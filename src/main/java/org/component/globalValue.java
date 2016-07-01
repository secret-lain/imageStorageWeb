package org.component;

import org.springframework.stereotype.Component;

@Component
public class globalValue {
	private String savePath = "C:\\Users\\admin\\Desktop\\images\\";

	public String getSavePath() {
		return savePath;
	}
}
