package com.tis.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LectureDao implements LectureService{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory;

	@Override
	public int insertLecture(LectureDto lectureDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateLecture(LectureDto lectureDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public LectureDto getSelectOne(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public List<LectureDto> getAllLecture(LectureDto lectureDto) {
		List<LectureDto> lectureList = new ArrayList<>();
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		lectureList = sqlSession.selectList("getAllLecture",lectureDto);
		
		sqlSession.close();		
		return lectureList;
	}
	
	@Override
	public List<LectureDto> getDateLecture(LectureDto lectureDto) {
		List<LectureDto> lectureList = new ArrayList<>();
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		lectureList = sqlSession.selectList("getDateLecture",lectureDto);
		
		sqlSession.close();		
		return lectureList;
	}

	@Override
	public int deleteLecture(LectureDto lectureDto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
