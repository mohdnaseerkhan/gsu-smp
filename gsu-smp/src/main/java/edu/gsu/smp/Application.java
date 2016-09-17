package edu.gsu.smp;

import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

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
}
