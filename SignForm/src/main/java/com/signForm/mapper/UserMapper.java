package com.signForm.mapper;

import java.util.List;

import com.signForm.domain.Criteria;
import com.signForm.domain.UserVO;

public interface UserMapper {
	public int insert(UserVO user);
	
	public int select(UserVO user);
	
	public UserVO getInfo(String id);
	
	public int update(UserVO user);
	
	public int delete(String id);
	
	public int overlap(String id);
	
	public List<UserVO> getList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
