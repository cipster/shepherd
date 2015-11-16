package controllers;

import model.dao.*;
import model.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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
    private ProiectDAO proiecteJDBCDAO;

    @Transactional(isolation = Isolation.READ_COMMITTED)
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
            byte[] bytes = file.getBytes();
            String name = file.getOriginalFilename();
            String rootPath = System.getProperty("catalina.home");
            File dir = new File(rootPath + File.separator  + "fisiere" + File.separator + "bd");
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath()
                    + File.separator + name);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
            bd.setBd(serverFile.getAbsolutePath());
                bd.setNume(file.getOriginalFilename());
                bd.setCreat_de(username);



            int idBd = bdJDBCDAO.create(bd);
            proiecteJDBCDAO.updateBd(idBd, id);
            String responseString = "{\"idProiect\":\"" + id + "\", \"fileName\":\"" + file.getOriginalFilename() + "\"}";
            return responseString;
        }
    }

    @Transactional(isolation = Isolation.READ_COMMITTED)
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
            byte[] bytes = file.getBytes();
            String name = file.getOriginalFilename();
            String rootPath = System.getProperty("catalina.home");
            File dir = new File(rootPath + File.separator  + "fisiere" + File.separator + "propunere");
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath()
                    + File.separator + name);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
            propunere.setPropunere(serverFile.getAbsolutePath());
            propunere.setNume(name);
            propunere.setCreat_de(username);

            int idPropunere = propunereJDBCDAO.create(propunere);
            proiecteJDBCDAO.updatePropunere(idPropunere, id);
            String responseString = "{\"idProiect\":\"" + id + "\", \"fileName\":\"" + file.getOriginalFilename() + "\"}";
            return responseString;
        }
    }

    @Transactional(isolation = Isolation.READ_COMMITTED)
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
            byte[] bytes = file.getBytes();
            String name = file.getOriginalFilename();
            String rootPath = System.getProperty("catalina.home");
            File dir = new File(rootPath + File.separator  + "fisiere" + File.separator + "chestionarFinal");
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath()
                    + File.separator + name);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
            chestionarFinal.setChestionarFinal(serverFile.getAbsolutePath());
            chestionarFinal.setNume(name);
            chestionarFinal.setCreat_de(username);

            int idChestionar = chestionarFinalJDBCDAO.create(chestionarFinal);
            proiecteJDBCDAO.updateChestionarFinal(idChestionar, id);
            String responseString = "{\"idProiect\":\"" + id + "\", \"fileName\":\"" + file.getOriginalFilename() + "\"}";
            return responseString;
        }
    }

    @Transactional(isolation = Isolation.READ_COMMITTED)
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
            byte[] bytes = file.getBytes();
            String name = file.getOriginalFilename();
            String rootPath = System.getProperty("catalina.home");
            File dir = new File(rootPath + File.separator  + "fisiere" + File.separator + "raportFinal");
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath()
                    + File.separator + name);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
            raportFinal.setRaportFinal(serverFile.getAbsolutePath());
            raportFinal.setNume(name);
            raportFinal.setCreat_de(username);

            int idRaport = raportFinalJDBCDAO.create(raportFinal);
            proiecteJDBCDAO.updateRaportFinal(idRaport, id);
            String responseString = "{\"idProiect\":\"" + id + "\", \"fileName\":\"" + file.getOriginalFilename() + "\"}";
            return responseString;
        }
    }

    @Transactional(isolation = Isolation.READ_COMMITTED)
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
            byte[] bytes = file.getBytes();
            String name = file.getOriginalFilename();
            String rootPath = System.getProperty("catalina.home");
            File dir = new File(rootPath + File.separator + "fisiere" + File.separator + "alteMateriale");
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath()
                    + File.separator + name);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
            alteMateriale.setAltemateriale(serverFile.getAbsolutePath());
            alteMateriale.setNume(name);
            alteMateriale.setCreat_de(username);

            int idAlteMateriale = alteMaterialeJDBCDAO.create(alteMateriale);
            proiecteJDBCDAO.updateAlteMateriale(idAlteMateriale, id);
            return "{\"idProiect\":\"" + id + "\", \"fileName\":\"" + file.getOriginalFilename() + "\"}";
        }
    }
}
