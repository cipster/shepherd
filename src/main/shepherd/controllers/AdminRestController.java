package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import enums.Response;
import model.dao.Client;
import model.dao.ListaProiecte;
import model.dao.UserRoles;
import model.interfaces.ClientDAO;
import model.interfaces.ListaProiecteDAO;
import model.interfaces.UserRolesDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping(value = "/projAdmin")
public class AdminRestController {


    @Autowired
    private ListaProiecteDAO listaProiecteJDBCDAO;
    @Autowired
    private ClientDAO clientiJDBCDAO;
    @Autowired
    private UserRolesDAO userRolesJDBCDAO;

    @PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
    @Transactional(isolation = Isolation.READ_COMMITTED)
    @RequestMapping(value = "/getrole", method = RequestMethod.POST)
    public
    @ResponseBody
    String getRole(@RequestParam String username) throws Exception {
        String responseString;
        String roleString = "";
        try {
            List<UserRoles> userRoles = userRolesJDBCDAO.findByID(username);
            if(userRoles != null && !userRoles.isEmpty()) {
                for (UserRoles s : userRoles) {
                    roleString += s.getRoleType() + "=";
                }
            }
            responseString = "{\"username\":\"" + username + "\", \"role\":\"" + roleString + "\"}";
        } catch (Exception x){
            responseString = "error";
        }

        return responseString;
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
    @RequestMapping(value = "/createProj", method = RequestMethod.POST)
    public
    @ResponseBody
    String createProiect(@RequestParam String numeProiect,
                         @RequestParam String nrProiect,
                         @RequestParam String an,
                         @RequestParam String idClient) throws Exception {

        if(numeProiect.isEmpty() || nrProiect.isEmpty() || an.isEmpty() || idClient.isEmpty()){
            return Response.ERROR.getLabel();
        }

        ListaProiecte proiect = new ListaProiecte();
        proiect.setNumeProiect(numeProiect);
        proiect.setNrProiect(nrProiect);
        proiect.setAn(an);
        proiect.setIdClient(Integer.parseInt(idClient));

        listaProiecteJDBCDAO.create(proiect);

        String responseString = "{\"numeProiect\":\"" + numeProiect + "\", \"nrProiect\":\"" + nrProiect + "\", \"an\":\"" + an + "\", \"idClient\":\"" + idClient + "\"}";
        return responseString;
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
    @RequestMapping(value = "/adaugaClient", method = RequestMethod.POST)
    public
    @ResponseBody
    String createClient(HttpServletRequest request) throws Exception {
        Client client = new Client();
        String numeClient = request.getParameter("client");
        client.setClient(numeClient);
        String responseString = null;
        int ok;
        try {
            ok = clientiJDBCDAO.create(client);
            if (ok > 0)
            responseString = "{\"client\":\"" + numeClient + "\"}";
        } catch(Exception e) {
            responseString = Response.EMPTY.getLabel();
        }
        return responseString;
    }
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Transactional(isolation = Isolation.SERIALIZABLE)
    @RequestMapping(value = "/deleteProj", method = RequestMethod.POST)
    public
    @ResponseBody
    String deleteProiect(HttpServletRequest request, HttpServletResponse response) {
        String idString = request.getParameter("idProiect");
        int id = (idString == null) ? 0 : Integer.parseInt(idString);
        String responseString = null;
        if(id != 0) {
            Integer status = listaProiecteJDBCDAO.deleteByID(id);
            if(status == null || status == 0) {
                responseString = null;
            } else {
                responseString = "{\"idProiect\":\"-1\"}";
            }
        }
        return responseString;
    }
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Transactional(isolation = Isolation.SERIALIZABLE)
    @RequestMapping(value = "/modificaProj", method = RequestMethod.POST)
    public
    @ResponseBody
    String modProiect(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ListaProiecte proiect = new ListaProiecte();
        String responseString;

        String idProiect = request.getParameter("idProiect").trim();
        String numeProiect = request.getParameter("numeProiect").trim();
        String nrProiect = request.getParameter("nrProiect").trim();
        String an = request.getParameter("an").trim();
        String idClient = request.getParameter("idClient").trim();

        if(idProiect.isEmpty() || numeProiect.isEmpty() || nrProiect.isEmpty() || an.isEmpty() || idClient.isEmpty()){
            return Response.ERROR.getLabel();
        }

        proiect.setIdProiect(Integer.parseInt(idProiect));
        proiect.setNumeProiect(numeProiect);
        proiect.setNrProiect(nrProiect);
        proiect.setAn(an);
        proiect.setIdClient(Integer.parseInt(idClient));

        listaProiecteJDBCDAO.update(proiect);

        responseString = "{\"numeProiect\":\"" + numeProiect + "\", \"nrProiect\":\"" + nrProiect + "\", \"an\":\"" + an + "\", \"idClient\":\"" + idClient + "\"}";
        return responseString;
    }
}
