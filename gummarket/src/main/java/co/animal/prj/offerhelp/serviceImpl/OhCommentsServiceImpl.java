package co.animal.prj.offerhelp.serviceImpl;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.common.DataSource;
import co.animal.prj.offerhelp.service.OhCommentsService;
import co.animal.prj.offerhelp.service.OhCommentsServiceMapper;
import co.animal.prj.offerhelp.vo.CommentsVO;

public class OhCommentsServiceImpl implements OhCommentsService{
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private OhCommentsServiceMapper map = sqlSession.getMapper(OhCommentsServiceMapper.class);
	
	@Override
	public int ohCommentsInsert(CommentsVO vo) {
		return map.ohCommentsInsert(vo);
	}
}
