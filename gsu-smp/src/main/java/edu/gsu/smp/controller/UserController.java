package edu.gsu.smp.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.gsu.smp.dto.ChangePasswordForm;
import edu.gsu.smp.dto.UserEditForm;
import edu.gsu.smp.entities.User;
import edu.gsu.smp.service.UserService;
import edu.gsu.smp.util.MyUtil;


@Controller
@RequestMapping("/users")
public class UserController {
	
	private UserService userService;
	
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("/{verificationCode}/verify")
	public String verify(@PathVariable("verificationCode") String verificationCode,
			RedirectAttributes redirectAttributes,
			HttpServletRequest request) throws ServletException {
		
		userService.verify(verificationCode);
		MyUtil.flash(redirectAttributes, "success", "verificationSuccess");
		request.logout();
		
		return "redirect:/";

	}
	
    @RequestMapping(value = "/{userId}")
    public String getById(@PathVariable("userId") long userId, Model model) {
    	model.addAttribute(userService.findOne(userId));
	  	return "user";
    }
    
    @RequestMapping(value = "/{userId}/edit")
    public String edit(@PathVariable("userId") long userId, Model model) {
		User user = userService.findOne(userId);
    	model.addAttribute(user);
    	
		return "user-edit";

    }
    
	@RequestMapping(value = "/{userId}/edit", method = RequestMethod.POST)
	public String edit(@PathVariable("userId") long userId,
			@ModelAttribute("userEditForm") @Valid UserEditForm userEditForm,
			BindingResult result, RedirectAttributes redirectAttributes,
			HttpServletRequest request) throws ServletException {

		if (result.hasErrors())
			return "user-edit";

		userService.update(userId, userEditForm);
		MyUtil.flash(redirectAttributes, "success", "editSuccessful");
		// request.logout();

		return "redirect:/";
	}
	
	@RequestMapping(value="/{id}/change-password", method=RequestMethod.GET)
	public String changePassword(Model model) {
		model.addAttribute("changePasswordForm", new ChangePasswordForm());
		model.addAttribute("title", MyUtil.getMessage("changePasswordTitle"));
		return "change-password";
	}
	
	@RequestMapping(value="/{id}/change-password", method=RequestMethod.POST)
	public String changePassword(@ModelAttribute("changePasswordForm") @Valid ChangePasswordForm changePasswordForm, 
			BindingResult result, RedirectAttributes redirectAttributes, Model model) {
		
		if(result.hasErrors()){
			model.addAttribute("title", MyUtil.getMessage("passwordChanged"));
			return "change-password";
		}
		userService.updatePassword(changePasswordForm);
		MyUtil.flash(redirectAttributes, "success", "passwordChanged");
		return "redirect:/";
	}
}
