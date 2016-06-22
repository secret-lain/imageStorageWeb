package com.spring.controller;

import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class CustomErrorController {
	private static final Logger logger = LoggerFactory.getLogger(CustomErrorController.class);
		
	@RequestMapping(value = "/error/pageNotFound", method = RequestMethod.GET)
	public String notFoundError(Locale locale, Model model, HttpServletResponse response){
		logger.info(locale + " visit 404 Error Page");
		response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		
		model.addAttribute("errorCode", 400);
		model.addAttribute("errorComment", "페이지를 찾을 수 없습니다.");
		
		return "/error/errorPage";
	}
	
	@RequestMapping(value = "/error/internalServerError", method = RequestMethod.GET)
	public String internalServerError(Locale locale, Model model, HttpServletResponse response){
		logger.info(locale + " visit 500 Error Page");
		response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		
		model.addAttribute("errorCode", 500);
		model.addAttribute("errorComment", "내부 서버 에러입니다.<br>무슨 짓을 하신거죠?");
		
		return "/error/errorPage";
	}
}
