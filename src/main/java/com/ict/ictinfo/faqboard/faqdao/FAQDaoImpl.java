package com.ict.ictinfo.faqboard.faqdao;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ict.ictinfo.faqboard.faqdto.FAQDto;
import com.ict.ictinfo.faqboard.faqdto.FileDto;

@Repository
public class FAQDaoImpl implements FAQDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.ict.ictinfo.faqboard.faqdao.FAQDao";
	
	@Override
	public List<FAQDto> list(HashMap<String, String> pagingMap){
		return sqlSession.selectList(nameSpace+".list",pagingMap);
	}
	
	@Override
	public FAQDto content(String articleNum) {
		return sqlSession.selectOne(nameSpace+".content", articleNum);
	}
	

	@Override
	public void updateHit(String articleNum) {
		sqlSession.update(nameSpace+".updateHit", articleNum);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace+".getTotalCount");
	}
	
	@Override
	public void write(FAQDto article){
		sqlSession.insert(nameSpace+".write", article);
	}

	@Override
	public void reply(FAQDto article) {
		sqlSession.insert(nameSpace+".reply", article);
		
	}

	@Override
	public void delete(String articleNum) {
		sqlSession.delete(nameSpace+".delete",articleNum);
		
	}

	@Override
	public FAQDto getUpdateArticle(String articleNum) {
		return sqlSession.selectOne(nameSpace+".getUpdateArticle",articleNum);
	}

	@Override
	public void updateArticle(FAQDto article) {
		sqlSession.update(nameSpace+".updateArticle",article);
		
	}
	
	@Override
	public void insertFile(FileDto fileDto) {
		sqlSession.insert(nameSpace+".insertFile",fileDto);
		
	}

	@Override
	public List<String> getFiles(String articleNum) {
		return sqlSession.selectList(nameSpace+".getFiles",articleNum);
	}

	@Override
	public int getCommentCount(String articleNum) {
		return sqlSession.selectOne(nameSpace+".getCommentCount",articleNum);
	}

	@Override
	public void dbDelFileName(List<String> delFileList) {
		sqlSession.delete(nameSpace+".dbDelFileName",delFileList);
		
	}

	
	public void dbDelFileName1(String[] deleteFileName) {
		sqlSession.delete(nameSpace+".dbDelFileName1",deleteFileName);
		
	}
	
	@Override
	public List<String> getDeleteList(String articleNum) {
		return sqlSession.selectList(nameSpace+".getDeleteList",articleNum);
	}
	
}