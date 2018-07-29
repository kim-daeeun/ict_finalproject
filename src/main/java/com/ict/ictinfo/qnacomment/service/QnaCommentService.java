package com.ict.ictinfo.qnacomment.service;

import java.util.List;

import com.ict.ictinfo.qnacomment.dto.QnaCommentDto;

public interface QnaCommentService {
	public void insertQnaComment(QnaCommentDto qnaComment);
	public List<QnaCommentDto> getQnaComments(int articleNum, int commentRow);
}
