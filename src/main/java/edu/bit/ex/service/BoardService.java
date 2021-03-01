package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.vo.BoardVO;  

public interface BoardService {

	public List<BoardVO> getList();

	public void writeBoard(BoardVO boardVO);

	public BoardVO get(int getbId);

	public void modifyBoard(BoardVO boardVO);

	public void remove(int getbId);

	public void uphitBoard(int getbId);

	public int countBoard();

	/* public List<BoardVO> selectBoard(PagingVO vo); */
	
	public void replyBoard(BoardVO boardVO);

	public BoardVO getReply(int getbId);

}
