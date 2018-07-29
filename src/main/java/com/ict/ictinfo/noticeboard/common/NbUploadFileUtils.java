package com.ict.ictinfo.noticeboard.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class NbUploadFileUtils {
	private static final Logger logger = LoggerFactory.getLogger(NbUploadFileUtils.class);
	
	public static String uploadFile(String saveDir, String originalName, byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID();   
		
	    String storedFname = uid.toString() +"_"+originalName;    	// 저장할 이름
	    String storedPath = calcPath(saveDir);  					// 저장할 폴더(날짜 폴더이다)
	    
	    File target = new File(saveDir +storedPath, storedFname);    // 파일 앞에 날짜가 붙어서 가야한다
	    FileCopyUtils.copy(fileData, target);  
	    																				// 썸네일로 뿌려주기
	    String formatName =  originalName.substring(originalName.lastIndexOf(".")+1);  // 확장자만 잘라내기
	    String uploadedFileName = null;
	    
	    if(NbMediaUtils.getMediaType(formatName) != null){	    					// 이미지 파일이면
	    	uploadedFileName = makeThumbnail(saveDir, storedPath, storedFname);	    // 이미지를 썸네일로 만든다
	    }else{
	    	uploadedFileName = makeIcon(storedPath, storedFname);			// 이미지 파일이 아니면  
	    }	 	  
	    return uploadedFileName;	
	}
	
	// 저장할 날짜 폴더 만들기
	private static String calcPath(String saveDir){  			// 년월일에 부여하는 폴더 만들기
		
	   Calendar cal = Calendar.getInstance();  
	   
	   String yearPath = File.separator+cal.get(Calendar.YEAR);    // \2018		\05		\23
	   String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);

	   String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	    
	   makeDir(saveDir, yearPath, monthPath, datePath);   		// 폴더를 탐색기에 생성한다 
	   logger.info(datePath);
	    
	   return datePath;
	   
	}
	 
	// 이미지를 썸네일로 보여주기
	private static  String makeThumbnail(String saveDir, 
             String storedPath,String storedFname)throws Exception{  
		
		// 이미지 파일 읽어와서 메모리에 저장
		BufferedImage sourceImg = ImageIO.read(new File(saveDir + storedPath, storedFname));
   
		BufferedImage destImg = Scalr.resize(sourceImg, 
					           Scalr.Method.AUTOMATIC, 
					           Scalr.Mode.FIT_TO_HEIGHT,100);   // 높이를 100으로 줄임, 가로 길이도 비율따라 줄어듬
		
		String thumbnailName = saveDir + storedPath + File.separator +"s_"+ storedFname;   
		File newFile = new File(thumbnailName);
		String formatName = storedFname.substring(storedFname.lastIndexOf(".")+1);  
   
		//썸네일 이미지를 upload 폴더에 담기
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);	   
		return thumbnailName.substring(saveDir.length()).replace(File.separatorChar, '/');	// s_파일이름.jpg 가 리턴됨
	} 
	
	// 파일 이름에 날짜를 붙여서 리턴한다
	private static  String makeIcon(String storedPath,String storedFname) throws Exception{	
	    String iconName = storedPath +File.separator+ storedFname;    
	    return iconName.replace(File.separatorChar, '/');
    }  
	 
	// 폴더를 탐색기에 생성한다 . 파일 업로드할때마다 폴더 존재 유무를 체크하므로 안좋은 것이다
	private static void makeDir(String saveDir, String... paths){    
	   if(new File(saveDir+paths[paths.length-1]).exists()){
	     return;
	   }
	    
	   for (String path : paths) {      
	     File dirPath = new File(saveDir + path);      
	     if(! dirPath.exists() ){
	       dirPath.mkdir();
	     } 
	   }
	}
            

}
