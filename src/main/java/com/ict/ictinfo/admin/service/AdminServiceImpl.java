package com.ict.ictinfo.admin.service;

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

import com.ict.ictinfo.admin.dao.AdminDao;
import com.ict.ictinfo.noticeboard.common.NbMediaUtils;
import com.ict.ictinfo.noticeboard.common.NbPage;
import com.ict.ictinfo.noticeboard.dao.NbDao;
import com.ict.ictinfo.noticeboard.dto.NbDto;
import com.ict.ictinfo.noticeboard.dto.NbFileDto;

@Service
public class AdminServiceImpl implements AdminService {
	
	
	@Autowired
	private NbDao nbDao;
	
	@Autowired
	private AdminDao adminDao;
	
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
	public void articleListDelete(String[] checkboxValues) {
		
		List<String> deleteList=null;		
		ArrayList<String> delMessageList = new ArrayList<String>();
		
		for(String delArticleNum : checkboxValues) {	/*선택된 글번호를 배열에서 꺼내어 첨부된 파일을 삭제하기 */
			
			deleteList = nbDao.getDeleteList(delArticleNum);	
			for(String storedFname : deleteList) {		
				
			    File deleteFname = new File(saveDir+storedFname);
			    if(deleteFname.exists()) {
			    	deleteFname.delete();
			    }
			}
		}
		
	    adminDao.dbDelArticleNum(checkboxValues);		/*위에서 첨부된 파일을 먼저 삭제한후 글 삭제하기*/
	}	

	
}





























