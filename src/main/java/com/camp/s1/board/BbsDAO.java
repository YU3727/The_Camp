package com.camp.s1.board;

import java.util.List;


public interface BbsDAO {
	
	
	//totalCount
	//Pager Ŭ���� ������ �Ű������� �߰��ؾ���
	public Long getTotalCount() throws Exception;
	
	//list
	//Pager Ŭ���� ������ �Ű������� �߰��ؾ���
	public List<BbsDTO> getBoardList() throws Exception;
	
	//insert(add)
	public int setBoardAdd(BbsDTO bbsDTO) throws Exception;
	
	//update
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception;
	
	//delete
	public int setBoardDelete(BbsDTO bbsDTO) throws Exception;
	
}
