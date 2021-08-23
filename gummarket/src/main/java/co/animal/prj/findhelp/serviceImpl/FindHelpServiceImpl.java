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
		return map.findHelpSelectList();
	}

	@Override
	public FindHelpVO findHelpSelect(FindHelpVO vo) {
		return map.findHelpSelect(vo);
	}

	@Override
	public int findHelpUpdate(FindHelpVO vo) {
		return map.findHelpUpdate(vo);
	}

	@Override
	public int findHelpDelete(FindHelpVO vo) {
		return map.findHelpDelete(vo);
	}

	@Override
	public int findHelpInsert(FindHelpVO vo) {
		return map.findHelpInsert(vo);
	}

	@Override
	public int updateLike(FindHelpVO vo) {
		return map.updateLike(vo);
	}

	@Override
	public FindHelpVO findHelpLike(FindHelpVO vo) {
		return map.findHelpLike(vo);
	}

	@Override
	public List<FindHelpVO> findHelpSelectListByKeyWord(FindHelpVO vo) {
		// TODO Auto-generated method stub
		return map.findHelpSelectListByKeyWord(vo);
	}

	@Override
	public int memberTotalfh(FindHelpVO vo) {
		// TODO Auto-generated method stub
		return map.memberTotalfh(vo);
	}

	@Override
	public List<FindHelpVO> findHelpSelectListByMember(FindHelpVO vo) {
		// TODO Auto-generated method stub
		return map.findHelpSelectListByMember(vo);
	}

}
