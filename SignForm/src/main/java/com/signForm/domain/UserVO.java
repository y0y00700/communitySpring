package com.signForm.domain;

import lombok.Data;

@Data
public class UserVO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String gender;
	private String birth;
}
