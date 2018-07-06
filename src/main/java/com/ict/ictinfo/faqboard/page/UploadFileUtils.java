package com.ict.ictinfo.faqboard.page;
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

public class UploadFileUtils {
	private static final Logger logger = 
		      LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String saveDir,
		String originalName, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();  
		// randomUUID() 는 중복되지 않는 고유한 키값을 설정할 때 사용한다.    
		//파일업로드에서 주의해야야 할 점은 동일한 경로에 동일한 이름의 파일을 업로드하는 것이다.
	    String storedFname = uid.toString() +"_"+originalName;    
	    String storedPath = calcPath(saveDir);    
	    File target = new File(saveDir +storedPath,storedFname);    
	    FileCopyUtils.copy(fileData, target);
	    //FileCopyUtils.copy(fileData, target);  을 통해서 맵핑된 위치에 실제로 들어온 파일을 저장하고  saveName을 리턴한다.
	    String formatName =  originalName.substring(originalName.lastIndexOf(".")+1);    
	    String uploadedFileName = null;
	    
	    if(MediaUtils.getMediaType(formatName) != null){
	    	//이미지가 아닌지 체크
	      uploadedFileName = makeThumbnail(saveDir, storedPath, storedFname);
	      //썸네일 이미지 생성
	    }else{
	      uploadedFileName = makeIcon(storedPath, storedFname);
	    }	 	  
	    return uploadedFileName;	
	}
	
	private static String calcPath(String saveDir){    
	   Calendar cal = Calendar.getInstance();    
	   String yearPath = File.separator+cal.get(Calendar.YEAR); 
	   //File.separator -> \
	   //yearpath-> \2018
	   String monthPath = yearPath + File.separator + 
	       new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
	   //monthpath->\2018\05
	   String datePath = monthPath + File.separator + 
	       new DecimalFormat("00").format(cal.get(Calendar.DATE));
	   //datepath->\2018\05\24
	   makeDir(saveDir, yearPath,monthPath,datePath);    
	   logger.info(datePath);
	    
	   return datePath;
	}
	 
	private static  String makeThumbnail(String saveDir, 
             String storedPath,String storedFname)throws Exception{           
		BufferedImage sourceImg = ImageIO.read(new File(saveDir + storedPath, storedFname));
   
		BufferedImage destImg = Scalr.resize(sourceImg, 
					           Scalr.Method.AUTOMATIC, 
					           Scalr.Mode.FIT_TO_HEIGHT,100);
		String thumbnailName = saveDir + storedPath + File.separator +"s_"+ storedFname;   
		File newFile = new File(thumbnailName);
		String formatName = 	storedFname.substring(storedFname.lastIndexOf(".")+1);  
   
	   ImageIO.write(destImg, formatName.toUpperCase(), newFile);	   
	   return thumbnailName.substring(saveDir.length()).replace(File.separatorChar, '/');
	} 
	
	private static  String makeIcon( 
		String storedPath,String storedFname) throws Exception{	
	    String iconName = storedPath +File.separator+ storedFname;    
	    return iconName.replace(File.separatorChar, '/');
	    //replace-> \를 /로 바꾸는 역할 윈도우에서는 경로를 /로 많이 쓰기 때문
    }  
	 
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


