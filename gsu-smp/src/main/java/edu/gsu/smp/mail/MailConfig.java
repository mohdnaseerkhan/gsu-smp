package edu.gsu.smp.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Session;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

	@Value("${mail.sender.host}")
	private String host;

	@Value("${smtp.authenticator.email}")
	private String username;

	@Value("${smtp.authenticator.password}")
	private String password;

	@Bean
	@Profile("!dev")
	public MailSender mockMailSender() {
		return new MockMailSender();
	}

	@Bean
	@Profile("dev")
	public MailSender smtpMailSender() {
		SmtpMailSender mailSender = new SmtpMailSender();
		mailSender.setJavaMailSender(javaMailSender());
		return mailSender;
	}

	@Bean
	public JavaMailSender javaMailSender() {
		JavaMailSenderImpl sender = new JavaMailSenderImpl();

		sender.setHost(host);
		sender.setSession(getMailSession());

		return sender;
	}

	private Session getMailSession() {
		Properties props = new Properties();

		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.from", username);
		props.put("mail.smtp.starttls.enable", true);
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.ssl.trust", "*");

		return Session.getInstance(props, getAuthenticator());

	}

	private Authenticator getAuthenticator() {
		SmtpAuthenticator authenticator = new SmtpAuthenticator();
		authenticator.setUsername(username);
		authenticator.setPassword(password);
		return authenticator;
	}

}
