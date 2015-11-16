package controllers;

import model.dao.*;
import model.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/files")
public class MainRestController {
    @Autowired
    private ProiectDAO listaProiecteJDBCDAO;
    @Autowired
    private PropunereDAO propunereJDBCDAO;
    @Autowired
    private ChestionarFinalDAO chestionarFinalJDBCDAO;
    @Autowired
    private RaportFinalDAO raportFinalJDBCDAO;
    @Autowired
    private BdDAO bdJDBCDAO;
    @Autowired
    private AlteMaterialeDAO alteMaterialeJDBCDAO;

    @Transactional(isolation = Isolation.REPEATABLE_READ)
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER','ROLE_USER')")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public
    @ResponseBody
    String createProiect(@PathVariable int id) throws Exception {

        Proiect proiect = listaProiecteJDBCDAO.findByID(id);
        String idPropunere = proiect.getIdPropunere();
        String idChestionar = proiect.getIdChestionarFinal();
        String idRaport = proiect.getIdRaportFinal();
        String idBd = proiect.getIdBd();
        String idAlteMateriale = proiect.getIdAlteMateriale();

        Map<Integer, String> idPropMap = new HashMap<Integer, String>();
        Map<Integer, String> idChestMap = new HashMap<Integer, String>();
        Map<Integer, String> idRapMap = new HashMap<Integer, String>();
        Map<Integer, String> idBdMap = new HashMap<Integer, String>();
        Map<Integer, String> idAMMap = new HashMap<Integer, String>();

        String[] idPropunereArr = idPropunere.split(",");
        String[] idChestionarArr = idChestionar.split(",");
        String[] idRaportArr = idRaport.split(",");
        String[] idBdArr = idBd.split(",");
        String[] idAlteMaterialeArr = idAlteMateriale.split(",");

        for(String s : idPropunereArr) {
            if(!s.equalsIgnoreCase("0") && !s.equalsIgnoreCase("")) {
                Propunere propunere = propunereJDBCDAO.findByID(Integer.parseInt(s));
                idPropMap.put(propunere.getIdPropunere(), propunere.getNume());
            } else {
                idPropMap.put(0, "null");
            }
        }
        for(String s : idChestionarArr) {
            if(!s.equalsIgnoreCase("0") && !s.equalsIgnoreCase("")) {
                ChestionarFinal chestionarFinal = chestionarFinalJDBCDAO.findByID(Integer.parseInt(s));
                idChestMap.put(chestionarFinal.getIdChestionarFinal(), chestionarFinal.getNume());
            } else {
                idChestMap.put(0, "null");
            }
        }
        for(String s : idRaportArr) {
            if(!s.equalsIgnoreCase("0") && !s.equalsIgnoreCase("")) {
                RaportFinal raportFinal = raportFinalJDBCDAO.findByID(Integer.parseInt(s));
                idRapMap.put(raportFinal.getIdRaportFinal(), raportFinal.getNume());
            } else {
                idRapMap.put(0, "null");
            }
        }
        for(String s : idBdArr) {
            if(!s.equalsIgnoreCase("0") && !s.equalsIgnoreCase("")) {
                Bd bd = bdJDBCDAO.findByID(Integer.parseInt(s));
                idBdMap.put(bd.getIdBd(), bd.getNume());
            } else {
                idBdMap.put(0, "null");
            }
        }
        for(String s : idAlteMaterialeArr) {
            if(!s.equalsIgnoreCase("0") && !s.equalsIgnoreCase("")) {
                AlteMateriale alteMateriale = alteMaterialeJDBCDAO.findByID(Integer.parseInt(s));
                idAMMap.put(alteMateriale.getIdAlteMateriale(), alteMateriale.getNume());
            } else {
                idAMMap.put(0, "null");
            }
        }

        String returnProp = idPropMap.toString();
        returnProp = returnProp.replace("{", "");
        returnProp = returnProp.replace("}", "");

        String returnRap = idRapMap.toString();
        returnRap = returnRap.replace("{", "");
        returnRap = returnRap.replace("}", "");

        String returnChest = idChestMap.toString();
        returnChest = returnChest.replace("{", "");
        returnChest = returnChest.replace("}", "");

        String returnBd = idBdMap.toString();
        returnBd = returnBd.replace("{", "");
        returnBd = returnBd.replace("}", "");

        String returnAM = idAMMap.toString();
        returnAM = returnAM.replace("{", "");
        returnAM = returnAM.replace("}", "");

        String responseString = "{\"propunere\":\"" + returnProp + "\", \"chestionar\":\"" + returnChest + "\", \"raport\":\"" + returnRap + "\", \"bd\":\"" + returnBd + "\", \"alteMateriale\":\"" + returnAM + "\"}";
        return responseString;
    }

}
