package com.signForm.service;

import org.springframework.stereotype.Service;

import com.signForm.domain.AdminVO;
import com.signForm.mapper.AdminMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{
	private AdminMapper mapper;
	@Override
	public boolean login(AdminVO avo) {
		return mapper.loginAdmin(avo)==1;
		
	}

	
}
