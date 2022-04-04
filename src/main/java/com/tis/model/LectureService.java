package com.tis.model;

import org.springframework.stereotype.Service;

@Service
public interface LectureService {
	// 입력
	public int insertLecture(LectureDto lectureDto);
	// 수정
	public int updateLecture(LectureDto lectureDto);
	// 읽기
	public LectureDto getSelectOne(int no);
	// 삭제
	public int deleteLecture(LectureDto lectureDto);
}
