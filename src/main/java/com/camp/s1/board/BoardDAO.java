package com.camp.s1.board;

import java.util.List;

public interface BoardDAO extends BbsDAO{
	
	//list
	

	//add
	
	//fileAdd
	public int setBoardFileAdd(BoardFileDTO boardFileDTO) throws Exception;
	
	//update
	
	//delete
	
	//BoardFileList
	public List<BoardFileDTO> getBoardFileList(BbsDTO bbsDTO) throws Exception;
	
	//BoardFileDetail
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception;
	
	public int setBoardFileDelete(Long fileNum) throws Exception;
	
	public int setBoardHitCount(BoardDTO boardDTO) throws Exception;
	
	
}
