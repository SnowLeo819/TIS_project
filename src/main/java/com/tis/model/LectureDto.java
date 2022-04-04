package com.tis.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Component
public class LectureDto {
	private int no;
	private String subject;
	private String teacher;
	private String selectDate;
	private String contents;
}
