package co.animal.prj.lost.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.common.DataSource;
import co.animal.prj.lost.service.LostService;
import co.animal.prj.lost.service.LostServiceMapper;
import co.animal.prj.lost.vo.LostVO;

public class LostServiceImpl implements LostService {
	private SqlSession sqlSession =DataSource.getInstance().openSession();
	private LostServiceMapper map =sqlSession.getMapper(LostServiceMapper.class);
	
	@Override
	public List<LostVO> lostSelectList() {
		// TODO Auto-generated method stub
		return map.lostSelectList();
	}

	@Override
	public LostVO lostSelect(LostVO vo) {
		// TODO Auto-generated method stub
		return map.lostSelect(vo);
	}

	@Override
	public int lostUpdate(LostVO vo) {
		// TODO Auto-generated method stub
		return map.lostUpdate(vo);
	}

	@Override
	public int lostDelete(LostVO vo) {
		// TODO Auto-generated method stub
		return map.lostDelete(vo);
	}

	@Override
	public int lostInsert(LostVO vo) {
		// TODO Auto-generated method stub
		return map.lostInsert(vo);
	}

}
