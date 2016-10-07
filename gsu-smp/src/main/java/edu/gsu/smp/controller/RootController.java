package edu.gsu.smp.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.gsu.smp.dto.ForgotPasswordForm;
import edu.gsu.smp.dto.ResetPasswordForm;
import edu.gsu.smp.service.UserService;
import edu.gsu.smp.util.MyUtil;

@Controller
public class RootController {

	private static final Logger logger = LoggerFactory.getLogger(RootController.class);
	
	private UserService userService;

	@Autowired
	public RootController(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		if(MyUtil.getSessionUser() != null) {
			return "dashboard";
		}
		return "index";
	}
	
	@RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
	public String forgotPassword(Model model) {
		
		model.addAttribute(new ForgotPasswordForm());
		
		return "forgot-password";
		
	}
	
	/*@RequestMapping("/error")
	public String error() {
		return "error";
	}*/
	

	/**
	 * Forgot password
	 */
	@RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
	public String forgotPassword(
			@ModelAttribute("forgotPasswordForm") @Valid ForgotPasswordForm forgotPasswordForm,
			BindingResult result, RedirectAttributes redirectAttributes) {
		if (result.hasErrors())
			return "forgot-password";

		userService.forgotPassword(forgotPasswordForm);
		MyUtil.flash(redirectAttributes, "info", "checkMailResetPassword");

		return "redirect:/";
	}
	
    /**
     * Reset password
     */
    @RequestMapping(value = "/reset-password/{forgotPasswordCode}")
    public String resetPassword(@PathVariable("forgotPasswordCode") String forgotPasswordCode, Model model) {
    	
     	model.addAttribute(new ResetPasswordForm());
    	return "reset-password";
    	
    }
    
	@RequestMapping(value = "/reset-password/{forgotPasswordCode}",
			method = RequestMethod.POST)
	public String resetPassword(
			@PathVariable("forgotPasswordCode") String forgotPasswordCode,
			@ModelAttribute("resetPasswordForm")
				@Valid ResetPasswordForm resetPasswordForm,
			BindingResult result,
			RedirectAttributes redirectAttributes) {

		userService.resetPassword(forgotPasswordCode, resetPasswordForm, result);
		
		if (result.hasErrors())
			return "reset-password";

		MyUtil.flash(redirectAttributes, "success", "passwordChanged");

		return "redirect:/login";
	}
}
