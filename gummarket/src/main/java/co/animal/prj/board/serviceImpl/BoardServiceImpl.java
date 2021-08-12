package co.animal.prj.board.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.board.service.BoardService;
import co.animal.prj.board.service.BoardServiceMapper;
import co.animal.prj.board.vo.BoardVO;
import co.animal.prj.common.DataSource;

public class BoardServiceImpl implements BoardService {
	private SqlSession sqlSession =DataSource.getInstance().openSession();
	
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

}
