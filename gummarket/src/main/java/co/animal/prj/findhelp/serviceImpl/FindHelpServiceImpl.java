package co.animal.prj.findhelp.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.common.DataSource;
import co.animal.prj.findhelp.service.FindHelpService;
import co.animal.prj.findhelp.service.FindHelpServiceMapper;
import co.animal.prj.findhelp.vo.FindHelpVO;

public class FindHelpServiceImpl implements FindHelpService {
	private SqlSession sqlSession=DataSource.getInstance().openSession(true);
	private FindHelpServiceMapper map = sqlSession.getMapper(FindHelpServiceMapper.class);
	@Override
	public List<FindHelpVO> findHelpSelectList() {
		// TODO Auto-generated method stub
		return map.findHelpSelectList();
	}

	@Override
	public FindHelpVO findHelpSelect(FindHelpVO vo) {
		// TODO Auto-generated method stub
		return map.findHelpSelect(vo);
	}

	@Override
	public int findHelpUpdate(FindHelpVO vo) {
		// TODO Auto-generated method stub
		return map.findHelpUpdate(vo);
	}

	@Override
	public int findHelpDelete(FindHelpVO vo) {
		// TODO Auto-generated method stub
		return map.findHelpDelete(vo);
	}

	@Override
	public int findHelpInsert(FindHelpVO vo) {
		// TODO Auto-generated method stub
		return map.findHelpInsert(vo);
	}

}
