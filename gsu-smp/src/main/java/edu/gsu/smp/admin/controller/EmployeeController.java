package edu.gsu.smp.admin.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Arrays;

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

import edu.gsu.smp.entities.User;
import edu.gsu.smp.service.UserServiceImpl;

@Controller
@RequestMapping("/admin")
@Secured({"ROLE_ADMIN"})
public class EmployeeController {
	
	private UserServiceImpl userServiceImpl;
	
	@Autowired
	public void setUserService(UserServiceImpl userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}
	
	@RequestMapping(value="/create-employee", method=RequestMethod.GET)
	@Secured({"ROLE_ADMIN"})
	public String createEmployee(Model model) {
		User user = new User();
		model.addAttribute("roles", Arrays.asList(User.Role.values()));
		user.setPassword(new BigInteger(32, new SecureRandom()).toString(32));
		model.addAttribute("user", user);
		return "/admin/employee/create-employee";
	}

	@RequestMapping(value="/create-employee", method=RequestMethod.POST)
	@Secured({"ROLE_ADMIN"})
	public String createEmployee(@ModelAttribute("user") @Valid User user,
			BindingResult result, RedirectAttributes redirectAttributes) {
		
		user.setPassword(new BigInteger(32, new SecureRandom()).toString(32));
		
		System.out.println("this is your tmporary password: " + user.getPassword());
		
		if(result.hasErrors()) {
			return "/admin/employee/create-employee";
		}
		
		userServiceImpl.createEmployee(user);
		return "redirect:/";
	}

	@RequestMapping(value="/employees", method=RequestMethod.GET)
	@Secured({"ROLE_ADMIN"})
	public String list(Model model) {
		model.addAttribute("employees", userServiceImpl.list());
		return "/admin/employee/list-employee";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/{id}/update-employee", method=RequestMethod.GET)
	public String updateEmployee(Model model, @PathVariable("id") long id) {
		model.addAttribute("roles", Arrays.asList(User.Role.values()));
		model.addAttribute("user", userServiceImpl.findOne(id));
		return "/admin/employee/create-employee";
	}
	
	@RequestMapping(value="/{id}/update-employee", method=RequestMethod.POST)
	@Secured({"ROLE_ADMIN"})
	public String updateEmployee(@ModelAttribute("user") @Valid User user,
			BindingResult result, RedirectAttributes redirectAttributes, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("roles", Arrays.asList(User.Role.values()));
			model.addAttribute("user", user);
			return "/admin/employee/create-employee";
		}
		userServiceImpl.updateEmployee(user);
		return "redirect:/";
	}
}
