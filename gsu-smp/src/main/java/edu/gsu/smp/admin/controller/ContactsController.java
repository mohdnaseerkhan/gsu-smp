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

import edu.gsu.smp.entities.Contacts;
import edu.gsu.smp.service.ContactService;

@Controller
@RequestMapping("/admin/contact")
@Secured({"ROLE_ADMIN", "ROLE_MANAGER", "ROLE_EMPLOYEE"})
public class ContactsController {
	
	private ContactService contactService;
	
	@Autowired
	public ContactsController(ContactService contactService) {
		this.contactService = contactService;
	}

	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("contact", new Contacts());
		model.addAttribute("clients", contactService.allClient());
		return "/admin/contact/create-contact";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(@ModelAttribute("contact") @Valid Contacts contact,
			BindingResult result, RedirectAttributes redirectAttributes) {
		
		if(result.hasErrors()) {
			return "/admin/contact/create-contact";
		}
		
		contactService.create(contact);
		return "redirect:/";
	}
	
	/*@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("contact", contactService.list(true));
		return "/admin/list-client-prospect";
	}*/
	
	@RequestMapping(value="{id}/update", method=RequestMethod.GET)
	public String update(Model model, @PathVariable long id) {
		model.addAttribute("clients", contactService.allClient());
		model.addAttribute("contact", contactService.update(id));
		return "/admin/contact/create-contact";
	}

}
