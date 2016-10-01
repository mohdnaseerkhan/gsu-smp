package edu.gsu.smp.service;

import org.springframework.validation.BindingResult;

import edu.gsu.smp.dto.ChangePasswordForm;
import edu.gsu.smp.dto.ForgotPasswordForm;
import edu.gsu.smp.dto.ResetPasswordForm;
import edu.gsu.smp.dto.UserEditForm;
import edu.gsu.smp.entities.User;


public interface UserService {

	public abstract void verify(String verificationCode);

	public abstract void forgotPassword(ForgotPasswordForm forgotPasswordForm);

	public abstract void resetPassword(String forgotPasswordCode,
			ResetPasswordForm resetPasswordForm, BindingResult result);

	public abstract User findOne(long userId);

	public abstract void update(long userId, UserEditForm userEditForm);

	public abstract void updatePassword(ChangePasswordForm changePasswordForm);
	
}
