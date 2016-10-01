package edu.gsu.smp.service;

import javax.mail.MessagingException;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationAdapter;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.validation.BindingResult;

import edu.gsu.smp.dto.ChangePasswordForm;
import edu.gsu.smp.dto.ForgotPasswordForm;
import edu.gsu.smp.dto.ResetPasswordForm;
import edu.gsu.smp.dto.UserDetailsImpl;
import edu.gsu.smp.dto.UserEditForm;
import edu.gsu.smp.entities.User;
import edu.gsu.smp.entities.User.Role;
import edu.gsu.smp.mail.MailSender;
import edu.gsu.smp.repositories.UserRepository;
import edu.gsu.smp.util.MyUtil;

@Service
@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
public class UserServiceImpl implements UserService, UserDetailsService {
	
    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	private UserRepository userRepository;
	private PasswordEncoder passwordEncoder;
    private MailSender mailSender;

	@Autowired
	public UserServiceImpl(UserRepository userRepository,
			PasswordEncoder passwordEncoder,
			MailSender mailSender) {
		
		this.mailSender = mailSender;
		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
		
	}

	/*@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public void signup(SignupForm signupForm) {
		final User user = new User();
		user.setEmail(signupForm.getEmail());
		user.setName(signupForm.getName());
		user.setPassword(passwordEncoder.encode(signupForm.getPassword()));
		user.getRoles().add(Role.UNVERIFIED);
		user.setVerificationCode(RandomStringUtils.randomAlphanumeric(16));
		userRepository.save(user);
		
		TransactionSynchronizationManager.registerSynchronization(
			    new TransactionSynchronizationAdapter() {
			        @Override
			        public void afterCommit() {
			    		try {
			    			String verifyLink = MyUtil.hostUrl() + "/users/" + user.getVerificationCode() + "/verify";
			    			mailSender.send(user.getEmail(), MyUtil.getMessage("verifySubject"), MyUtil.getMessage("verifyEmail", verifyLink));
			    			logger.info("Verification mail to " + user.getEmail() + " queued.");
						} catch (MessagingException e) {
							logger.error(ExceptionUtils.getStackTrace(e));
						}
			        }
		    });
		
	}*/

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		User user = userRepository.findByEmail(username);
		if (user == null)
			throw new UsernameNotFoundException(username);

		return new UserDetailsImpl(user);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public void verify(String verificationCode) {
		
		long loggedInUserId = MyUtil.getSessionUser().getId();
		User user = userRepository.findOne(loggedInUserId);
		
		MyUtil.validate(user.getRoles().contains(Role.UNVERIFIED), "alreadyVerified");
		MyUtil.validate(user.getVerificationCode().equals(verificationCode),
				"incorrect", "verification code");
		
		user.getRoles().remove(Role.UNVERIFIED);
		user.setVerificationCode(null);
		userRepository.save(user);

		
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public void forgotPassword(ForgotPasswordForm form) {
		
		final User user = userRepository.findByEmail(form.getEmail());
		final String forgotPasswordCode = RandomStringUtils.randomAlphanumeric(User.RANDOM_CODE_LENGTH);
		
		user.setForgotPasswordCode(forgotPasswordCode);
		final User savedUser = userRepository.save(user);
		
		TransactionSynchronizationManager.registerSynchronization(
			    new TransactionSynchronizationAdapter() {
			        @Override
			        public void afterCommit() {
			        	try {
							mailForgotPasswordLink(savedUser);
						} catch (MessagingException e) {
							logger.error(ExceptionUtils.getStackTrace(e));
						}
			        }

		    });				

	}
	
	private void mailForgotPasswordLink(User user) throws MessagingException {
		
		String forgotPasswordLink = 
				MyUtil.hostUrl() + "/reset-password/" +
				user.getForgotPasswordCode();
		mailSender.send(user.getEmail(),
				MyUtil.getMessage("forgotPasswordSubject"),
				MyUtil.getMessage("forgotPasswordEmail", forgotPasswordLink));

	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public void resetPassword(String forgotPasswordCode,
			ResetPasswordForm resetPasswordForm,
			BindingResult result) {
		
		User user = userRepository.findByForgotPasswordCode(forgotPasswordCode);
		if (user == null)
			result.reject("invalidForgotPassword");
		
		if (result.hasErrors())
			return;
		
		user.setForgotPasswordCode(null);
		user.setPassword(passwordEncoder.encode(resetPasswordForm.getPassword().trim()));
		userRepository.save(user);
	}


	@Override
	public User findOne(long userId) {
		
		User loggedIn = MyUtil.getSessionUser();
		User user = userRepository.findOne(userId);

		if (loggedIn == null ||
			loggedIn.getId() != user.getId() && !loggedIn.isAdmin())
			
			user.setEmail("Confidential");
			
		return user;

	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public void update(long userId, UserEditForm userEditForm) {
		
		User loggedIn = MyUtil.getSessionUser();
		MyUtil.validate(loggedIn.isAdmin() || loggedIn.getId() == userId, "noPermissions");
		User user = userRepository.findOne(userId);
		user.setName(userEditForm.getName());
		if (loggedIn.isAdmin())
			user.setRoles(userEditForm.getRoles());
		userRepository.save(user);
		
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public void updatePassword(ChangePasswordForm changePasswordForm) {
		
		try {
			// Getting user record by its session id
			User user = userRepository.findOne(MyUtil.getSessionUser().getId());
			// encrypting new password and setting it to the password field
			user.setPassword(passwordEncoder.encode(changePasswordForm.getNewPassword()));
			userRepository.save(user);
			
			TransactionSynchronizationManager.registerSynchronization(
				    new TransactionSynchronizationAdapter() {
				        @Override
				        public void afterCommit() {
				    		try {
	
				    			String loginLink = MyUtil.hostUrl() + "/login";
				    			mailSender.send(user.getEmail(), MyUtil.getMessage("passwordChanged"), MyUtil.getMessage("passwordChanged", loginLink));
							} catch (MessagingException e) {
								logger.error(ExceptionUtils.getStackTrace(e));
							}
				        }
			    });
		} catch (Exception e) {
			return;
		}
		return;
	}
}