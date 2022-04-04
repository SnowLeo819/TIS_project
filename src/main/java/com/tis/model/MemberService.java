package com.tis.model;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {
	// 전체 리스트
	public List<MemberDto> getAllMemberList(int start, int end, String search_select, String search_word);
	// 한명 찾기	
	public MemberDto getSelectOne(String id);
	// 삭제
	public int deleteMember(MemberDto memberDto);
	// 신규등록
	public int insertMember(MemberDto memberDto);
	// 수정
	public int updateMember(MemberDto memberDto);

	public int getTotal(String search_select,String search_word);
}
