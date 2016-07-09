package org.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class externalLinkController {
	
	@RequestMapping("/image/{hash}")
	public String imageLink(){
		
		return "";
	}
	
}
