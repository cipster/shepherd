package controllers;

import model.domain.Proiect;
import model.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import model.domain.Client;

@Controller
public class MainController {

    @Autowired
    MessageSource messageSource;


    @Autowired
    private ProiectDAO proiecteJDBCDAO;
    @Autowired
    private PropunereDAO propunereJDBCDAO;
    @Autowired
    private ChestionarFinalDAO chestionarFinalJDBCDAO;
    @Autowired
    private RaportFinalDAO raportFinalJDBCDAO;
    @Autowired
    private AlteMaterialeDAO alteMaterialeJDBCDAO;
    @Autowired
    private ClientDAO clientiDAO;
    @Autowired
    private BdDAO bdDAO;


    @RequestMapping(value = {"/main", "/"}, method = RequestMethod.GET)
    public String getMainPage(ModelMap map) {

        map.addAttribute("proiect", new Proiect());
        map.addAttribute("listaProiecte", proiecteJDBCDAO.getAll());
        map.addAttribute("client", new Client());
        map.addAttribute("listaClienti", clientiDAO.getAll());
        map.addAttribute("listaPropunere", propunereJDBCDAO.getAll());
        map.addAttribute("listaChestionar", chestionarFinalJDBCDAO.getAll());
        map.addAttribute("listaRaport", raportFinalJDBCDAO.getAll());
        map.addAttribute("listaBD", bdDAO.getAll());
        map.addAttribute("listaAM", alteMaterialeJDBCDAO.getAll());

        return "main";
    }
}
