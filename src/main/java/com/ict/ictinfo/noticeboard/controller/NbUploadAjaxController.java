package com.ict.ictinfo.noticeboard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ict.ictinfo.noticeboard.common.NbMediaUtils;
import com.ict.ictinfo.noticeboard.common.NbUploadFileUtils;

@Controller
public class NbUploadAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(NbUploadAjaxController.class);
	
	@Resource(name="saveDir")
	String saveDir;
	
	
	//@RequestMapping("/")
	@RequestMapping(value ="/nbUploadAjax.ict", method=RequestMethod.GET)
	public String main(){
		return "/noticeboard/nbUploadAjax";
	}
	
//	java8은 스프링 3.2.9부터 지원함 ...하위버전에서는  
//	ASM ClassReader failed to parse class file 
//	- probably due to a new Java class file version that isn't supported yet:
//	에러가 발생함
	

//	List<String> 형태의 JSON으로 리턴 할려면 스프링 3. 버전에서는 아래의 jar 파일인
//	jackson-mapper-asl과	jackson-core-asl만 있어도 처리할 수 있음
//	그런데 스프링 4. 버전에서는 위의 두 가지 jar로 처리할려면  에러 발생
//	스프링 3버전과 4버전에서는  jackson-databind 디펜더시만 설정해도 처리할 수 있음
//	그리고 produces = "appliation/json"으로 설정
//	@ResponseBody
//	@RequestMapping(value ="/uploadAjax", method=RequestMethod.POST, 
//	               produces = "application/json;charset=UTF-8")
//	public ResponseEntity<List<String>> uploadAjax(MultipartHttpServletRequest mRequest) throws Exception{
//		List<String> fileList= new ArrayList<>();
//		List<MultipartFile> mfile=mRequest.getFiles("multiFile");
//		for(MultipartFile file : mfile){			
//			fileList.add(UploadFileUtils.uploadFile(saveDir,file.getOriginalFilename(),file.getBytes()));
//		}
//		return  new ResponseEntity<>( fileList, HttpStatus.CREATED);
//	}				<>는 List<String>가 생략되어있다.		HttpStatus.CREATED는 정상으로 끝났다
//	
	
	
	
	// 파일을 업로드 할때 작동, saveDri => value="d:upload"( servlet-context.xml)
	//ResponseEntity를 사용하지 않을때
	@ResponseBody
	@RequestMapping(value ="/nbUploadAjax.ict", method=RequestMethod.POST)
	// public List<String> uploadAjax(MultipartHttpServletRequest mRequest) throws Exception{
	public List<String> uploadAjax(@RequestPart("multiFile") List<MultipartFile> mFile) throws Exception{
		
	
		List<String> fileList= new ArrayList<String>();
		//List<MultipartFile> mFile=mRequest.getFiles("multiFile");
		
		for(MultipartFile file : mFile){
		
			fileList.add(NbUploadFileUtils.uploadFile(saveDir,file.getOriginalFilename(),file.getBytes()));
		}	// 텍스트 파일일 경우 텍스트 파일 이름, 이미지일 경우 썸네일 파일 이름이 넘어온다
		
		return fileList;
	}


	
	
	// 파일을 다운로드 할때 작동
	// 이미지 파일과 아닐경우 헤더에
	@ResponseBody
	@RequestMapping("/nbDisplayFile.ict")
	public ResponseEntity<byte[]>  displayFile(String fileName) throws Exception{
		
		InputStream in = null; 
		ResponseEntity<byte[]> entity = null;

		try{      
			
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = NbMediaUtils.getMediaType(formatName);  
			
			HttpHeaders headers = new HttpHeaders();    // 다운로드 타입을 넣어준다  
			in = new FileInputStream(saveDir+fileName);		

			if(mType != null){							// 이미지 파일 이면
				headers.setContentType(mType);
			}else{										// 이미지 파일이 아니면      
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);			
			}		
			
			fileName = fileName.substring(fileName.indexOf("_")+1); // UUID를 자르고 원본 파일 이름이 나옴
			
			headers.add("Content-Disposition","attachment; filename=\""+ 
					URLEncoder.encode(fileName,"utf-8").replace("+","%20")+"\"");
			
			// IOUtils.toByteArray(in) in 이라는 파일 입출력 객체 변수가 배열이다 
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;    
	}
	
	@ResponseBody
	@RequestMapping(value="/nbDeleteFile.ict", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){    
		logger.info("delete file: "+ fileName);    
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);    // 확장자 뽑아오기(jpg)
		MediaType mType = NbMediaUtils.getMediaType(formatName);

		// 이미지일 경우 원본 파일 삭제
		if(mType != null){      
			String front = fileName.substring(0,12);		// front => /2018/07/23/
			String end = fileName.substring(14);			// end => af46fe8a-2c47-4337-a1ff-d2a1e2cecbe6_BBSController02.png
			
			// saveDir+(front+end).replace('/', File.separatorChar) 
			// => d:\ upload\\2018\07\23\af46fe8a-2c47-4337-a1ff-d2a1e2cecbe6_BBSController02.png
			
			// 원본 파일 삭제 하는 부분
			new File(saveDir+(front+end).replace('/', File.separatorChar)).delete();
		}

		// 썸네일 파일 삭제하는 부분
		new File(saveDir + fileName.replace('/', File.separatorChar)).delete();    
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}  
	
	
	@ResponseBody
	@RequestMapping(value="/nbDeleteAllFiles.ict", method=RequestMethod.POST)
//	ajax() 함수가 배열을 직렬화 하지 않고 보낼때는..아래 코드처럼 해도 처리됨
//	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
//	ajax() 함수가 배열을 직렬화 하고 보낼때는..아래 코드처럼 해도 처리됨	. []가 없다
	public ResponseEntity<String> deleteFile(@RequestParam("files") String[] files){				
		logger.info("delete all files: "+ files);    
		
		if(files == null || files.length == 0) {		// 파일이 없을 경우
			return new ResponseEntity<String>	("deleted", HttpStatus.OK);
		}
		
		for (String fileName : files) {
			String formatName=fileName.substring(fileName.lastIndexOf(".")+1);      
			MediaType mType = NbMediaUtils.getMediaType(formatName);      
			if(mType != null){        
				String front = fileName.substring(0,12);
				String end = fileName.substring(14);
				new File(saveDir + (front+end).replace('/', File.separatorChar)).delete();
			}
			new File(saveDir + fileName.replace('/', File.separatorChar)).delete();      
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}  
}
