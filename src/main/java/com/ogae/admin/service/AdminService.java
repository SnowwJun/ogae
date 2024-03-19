package com.ogae.admin.service;

import com.ogae.admin.AdminVO;

public interface AdminService {
	String checkAdmin(AdminVO vo);
	AdminVO getAdmin(AdminVO vo);
	int updateAdmin(AdminVO vo);
}
