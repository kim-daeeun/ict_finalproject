package com.ict.ictinfo.noticeboard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.ictinfo.noticeboard.dto.NbFileDto;
import com.ict.ictinfo.noticeboard.dto.NbDto;

@Repository
public class NbDaoImpl implements NbDao {
	
	// root-context.xml에 생성해 놓았으므로 가능
	@Autowired
	// ★private JdbcTemplate jdbcTemplate;
	private SqlSessionTemplate sqlSession;
	private StringBuffer query;					//질문. ????????????????????
	
	//bbs.xml 파일을 호출하기 위해 bbs.xml에 있는 namespace를 선언해 준다
	private final String nameSpace="com.ict.ictinfo.noticeboard.dao.NbDao";	
	
	
	
	
	@Override
	public int getTotalCount() {
		return sqlSession.selectOne(nameSpace+".getTotalCount");
	}
	@Override
	public int getCommentCount(String articleNum) {
		return sqlSession.selectOne(nameSpace+".getCommentCount",articleNum);
	}
	@Override
	public List<NbDto> list(HashMap<String, String> pagingMap) {
		return sqlSession.selectList(nameSpace+".list", pagingMap);
	}	
	
	
	
	
	
	
	@Override
	public void write(NbDto article) {
		sqlSession.insert(nameSpace+".write",article);		
	}
	
	@Override
	public String getNextArticleNum() {	
		System.out.println("dao getnextatinum");
		return sqlSession.selectOne(nameSpace+".getNextArticleNum");
	}
	

	@Override
	public void insertFile(NbFileDto fileDto) {	
		sqlSession.update(nameSpace+".insertFile", fileDto);		
	}		
	
	
	
	

	@Override
	public NbDto content(String articleNum) {		
		return sqlSession.selectOne(nameSpace+".content", articleNum); 
	}
	
	 @Override
	public void updateHit(String articleNum) {
		 sqlSession.update(nameSpace+".updateHit", articleNum);
	}
	@Override
	 public List<String> getFiles(String articleNum) {	 
		 return sqlSession.selectList(nameSpace+".getFiles", articleNum);
	 }
	
	

	@Override
	public List<String> getDeleteList(String articleNum) {
		return sqlSession.selectList(nameSpace+".getDeleteList", articleNum);
	}
	
	@Override
	public void delete(String articleNum) {
		sqlSession.delete(nameSpace+".delete", articleNum);		
	}
	

	
	
	
	
	@Override
	public NbDto getUpdateArticle(String articleNum) {
		return sqlSession.selectOne(nameSpace+".getUpdateArticle", articleNum);
	}

	@Override
	public void updateArticle(NbDto article) {	
		sqlSession.update(nameSpace+".updateArticle", article);		
	}	
	
	@Override
	public void dbDelFileName(List<String> delFileList) {
		sqlSession.delete(nameSpace+".dbDelFileName", delFileList);		
	}
	

	@Override
	public void dbDelFileName1(String[] deleteFileName) {
		sqlSession.delete(nameSpace+".dbDelFileName1", deleteFileName);			
	}	
	
	 @Override
	 public void reply(NbDto article) {
	  sqlSession.insert(nameSpace+".reply", article);	  
	 }
	 
	 
	 
	@Override
	public List<NbDto> nbSearch(HashMap<String, String> pagingMap) {
		return sqlSession.selectList(nameSpace+".nbSearch", pagingMap);		
	}	
	@Override
	public int getTotalCountNbSearch(HashMap<String, String> pagingMap) {
		return sqlSession.selectOne(nameSpace+".getTotalCountNbSearch", pagingMap);
	}	 


}



























