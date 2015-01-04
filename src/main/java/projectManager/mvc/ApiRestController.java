package projectManager.mvc;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.zxing.BarcodeFormat;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import projectManager.repository.*;
import projectManager.repository.dao.*;
import projectManager.util.Barcode;

import javax.json.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Raindrop
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


    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/getinventory", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Articole> getAllStoc() {

        return articoleDAO.getAll();
    }

    @PreAuthorize("hasRole('ROLE_SUPERUSER')")
    @RequestMapping(value = "/persoane", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Persoana> getPersoane() {

        return persoanaDAO.getAll();
    }

    @PreAuthorize("hasRole('ROLE_SUPERUSER')")
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

        }
        return cod3;
    }

    @RequestMapping(value = "/generatebarcode/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<byte[]> generateBarcode(@PathVariable String id) throws IOException {
        File f = null;
        String code = articoleDAO.findByID(Integer.valueOf(id)).getBarcode();
        byte[] image;
        try {
            // creates temporary file
            f = File.createTempFile("tmp", ".jpg", new File("C:/"));
            Barcode.encode(f, code, BarcodeFormat.CODE_128);
            image = new byte[(int) f.length()];
            InputStream in = null;
            in = new FileInputStream(f);
            in.read(image);
            in.close();
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

    @PreAuthorize("hasRole('ROLE_SUPERUSER')")
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
}
