package projectManager.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import projectManager.dao.*;
import projectManager.dao.jdbc.RolesJDBCDAO;
import projectManager.dao.jdbc.UserRolesJDBCDAO;
import projectManager.repository.Client;
import projectManager.repository.ListaProiecte;
import projectManager.repository.User;

@Controller
public class AdminController {

    @Autowired
    MessageSource messageSource;
    @Autowired
    private UserDAO userJDBCDAO;
    @Autowired
    private ListaProiecteDAO listaProiecteJDBCDAO;
    @Autowired
    private ClientDAO clientiJDBCDAO;
    @Autowired
    private UserRolesDAO userRolesJDBCDAO;
    @Autowired
    private RolesDAO rolesJDBCDAO;


    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String proiecte(ModelMap map) {

        map.addAttribute("proiect", new ListaProiecte());
        map.addAttribute("listaProiecte", listaProiecteJDBCDAO.getAll());
        map.addAttribute("client", new Client());
        map.addAttribute("listaClienti", clientiJDBCDAO.getAll());
        map.addAttribute("user", new User());
        map.addAttribute("listaUsers", userJDBCDAO.getAll());
        map.addAttribute("listaRoluri", rolesJDBCDAO.getAll());

        return "admin";
    }


    @RequestMapping(value = "/modificaUser", method = RequestMethod.POST)
    public String modUser(@ModelAttribute(value = "user") User user, BindingResult result) {

        userJDBCDAO.update(user);
        return "redirect:/admin#modUsers";
    }

    @RequestMapping(value = "/adaugaUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute(value = "user") User user, BindingResult result) {
        userJDBCDAO.create(user);
        return "redirect:/admin#addUser";
    }
}
