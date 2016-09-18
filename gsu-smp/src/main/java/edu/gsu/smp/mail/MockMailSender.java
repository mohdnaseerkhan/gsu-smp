package edu.gsu.smp.mail;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MockMailSender implements MailSender {
	private static final Logger logger = LoggerFactory.getLogger(MockMailSender.class);
	
	/* (non-Javadoc)
	 * @see demo.mail.MailSender#send(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public void send (String to,String subject,String body){
		logger.info("sending mail to:"+to);
		logger.info("subject :"+subject);
		logger.info("body:"+body);
	}
}