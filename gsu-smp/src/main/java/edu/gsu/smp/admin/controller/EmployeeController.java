package edu.gsu.smp.admin.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Random;

import javax.validation.Valid;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.gsu.smp.entities.User;

@Controller
@Secured({"ROLE_ADMIN"})
@RequestMapping("/admin")
public class EmployeeController {
	
	public EmployeeController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/create-employee", method=RequestMethod.GET)
	@Secured({"ROLE_ADMIN", "ROLE_EMPLOYEE"})
	public String createEmployee(Model model) {
		User user = new User();
		user.setPassword(new BigInteger(32, new SecureRandom()).toString(32));
		model.addAttribute("user", user);
		return "/admin/create-employee";
	}
	
	@RequestMapping(value="/create-employee", method=RequestMethod.POST)
	public String createEmployee(@ModelAttribute("user") @Valid User user,
			BindingResult result, RedirectAttributes redirectAttributes) {
		
		return "";
	}

}
