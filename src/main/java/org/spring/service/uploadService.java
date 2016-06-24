package org.spring.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;


@Service
public class uploadService {
	
	public void saveImgfile(MultipartFile imgfile, Model model)
	{
		final String savePath = "C:\\Users\\admin\\Desktop\\images\\";
		final String savePrefix = "Imgine";
		
		String saveFilename = savePrefix + "_" + System.currentTimeMillis();
		String saveFileExtension = imgfile.getOriginalFilename().substring(imgfile.getOriginalFilename().lastIndexOf('.') + 1);
		String fullPath = savePath + saveFilename + "." + saveFileExtension;
		
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
