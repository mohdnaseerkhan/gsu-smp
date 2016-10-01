package edu.gsu.smp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.gsu.smp.util.MyUtil;

@Controller
public class RootController {

	private static final Logger logger = LoggerFactory.getLogger(RootController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		if(MyUtil.getSessionUser() != null) {
			return "dashboard";
		}
		return "index";
	}
}
