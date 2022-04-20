package com.tis.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Component
public class AttendDto {
	private int no;
	private String code;
	private String name;
	private String subject;
	private String attendDate;
	private String attendTime;
	private String leaveTime;
	private String state;
	public AttendDto() {
		
	}
}
