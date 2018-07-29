package com.ict.ictinfo.nbcomment.dao;

import java.util.HashMap;
import java.util.List;


import com.ict.ictinfo.nbcomment.dto.NbCommentDto;

public interface NbCommentDao {
	
	public void insertComment(NbCommentDto comment);
	
	public List<NbCommentDto> getComments(HashMap<String, Integer> map);

}
