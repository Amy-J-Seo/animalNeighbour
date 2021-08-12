package co.animal.prj.comments.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.comment.service.CommentsService;
import co.animal.prj.comment.service.CommentsServiceMapper;
import co.animal.prj.comments.vo.CommentsVO;
import co.animal.prj.common.DataSource;

public class CommentsServiceImpl implements CommentsService {
	private SqlSession sqlSession = DataSource.getInstance().openSession();
	private CommentsServiceMapper map = sqlSession.getMapper(CommentsServiceMapper.class);
	
	@Override
	public List<CommentsVO> commentSelectList() {
		// TODO Auto-generated method stub
		return map.commentSelectList();
	}

	@Override
	public CommentsVO commentSelect(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.commentSelect(vo);
	}

	@Override
	public int commentUpdate(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.commentUpdate(vo);
	}

	@Override
	public int commentDelete(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.commentDelete(vo);
	}

	@Override
	public int commentInsert(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.commentInsert(vo);
	}

}
