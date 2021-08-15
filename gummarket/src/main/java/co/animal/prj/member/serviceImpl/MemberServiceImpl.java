package co.animal.prj.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.common.DataSource;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.service.MemberServiceMapper;
import co.animal.prj.member.vo.MemberVO;

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
}
