package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping
public class LoginController {
    @Autowired
    MessageSource messageSource;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView firstPage(@RequestParam(value = "error", required = false) String error,
                                  @RequestParam(value = "logout", required = false) String logout,
                                  @RequestParam(value = "notActive", required = false) String notActive) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Utilizator sau parola gresita!");
        }

        if (notActive != null) {
            model.addObject("notActive", "Utilizator este inactiv!");
        }

        if (logout != null) {
            model.addObject("msg", "Iesire cu succes");
        }
        model.setViewName("login");

        return model;

    }

}
