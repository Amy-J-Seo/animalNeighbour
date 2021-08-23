package co.animal.prj.board.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.board.service.BoardService;
import co.animal.prj.board.service.BoardServiceMapper;
import co.animal.prj.board.vo.BoardVO;
import co.animal.prj.common.DataSource;

public class BoardServiceImpl implements BoardService {
	private SqlSession sqlSession =DataSource.getInstance().openSession(true);
	
	private BoardServiceMapper map= sqlSession.getMapper(BoardServiceMapper.class);
	@Override
	public List<BoardVO> boardSelectList() {
		// TODO Auto-generated method stub
		return map.boardSelectList();
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.boardSelect(vo);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.boardUpdate(vo);
	}

	@Override
	public int boardDelete(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.boardDelete(vo);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.boardInsert(vo);
	}

	@Override
	public List<BoardVO> boardSelectListEvent() {
		// TODO Auto-generated method stub
		return map.boardSelectListEvent();
	}

	@Override
	public List<BoardVO> boardSelectListNotice() {
		// TODO Auto-generated method stub
		return map.boardSelectListNotice();
	}

	@Override
	public int bUpdateLike(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.bUpdateLike(vo);
	}

	@Override
	public int bUpdateHit(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.bUpdateHit(vo);
	}

	@Override
	public int noticeNum() {
		// TODO Auto-generated method stub
		return map.noticeNum();
	}

	@Override
	public int eventNum() {
		// TODO Auto-generated method stub
		return map.eventNum();
	}


}
