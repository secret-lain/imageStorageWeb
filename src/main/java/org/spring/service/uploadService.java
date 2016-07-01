package org.spring.service;

import java.util.List;
import org.spring.dto.*;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.controller.customErrorController;
import org.spring.dao.imageDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.java.cipher.fileEncrypter;

@Service
public class uploadService {
	@Autowired
	private imageDAO imageDAO;
	@Autowired
	fileEncrypter encrypt;
	final String salt = "IdolMaster";
	
	public void saveImgfile(MultipartFile imgfile, Model model, String description) throws Exception
	{		
		final String savePath = "C:\\Users\\admin\\Desktop\\images\\";
		
		String originalFileName = imgfile.getOriginalFilename();
		String hashFileName = encrypt.getMD5(originalFileName + salt);
		Date fileSavedDate = new Date(System.currentTimeMillis());
		//난수로 사용된다.
		
		String linkHash = encrypt.getSHA1(hashFileName+fileSavedDate.toString());
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
	            
	            imageDTO dto = new imageDTO(description, originalFileName, linkHash, hashFileName, fileSavedDate);
	            
	            //TODO for Debug(exact value test)
	            int resultValue = imageDAO.insert(dto);           
	            model.addAttribute("resultMsg", "File uploaded!");
	            
	            /*
	             * 20160628 현재상황
	             * mybatis-context.xml로 연결설정하고
	             * mybatisMapper-context.xml로 CRUD쿼리가 설정되어있는 경우이다.
	             * imageUploadDAO에서 SqlSession이라는 객체로 바로 Autowire할수있는 것은
	             * sqlSessionTemplate->sqlSession->mapper로 매핑됨->DAO파일이 세션을 가져옴 순서이기때문
	             * 
	             * SELECT 'test' 이기 떄문에 사실 DB에 접속하지 않아도 test라는 값을 String으로 반환하기로 되어있다.
	             * 실제로 다양한 타입의 변수를 가져올 경우를 대비해 DTO를 작성할 예정임.(이때 반환타입은 DTO객체가 된다)
	             * 
	             * interface만 만들고 바로 매퍼가 적용되는 애노테이션이 있다고 하였는데 이쪽부분으로 찾는 것이 좋을듯함.
	             * */
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
