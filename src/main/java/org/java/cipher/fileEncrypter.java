package org.java.cipher;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;

@Component
public class fileEncrypter {
	public String getMD5(String txt) throws Exception {
	    StringBuffer sbuf = new StringBuffer();
	          
	    MessageDigest mDigest = MessageDigest.getInstance("MD5");
	    mDigest.update(txt.getBytes());
	     
	    byte[] msgStr = mDigest.digest() ;
	     
	    for(int i=0; i < msgStr.length; i++){
	        String tmpEncTxt = Integer.toHexString((int)msgStr[i] & 0x00ff) ;           
	        sbuf.append(tmpEncTxt) ;
	    }	     
	     
	    return sbuf.toString() ;
	}

	public String getSHA1(String txt) throws Exception {
		StringBuffer sbuf = new StringBuffer();
	     
	    MessageDigest mDigest = MessageDigest.getInstance("SHA-1");
	    mDigest.update(txt.getBytes());
	     
	    byte[] msgStr = mDigest.digest() ;
	     
	    for(int i=0; i < msgStr.length; i++){
	        byte tmpStrByte = msgStr[i];
	        String tmpEncTxt = Integer.toString((tmpStrByte & 0xff) + 0x100, 16).substring(1);
	         
	        sbuf.append(tmpEncTxt) ;
	    }
	     
	    return sbuf.toString();
	}
}
