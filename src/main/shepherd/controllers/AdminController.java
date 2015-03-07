package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import model.dao.Roles;
import model.interfaces.RolesDAO;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private RolesDAO rolesDAO;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String proiecte(ModelMap map) {
        Roles admin = new Roles();
        admin.setIdRole(2);
        Roles superuser = new Roles();
        superuser.setIdRole(8);
        List<Roles> rolesList = rolesDAO.getAll();

        String role = SecurityContextHolder.getContext().getAuthentication().getAuthorities().iterator().next().getAuthority();

        if(role.compareTo("ROLE_ADMIN") != 0) {
            rolesList.remove(admin);
            rolesList.remove(superuser);
        }
        map.addAttribute("listaRoluri", rolesList);
        return "admin";
    }
}
