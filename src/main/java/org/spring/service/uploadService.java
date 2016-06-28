package org.spring.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.controller.customErrorController;
import org.spring.dao.imageUploadDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;


@Service
public class uploadService {
	@Autowired
	private imageUploadDAO imageUploadDAO;
	
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
	            
	            System.out.println(imageUploadDAO.test());
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
}
