package com.ict.ictinfo.qnaboard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.ictinfo.qnaboard.dto.QnaBoardDto;
import com.ict.ictinfo.qnaboard.dto.QnaFileDto;

@Repository
public class QnaBoardDaoImpl implements QnaBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.ict.ictinfo.qnaboard.dao.QnaBoardDao";
	
	@Override
	public void qnaWrite(QnaBoardDto qnaArticle) {
		sqlSession.insert(nameSpace+".qnaWrite",qnaArticle);
	}
	
	@Override
	public List<QnaBoardDto> qnaList(HashMap<String, String> pagingMap){
		return sqlSession.selectList(nameSpace+".qnaList",pagingMap);
	}

	@Override
	public int getTotalCount() {
		
		return sqlSession.selectOne(nameSpace+".getTotalCount");
	}

	@Override
	public void qnaReply(QnaBoardDto qnaArticle) {

		sqlSession.insert(nameSpace+".qnaReply", qnaArticle);
		
	}

	@Override
	public QnaBoardDto qnaContent(String articleNum) {

		return sqlSession.selectOne(nameSpace+".qnaContent",articleNum);
	}

	@Override
	public void updateHit(String articleNum) {
		
		sqlSession.update(nameSpace+".updateHit",articleNum);
		
	}

	@Override
	public int getQnacommentCount(String articleNum) {
		return sqlSession.selectOne(nameSpace+".getQnacommentCount",articleNum);
	}
	
	@Override
	public QnaBoardDto qnaUpdate(String articleNum) {
		
		return sqlSession.selectOne(nameSpace+".qnaUpdate",articleNum);
	}

	@Override
	public void qnaUpdates(QnaBoardDto qnaArticle) {
		
		sqlSession.update(nameSpace+".qnaUpdates",qnaArticle);
		
	}

	@Override
	public void qnaDelete(String articleNum) {
		sqlSession.delete(nameSpace+".qnaDelete",articleNum);
		
	}
	
	@Override
	public List<QnaFileDto> getQnacontentFiles(String articleNum) {
		
		return sqlSession.selectList(nameSpace+".getQnacontentFiles",articleNum);
	}

	@Override
	public void insertQnaFile(QnaFileDto qnaFile) {

		sqlSession.insert(nameSpace+".insertQnaFile",qnaFile);
	}
	
	@Override
	public List<String> getFiles(String articleNum) {
		
		return sqlSession.selectList(nameSpace+".getFiles",articleNum);
	}
	
	@Override
	public String getStoredFname(String fileNum) {

		return sqlSession.selectOne(nameSpace+".getStoredFname",fileNum);
	}

	@Override
	public void dbDelFileList(List<String> delFileList) {

		sqlSession.delete(nameSpace+".dbDelFileList",delFileList);
		
	}

	@Override
	public void dbDelFileName(String[] deleteFileName) {
		
		sqlSession.delete(nameSpace+".dbDelFileName",deleteFileName);
		
	}

	@Override
	public List<String> getDeleteList(String articleNum) {

		return sqlSession.selectList(nameSpace+".getDeleteList",articleNum);
	}
	
	
}
