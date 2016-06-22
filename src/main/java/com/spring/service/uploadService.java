package com.spring.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

public class uploadService {
	private MultipartFile imgfile;
	private Model model;
	
	private final String savePath = "C:\\Users\\mar1s\\Desktop\\image\\";
	private final String savePrefix = "Imgine";
	
	private String saveFilename;
	private String saveFileExtension;
	private String fullPath;
	
	public uploadService(MultipartFile _imgfile, Model _model)
	{
		imgfile = _imgfile;
		model = _model;
	}
	
	public void saveImgfile()
	{
		saveFilename = savePrefix + "_" + System.currentTimeMillis();
		saveFileExtension = imgfile.getOriginalFilename().substring(imgfile.getOriginalFilename().lastIndexOf('.') + 1);
		fullPath = savePath + saveFilename + "." + saveFileExtension;
		
		if(!imgfile.isEmpty())
		{
			try
			{
	            byte[] bytes = imgfile.getBytes();
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
	            stream.write(bytes);
	            stream.close();
	            model.addAttribute("resultMsg", "File uploaded!");
			}
			catch(Exception e)
			{
				model.addAttribute("resultMsg", e.getMessage());
			}
		}
	}
}
