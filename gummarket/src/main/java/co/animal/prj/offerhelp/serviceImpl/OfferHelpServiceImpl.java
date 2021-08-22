package co.animal.prj.offerhelp.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.common.DataSource;
import co.animal.prj.offerhelp.service.OfferHelpMapper;
import co.animal.prj.offerhelp.service.OfferHelpService;
import co.animal.prj.offerhelp.vo.OfferHelpVO;

public class OfferHelpServiceImpl implements OfferHelpService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private OfferHelpMapper map = sqlSession.getMapper(OfferHelpMapper.class);
	@Override
	public List<OfferHelpVO> offerHelpSelectList() {
		// TODO Auto-generated method stub
		return map.offerHelpSelectList();
	}

	@Override
	public OfferHelpVO offerHelpSelect(OfferHelpVO vo) {
		// TODO Auto-generated method stub
		return map.offerHelpSelect(vo);
	}

	@Override
	public int offerHelpUpdate(OfferHelpVO vo) {
		// TODO Auto-generated method stub
		return map.offerHelpUpdate(vo);
	}

	@Override
	public int offerHelpDelete(OfferHelpVO vo) {
		// TODO Auto-generated method stub
		return map.offerHelpDelete(vo);
	}

	@Override
	public int offerHelpInsert(OfferHelpVO vo) {
		// TODO Auto-generated method stub
		return map.offerHelpInsert(vo);
	}

	@Override
	public int memberTotalOh(OfferHelpVO vo) {
		// TODO Auto-generated method stub
		return map.memberTotalOh(vo);
	}

	@Override
	public List<OfferHelpVO> offerHelpSelectListByMember(OfferHelpVO vo) {
		// TODO Auto-generated method stub
		return map.offerHelpSelectListByMember(vo);
	}

}
