package com.ict.ictinfo.noticeboard.service;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ict.ictinfo.noticeboard.common.NbMediaUtils;
import com.ict.ictinfo.noticeboard.common.NbPage;
import com.ict.ictinfo.noticeboard.dao.NbDao;
import com.ict.ictinfo.noticeboard.dto.NbDto;
import com.ict.ictinfo.noticeboard.dto.NbFileDto;

@Service
public class NbServiceImpl implements NbService {
	
	
	@Autowired
	private NbDao nbDao;
	
	// 게시판 리스트 뿌려줄때 필요
	@Autowired
	private NbPage page;
	
	
	@Resource(name="pageSize")
	private int pageSize;
	
	@Resource(name="pageBlock")
	private int pageBlock;
	
	// 파일 업로드시 필요
	// @Autowired
	//private FileSaveHelper fileSaveHelper;
	
	// 파일 다운로드시 필요
	@Resource(name="saveDir")
	private String saveDir;	
	
	@Override
	public void list(String pageNum, Model model) {
		
		int totalCount=nbDao.getTotalCount();
		HashMap<String, String> pagingMap=page.paging(Integer.parseInt(pageNum), totalCount, pageSize, pageBlock);

		model.addAttribute("pageCode",pagingMap.get("pageCode"));
		model.addAttribute("articleList",nbDao.list(pagingMap));
		model.addAttribute("totalCount",totalCount);	
		
	}
	
	
	@Override
	public void write(NbDto article) {		
		
		if(article.getFileNames()==null) {
			nbDao.write(article);
			
		}else {		// 파일업로드가 있으면 articleNum를 가져오므로 0이 아니고, 없으면 안가져왔으므로 0이다
			//int articleNum = bbsDao.getNextArticleNum(); 		5버전까지 사용
			// article.setArticleNum(articleNum);				5버전까지 사용
						
			article.setFileStatus((byte)1);
			nbDao.write(article);
			
			// System.out.println(article.getArticleNum());
			commonFileUpload(article.getArticleNum(), article.getFileNames() );	// 처음에 articleNum 은 0이다
		}			
			
	}		
	

	public void commonFileUpload(String articleNum, List<String> fileNames) {
		NbFileDto fileDto = null;
		
		// 본래 이름은 sotredFname 하나만 있으면 다 알수 있다
		for(String storedFname:fileNames) {
			//if(!uploadFile.isEmpty()) {
				//String storedFname = fileSaveHelper.save(uploadFile);
				
				fileDto = new NbFileDto();
				//fileDto.setOriginFname(uploadFile.getOriginalFilename());
				fileDto.setStoredFname(storedFname);
				//fileDto.setFileLength(uploadFile.getSize());
				fileDto.setArticleNum(articleNum);
				
				nbDao.insertFile(fileDto);	// 테이블에 파일 업로드할때 필요
			}
		
	}	
	
	
	
	
	
	@Override
	public void content(String articleNum, int fileStatus, Model model) {
		nbDao.updateHit(articleNum);
		// 질문. import와 DI의 차이 ???????????????????????
		// Dto 객체 article에 심고 model에 넣어주어야 뷰에서 사용 가능
		NbDto article = nbDao.content(articleNum);			
		model.addAttribute("article",article);

		// >>>>>>>>>>>>>>>>>>>>>>>> 코멘트시 반드시 적용
		article.setCommentCount(nbDao.getCommentCount(articleNum));
		
		if(fileStatus==1) {						// 업로드 파일이 있으면
			model.addAttribute("fileList", nbDao.getFiles(articleNum));
		}		

	}	
	
