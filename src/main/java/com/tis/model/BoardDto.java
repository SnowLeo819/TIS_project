package com.tis.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Component

public class BoardDto {
	private int no;
	private String title;
	private String category;
	private String code;
	private String id;
	private String regDate;
	private int reGroup; // 답글 안쓰면 나중에 삭제
	private int reLevel; // 답글 안쓰면 나중에 삭제
	private int reStep; // 답글 안쓰면 나중에 삭제
	private int hit;
	private String contents;
	private int num;
}