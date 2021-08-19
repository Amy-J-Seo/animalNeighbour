package co.animal.prj.member.service;

import java.util.List;

import co.animal.prj.member.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> memberSelectList();
	public MemberVO memberSelect(MemberVO vo);
	public int memberUpdate(MemberVO vo);
	public int memberDelete(MemberVO vo);
	public int memberInsert(MemberVO vo);
	public MemberVO Login(MemberVO vo);
	public int checkId(String mId);
	public String emailDupleCheck(String inputEmail);
}
