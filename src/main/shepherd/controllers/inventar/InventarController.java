package controllers.inventar;

import model.dao.Cod1DAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
