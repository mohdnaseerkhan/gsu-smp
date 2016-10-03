package edu.gsu.smp.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

import edu.gsu.smp.dto.ChangePasswordForm;
import edu.gsu.smp.entities.User;
import edu.gsu.smp.repositories.UserRepository;
import edu.gsu.smp.util.MyUtil;

@Component
public class ChangePasswordFormValidator extends LocalValidatorFactoryBean {
	
	private UserRepository userRepository;
	
	@Autowired
	public ChangePasswordFormValidator(UserRepository userRepository){
		this.userRepository = userRepository;
	}
	
	// method of LocalValidatorFactoryBean class, supports Bean Validation
	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(ChangePasswordForm.class);
	}

	// validating the current password while password change 
	@Override
	public void validate(Object obj, Errors errors, final Object... validationHints) {
		super.validate(obj, errors, validationHints);
		long id = MyUtil.getSessionUser().getId();
		User user = userRepository.findOne(id);
		if (!errors.hasErrors()) {
			ChangePasswordForm changePassword = (ChangePasswordForm) obj;
			if(!BCrypt.checkpw(changePassword.getPassword(), user.getPassword())){
				errors.rejectValue("password", "currentPassword");
			}
			if (!changePassword.getNewPassword().equals(changePassword.getConfirmPassword())) {
				errors.rejectValue("confirmPassword", "passwordsDoNotMatch");
			}
		}
	}
}