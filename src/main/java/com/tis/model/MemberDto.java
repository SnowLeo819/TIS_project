package com.tis.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Component
public class MemberDto {
	private int no;
	private String id;
	private String password;
	private String code;
	private String name;
	private String subject; // 과목
	private String tell;
	private String email;
	private String regDate;
}
