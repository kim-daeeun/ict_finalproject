package com.ict.ictinfo.nbcomment.service;

import java.util.List;

import org.springframework.ui.Model;

import com.ict.ictinfo.nbcomment.dto.NbCommentDto;

public interface NbCommentService {
	
	public void insertComment(NbCommentDto comment);
	
	public List<NbCommentDto> getComments(int articleNum, int commentRow);

}


