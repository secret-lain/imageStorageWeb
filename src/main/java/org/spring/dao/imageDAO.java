package org.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class imageDAO {
	@Autowired
	private SqlSession query;
	private static final Logger logger = LoggerFactory.getLogger(imageDAO.class);
	
	public String test() throws SQLException{
		logger.debug("query test");
		return query.selectOne("query.test");
	}
	
	public int insert(imageDTO dto) throws SQLException{
		logger.info(dto.getOriginalFileName() + "has uploaded at" + dto.getUploadDate());
		return query.insert("imageInsert", dto);
	}
	
	public List<mainImageDTO> selectAll() throws SQLException{
		return query.selectList("imageSelectAllforMain");
	}

	public void truncate() {
		// TODO Auto-generated method stub
		query.delete("truncate");
	}

}
