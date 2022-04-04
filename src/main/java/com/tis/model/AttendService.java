package com.tis.model;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface AttendService {
	// 출석 (입력)
	public int insertAttend(AttendDto attendDto);
	
	// 퇴실 (수정)
	public int updateAttend(AttendDto attendDto);
	
	// 전체 출결리스트 가져오기
	public List<AttendDto> getAllList(int start, int end,String search_select, String search_word);
	public List<AttendDto> getSearchAllList(String search_select, String search_word);
	
	// 출결 삭제
	public int deleteAttend(AttendDto attendDto);
	
	public int getTotal(String search_select,String search_word);
}
