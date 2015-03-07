package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SetariController {
    @Autowired
    MessageSource messageSource;

    @RequestMapping(value = "/setari", method = RequestMethod.GET)
    public String proiecte(ModelMap map) {

        return "setari";
    }

}
