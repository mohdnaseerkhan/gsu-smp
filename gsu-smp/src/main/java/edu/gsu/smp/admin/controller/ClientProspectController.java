package edu.gsu.smp.admin.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.gsu.smp.entities.ClientProspect;
import edu.gsu.smp.service.ClientProspectService;
import edu.gsu.smp.util.MyUtil;

@Controller
@RequestMapping("/admin/client")
@Secured({"ROLE_ADMIN", "ROLE_MANAGER", "ROLE_EMPLOYEE"})
public class ClientProspectController {
	
	private ClientProspectService clientProspectService;
	
	@Autowired
	public void setClientProspectService(ClientProspectService clientProspectService) {
		this.clientProspectService = clientProspectService;
	}

	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("clientProspect", new ClientProspect());
		return "/admin/client/create-client-prospect";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(@ModelAttribute("clientProspect") @Valid ClientProspect clientProspect,
			BindingResult result, RedirectAttributes redirectAttributes) {
		if(result.hasErrors()) {
			return "/admin/client/create-client-prospect";
		}
		clientProspectService.create(clientProspect);
		return "redirect:/";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("clientProspect", clientProspectService.list(true));
		return "/admin/client/list-client-prospect";
	}
	
	@RequestMapping(value="{id}/update", method=RequestMethod.GET)
	public String update(Model model, @PathVariable long id) {
		model.addAttribute("clientProspect", clientProspectService.edit(id));
		return "/admin/client/create-client-prospect";
	}
	
	@RequestMapping(value="{id}/update", method=RequestMethod.POST)
	public String update(@ModelAttribute("clientProspect") @Valid ClientProspect clientProspect,
			BindingResult result, RedirectAttributes redirectAttributes) {
		
		if(result.hasErrors()) {
			return "/admin/client/create-client-prospect";
		}
		
		clientProspectService.create(clientProspect);
		return "redirect:/";
	}
	
	@RequestMapping(value="{id}/delete")
	public String delete(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {	
		
		boolean deletesucessful = clientProspectService.delete(id);
		
		if(!deletesucessful) {
			MyUtil.flash(redirectAttributes, "danger", "deleteFailed");
		} else {
			MyUtil.flash(redirectAttributes, "success", "deleteSuccess");
		}
		
		return "redirect:/admin/client/list";
	}	
	
}
