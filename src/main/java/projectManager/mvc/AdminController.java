package projectManager.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import projectManager.repository.Roles;
import projectManager.repository.dao.ArticoleDAO;
import projectManager.repository.dao.LocDAO;
import projectManager.repository.dao.PersoanaDAO;
import projectManager.repository.dao.RolesDAO;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private RolesDAO rolesDAO;
    @Autowired
    private PersoanaDAO persoanaDAO;
    @Autowired
    private LocDAO locDAO;
    @Autowired
    private ArticoleDAO articoleDAO;


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
        map.addAttribute("listaPersoane", persoanaDAO.getAll());
        map.addAttribute("listaLocuri", locDAO.getAll());
        map.addAttribute("listaArticole", articoleDAO.getAll());
        return "admin";
    }
}
