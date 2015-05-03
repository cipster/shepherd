package controllers.inventar;

import model.dao.ArticolDAO;
import model.dao.PersoanaDAO;
import model.dao.UserRoleDAO;
import model.domain.Articol;
import model.domain.Evidenta;
import model.domain.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import services.ArticolService;
import util.enums.RoleType;

import javax.validation.constraints.NotNull;
import java.util.List;

@Controller
@RequestMapping(value = "/global/inventar/articole")
public class InventarArticoleRestController {

    @Autowired
    private ArticolDAO articolDAO;
    @Autowired
    private UserRoleDAO userRoleDAO;
    @Autowired
    private PersoanaDAO persoanaDAO;
    @Autowired
    private ArticolService articolService;


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

    @Transactional(isolation = Isolation.READ_UNCOMMITTED)
    @PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
    @RequestMapping(value = "/gethistory/{barcode}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Evidenta> getHistoryForCode(@PathVariable @NotNull String barcode) {
        return articolService.fetchEvidentaByBarcode(barcode);
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
