package edu.bit.ex.mapper;

import java.util.List;

import edu.bit.ex.vo.BoardVO; 


public interface BoardMapper {
	
	public List<BoardVO> getList(); 

	public void insert(BoardVO boardVO);

	public BoardVO read(int bno);

	public void update(BoardVO boardVO);

	public void delete(int bId);

	public void replyinsert(BoardVO boardVO);

	public void replyshape(BoardVO boardVO);

	public void uphit(int bno);

	public int countBoard();

	/* public List<BoardVO> selectBoard(PagingVO vo); */

	public BoardVO readReply(int bno);

}
