package com.ict.ictinfo.memjoin.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.ictinfo.memjoin.dao.MemJoinDao;
import com.ict.ictinfo.memjoin.dto.MemJoinDto;

@Service
public class MemJoinServiceImpl implements MemJoinService {
	
	@Autowired
	private MemJoinDao memjoinDao;
	
	@Override
	public int joinIdCheck(String id) {
		String idCheck=memjoinDao.joinIdCheck(id);
		int result;
		if(idCheck!=null) {
			result=0;
		}
		else {
			result=1;
		}
			return result;
	}
	
	
	@Override
	public void joinConfirm(MemJoinDto memjoin) {
		
		memjoinDao.joinConfirm(memjoin);
	}


	@Override
	public String login(String id, String password, HttpSession session) {
//			정적인 쿼리를 사용한다면 id를 화이트리스트로 처리해야함
//			최종적으로는 ESAPI같은 보안라이브러리를 사용
//			id=SQLFilter.sqlFiltering(id);
		
			String dbPass=memjoinDao.login(id);
			
			String result = null;			
			if(dbPass==null) {
				result = "1";
				
			}else {
				if(password.equals(dbPass)) {
										
					session.setAttribute("id", id);
					result = "2";		

				}else {
					result="1";
				}
			}
			
		return result;
	}


	@Override
	public MemJoinDto joinInfo(String id) {
		// TODO Auto-generated method stub
		return memjoinDao.joinInfo(id);
	}


	@Override
	public void joinUpdate(MemJoinDto memjoin) {
		
		memjoinDao.joinUpdate(memjoin);
	}


	@Override
	public MemJoinDto getJoinUpdate(String id) {
		return memjoinDao.getJoinUpdate(id);
	}


	@Override
	public void joinDelete(String id) {

				memjoinDao.joinDelete(id);
	}


	@Override
	public String joinPassChk(String password, HttpSession session) {

		String id = (String) session.getAttribute("id");
		String dbPass=memjoinDao.login(id);
		String result = null;
		
		if(password==null) {
			result = "1";
			
		}else {
			if(dbPass.equals(password)) {
									
				result = "3";

			}else {
				result="2";
			}
		}
		
		return result;
	}



}
