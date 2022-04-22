package com.tis.model;


import java.util.Date;

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
	private String name;
	private String code;
	private String position;
	private String subject;
	private String tell;
	private String tellFirst;
	private String tellMiddle;
	private String tellLast;
	private String email;
	private Date regDate;
}
