package org.spring.dto;

import java.sql.Date;

public class mainImageDTO {
//description, linkHash, uploadDate
	private String description;
	private String linkHash;
	private Date uploadDate;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setLinkHash(String linkHash) {
		this.linkHash = linkHash;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getLinkHash() {
		return linkHash;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	
}
