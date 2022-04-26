package com.tis.model;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface BoardService {
	// 입력
		public int insertBoard(BoardDto boardDto);
		
		// 수정
		public int updateBoard(BoardDto boardDto);
		public int updateReply(ReplyDto replyDto);

		//검색
		public List<BoardDto> getCateBoard(int start, int end,String search_select, String search_word, String category);
		public int getTotal(String search_select,String search_word, String cate_select);
		public BoardDto getTarget(int target_num, String search_select, String search_word, String cate_select);
		
		
		// 보여주기
		public BoardDto getSelectOne(int no);
		public int updateHit(int no);

		//삭제
		public int deleteBoard(int no);
		
		
//		public BoardDto getPrevSelect(int num);
//		public BoardDto getNextSelect(int num);
}
