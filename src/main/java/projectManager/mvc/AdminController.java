package projectManager.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import projectManager.repository.dao.RolesDAO;

@Controller
public class AdminController {

    @Autowired
    private RolesDAO rolesDAO;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String proiecte(ModelMap map) {
        map.addAttribute("listaRoluri", rolesDAO.getAll());
        return "admin";
    }
}
