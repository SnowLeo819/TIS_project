package com.tis.model;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface BoardService {
	public int insertBoard(BoardDto boardDto);
	
	public int insertReplyBoard(BoardDto boardDto);	
	//글 수정
	public int updateBoard(BoardDto boardDto);

	// 답글 쓰기
	public int updateReLevel(BoardDto boardDto);
	
	public int getMaxRegroup();
	
	public List<BoardDto> getAllList(int start, int end,String search_select, String search_word);
	
	public List<BoardDto> getSearchAllList(String search_select, String search_word);
	
	public BoardDto getSelectOne(int no);
	
	public BoardDto getPrevSelect(int num);
	
	public BoardDto getNextSelect(int num);
	
	public int updateHit(int no);
	
	public int deleteBoard(BoardDto boardDto);
	
	public int getTotal(String search_select,String search_word);
}
