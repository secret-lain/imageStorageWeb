package org.spring.controller;

import java.sql.SQLException;
import java.util.Locale;

import org.component.globalValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.service.uploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application upload jsp Page.
 */
@Controller
public class homeController {
	@Autowired private uploadService uploadService;
	@Autowired globalValue global;
	private static final Logger logger = LoggerFactory.getLogger(homeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws SQLException {
		logger.info("Welcome home! The client locale is {}.", locale);	
		model.addAttribute("images" , uploadService.getMainImages());
		model.addAttribute("path", global.getSavePath());
		return "home";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Index connected The client locale is {}.", locale);	
		return "index";
	}
}
