package co.animal.prj.csc.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.common.DataSource;
import co.animal.prj.csc.service.CscService;
import co.animal.prj.csc.service.CscServiceMapper;
import co.animal.prj.csc.vo.CscVO;

public class CscServiceImpl implements CscService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private CscServiceMapper map = sqlSession.getMapper(CscServiceMapper.class);
	@Override
	public List<CscVO> cscSelectList() {
		// TODO Auto-generated method stub
		return map.cscSelectList();
	}

	@Override
	public CscVO cscSelect(CscVO vo) {
		// TODO Auto-generated method stub
		return map.cscSelect(vo);
	}

	@Override
	public int cscUpdate(CscVO vo) {
		// TODO Auto-generated method stub
		return map.cscUpdate(vo);
	}

	@Override
	public int cscDelete(CscVO vo) {
		// TODO Auto-generated method stub
		return map.cscDelete(vo);
	}

	@Override
	public int cscInsert(CscVO vo) {
		// TODO Auto-generated method stub
		map.cscInsert(vo);
		return vo.getCsNo();
	}

	public List<CscVO> cscMyList(CscVO vo) {
		// TODO Auto-generated method stub
		return map.cscMyList(vo);
	}

}
