package com.ict.ictinfo.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ict.ictinfo.noticeboard.dto.NbDto;

public interface AdminService {
	public void articleListDelete(String[] checkboxValues);

}
