package fr.floor11.test.roo.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import fr.floor11.test.roo.Client;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "clients", formBackingObject = Client.class)
@RequestMapping("/clients")
@Controller
public class ClientController {
}
