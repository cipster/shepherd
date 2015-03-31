package controllers.inventar;

import model.dao.ArticolDAO;
import model.dao.PersoanaDAO;
import model.dao.UserRoleDAO;
import model.dto.Articol;
import model.dto.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import util.enums.RoleType;

import java.util.List;

/**
 * @author Ciprian on 3/30/2015.
 *
 *         Shepherd
 */

@Controller
@RequestMapping(value = "/global/inventar/articole")
public class InventarArticoleController {

    @Autowired
    private ArticolDAO articolDAO;
    @Autowired
    private UserRoleDAO userRoleDAO;
    @Autowired
    private PersoanaDAO persoanaDAO;


    @Transactional(isolation = Isolation.READ_UNCOMMITTED)
    @PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
    @RequestMapping(value = "/getinventory", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Articol> getAllStoc() {
        if (isAdmin()) {
            return articolDAO.getAll();
        } else {
            return articolDAO.getOnlyMine(getIdPersoana());
        }
    }

    private int getIdPersoana(){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        try {
            return persoanaDAO.findByUsername(user.getUsername()).getIdPersoana();
        } catch (DataAccessException e) {
            return 0;
        }
    }

    private boolean isAdmin() {
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<UserRole> userRoles = userRoleDAO.findByID(user.getUsername());
        for (UserRole x : userRoles) {
            if (x.getRole().equals(RoleType.ROLE_ADMIN.getFullName()) || x.getRole().equals(RoleType.ROLE_SUPERUSER.getFullName())) {
                return true;
            }
        }
        return false;
    }

}
