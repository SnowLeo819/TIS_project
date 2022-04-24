package com.tis.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReplyDao implements ReplyService{
	@Autowired
	ReplyDto replyDto;

	@Autowired
	public SqlSessionFactory sqlSessionFactory;

	@Override
	public int insertReply(ReplyDto replyDto) {
		int result = 0;

		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertReply",replyDto);
		sqlSession.commit();
		
		sqlSession.close();
		return result;
	}

	@Override
	public int updateReply(ReplyDto replyDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(ReplyDto replyDto) {
		int result = 0;

		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteReply",replyDto);
		sqlSession.commit();
		
		sqlSession.close();
		return result;
	}

	@Override
	public ReplyDto getReply(int no) {
				
		SqlSession sqlSession = sqlSessionFactory.openSession();
		replyDto = sqlSession.selectOne("getReply",no);
		
		sqlSession.close();
		return replyDto;
	}

	@Override
	public List<ReplyDto> getReplyList(int no) {
		List<ReplyDto> replyList = new ArrayList<>();
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		replyList = sqlSession.selectList("getReplyList",no);

		sqlSession.close();
		return replyList;
	}

}
