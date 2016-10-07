package edu.gsu.smp.admin.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.gsu.smp.entities.ClientProspect;
import edu.gsu.smp.service.ClientProspectService;

@Controller
@RequestMapping("/admin/client")
public class ClientProspectController {
	
	private ClientProspectService clientProspectService;
	
	@Autowired
	public void setClientProspectService(ClientProspectService clientProspectService) {
		this.clientProspectService = clientProspectService;
	}

	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("clientProspect", new ClientProspect());
		return "/admin/create-client-prospect";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createEmployee(@ModelAttribute("clientProspect") @Valid ClientProspect clientProspect,
			BindingResult result, RedirectAttributes redirectAttributes) {
		if(result.hasErrors()) {
			return "/admin/create-client-prospect";
		}
		clientProspectService.create(clientProspect);
		return "redirect:/";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("clientProspect", clientProspectService.list(true));
		return "/admin/list-client-prospect";
	}
	
}
