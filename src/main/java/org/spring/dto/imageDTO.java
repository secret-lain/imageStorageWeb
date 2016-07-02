package org.spring.dto;

import java.sql.Date;

public class imageDTO {
	private int blameRate;
	private int viewCount;
	private String description;
	private Date uploadDate;
	private String originalFileName;
	private String linkHash;
	
	public imageDTO(String description, String originalFileName,
			String linkHash, Date uploadDate){
		
		setDescription(description);
		setOriginalFileName(originalFileName);
		setUploadDate(uploadDate);
		setLinkHash(linkHash);
	}
	
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public void setLinkHash(String linkHash) {
		this.linkHash = linkHash;
	}

	public int getBlameRate() {
		return blameRate;
	}
	public void setBlameRate(int blameRate) {
		this.blameRate = blameRate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getLinkHash() {
		return linkHash;
	}
	
	
	
}
