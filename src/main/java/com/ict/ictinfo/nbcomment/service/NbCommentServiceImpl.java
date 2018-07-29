package com.ict.ictinfo.nbcomment.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.ictinfo.nbcomment.dao.NbCommentDao;
import com.ict.ictinfo.nbcomment.dto.NbCommentDto;

@Service
public class NbCommentServiceImpl implements NbCommentService {

	@Autowired
	private NbCommentDao nbCommentDao;
	
	@Override
	public void insertComment(NbCommentDto comment) {
		nbCommentDao.insertComment(comment);		
	}

	@Override
	public List<NbCommentDto> getComments(int articleNum, int commentRow) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("articleNum",articleNum);
		map.put("commentRow",commentRow);
		
		return nbCommentDao.getComments(map);
	}

	
	
}
