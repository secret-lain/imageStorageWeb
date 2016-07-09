package org.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/*
 * 현재 사용하지않음. 추후 외부링크를 생성할때 사용할 예정
 * 
 * */
@Controller
public class externalLinkController {
	
	@RequestMapping("/image/{hash}")
	public String imageLink(){
		
		return "";
	}
	
}
