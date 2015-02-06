package projectManager.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import projectManager.repository.Cod3;
import projectManager.repository.dao.Cod1DAO;
import projectManager.repository.dao.Cod2DAO;
import projectManager.repository.dao.Cod3DAO;
import projectManager.repository.dao.LocDAO;

@Controller
public class InventarController {
    @Autowired
    MessageSource messageSource;
    @Autowired
    private Cod1DAO cod1DAO;


    @RequestMapping(value = "/inventar", method = RequestMethod.GET)
    public String inventar(ModelMap map) {

        map.addAttribute("cod1", cod1DAO.getAll());
        return "inventar";
    }

}
