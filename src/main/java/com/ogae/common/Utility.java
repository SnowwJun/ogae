package com.ogae.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Utility {
	
	static private Utility instance = null;
	
	public static Utility getInstance() {
		if(instance == null) {
			return new Utility();
		} else {
			return null;
		}
	}
	
	/**
	 * 파일이름 생성
	 * @return 생성된 파일이름
	 */
	public String createFileName(int index) {

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmSS");
		return dateFormat.format(cal.getTime()) + String.format("%03d", index); 
	}
		
}
