package org.spring.service;

import java.util.List;
import org.spring.dto.*;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.sql.SQLException;

import org.component.cipher.*;
import org.component.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.dao.imageDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

@Service
public class uploadService {
	@Autowired private imageDAO imageDAO;
	
	@Autowired
	@Qualifier("encrypter")	Encrypter encrypt;
	
	@Autowired globalValue global;
	
	
	/*
	 * TODO 파일확장자 img src할때 필요한지. 지금은 경로에 그대로 해시파일을 삽입한다.
	 * DB insert Argument = description, originalFileName, linkHash, fileSavedfDate
	 * description = 한줄설명
	 * originalFileName = 실제 파일이름. 해시화에 사용된다
	 * fileSaveDate = 파일이 저장된 년-월-일. 해시화에 사용된다.
	 * linkHash = 실제로 저장 및 사용될 명칭. 파일명+저장일+salt값을 SHA-1로 해시화한다.
	 * (salt) = 해시화에 사용되는 임의값.
	 * 
	 * */
	public void saveImgfile(MultipartFile imgfile, Model model, String description) throws Exception
	{		
		final String savePath = global.getSavePath();
		final String salt = global.getSalt();
		
		String originalFileName = imgfile.getOriginalFilename();
		Date fileSavedDate = new Date(System.currentTimeMillis());
		//난수로 사용된다.
		
		String linkHash = encrypt.getSHA1(originalFileName+fileSavedDate.toString()+salt);
		//String saveFileExtension = imgfile.getOriginalFilename().substring(imgfile.getOriginalFilename().lastIndexOf('.') + 1);
		String fullPath = savePath + linkHash;
		
		if(!imgfile.isEmpty())
		{
			try
			{
	            byte[] bytes = imgfile.getBytes();
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
	            stream.write(bytes);
	            stream.close();         
	            
	            imageDTO dto = new imageDTO(description, originalFileName, linkHash, fileSavedDate);
	            
	            //return 1 if insert success
	            if(imageDAO.insert(dto) == 1)           
	            	model.addAttribute("resultMsg", "File uploaded!");
			}
			catch(Exception e)
			{
				model.addAttribute("resultMsg", e.getMessage());
			}
		}
	}

	public List<mainImageVO> getMainImages() throws SQLException {
		return imageDAO.selectAll();
	}
}
