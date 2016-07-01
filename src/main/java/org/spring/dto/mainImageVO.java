package org.spring.dto;

import java.sql.Date;

public class mainImageVO {
//title, linkHash, uploadDate
	private String title;
	private String linkHash;
	private Date uploadDate;
	
	public String getTitle() {
		return title;
	}
	public String getLinkHash() {
		return linkHash;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	
}
