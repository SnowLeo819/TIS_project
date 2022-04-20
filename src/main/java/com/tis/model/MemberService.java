package com.tis.model;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {
	// 전체 리스트
	public List<MemberDto> getAllMemberList(String search_classification, String search_subject, String search_name);

	// 한명 찾기
	public MemberDto getSelectOne(String code);

	// 한명 찾기
	public MemberDto isRegistered(MemberDto memberDto);

	// 삭제
	public int deleteMember(String code);

	// 신규등록
	public int insertMember(MemberDto memberDto);

	// 수정
	public int updateMember(MemberDto memberDto);

	public int getTotal(String search_select, String search_word);

	public int idCheck(String user_id);
}
