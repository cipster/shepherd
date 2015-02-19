package projectManager.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import projectManager.repository.dao.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping(value = "/delete")
public class DeleteRestController {

    @Autowired
    private ListaProiecteDAO proiecteJDBCDAO;
    @Autowired
    private AlteMaterialeDAO alteMaterialeJDBCDAO;
    @Autowired
    private PropunereDAO propunereJDBCDAO;
    @Autowired
    private ChestionarFinalDAO chestionarFinalJDBCDAO;
    @Autowired
    private RaportFinalDAO raportFinalJDBCDAO;
    @Autowired
    private BdDAO bdJDBCDAO;

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Transactional(isolation = Isolation.REPEATABLE_READ)
    @RequestMapping(value = "/altemateriale", method = RequestMethod.POST)
    public
    @ResponseBody
    String alteMaterialeDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        int idProiect = Integer.parseInt(request.getParameter("idProiect"));
        int idAlteMateriale = Integer.parseInt(request.getParameter("idAM"));
        String nume = alteMaterialeJDBCDAO.findByID(idAlteMateriale).getNume();
        alteMaterialeJDBCDAO.deleteByID(idAlteMateriale);
        proiecteJDBCDAO.stergeAlteMateriale(idAlteMateriale, idProiect);
        String responseString = "{\"idProiect\":\"" + idProiect + "\", \"nume\":\"" + nume + "\"}";
        return responseString;

    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Transactional(isolation = Isolation.REPEATABLE_READ)
    @RequestMapping(value = "/propunere", method = RequestMethod.POST)
    public
    @ResponseBody
    String propunereDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        int idProiect = Integer.parseInt(request.getParameter("idProiect"));
        int idPropunere = Integer.parseInt(request.getParameter("idP"));
        String nume = propunereJDBCDAO.findByID(idPropunere).getNume();
        propunereJDBCDAO.deleteByID(idPropunere);
        proiecteJDBCDAO.stergePropunere(idPropunere, idProiect);
        String responseString = "{\"idProiect\":\"" + idProiect + "\", \"nume\":\"" + nume + "\"}";
        return responseString;

    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Transactional(isolation = Isolation.REPEATABLE_READ)
    @RequestMapping(value = "/chestionar", method = RequestMethod.POST)
    public
    @ResponseBody
    String chestionarDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        int idProiect = Integer.parseInt(request.getParameter("idProiect"));
        int idChestionar = Integer.parseInt(request.getParameter("idC"));
        String nume = chestionarFinalJDBCDAO.findByID(idChestionar).getNume();
        chestionarFinalJDBCDAO.deleteByID(idChestionar);
        proiecteJDBCDAO.stergeChestionar(idChestionar, idProiect);
        String responseString = "{\"idProiect\":\"" + idProiect + "\", \"nume\":\"" + nume + "\"}";
        return responseString;

    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Transactional(isolation = Isolation.REPEATABLE_READ)
    @RequestMapping(value = "/raport", method = RequestMethod.POST)
    public
    @ResponseBody
    String raportDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        int idProiect = Integer.parseInt(request.getParameter("idProiect"));
        int idRaport = Integer.parseInt(request.getParameter("idR"));
        String nume = raportFinalJDBCDAO.findByID(idRaport).getNume();
        raportFinalJDBCDAO.deleteByID(idRaport);
        proiecteJDBCDAO.stergeRaport(idRaport, idProiect);
        String responseString = "{\"idProiect\":\"" + idProiect + "\", \"nume\":\"" + nume + "\"}";
        return responseString;

    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Transactional(isolation = Isolation.REPEATABLE_READ)
    @RequestMapping(value = "/bd", method = RequestMethod.POST)
    public
    @ResponseBody
    String bdDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        int idProiect = Integer.parseInt(request.getParameter("idProiect"));
        int idBd = Integer.parseInt(request.getParameter("idB"));
        String nume = bdJDBCDAO.findByID(idBd).getNume();
        bdJDBCDAO.deleteByID(idBd);
        proiecteJDBCDAO.stergeBd(idBd, idProiect);
        String responseString = "{\"idProiect\":\"" + idProiect + "\", \"nume\":\"" + nume + "\"}";
        return responseString;

    }
}
