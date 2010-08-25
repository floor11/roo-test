package fr.floor11.test.roo.web;

import fr.floor11.test.roo.Client;
import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ClientController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ClientController.create(@Valid Client client, BindingResult result, ModelMap modelMap) {
        if (client == null) throw new IllegalArgumentException("A client is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("client", client);
            return "clients/create";
        }
        client.persist();
        return "redirect:/clients/" + client.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ClientController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("client", new Client());
        return "clients/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ClientController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("client", Client.findClient(id));
        return "clients/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ClientController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("clients", Client.findClientEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Client.countClients() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("clients", Client.findAllClients());
        }
        return "clients/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ClientController.update(@Valid Client client, BindingResult result, ModelMap modelMap) {
        if (client == null) throw new IllegalArgumentException("A client is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("client", client);
            return "clients/update";
        }
        client.merge();
        return "redirect:/clients/" + client.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ClientController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("client", Client.findClient(id));
        return "clients/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ClientController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Client.findClient(id).remove();
        return "redirect:/clients?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    Converter<Client, String> ClientController.getClientConverter() {
        return new Converter<Client, String>() {
            public String convert(Client client) {
                return new StringBuilder().append(client.getNom()).append(" ").append(client.getPrenom()).append(" ").append(client.getNumTelephone()).toString();
            }
        };
    }
    
    @InitBinder
    void ClientController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getClientConverter());
        }
    }
    
}
