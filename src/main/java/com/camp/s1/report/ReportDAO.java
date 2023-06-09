package com.camp.s1.report;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.util.Pager;

@Repository
public class ReportDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.camp.s1.report.ReportDAO.";
	
	public int setReportAdd(ReportDTO reportDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setReportAdd", reportDTO);
	}
	
	public int setCommentReportAdd(ReportDTO reportDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setCommentReportAdd", reportDTO);
	}
	
	public ReportDTO getParentNum(ReportDTO reportDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getParentNum", reportDTO);
	}
	
	public List<ReportDTO> getReporterList(ReportDTO reportDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getReporterList", reportDTO);
	}
	
	public List<ReportDTO> getReportList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getReportList", pager);
	}
	
	public ReportDTO getReportDetail(ReportDTO reportDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getReportDetail", reportDTO);
	}
	
	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", pager);
	}
	
	public int setReportResult(ReportDTO reportDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setReportResult", reportDTO);
	}
	
	public int setBoardBlind(BbsDTO bbsDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setBoardBlind", bbsDTO);
	}
	
	public int setCommentBlind(BbsDTO bbsDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setCommentBlind", bbsDTO);
	}
	
	public List<BbsDTO> getCommentList(ReportDTO reportDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getCommentList", reportDTO);
	}
	
	
	
	
	
}
