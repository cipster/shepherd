package projectManager.mvc;

import com.google.zxing.BarcodeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import projectManager.repository.*;
import projectManager.repository.dao.*;
import projectManager.util.Barcode;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Shepherd
 */
@Controller
@RequestMapping(value = "/api")
public class ApiRestController {

    @Autowired
    private Cod3DAO cod3DAO;
    @Autowired
    private ArticoleDAO articoleDAO;
    @Autowired
    ServletContext servletContext;
    @Autowired
    private PersoanaDAO persoanaDAO;
    @Autowired
    private LocDAO locDAO;
    @Autowired
    private EvidentaInventarDAO evidentaInventarDAO;
    @Autowired
    private ClientDAO clientiDAO;
    @Autowired
    private ListaProiecteDAO listaProiecteDAO;
    @Autowired
    private Cod2DAO cod2DAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private UserRolesDAO userRolesDAO;
    @Autowired
    private RolesDAO rolesDAO;


    @PreAuthorize("hasRole('ROLE_INVENTAR')")
    @RequestMapping(value = "/getinventory", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Articole> getAllStoc() {

        return articoleDAO.getAll();
    }

    @PreAuthorize("hasRole('ROLE_SUPERUSER')")
    @RequestMapping(value = "/clientlist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Client> getAllClienti() {

        return clientiDAO.getAll();
    }

    @PreAuthorize("hasRole('ROLE_SUPERUSER')")
    @RequestMapping(value = "/proiectelist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<ListaProiecte> getAllProiecte() {

        return listaProiecteDAO.getAll();
    }

    @PreAuthorize("hasRole('ROLE_SUPERUSER')")
    @RequestMapping(value = "/userlist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<User> getAllUsers() {

        return userDAO.getAll();
    }

    @PreAuthorize("hasRole('ROLE_SUPERUSER')")
    @RequestMapping(value = "/cod2list/{id}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Cod2> getAllCod2ByCod1(@PathVariable int id) {

        return cod2DAO.getAllByCod1(id);
    }

    @PreAuthorize("hasRole('ROLE_INVENTAR')")
    @RequestMapping(value = "/persoane", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Persoana> getPersoane() {

        return persoanaDAO.getAll();
    }

    @PreAuthorize("hasRole('ROLE_INVENTAR')")
    @RequestMapping(value = "/locuri", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Loc> getLocuri() {

        return locDAO.getAll();
    }

    @RequestMapping(value = "/articol/{code}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public Cod3 getArticol(@PathVariable String code) {
        Cod3 cod3 = null;
        try {
            cod3 = cod3DAO.findByBarcode(code);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cod3;
    }

    @RequestMapping(value = "/generatebarcode/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<byte[]> generateBarcode(@PathVariable String id) throws IOException {
        File f = null;
        String code = articoleDAO.findByID(Integer.valueOf(id)).getBarcode();
        byte[] image;
        try (InputStream in = new FileInputStream(f)) {
            // creates temporary file
            f = File.createTempFile("tmp", ".jpg", new File("C:/"));
            Barcode.encode(f, code, BarcodeFormat.CODE_128);
            image = new byte[(int) f.length()];
            in.read(image);
            f.delete();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG); //or what ever type it is
        headers.setContentLength(image.length);
        return new ResponseEntity<byte[]>(image, headers, HttpStatus.OK);
    }

    @PreAuthorize("hasRole('ROLE_SUPERUSER')")
    @RequestMapping(value = "/adaugaarticol", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String addClient(@RequestBody Cod3 cod3) {

        String response = "";
        try {
            cod3DAO.create(cod3);
            response = "1";
        } catch (DataAccessException ex) {
            ex.printStackTrace();
            response = "-1";
        }

        return response;
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/modificaclient", method = RequestMethod.POST)
    @ResponseBody
    public String modificaClient(@RequestBody Client client) {
        String response = "";
        Client deModificat = clientiDAO.findByID(client.getIdClient());
        if(deModificat != null) {
            try {
                deModificat.setClient(client.getClient());
                clientiDAO.update(deModificat);
                response = "1";
            } catch (DataAccessException ex) {
                ex.printStackTrace();
                response = "-1";
            }
        }

        return response;
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/stergeclient", method = RequestMethod.POST)
    @ResponseBody
    public String stergeClient(@RequestBody Client client) {
        String response = "";
        Client deSters = clientiDAO.findByID(client.getIdClient());
        if(deSters != null) {
            try {
                clientiDAO.deleteByID(deSters.getIdClient());
                response = "1";
            } catch (DataAccessException ex) {
                ex.printStackTrace();
                response = "-1";
            }
        }

        return response;
    }

    @PreAuthorize("hasRole('ROLE_SUPERUSER')")
    @RequestMapping(value = "/adaugapersoana", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String addPersoana(@RequestBody Persoana persoana) {

        String response = "";
        try {
            persoanaDAO.create(persoana);
            response = "1";
        } catch (DataAccessException ex) {
            ex.printStackTrace();
            response = "-1";
        }

        return response;
    }

    @PreAuthorize("hasRole('ROLE_INVENTAR')")
    @RequestMapping(value = "/evidentaiese", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String evidentaIese(HttpServletRequest request) {
        EvidentaInventar evidentaInventar = new EvidentaInventar();
        String evidenta = request.getParameterNames().nextElement();
        String response = "";
        if(evidenta != null) {
            JsonObject obj = Json.createReader(new StringReader(evidenta)).readObject();

            if (obj != null) {
                Integer idLoc = Integer.parseInt(obj.getString("idLoc"));
                Integer idPersoana = Integer.parseInt(obj.getString("idPersoana"));
                String detalii = obj.getString("detalii");
                int stare = obj.getInt("stare");

                evidentaInventar.setIdLoc(idLoc);
                evidentaInventar.setIdPersoana(idPersoana);
                evidentaInventar.setDetalii(detalii);
                JsonArray cod3 = obj.getJsonArray("cod3");
                for(int i = 0; i < cod3.size(); i ++){
                    Integer cod3Val = Integer.parseInt(cod3.getJsonString(i).getString());
                    evidentaInventar.setIdCod3(cod3Val);
                    try {
                        cod3DAO.setStare((byte)stare, cod3Val);
                        evidentaInventarDAO.create(evidentaInventar);
                        response = "1";
                    } catch (DataAccessException ex) {
                        ex.printStackTrace();
                        response = "-1";
                    }
                }
            }
        }
        return response;
    }

    @PreAuthorize("hasRole('ROLE_SUPERUSER')")
    @RequestMapping(value = "/adaugaloc", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String addLoc(@RequestBody Loc loc) {

        String response = "";
        try {
            locDAO.create(loc);
            response = "1";
        } catch (DataAccessException ex) {
            ex.printStackTrace();
            response = "-1";
        }

        return response;
    }


    @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping(value = "/schimbaparola", method = RequestMethod.POST)
    @ResponseBody
    public String schimbaParola(HttpServletRequest request) {

        String response = "";
        try {
            userDAO.updatePassword(request.getParameter("user"),request.getParameter("password"));
            response = "1";
        } catch (DataAccessException ex) {
            ex.printStackTrace();
            response = "-1";
        }

        return response;
    }

    @PreAuthorize("hasRole('ROLE_SUPERUSER')")
    @Transactional(isolation = Isolation.READ_COMMITTED)
    @RequestMapping(value = "/adaugauser", method = RequestMethod.POST)
    @ResponseBody
    public String adaugaUser(HttpServletRequest request) {

        String response = "";
        String user = request.getParameter("username");
        String password = new BCryptPasswordEncoder(4).encode("qwerty");
        String[] roluri = request.getParameterValues("rol");
        if((user != null &&user.length() == 0) || ( roluri != null && roluri.length == 0)){
            response = "-1";
        } else {
            try {
                User deCreat = new User();
                deCreat.setPassword(password);
                deCreat.setUsername(user);
                deCreat.setEnabled(1);

                UserRoles userRoles = new UserRoles();
                userRoles.setUsername(user);

                Roles roles = null;

                userDAO.create(deCreat);

                for(String rol : roluri){
                    roles = rolesDAO.findByID(Integer.parseInt(rol));
                    if(roles != null) {
                        userRoles.setRole(roles.getRoleValue());
                        userRoles.setRoleType(roles.getIdRole());
                        userRolesDAO.create(userRoles);
                    }
                }
                response = "1";
            } catch (DataAccessException ex) {
                ex.printStackTrace();
                response = "-1";
            }
        }
        return response;
    }

    @PreAuthorize("hasRole('ROLE_SUPERUSER')")
    @Transactional(isolation = Isolation.READ_COMMITTED)
    @RequestMapping(value = "/modificauser", method = RequestMethod.POST)
    @ResponseBody
    public String modificaUser(HttpServletRequest request) {

        String response = "";
        String user = request.getParameter("username");
        String status = request.getParameter("status");
        String[] roluri = request.getParameterValues("rol");
        if((user != null &&user.length() == 0) || ( roluri != null && roluri.length == 0)){
            response = "-1";
        } else {
            try {
                User deModificat = userDAO.findByID(user);
                deModificat.setEnabled(Integer.parseInt(status));

                UserRoles userRoles = new UserRoles();
                userRoles.setUsername(user);

                Roles roles = null;

                userDAO.update(deModificat);
                userRolesDAO.deleteByUsername(user);

                for(String rol : roluri){
                    roles = rolesDAO.findByID(Integer.parseInt(rol));
                    if(roles != null) {
                        userRoles.setRole(roles.getRoleValue());
                        userRoles.setRoleType(roles.getIdRole());
                        userRolesDAO.create(userRoles);
                    }
                }
                response = "1";
            } catch (DataAccessException ex) {
                ex.printStackTrace();
                response = "-1";
            }
        }
        return response;
    }
}
