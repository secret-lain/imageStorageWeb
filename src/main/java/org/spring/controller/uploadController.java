package org.spring.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.service.uploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class uploadController {
	/*
	 * 설명
	 * uploadService 는 자동으로 com.spring.service의 uploadService를 받아온다.
	 * saveImgfile을 사용하기 위해 사용되며 인자로 이미지파일과 view에 보낼 Model객체를 받는다.
	 * 
	 * 이 model로 인해 uploadService에서 추가한 데이터도 컨트롤러에서 리턴할 수 있게 되는 것. 
	 * */
	
	private static final Logger logger = LoggerFactory.getLogger(uploadController.class);
	
	@Autowired
	private uploadService uploadService;
		
	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public String uploadResult(Locale locale, Model model, HttpServletRequest request, @RequestPart("uploadImg") MultipartFile imgFile, @RequestParam("fileDescription") String title) throws Exception{
		logger.info("{} upload.", locale);
			
		if(!imgFile.getContentType().contains("image")){
			model.addAttribute("resultMsg", "upload Failed!(this is not image file)");
			return "uploadResult";
		}
		
		uploadService.saveImgfile(imgFile, model, title);
		return "uploadResult";
	}
}
