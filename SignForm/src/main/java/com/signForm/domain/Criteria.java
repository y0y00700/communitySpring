package com.signForm.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;
	
	//기본생성자. criteria 생성자 호출시 디폴트 값으로 1페이지 10개씩 출력
	public Criteria() {
		this(1,10);
	}
	public Criteria(int pageNum,int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
}
