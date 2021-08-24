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

	@Override
	public int careNum() {
		// TODO Auto-generated method stub
		return map.careNum();
	}

	@Override
	public List<FindHelpVO> findDeagu() {
		// TODO Auto-generated method stub
		return map.findDeagu();
	}

	@Override
	public List<FindHelpVO> findSeoul() {
		// TODO Auto-generated method stub
		return map.findSeoul();
	}

	@Override
	public List<FindHelpVO> findIncheon() {
		// TODO Auto-generated method stub
		return map.findIncheon();
	}

	@Override
	public List<FindHelpVO> findBusan() {
		// TODO Auto-generated method stub
		return map.findBusan();
	}

	@Override
	public List<FindHelpVO> findDeajeon() {
		// TODO Auto-generated method stub
		return map.findDeajeon();
	}

	@Override
	public List<FindHelpVO> findGwangju() {
		// TODO Auto-generated method stub
		return map.findGwangju();
	}

	@Override
	public List<FindHelpVO> findGyeongSang() {
		// TODO Auto-generated method stub
		return map.findGyeongSang();
	}

	@Override
	public List<FindHelpVO> findChungCheong() {
		// TODO Auto-generated method stub
		return map.findChungCheong();
	}

	@Override
	public List<FindHelpVO> findJeolla() {
		// TODO Auto-generated method stub
		return map.findJeolla();
	}

	@Override
	public List<FindHelpVO> findGyeongGi() {
		// TODO Auto-generated method stub
		return map.findGyeongGi();
	}

	@Override
	public List<FindHelpVO> findGangWon() {
		// TODO Auto-generated method stub
		return map.findGangWon();
	}

	@Override
	public List<FindHelpVO> findJeju() {
		// TODO Auto-generated method stub
		return map.findJeju();
	}

	@Override
	public List<FindHelpVO> findUlsan() {
		// TODO Auto-generated method stub
		return map.findUlsan();
	}

}
