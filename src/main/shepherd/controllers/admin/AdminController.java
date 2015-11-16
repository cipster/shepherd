package controllers.admin;

import model.dao.RoleDAO;
import model.domain.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private RoleDAO roleDAO;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String proiecte(ModelMap map) {
        Role admin = new Role();
        admin.setIdRole(2);
        Role superuser = new Role();
        superuser.setIdRole(8);
        List<Role> roleList = roleDAO.getAll();

        String role = SecurityContextHolder.getContext().getAuthentication().getAuthorities().iterator().next().getAuthority();

        if(role.compareTo("ROLE_ADMIN") != 0) {
            roleList.remove(admin);
            roleList.remove(superuser);
        }
        map.addAttribute("listaRoluri", roleList);
        return "admin";
    }
}
