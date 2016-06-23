package com.spring.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.spring.service.uploadService;

@Controller
public class uploadController {
	private static final Logger logger = LoggerFactory.getLogger(uploadController.class);
	
	@Autowired
	public uploadService uploadService;
	
	
	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public String uploadResult(Locale locale, Model model, HttpServletRequest request, @RequestPart("uploadImg") MultipartFile imgFile){
		logger.info("{} upload.", locale);
			
		if(!imgFile.getContentType().contains("image")){
			model.addAttribute("resultMsg", "upload Failed!(this is not image file)");
			return "uploadResult";
		}
		
		uploadService.saveImgfile(imgFile, model);
		return "uploadResult";
	}
	
	
}
