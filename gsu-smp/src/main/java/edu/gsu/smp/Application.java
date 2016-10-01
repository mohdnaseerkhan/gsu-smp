package edu.gsu.smp;

import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

import edu.gsu.smp.entities.User;
import edu.gsu.smp.entities.User.Role;
import edu.gsu.smp.repositories.UserRepository;

@SpringBootApplication
public class Application {

	// when application is running, you might want to log a few things every single time they happen
	// You can write down the errors that occur to the log file
	private static final Logger logger = LoggerFactory.getLogger(Application.class);

	public static void main(String[] args) {
		
		ApplicationContext ctx = SpringApplication.run(Application.class, args);
		
		logger.info("Beans in application context:");

		String beanNames[] = ctx.getBeanDefinitionNames();
		Arrays.sort(beanNames);

		for (String beanName : beanNames)
			logger.info(beanName);	
	}
	
	@Bean
	public CommandLineRunner demo(UserRepository repository) {
		return (args) -> {
			if (repository.findAll().isEmpty()) {
				User user = new User();
				user.setEmail("naseer698@gmail.com");
				user.setFirstName("naseer");
				user.setLastName("khan");
				// the password passed below is the encrypted password(123456)
				user.setPassword("$2a$10$la.CVFcxEVksWaP6yxBnH.XBcT3LoVBRFN5NyZXLXbGumdwWmeBWW");
				user.getRoles().add(Role.ADMIN);
				repository.save(user);
			}
		};
	}
	
}
