package com.tis.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AttendDao implements AttendService{

	@Autowired
	AttendDto attendDto;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	//출석한번체크?
	@Override
	public AttendDto getTodayAttend(String code) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		attendDto = sqlSession.selectOne("getTodayAttend",code);
		sqlSession.close();
		return attendDto; // 컨트롤러에 던져줌
	}
	
	//과목출석현황
	@Override
	public List<AttendDto> getAllAttend(String subject) {
	   List<AttendDto> attendList = null;
	   SqlSession sqlSession = sqlSessionFactory.openSession();
	   attendList = sqlSession.selectList("getAllAttend",subject);
	   System.out.println("값=="+attendList);
	   sqlSession.close();
	   return attendList;
	}
		
	//출석카운터일수
	@Override
	public int getAllAttendCount(AttendDto attendDto,String position) {
		
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		if(position.equals("S")) {
			result = sqlSession.selectOne("getAllAttendCount",attendDto);		
		} else if(position.equals("T")||position.equals("M")) {
			result = sqlSession.selectOne("getStaffAttendCount",attendDto);	
		}
		sqlSession.close();
		return result;
	}

	//출석시간입력
	@Override
	public int AttendCheck(AttendDto attendDto) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("AttendCheck",attendDto);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}


	//퇴실
	@Override
	public int AttendOut(AttendDto attendDto) {
		int result = 0; 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("AttendOut",attendDto);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	//개인정보
	@Override
	public AttendDto AttendOneSelect(int no) {
		AttendDto attendDto;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		attendDto = sqlSession.selectOne("AttendOneSelect",no);
		sqlSession.close();
		return attendDto;
	}
	
	//시간수정
	@Override
	public int AttendUpdate(AttendDto attendDto) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("AttendUpdate",attendDto);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	//날짜리스트
	@Override
	public List<AttendDto> getDateList(String attendDate) {
		List<AttendDto> attendDateList = new ArrayList<>();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		attendDateList = sqlSession.selectList("selectDate",attendDate);
		
		System.out.println("dao="+attendDateList);
		
		sqlSession.close();
		return attendDateList;
	}
	
	//시간차이계산
    @Override
    public int AttendState(AttendDto attendDto) {
       int result=0;
       SqlSession sqlSession = sqlSessionFactory.openSession();
       result = sqlSession.selectOne("AttendState",attendDto);
       sqlSession.close();
       return result;
    }
		
	

	@Override
	public List<AttendDto> getSearchAllList(String search_select, String search_word) {
		// TODO Auto-generated method stub
		return null;
	}

	//만들엉야됨
	@Override
	public int deleteAttend(AttendDto attendDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTotal(String search_select, String search_word) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AttendDto> getAllList(int start, int end, String search_select, String search_word) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AttendDto> AttendAllList() {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public int updateAttend(AttendDto attendDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AttendDto getState(AttendDto _attendDto) {

		System.out.println("attendDto="+_attendDto);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		attendDto = sqlSession.selectOne("getState",_attendDto);

		System.out.println("attendDto="+attendDto);
		
        sqlSession.close();
		return attendDto;
	}

	
}
