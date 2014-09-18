package projectManager.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import projectManager.dao.*;
import projectManager.repository.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;

@Controller
@RequestMapping(value = "/upload")
public class UploadRestController {


    @Autowired
    private BdDAO bdJDBCDAO;
    @Autowired
    private AlteMaterialeDAO alteMaterialeJDBCDAO;
    @Autowired
    private PropunereDAO propunereJDBCDAO;
    @Autowired
    private RaportFinalDAO raportFinalJDBCDAO;
    @Autowired
    private ChestionarFinalDAO chestionarFinalJDBCDAO;
    @Autowired
    private ListaProiecteDAO proiecteJDBCDAO;


    @RequestMapping(value = "/uploadBd", method = RequestMethod.POST)
    public
    @ResponseBody
    String bdUpload(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Bd bd = new Bd();
        Iterator<String> fileNames = request.getFileNames();
        String username = request.getParameter("user");

        MultipartFile file = request.getFile(fileNames.next());
        int id = Integer.parseInt(request.getParameter("idProiect"));
        if(file == null) {
            return "error";
        } else {
            try {
                bd.setBd(file.getBytes());
                bd.setNume(file.getOriginalFilename());
                bd.setCreat_de(username);

            } catch(IOException e) {
                e.printStackTrace();
            }

            int idBd = bdJDBCDAO.create(bd);
            proiecteJDBCDAO.updateBd(idBd, id);
            String responseString = "{\"idProiect\":\"" + id + "\", \"fileName\":\"" + file.getOriginalFilename() + "\"}";
            return responseString;
        }
    }

    @RequestMapping(value = "/uploadPropunere", method = RequestMethod.POST)
    public
    @ResponseBody
    String propunereUpload(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Propunere propunere = new Propunere();
        Iterator<String> fileNames = request.getFileNames();
        String username = request.getParameter("user");

        MultipartFile file = request.getFile(fileNames.next());
        int id = Integer.parseInt(request.getParameter("idProiect"));
        if(file == null) {
            return "error";
        } else {
            try {
                propunere.setPropunere(file.getBytes());
                propunere.setNume(file.getOriginalFilename());
                propunere.setCreat_de(username);

            } catch(IOException e) {
                e.printStackTrace();
            }

            int idPropunere = propunereJDBCDAO.create(propunere);
            proiecteJDBCDAO.updatePropunere(idPropunere, id);
            String responseString = "{\"idProiect\":\"" + id + "\", \"fileName\":\"" + file.getOriginalFilename() + "\"}";
            return responseString;
        }
    }

    @RequestMapping(value = "/uploadChestionar", method = RequestMethod.POST)
    public
    @ResponseBody
    String chestionarUpload(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ChestionarFinal chestionarFinal = new ChestionarFinal();
        Iterator<String> fileNames = request.getFileNames();
        String username = request.getParameter("user");

        MultipartFile file = request.getFile(fileNames.next());
        int id = Integer.parseInt(request.getParameter("idProiect"));
        if(file == null) {
            return "error";
        } else {
            try {
                chestionarFinal.setChestionarFinal(file.getBytes());
                chestionarFinal.setNume(file.getOriginalFilename());
                chestionarFinal.setCreat_de(username);

            } catch(IOException e) {
                e.printStackTrace();
            }

            int idChestionar = chestionarFinalJDBCDAO.create(chestionarFinal);
            proiecteJDBCDAO.updateChestionarFinal(idChestionar, id);
            String responseString = "{\"idProiect\":\"" + id + "\", \"fileName\":\"" + file.getOriginalFilename() + "\"}";
            return responseString;
        }
    }

    @RequestMapping(value = "/uploadRaport", method = RequestMethod.POST)
    public
    @ResponseBody
    String raportUpload(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RaportFinal raportFinal = new RaportFinal();
        Iterator<String> fileNames = request.getFileNames();
        String username = request.getParameter("user");

        MultipartFile file = request.getFile(fileNames.next());
        int id = Integer.parseInt(request.getParameter("idProiect"));
        if(file == null) {
            return "error";
        } else {
            try {
                raportFinal.setRaportFinal(file.getBytes());
                raportFinal.setNume(file.getOriginalFilename());
                raportFinal.setCreat_de(username);

            } catch(IOException e) {
                e.printStackTrace();
            }

            int idRaport = raportFinalJDBCDAO.create(raportFinal);
            proiecteJDBCDAO.updateRaportFinal(idRaport, id);
            String responseString = "{\"idProiect\":\"" + id + "\", \"fileName\":\"" + file.getOriginalFilename() + "\"}";
            return responseString;
        }
    }

    @RequestMapping(value = "/uploadAlteMateriale", method = RequestMethod.POST)
    public
    @ResponseBody
    String alteMaterialeUpload(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AlteMateriale alteMateriale = new AlteMateriale();
        Iterator<String> fileNames = request.getFileNames();
        String username = request.getParameter("user");

        MultipartFile file = request.getFile(fileNames.next());
        int id = Integer.parseInt(request.getParameter("idProiect"));
        if(file == null) {
            return "error";
        } else {
            try {
                alteMateriale.setAltemateriale(file.getBytes());
                alteMateriale.setNume(file.getOriginalFilename());
                alteMateriale.setCreat_de(username);

            } catch(IOException e) {
                e.printStackTrace();
            }

            int idAlteMateriale = alteMaterialeJDBCDAO.create(alteMateriale);
            proiecteJDBCDAO.updateAlteMateriale(idAlteMateriale, id);
            String responseString = "{\"idProiect\":\"" + id + "\", \"fileName\":\"" + file.getOriginalFilename() + "\"}";
            return responseString;
        }
    }
}
