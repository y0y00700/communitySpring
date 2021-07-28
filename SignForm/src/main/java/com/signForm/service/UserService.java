package com.signForm.service;

import java.util.List;

import com.signForm.domain.Criteria;
import com.signForm.domain.UserVO;

public interface UserService {
	public boolean sign(UserVO user);
	
	public boolean login(UserVO user);
	
	public UserVO userInfo(String id);
	
	public boolean modify(UserVO user);
	
	public boolean erase(String id);
	
	public boolean overlap(String id);
	
	public List<UserVO> getList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
