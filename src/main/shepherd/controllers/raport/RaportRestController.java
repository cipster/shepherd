package controllers.raport;

import model.dao.RaportInventarDAO;
import model.domain.RaportInventar;
import model.raport.RaportInventarForm;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import util.UserUtils;
import util.beans.FileBean;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/generate-raport")
public class RaportRestController {
    private static final Logger LOGGER = LoggerFactory.getLogger(RaportRestController.class);

    @Autowired
    ServletContext servletContext;
    @Autowired
    private RaportInventarDAO raportInventarDAO;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(sdf, true));
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
    @RequestMapping(value = "/raport-inventar/{filename}", method = RequestMethod.GET)
    public
    @ResponseBody
    String getRaportInventar(@PathVariable String filename, HttpServletResponse response) throws IOException {
        String dirPath = "/WEB-INF" + File.separator + "resources";
        String contextDirName = this.servletContext.getRealPath(dirPath);
        String originalFilename = filename + ".html";
        File dir = new File(contextDirName + File.separator + "raport");
        filename = dir + File.separator + originalFilename;
        File file = new File(filename);
        byte[] bytes = getBytesFromFile(file);
        FileBean fileBean = new FileBean();
        fileBean.setFile(bytes);
        fileBean.setFilename(originalFilename);
        fileBean.setCreatDe(UserUtils.getLoggedInUsername());
        fileBean.setCreatLa(new Timestamp(file.lastModified()));
        fileBean.setId(1);
        response.setContentLength(fileBean.getFile().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileBean.getFilename() + "\"");

        FileCopyUtils.copy(fileBean.getFile(), response.getOutputStream());
        response.getOutputStream().flush();
        return null;
    }

    private byte[] getBytesFromFile(File file) throws IOException {
        byte[] bytes = new byte[(int) file.length()];
        try (BufferedInputStream stream = new BufferedInputStream(new FileInputStream(file))) {
            stream.read(bytes);
        }
        return bytes;
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
    @RequestMapping(value = "/raport-inventar", method = RequestMethod.POST)
    public
    @ResponseBody
    String generateRaportInventarAndLink(@RequestBody RaportInventarForm raport) throws IOException {
        List<RaportInventar> raportInventarList = raportInventarDAO.getBy(raport.getIdLoc(), raport.getIdPersoana(), raport.getCod1(), raport.getCod2(), raport.getOrderBy());
        String code = "raport-inventar-" + new Date().getTime();
        String dirPath = "/WEB-INF" + File.separator + "resources";
        String contextDirName = this.servletContext.getRealPath(dirPath);
        File dir = new File(contextDirName + File.separator + "raport");
        if (!dir.exists()) {
            dir.mkdirs();
        }
        String filename = dir + File.separator + code + ".html";
        File file = new File(filename);

        File htmlTemplateFile = new File(contextDirName + File.separator + "template/raport-inventar-template.html");
        String htmlString = FileUtils.readFileToString(htmlTemplateFile);
        htmlString = htmlString.replace("$title", "Raport Inventar");
        if (raport.getCod1() != null && raport.getCod1().length > 0) {
            htmlString = htmlString.replace("$cod1", Arrays.toString(raport.getCod1()));
        } else {
            htmlString = htmlString.replace("$cod1", "");
        }
        String cat1 = "";
        String cat2 = "";
        int count = raportInventarList.size();
        int internalCount = 0;
        String orderValue = null;
        for (int i = 0; i < raportInventarList.size(); i++) {
            RaportInventar found = raportInventarList.get(i);
            if (!cat1.contains(found.getCat1())) {
                cat1 += " " + found.getCat1();
            }
            if (!cat2.contains(found.getCat2())) {
                cat2 += " " + found.getCat2();
            }
            boolean newOrderValue;
            switch (raport.getOrderBy()) {
                case "id_loc":
                    newOrderValue = !found.getDenumireLoc().equals(orderValue);
                    if (newOrderValue) {
                        orderValue = found.getDenumireLoc();
                    }
                    break;
                case "nume":
                    newOrderValue = !found.getNume().equals(orderValue);
                    if (newOrderValue) {
                        orderValue = found.getNume();
                    }
                    break;
                default:
                    newOrderValue = !found.getCat2().equals(orderValue);
                    if (newOrderValue) {
                        orderValue = found.getCat2();
                    }
                    break;
            }

            if (newOrderValue) {
                if (i != 0) {
                    htmlString = htmlString.replace("$firstCount", String.valueOf(internalCount));
                }
                htmlString += "<tr style='background-color: magenta;'>" +
                        "<td class='magenta' colspan=2>" +
                        orderValue +
                        "</td>" +
                        "<td class='magenta' colspan=1>" +
                        "$firstCount BUC" +
                        "</td>" +
                        "<td class='magenta' colspan=10>" +
                        "</td>" +
                        "</tr>";
                internalCount = 0;
            }
            htmlString += "<tr>" +
                    "<td>" + (internalCount + 1) + "</td>" +
                    "<td>" + found.getDenumire() + "</td>" +
                    "<td>" + found.getBarcode() + "</td>" +
                    "<td>" + found.getDetalii() + "</td>" +
                    "<td>" + found.getNume() + "</td>" +
                    "<td>" + found.getDenumireLoc() + "</td>" +
                    "<td>" + found.getDataPrimire() + "</td>" +
                    "<td>" + found.getDetaliiRecuperare() + "</td>" +
                    "</tr>";
            internalCount++;
        }

        htmlString = htmlString.replace("$cat1", cat1);
        htmlString = htmlString.replace("$cat2", cat2);
        htmlString = htmlString.replace("$c2count", String.valueOf(count));
        htmlString = htmlString.replace("$firstCount", String.valueOf(internalCount));
        htmlString += "</tbody></table></body></html>";

        FileUtils.writeStringToFile(file, htmlString);

        return file.getName();
    }


}
