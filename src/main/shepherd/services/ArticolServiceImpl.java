package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.dao.*;
import model.domain.Articol;
import model.domain.Cod3;
import model.domain.Evidenta;
import model.domain.EvidentaInventar;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import services.repository.*;
import util.UserUtils;
import util.enums.DAOResult;

import java.util.Collections;
import java.util.List;

public class ArticolServiceImpl implements ArticolService {
    private final Log LOGGER = LogFactory.getLog(getClass());

    @Autowired
    private ArticolRepository articolRepository;
    @Autowired
    private Cod3Repository cod3Repository;
    @Autowired
    private EvidentaRepository evidentaRepository;
    @Autowired
    private EvidentaInventarRepository evidentaInventarRepository;
    @Autowired
    private PersoanaRepository persoanaRepository;


    @Override
    public List<Articol> fetchAllArticole() {
        List<Articol> articoleList;
        try {
            articoleList = (List<Articol>) articolRepository.findAll();
        } catch (Exception e) {
            articoleList = Collections.emptyList();
        }
        return articoleList;
    }

    @Override
    public List<Cod3> fetchAllCod3() {
        List<Cod3> articoleList;
        try {
            articoleList = (List<Cod3>) cod3Repository.findAll();
        } catch (Exception e) {
            articoleList = Collections.emptyList();
        }
        return articoleList;
    }

    @Override
    public ControllerResult addArticol(Cod3 cod3) throws DAOException {
        ControllerResult controllerResult;
        Cod3 created = cod3Repository.save(cod3);
        try {

            if (created != null) {
                controllerResult = new ControllerResult(HttpStatus.OK.value(), "Articolul " + cod3.getDenumire3() + " a fost adăugat cu succes!");
            } else {
                throw new RuntimeException("Articolul nu a fost adăugat!");
            }

        } catch (RuntimeException e) {
            LOGGER.error(e.getMessage(), e);
            controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
        }
        return controllerResult;
    }

    @Override
    public ControllerResult modArticol(Cod3 cod3) throws DAOException {
        String username = UserUtils.getLoggedInUsername(); //get logged in username
        ControllerResult controllerResult;
        EvidentaInventar evidentaInventar;
        String detalii = "Modificat de administrator: " + username;
        int idCod3 = cod3Repository.findByID(cod3.getCod3()).getCod3();
        try {
            evidentaInventar = evidentaInventarRepository.findByIdArticol(String.valueOf(idCod3));
            cod3.setDetaliiRecuperare(detalii);
            if (cod3Repository.update(cod3) > DAOResult.ZERO) {
                controllerResult = new ControllerResult(HttpStatus.OK.value(), "Articolul " + cod3.getDenumire3() + " a fost modificat cu succes!");
                if (evidentaInventar != null) {
                    evidentaInventarRepository.update(evidentaInventar);
                }
            } else {
                throw new RuntimeException("Articolul nu a fost modificat!");
            }
        } catch (RuntimeException e) {
            LOGGER.error(e.getMessage(), e);
            controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
        }
        return controllerResult;
    }

    @Override
    public ControllerResult delArticol(Cod3 cod3) throws DAOException {
        ControllerResult controllerResult;
        try {
            cod3Repository.delete(cod3);
            controllerResult = new ControllerResult(HttpStatus.OK.value(), "Articolul " + cod3.getDenumire3() + " a fost şters cu succes!");

        } catch (RuntimeException e) {
            LOGGER.error(e.getMessage(), e);
            controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
        }
        return controllerResult;
    }

    @Override
    public List<Evidenta> fetchEvidentaByBarcode(String barcode) {
        List<Evidenta> evidenta;
        try {
            evidenta = evidentaRepository.findAllByBarcodeEquals(barcode);
        } catch (Exception e) {
            evidenta = Collections.emptyList();
        }
        return evidenta;

    }
}
