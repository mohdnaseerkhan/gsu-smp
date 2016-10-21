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

import edu.gsu.smp.entities.Proposal;
import edu.gsu.smp.service.ContactService;
import edu.gsu.smp.service.ProposalService;

@Controller
@RequestMapping("/admin/proposal")
@Secured({"ROLE_ADMIN", "ROLE_MANAGER", "ROLE_EMPLOYEE"})
public class ProposalController {

	private ContactService contactService;
	private ProposalService proposalService;
	
	@Autowired
	public ProposalController(ContactService contactService, ProposalService proposalService) {
		this.contactService = contactService;
		this.proposalService = proposalService;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("proposal", new Proposal());
		model.addAttribute("clients", contactService.allClient());
		return "/admin/proposal/create-proposal";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(@ModelAttribute("proposal") @Valid Proposal proposal,
			BindingResult result, RedirectAttributes redirectAttributes, Model model) {
		
		if(result.hasErrors()) {
			System.out.println("getAccountManagergetAccountManager : :" + proposal.getAccountManager());
			model.addAttribute("clients", contactService.allClient());
			return "/admin/proposal/create-proposal";
		}
		proposalService.create(proposal);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="{id}/update", method=RequestMethod.GET)
	public String update(Model model, @PathVariable long id) {
		model.addAttribute("clients", contactService.allClient());
		model.addAttribute("proposal", proposalService.findOneById(id));
		return "/admin/proposal/create-proposal";
	}
	
	@RequestMapping(value="{id}/update", method=RequestMethod.POST)
	public String update(@ModelAttribute("proposal") @Valid Proposal proposal,
			BindingResult result, RedirectAttributes redirectAttributes, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("clients", contactService.allClient());
			return "/admin/proposal/create-proposal";
		}
		proposalService.create(proposal);
		return "redirect:/admin/client/" + proposal.getCpId() + "/show";
	}

}
