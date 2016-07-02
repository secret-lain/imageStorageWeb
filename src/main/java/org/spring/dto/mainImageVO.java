package org.spring.dto;

import java.sql.Date;

public class mainImageVO {
//title, linkHash, uploadDate
	private String description;
	private String linkHash;
	private Date uploadDate;
	
	public String getDescription() {
		return description;
	}
	public String getLinkHash() {
		return linkHash;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	
}
