package co.animal.prj.comments.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.comments.service.CommentsService;
import co.animal.prj.comments.service.CommentsServiceMapper;
import co.animal.prj.comments.vo.CommentsVO;
import co.animal.prj.common.DataSource;

public class CommentsServiceImpl implements CommentsService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private CommentsServiceMapper map = sqlSession.getMapper(CommentsServiceMapper.class);
	
	@Override
	public List<CommentsVO> commentsSelectList() {
		// TODO Auto-generated method stub
		return map.commentsSelectList();
	}

	@Override
	public CommentsVO commentsSelect(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.commentsSelect(vo);
	}

	@Override
	public int commentsUpdate(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.commentsUpdate(vo);
	}

	@Override
	public int commentsDelete(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.commentsDelete(vo);
	}

	@Override
	public int commentsInsert(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.commentsInsert(vo);
	}

	@Override
	public List<CommentsVO> fhCommentsSelectList(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.fhCommentsSelectList(vo);
	}

	@Override
	public int fhCommentsInsert(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.fhCommentsInsert(vo);
	}

	@Override
	public int fhCommentsUpdate(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.fhCommentsUpdate(vo);
	}

	@Override
	public int fhCommentsDelete(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.fhCommentsDelete(vo);
	}

	@Override
	public List<CommentsVO> nCommentsSelectList(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.nCommentsSelectList(vo);
	}

	@Override
	public List<CommentsVO> eCommentsSelectList(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.eCommentsSelectList(vo);
	}
}
