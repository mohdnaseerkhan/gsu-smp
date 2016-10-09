package edu.gsu.smp.admin.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.gsu.smp.entities.Contacts;
import edu.gsu.smp.entities.Project;
import edu.gsu.smp.service.ContactService;
import edu.gsu.smp.service.ProjectService;

@Controller
@RequestMapping("/admin/project")
@Secured({"ROLE_ADMIN", "ROLE_MANAGER", "ROLE_EMPLOYEE"})
public class ProjectController {
	
private ContactService contactService;
private ProjectService projectService;
	
	@Autowired
	public ProjectController(ContactService contactService, ProjectService projectService) {
		this.contactService = contactService;
		this.projectService = projectService;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("project", new Project());
		model.addAttribute("clients", contactService.allClient());
		return "/admin/project/create-project";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(@ModelAttribute("contact") @Valid Project project,
			BindingResult result, RedirectAttributes redirectAttributes) {
		
		if(result.hasErrors()) {
			return "/admin/project/create-project";
		}
		
		projectService.create(project);
		return "redirect:/";
	}

}
