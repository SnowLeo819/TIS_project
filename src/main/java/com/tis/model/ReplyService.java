package com.tis.model;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface ReplyService {
	// 입력
	public int insertReply(ReplyDto replyDto);
	
	// 수정
	public int updateReply(ReplyDto replyDto);
	
	// 삭제
	public int deleteReply(ReplyDto replyDto);
	
	// 찾기
	public ReplyDto getReply(int no);
	public List<ReplyDto> getReplyList(int no);
}
