package com.ict.ictinfo.memjoin.service;

import javax.servlet.http.HttpSession;

import com.ict.ictinfo.memjoin.dto.MemJoinDto;

public interface MemJoinService {

	public int joinIdCheck(String id);

	public void joinConfirm(MemJoinDto memjoin);

	public String login(String id, String password, HttpSession session);

	public void joinUpdate(MemJoinDto memjoin);
	
	public MemJoinDto getJoinUpdate(String id);
	
	public void joinDelete(MemJoinDto memjoin);
}
