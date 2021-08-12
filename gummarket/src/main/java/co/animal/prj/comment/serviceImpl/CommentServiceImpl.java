package co.animal.prj.comment.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.comment.service.CommentService;
import co.animal.prj.comment.service.CommentServiceMapper;
import co.animal.prj.comment.vo.CommentVO;
import co.animal.prj.common.DataSource;

public class CommentServiceImpl implements CommentService {
	private SqlSession sqlSession = DataSource.getInstance().openSession();
	private CommentServiceMapper map = sqlSession.getMapper(CommentServiceMapper.class);
	
	@Override
	public List<CommentVO> commentSelectList() {
		// TODO Auto-generated method stub
		return map.commentSelectList();
	}

	@Override
	public CommentVO commentSelect(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentSelect(vo);
	}

	@Override
	public int commentUpdate(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentUpdate(vo);
	}

	@Override
	public int commentDelete(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentDelete(vo);
	}

	@Override
	public int commentInsert(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentInsert(vo);
	}

}
