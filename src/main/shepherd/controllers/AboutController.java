package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AboutController {

    @Autowired
    MessageSource messageSource;

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String proiecte() {
        return "about";
    }

}
