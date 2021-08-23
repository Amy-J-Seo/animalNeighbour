package co.animal.prj.board.service;

import java.util.List;

import co.animal.prj.board.vo.BoardVO;

public interface BoardServiceMapper {
	public List<BoardVO> boardSelectList();
	public List<BoardVO> boardSelectListEvent();
	public List<BoardVO> boardSelectListNotice();
	public List<BoardVO> boardSelectListByKeyWord(BoardVO vo);
	public BoardVO boardSelect(BoardVO vo);
	public int boardUpdate(BoardVO vo);
	public int boardDelete(BoardVO vo);
	public int boardInsert(BoardVO vo);
	public int bUpdateLike(BoardVO vo);
	public int bUpdateHit(BoardVO vo); //hit 증가
	
	//Admin Main 게시글 수 가져오기
	public int noticeNum();
	public int eventNum();
}
