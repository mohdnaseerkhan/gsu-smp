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

import edu.gsu.smp.entities.Opportunity;
import edu.gsu.smp.service.ContactService;
import edu.gsu.smp.service.OpportunityService;

@Controller
@RequestMapping("/admin/opportunity")
@Secured({"ROLE_ADMIN", "ROLE_MANAGER", "ROLE_EMPLOYEE"})
public class OpportunityController {
	
	private OpportunityService opportunityService;
	private ContactService contactService;
	
	@Autowired
	public OpportunityController(OpportunityService opportunityService, ContactService contactService) {
		this.opportunityService = opportunityService;
		this.contactService = contactService;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("opportunity", new Opportunity());
		model.addAttribute("clients", contactService.allClient());
		return "/admin/opportunity/create-opportunity";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(@ModelAttribute("opportunity") @Valid Opportunity opportunity,
			BindingResult result, RedirectAttributes redirectAttributes, Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("clients", contactService.allClient());
			return "/admin/opportunity/create-opportunity";
		}
		
		opportunityService.create(opportunity);
		return "redirect:/";
	}
	
	@RequestMapping(value="{id}/update", method=RequestMethod.GET)
	public String update(Model model, @PathVariable long id) {
		model.addAttribute("clients", contactService.allClient());
		model.addAttribute("opportunity", opportunityService.findOneById(id));
		return "/admin/opportunity/create-opportunity";
	}
	
	@RequestMapping(value="{id}/update", method=RequestMethod.POST)
	public String update(@ModelAttribute("opportunity") @Valid Opportunity opportunity,
			BindingResult result, RedirectAttributes redirectAttributes, Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("clients", contactService.allClient());
			return "/admin/opportunity/create-opportunity";
		}
		opportunityService.create(opportunity);
		return "redirect:/admin/client/" + opportunity.getCpId() + "/show";
	}

}
