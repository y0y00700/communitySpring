package com.signForm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.signForm.domain.Criteria;
import com.signForm.domain.UserVO;
import com.signForm.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	private UserMapper mapper;
	@Override
	public boolean sign(UserVO user) {
		log.info("회원가입 서비스로 이동됨");
		return mapper.insert(user)==1;
	}
	@Override
	public boolean login(UserVO user) {
		log.info("로그인 서비스로 이동됨");
		return mapper.select(user)==1;
	}
	@Override
	public UserVO userInfo(String id) {
		log.info("유저 정보 가지고 오기");
		return mapper.getInfo(id);
	}
	@Override
	public boolean modify(UserVO user) {
		log.info("정보 수정...");
		return mapper.update(user)==1;
	}
	@Override
	public boolean erase(String id) {
		log.info("회원 탈퇴");
		return mapper.delete(id)==1;
	}
	@Override
	public boolean overlap(String id) {
		log.info("중복조회");
		return mapper.overlap(id)==1;
	}
	@Override
	public List<UserVO> getList(Criteria cri) {
		return mapper.getList(cri);
	}
	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	

	
}
