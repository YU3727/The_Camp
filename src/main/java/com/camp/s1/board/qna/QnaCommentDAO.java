package com.camp.s1.board.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.BoardDTO;
import com.camp.s1.board.CommentDAO;
import com.camp.s1.util.Pager;

@Repository
public class QnaCommentDAO implements CommentDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.camp.s1.board.qna.QnaCommentDAO.";

	@Override
	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", pager);
	}

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getBoardList", pager);
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setBoardAdd", bbsDTO);
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setBoardUpdate", bbsDTO);
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setBoardDelete", bbsDTO);
	}

	@Override
	public int setStepUpdate(BbsDTO bbsDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setStepUpdate", bbsDTO);
	}
	
	

	@Override
	public Long getStepMax(BbsDTO bbsDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getStepMax", bbsDTO);
	}

	@Override
	public BbsDTO getBoardDetail(BbsDTO bbsDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getBoardDetail", bbsDTO);
	}

	@Override
	public int setSubCommentAdd(BbsDTO bbsDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setSubCommentAdd", bbsDTO);
	}
	
	
	
	
	
	
	
	

}
