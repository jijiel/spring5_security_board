package edu.bit.ex.service;

import java.util.List;  

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.bit.ex.mapper.BoardMapper;
import edu.bit.ex.vo.BoardVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
 

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	private BoardMapper mapper;
	
	  @Override
	  public List<BoardVO> getList() {
	  
	  return mapper.getList(); 
	  }
	 

	@Override
	public void writeBoard(BoardVO boardVO) {
		mapper.insert(boardVO);
		
	}

	@Override
	public BoardVO get(int bno) {
		log.info("get");
		mapper.uphit(bno);
		return mapper.read(bno);
		 
	}

	@Override
	public void modifyBoard(BoardVO boardVO) {
		mapper.update(boardVO);
		
	}

	@Override
	public void remove(int bId) {
		log.info("deleted");
		 mapper.delete(bId);	
	}

	@Override
	public void replyBoard(BoardVO boardVO) {
		mapper.replyinsert(boardVO);
		mapper.replyshape(boardVO);
		
	}

	@Override 
	public void uphitBoard(int bno) { 
		mapper.uphit(bno); 
	}

	@Override
	public int countBoard() {
		
		return mapper.countBoard();
	}

	/*
	 * @Override public List<BoardVO> selectBoard(PagingVO vo) {
	 * 
	 * return mapper.selectBoard(vo); }
	 */

	@Override
	public BoardVO getReply(int bno) {
		
		return mapper.readReply(bno);
	}

}
