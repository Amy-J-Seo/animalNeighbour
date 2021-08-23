package co.animal.prj.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import co.animal.prj.common.DataSource;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.service.MemberServiceMapper;
import co.animal.prj.member.vo.MemberVO;
@Service
public class MemberServiceImpl implements MemberService{
	private SqlSession sqlSession =DataSource.getInstance().openSession(true);
	
	private MemberServiceMapper map = sqlSession.getMapper(MemberServiceMapper.class);
	//MemberServiceMapper 메소드 사용
	public List<MemberVO> memberSelectList(){
		return map.memberSelectList();
	}
	public MemberVO memberSelect(MemberVO vo){
		return map.memberSelect(vo);
	}
	public int memberUpdate(MemberVO vo){
		return map.memberUpdate(vo);
	}
	public int memberDelete(MemberVO vo){
		return map.memberDelete(vo);
	}
	public int memberInsert(MemberVO vo){
		return map.memberInsert(vo);
	}
	@Override
	public MemberVO Login(MemberVO vo) {
		return map.Login(vo);
	}
	@Override
	public int checkId(String mId) {
		return map.checkId(mId);
	}
	@Override
	public MemberVO emailDupleCheck(MemberVO vo) {
		return map.emailDupleCheck(vo);
	}
	@Override
	public int usedPointUpdate(MemberVO vo) {
		int n = map.usedPointUpdate(vo);
		sqlSession.commit();
		return n;
	}
	@Override
	public int shippingInfoUpdate(MemberVO vo) {
		int n = map.shippingInfoUpdate(vo);
		sqlSession.commit();
	    return n;
    }
    
	public int updatePassword(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.updatePassword(vo);
	}
	@Override
	public MemberVO loginSearch(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.loginSearch(vo);
	}
}
