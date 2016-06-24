package org.spring.controller;

import java.util.Locale;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class customErrorController {
	/*
	 * 작성자 : ㄱㅇ
	 * 이메일 : vvvb78@gmail.com
	 * 
	 * 설명
	 * errorPage view 내의 글귀만 리턴해줌. 모든 결과는 200 OK Response 이다.(미적용)
	 * 브라우저가 코드를 읽고 커스텀페이지를 보여주기 전에 자체 에러페이지를 띄울 수 있기 때문이다. 
	 * */
	
	private static final Logger logger = LoggerFactory.getLogger(customErrorController.class);
		
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
		response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		
		model.addAttribute("errorCode", 500);
		model.addAttribute("errorComment", "내부 서버 에러입니다.<br>무슨 짓을 하신거죠?");
		
		return "/error/errorPage";
	}
}
