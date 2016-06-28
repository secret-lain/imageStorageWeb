package org.spring.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.service.uploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class imageUploadDAO {
	@Autowired
	private SqlSession query;
	private static final Logger logger = LoggerFactory.getLogger(imageUploadDAO.class);
	
	public String test() throws SQLException{
		return query.selectOne("query.test");
	}

}
