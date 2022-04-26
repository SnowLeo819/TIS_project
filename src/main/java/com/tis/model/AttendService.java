package com.tis.model;

import java.util.List;

import org.springframework.stereotype.Service;




@Service
public interface AttendService {

	
	//출석입력
	int AttendCheck(AttendDto attendDto);
	
	// 퇴실 
	public int AttendOut(AttendDto attendDto);

	// 전체 출결리스트 가져오기
	public List<AttendDto> getAllList(int start, int end,String search_select, String search_word);
	public List<AttendDto> getSearchAllList(String search_select, String search_word);
	public List<AttendDto> AttendAllList();
	
	//시간수정
	public int AttendUpdate(AttendDto attendDto);
	
	//개인정보
	public AttendDto AttendOneSelect(int no);
	
	// 출결 삭제
	public int deleteAttend(AttendDto attendDto);
	
	public int getTotal(String search_select,String search_word);
	
	//날짜리스트
	List<AttendDto> getDateList(String attendDate);
	//시간계산
	int AttendState(AttendDto attendDto);

	int getAllAttendCount(AttendDto attendDto,String position);

	AttendDto getTodayAttend(String code);

	int updateAttend(AttendDto attendDto);

	public List<AttendDto> getAllAttend(String code);
	
	public AttendDto getState(AttendDto attendDto);

	
}
