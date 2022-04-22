package com.tis.model;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface LectureService {
	// 입력
	public int insertLecture(LectureDto lectureDto);

	// 수정
	public int updateLecture(LectureDto lectureDto);

	// 읽기
	public LectureDto getSelectOne(int no);

	public List<LectureDto> getAllLecture(LectureDto lectureDto);

	public List<LectureDto> getDateLecture(LectureDto lectureDto);

	// 삭제
	public int deleteLecture(LectureDto lectureDto);

	// 종강일,.,.
	public int getDay(String startDay, String endDay);
	public int getDDay(String endDay);
}
