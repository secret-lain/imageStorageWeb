package org.component;


import org.springframework.stereotype.Component;

@Component("globalValue")
public class globalValue {
	private String savePath = "C:\\Users\\admin\\Desktop\\workspace\\Imagine\\src\\main\\webapp\\resources\\images\\";
	//private String savePath = "/home/release/tomcat8Root/images/";
	private String salt = "IdolMaster";
	
	public String getSalt() {
		return salt;
	}

	public String getSavePath() {
		return savePath;
	}
}
