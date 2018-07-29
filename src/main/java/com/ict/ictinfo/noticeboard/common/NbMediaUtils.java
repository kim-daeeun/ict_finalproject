package com.ict.ictinfo.noticeboard.common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class NbMediaUtils {	
	private static Map<String, MediaType> mediaMap;
	
	// static 메소드 안의 변수는 static 이다, static 블럭이라고 한다
	static{		
		mediaMap = new HashMap<String, MediaType>();		
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String type){		
		return mediaMap.get(type.toUpperCase());
	}
}



