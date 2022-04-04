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
	private String name;
	private String code;
	private String subject;
	private String tell;
	private String email;
	private String regDate;
}
