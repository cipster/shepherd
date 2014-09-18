package projectManager.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import projectManager.bean.FileBean;
import projectManager.dao.*;
import projectManager.repository.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping(value = "/download")
public class DownloadRestController {


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


    @RequestMapping(value = "/propunere/{id}", method = RequestMethod.GET)
    @PreAuthorize("hasRole('ROLE_DOWNLOAD')")
    public
    @ResponseBody
    String propunereDownload(@PathVariable int id,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        Propunere propunere = propunereJDBCDAO.findByID(id);
        FileBean file = new FileBean();

        file.setId(propunere.getIdPropunere());
        file.setFile(propunere.getPropunere());
        file.setCreatDe(propunere.getCreat_de());
        file.setCreatLa(propunere.getCreat_la());
        file.setFilename(propunere.getNume());

        response.setContentLength(file.getFile().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getFilename() + "\"");

        FileCopyUtils.copy(file.getFile(), response.getOutputStream());

        return null;
    }

    @RequestMapping(value = "/chestionar/{id}", method = RequestMethod.GET)
        @PreAuthorize("hasRole('ROLE_DOWNLOAD')")
        public
        @ResponseBody
        String chestionarDownload(@PathVariable int id,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

            ChestionarFinal chestionarFinal = chestionarFinalJDBCDAO.findByID(id);
            FileBean file = new FileBean();

            file.setId(chestionarFinal.getIdChestionarFinal());
            file.setFile(chestionarFinal.getChestionarFinal());
            file.setCreatDe(chestionarFinal.getCreat_de());
            file.setCreatLa(chestionarFinal.getCreat_la());
            file.setFilename(chestionarFinal.getNume());

            response.setContentLength(file.getFile().length);
            response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getFilename() + "\"");

            FileCopyUtils.copy(file.getFile(), response.getOutputStream());

            return null;
        }

    @RequestMapping(value = "/raport/{id}", method = RequestMethod.GET)
        @PreAuthorize("hasRole('ROLE_DOWNLOAD')")
        public
        @ResponseBody
        String raportDownload(@PathVariable int id,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

            RaportFinal raportFinal = raportFinalJDBCDAO.findByID(id);
            FileBean file = new FileBean();

            file.setId(raportFinal.getIdRaportFinal());
            file.setFile(raportFinal.getRaportFinal());
            file.setCreatDe(raportFinal.getCreat_de());
            file.setCreatLa(raportFinal.getCreat_la());
            file.setFilename(raportFinal.getNume());

            response.setContentLength(file.getFile().length);
            response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getFilename() + "\"");

            FileCopyUtils.copy(file.getFile(), response.getOutputStream());

            return null;
        }
    @RequestMapping(value = "/bd/{id}", method = RequestMethod.GET)
        @PreAuthorize("hasRole('ROLE_DOWNLOAD')")
        public
        @ResponseBody
        String bdDownload(@PathVariable int id,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

            Bd bd = bdJDBCDAO.findByID(id);
            FileBean file = new FileBean();

            file.setId(bd.getIdBd());
            file.setFile(bd.getBd());
            file.setCreatDe(bd.getCreat_de());
            file.setCreatLa(bd.getCreat_la());
            file.setFilename(bd.getNume());

            response.setContentLength(file.getFile().length);
            response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getFilename() + "\"");

            FileCopyUtils.copy(file.getFile(), response.getOutputStream());

            return null;
        }
    @RequestMapping(value = "/altemateriale/{id}", method = RequestMethod.GET)
        @PreAuthorize("hasRole('ROLE_DOWNLOAD')")
        public
        @ResponseBody
        String alteMaterialeDownload(@PathVariable int id,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

            AlteMateriale alteMateriale = alteMaterialeJDBCDAO.findByID(id);
            FileBean file = new FileBean();

            file.setId(alteMateriale.getIdAlteMateriale());
            file.setFile(alteMateriale.getAltemateriale());
            file.setCreatDe(alteMateriale.getCreat_de());
            file.setCreatLa(alteMateriale.getCreat_la());
            file.setFilename(alteMateriale.getNume());

            response.setContentLength(file.getFile().length);
            response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getFilename() + "\"");

            FileCopyUtils.copy(file.getFile(), response.getOutputStream());

            return null;
        }

}


