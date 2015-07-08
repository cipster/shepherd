package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import services.*;

@Controller
public class RapoarteController {

    @Autowired
    private LocService locService;
    @Autowired
    private PersoanaService persoanaService;
    @Autowired
    private ArticolService articolService;
    @Autowired
    private Cod1Service cod1Service;
    @Autowired
    private Cod2Service cod2Service;

    @RequestMapping(value = "/raport", method = RequestMethod.GET)
    public String proiecte(ModelMap map) {
        map.addAttribute("locuri", locService.fetchAllLocuri());
        map.addAttribute("persoane", persoanaService.fetchAllPersoane());
        map.addAttribute("articole", articolService.fetchAllCod3());
        map.addAttribute("listaCod1", cod1Service.fetchAllCod1());
        map.addAttribute("listaCod2", cod2Service.fetchAllCod2());

        return "rapoarte";
    }
}
