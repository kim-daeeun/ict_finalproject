package com.ict.ictinfo.memjoin.dao;

import com.ict.ictinfo.memjoin.dto.MemJoinDto;

public interface MemJoinDao {

	public String joinIdCheck(String id);

	public void joinConfirm(MemJoinDto memjoin);

	public String login(String id);

	public void joinUpdate(MemJoinDto memjoin);
	
	public MemJoinDto getJoinUpdate(String id);

	public void joinDelete(String id);

	public MemJoinDto joinInfo(String id);

}
