package com.ict.ictinfo.admin.dao;

import java.util.HashMap;
import java.util.List;

import com.ict.ictinfo.bizinfo.dto.BizInfoDto;
import com.ict.ictinfo.bizinfo.dto.GetBizDto;
import com.ict.ictinfo.main.dto.MainDto;
import com.ict.ictinfo.noticeboard.dto.NbFileDto;
import com.ict.ictinfo.noticeboard.dto.NbDto;

public interface AdminDao {
	
	public void dbDelArticleNum(String[] checkboxValues);	
	
}
