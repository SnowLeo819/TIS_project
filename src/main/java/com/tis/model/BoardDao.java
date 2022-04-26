package com.tis.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BoardDao implements BoardService{
	@Autowired
	public SqlSessionFactory sqlSessionFactory;
	
	@Override
	public int insertBoard(BoardDto boardDto) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertBoard",boardDto);
		sqlSession.commit();		
		
		sqlSession.close();
		return result;
	}

	@Override
	public int updateBoard(BoardDto boardDto) {
		int result = 0;

		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateBoard",boardDto);
		sqlSession.commit();		
		
		sqlSession.close();
		return result;
	}

	@Override
	public BoardDto getSelectOne(int no) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDto boardDto = sqlSession.selectOne("getSelectOne", no);
		
		sqlSession.close();
		return boardDto;
	}
	
	@Override
	public int updateHit(int no) {
		int result = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateHit",no);
		sqlSession.commit();
		
		sqlSession.close();
		return result;
	}

	@Override
	public BoardDto getTarget(int target_num, String search_select, String search_word, String cate_select) {
		HashMap<String,Object> targetMap = new HashMap<>();
		targetMap.put("targetNum", target_num);
		targetMap.put("searchSelect", search_select);
		targetMap.put("searchWord", search_word);
		targetMap.put("cateSelect",cate_select);

		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDto boardDto = sqlSession.selectOne("getTarget", targetMap);
		
		sqlSession.close();		
		return boardDto;
	}
	
	@Override
	public int deleteBoard(int no) {
		int result = 0; 
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteBoard",no);
		sqlSession.commit();
		
		sqlSession.close();
		return result;
	}

	@Override
	public int getTotal(String search_select, String search_word, String cate_select) {
		HashMap<String,Object> searchMap = new HashMap<>();
		searchMap.put("searchSelect",search_select);
		searchMap.put("searchWord",search_word);
		searchMap.put("cateSelect",cate_select);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int total = sqlSession.selectOne("getTotal",searchMap);
		
		sqlSession.close();
		return total;
	}

	@Override
	public List<BoardDto> getCateBoard(int start, int end, String search_select, String search_word, String cate_select) {
		HashMap<String,Object> pageMap = new HashMap<>();
		pageMap.put("start", start);
		pageMap.put("end", end);
		pageMap.put("searchSelect", search_select);
		pageMap.put("searchWord", search_word);
		pageMap.put("cateSelect", cate_select);
		
		List<BoardDto> boardList = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		boardList = sqlSession.selectList("getCateBoard",pageMap);

		sqlSession.close();
		return boardList;
	}
	
	@Override
	   public int updateReply(ReplyDto replyDto) {
	      int result = 0;
	
	      SqlSession sqlSession = sqlSessionFactory.openSession();
	      result = sqlSession.update("updateReply",replyDto);
	      sqlSession.commit();
	      
	      sqlSession.close();
	      return result;
	   }
}
