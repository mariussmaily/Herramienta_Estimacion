package com.becarios.proyecto_definitivo.web.controller.sub;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ControladorCostes {

    @RequestMapping(value = "/costes", method = RequestMethod.GET)
    public String index(ModelMap model) {

        return "costes/costes";
    }

}
