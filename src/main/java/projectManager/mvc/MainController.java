package projectManager.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import projectManager.dao.*;
import projectManager.dao.jdbc.BdJDBCDAO;
import projectManager.dao.jdbc.ClientiJDBCDAO;
import projectManager.repository.Client;
import projectManager.repository.ListaProiecte;

@Controller
public class MainController {

    @Autowired
    MessageSource messageSource;
    @Autowired
    private ClientiJDBCDAO clientiJDBCDAO;
    @Autowired
    private BdJDBCDAO bdJDBCDAO;
    @Autowired
    private ListaProiecteDAO proiecteJDBCDAO;
    @Autowired
    private PropunereDAO propunereJDBCDAO;
    @Autowired
    private ChestionarFinalDAO chestionarFinalJDBCDAO;
    @Autowired
    private RaportFinalDAO raportFinalJDBCDAO;
    @Autowired
    private AlteMaterialeDAO alteMaterialeJDBCDAO;


    @RequestMapping(value = {"/main", "/"}, method = RequestMethod.GET)
    public String getMainPage(ModelMap map) {

        map.addAttribute("proiect", new ListaProiecte());
        map.addAttribute("listaProiecte", proiecteJDBCDAO.getAll());
        map.addAttribute("client", new Client());
        map.addAttribute("listaClienti", clientiJDBCDAO.getAll());
        map.addAttribute("listaPropunere", propunereJDBCDAO.getAll());
        map.addAttribute("listaChestionar", chestionarFinalJDBCDAO.getAll());
        map.addAttribute("listaRaport", raportFinalJDBCDAO.getAll());
        map.addAttribute("listaBD", bdJDBCDAO.getAll());
        map.addAttribute("listaAM", alteMaterialeJDBCDAO.getAll());

        return "main";
    }

    @RequestMapping(value = "/buget", method = RequestMethod.GET)
    public String getBugetPage(ModelMap map) {

        map.addAttribute("proiect", new ListaProiecte());
        map.addAttribute("listaProiecte", proiecteJDBCDAO.getAll());
        map.addAttribute("client", new Client());
        map.addAttribute("listaClienti", clientiJDBCDAO.getAll());

        return "buget";
    }

    @RequestMapping(value = "/cheltuieli", method = RequestMethod.GET)
    public String getCheltuieliPage(ModelMap map) {

        map.addAttribute("proiect", new ListaProiecte());
        map.addAttribute("listaProiecte", proiecteJDBCDAO.getAll());
        map.addAttribute("client", new Client());
        map.addAttribute("listaClienti", clientiJDBCDAO.getAll());

        return "cheltuieli";
    }
}
