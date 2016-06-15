package com.spring.test;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
/**
 * Handles requests for the application upload jsp Page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * return View upload page with unpredictable token value
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);	
		return "home";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Index connected The client locale is {}.", locale);	
		return "index";
	}
	
	@RequestMapping(value = "/uploadResult", method = RequestMethod.POST)
	public String uploadResult(Locale locale, Model model, HttpServletRequest request, @RequestParam("uploadImg") MultipartFile imgFile){
		logger.info("{} upload.", locale);
			
		if(!imgFile.getContentType().contains("image")){
			model.addAttribute("resultMsg", "upload Failed!(this is not image file)");
			return "uploadResult";
		}
		
		String savePath = "../images/";
		String savePrefix = "Imgine";
		String saveFilename = savePrefix + "_" + System.currentTimeMillis();
		String saveFileExtension = imgFile.getOriginalFilename().substring(imgFile.getOriginalFilename().lastIndexOf('.') + 1);
		String fullPath = savePath + saveFilename + "." +saveFileExtension;
				
	    if (!imgFile.isEmpty()) {
	        try {
	            byte[] bytes = imgFile.getBytes();
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
	            stream.write(bytes);
	            stream.close();
	            model.addAttribute("resultMsg", "File uploaded!");
	        } catch (Exception e) {
	            model.addAttribute("resultMsg", e.getMessage());
	        }
    	}
		return "uploadResult";
	}
}
