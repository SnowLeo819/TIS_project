package com.tis.model;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface UserService {
	// 전체 리스트
	public List<UserDto> getAllUserList(int start, int end, String search_select, String search_word);
	// 한명 찾기	
	public UserDto getSelectOne(String id);
	// 삭제
	public int deleteUser(UserDto userDto);
	// 신규등록
	public int insertUser(UserDto userDto);
	// 수정
	public int updateUser(UserDto userDto);

	public int getTotal(String search_select,String search_word);
}
