package com.tis.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Component

public class ReplyDto {
	private int no;
	private int boardId;
	private String name;
	private String code;
	private String txt;
	private String regDate;
}