	@Override
	public FileSystemResource download(HttpServletResponse resp, @RequestParam String storedFname) {
		
		resp.setContentType("application/download");
		String originFname = storedFname.substring(storedFname.indexOf("_")+1);
		
		// resp.setContentLength(fileLength);
		try{
			originFname = URLEncoder.encode(originFname,"utf-8").replace("+","%20").replace("%28", "(").replace("%29", ")");
		}catch(Exception e){
		}

		resp.setHeader("Content-Disposition", "attachment;" +" filename=\""+originFname+ "\";");
		FileSystemResource fsr= new FileSystemResource(saveDir+storedFname);
		return fsr;

	}
	
	
	
	@Override
	public void delete(String articleNum) {
		
		List<String> deleteList=null;
		deleteList = nbDao.getDeleteList(articleNum);		
		
		for(String storedFname : deleteList) {	
			
			//1. 썸네일 파일 삭제
			//storedFname>>>>>>>>> /2018/07/23/55eb8e15-7e8c-4681-8bc3-47114862ecbd_buttons-for-music-player_1214-45.jpg
			//storedFname과 썸네일 이름 2개가 upload 폴더에 저장이 된다
			//날짜 폴더와 파일명 사이에 s_가 있으므로 분리해서 넣어 주어야 한다
			String vDate = storedFname.substring(0, 12);
			
			// 날짜를 뺀 이름 추출해서 다시 날짜를 합해 주기(날짜는 폴더명이므로 upload 폴더의 하위 폴더까지 정해 주어야 찾아서 삭제가 된다)
			// new File 에 넣으면 / 표시는 자동으로 \ 으로 변경된다
			File deleteFnameThumbnail = new File(saveDir + vDate + "s_" + storedFname.substring(12));
			System.out.println("deleteFnameThumbnail>>>>>>>>> " + deleteFnameThumbnail);
	
		    if(deleteFnameThumbnail.exists()) {
		    	deleteFnameThumbnail.delete();
		    }		    

		    //2. 저장된 파일 삭제
		    //deleteFname>>>>>>>>> d:\ upload\2018\07\23\55eb8e15-7e8c-4681-8bc3-47114862ecbd_buttons-for-music-player_1214-45.jpg
		    File deleteFname = new File(saveDir+storedFname);	// s_ 가 붙은 파일 이름 제거 하기	
		    System.out.println("deleteFname>>>>>>>>> " + deleteFname);
		    
		    if(deleteFname.exists()) {
		    	deleteFname.delete();
		    }
		}		
		
		nbDao.delete(articleNum);
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public void getUpdateArticle(String articleNum, Model model,int fileStatus) {
		// return bbsDao.getUpdateArticle(articleNum);
				
		model.addAttribute("article", nbDao.getUpdateArticle(articleNum));
		if(fileStatus==1) {
			List<String> fileList = nbDao.getFiles(articleNum);

			model.addAttribute("fileList", fileList);
			model.addAttribute("fileCount", fileList.size());			
		} else {
			// 기존의 글이 파일 업로드가 없는 글이었을 경우는 updateForm.jsp의 fileCount에 공백값이
			// 들어가므로 udate.bbs 요청시 400에러가 남.. 그래서 편법으로 0 줬음
			model.addAttribute("fileCount",0);
		}		
	}
	

	// ■ ■ ■ 기존글 수정하기(파일 첨가 유무 체크)
	@Override
	public void updateArticle(NbDto article,String[]deleteFileName,Model model,int fileCount) {
		// bbsDao.updateArticle(article);
		
		// deleteFileName 업로드된 파일 이름

		
		 if(article.getFileNames()!=null) {				// 새글에 파일 업로드가 있을 경우
			    if(fileCount==0) {						// 기존 글에 파일 업로드가 없을 경우에 fileStatus가 0이므로
			    //파일이 있을 경우 
			     article.setFileStatus((byte)1);		// 파일 업로드가  있으므로 1 로 세팅함	
			    }else {
				     if(deleteFileName != null) {
					      //Mybatis 매퍼 파일이 List를 받을 수 있음 (배열도 가능함)
					      //List를 이용할 수 있다는 걸 보여주기 위해서 만든 코드임
					      ArrayList<String> delFileList = new ArrayList<String>();
					      for(String delFileName : deleteFileName) {
					       delFileList.add(delFileName);
					      }
					      
					      nbDao.dbDelFileName(delFileList);		// dbDelFileName는 List를 받아서 처리 , db에 기존에 업로드되어 있는 파일 삭제하기
					      for(String storedFname : deleteFileName) {
					       storageDelFileName(storedFname);			// 폴더에서 실제 파일을 삭제할 이름 계속 넘겨줌
					      }
				      }
			    }
			     nbDao.updateArticle(article);
			     commonFileUpload(article.getArticleNum(), article.getFileNames());
			    
			   }else {												// 새글 즉, 수정글에 파일 업로드가 없을 경우
				    if(fileCount!=0) {								// 기존 글에 파일 업로드가 없을 경우에, fileStatus가 0이다
					     if(deleteFileName!=null) {
					    	 

						      if(fileCount==deleteFileName.length) {
						       article.setFileStatus((byte)0);		// 파일 업로드가  있으므로 0 으로 세팅함
						      }
						      
						      nbDao.dbDelFileName1(deleteFileName);	// dbDelFileName1는 배열을 받음, db에 기존에 업로드되어 있는 파일 삭제하기
						      for(String storedFname : deleteFileName) {
						       storageDelFileName(storedFname);			// 폴더에서 실제 파일을 삭제할 이름 계속 넘겨줌
						      }
					     }
				    }
				    nbDao.updateArticle(article);
			   }
			   model.addAttribute("fileStatus",article.getFileStatus()); }
		

	public void storageDelFileName(String storedFname) {
		if(storedFname != null) {
			String formatName = storedFname.substring(storedFname.lastIndexOf(".")+1);
			MediaType mType = NbMediaUtils.getMediaType(formatName);
			if(mType != null) {
				String front = storedFname.substring(0, 12);
				String end = storedFname.substring(12);
						
				File file = new File(saveDir + (front+"s_"+end).replace('/', File.separatorChar));
				if(file.exists()) {
					file.delete();
				}
				
			}
			File file = new File(saveDir+storedFname);
			if(file.exists()) {
				file.delete();
			}		
		}		
	}

	
	
	
	// ■ ■ ■ 답글쓰기
	@Override
	 public void reply(NbDto article) {		
		
		if(article.getFileNames()==null) {
			nbDao.reply(article);
			
		}else {		// 파일업로드가 있으면 articleNum를 가져오므로 0이 아니고, 없으면 안가져왔으므로 0이다
			//int articleNum = bbsDao.getNextArticleNum(); 		5버전까지 사용
			// article.setArticleNum(articleNum);				5버전까지 사용
						
			article.setFileStatus((byte)1);
			nbDao.reply(article);
			
			// System.out.println(article.getArticleNum());
			commonFileUpload(article.getArticleNum(), article.getFileNames() );	// 처음에 articleNum 은 0이다
		}
	}


	@Override
	public void nbSearch(String searchOption, String keyword, String pageNum, Model model) {
		
		/*매퍼 파일에 2개의 인자를 넣을수 없으므로 HashMap 에 넣어서 보냄*/
		HashMap<String, String> totalCountMap = new HashMap<String, String>();
		totalCountMap.put("searchOption",searchOption);
		totalCountMap.put("keyword",keyword);
		
		int totalCount=nbDao.getTotalCountNbSearch(totalCountMap);
		
		HashMap<String, String> pagingMap=page.paging(Integer.parseInt(pageNum), totalCount, pageSize, pageBlock);

		pagingMap.put("searchOption",searchOption);
		pagingMap.put("keyword",keyword);
		
		model.addAttribute("pageCode",pagingMap.get("pageCode"));
		model.addAttribute("articleList",nbDao.nbSearch(pagingMap));
		model.addAttribute("totalCount",totalCount);
		
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyword",keyword);

		
		
	}	
	
	
	

	
}





























