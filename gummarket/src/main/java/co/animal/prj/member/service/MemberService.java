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
	public MemberVO emailDupleCheck(MemberVO vo);
	public int updatePassword(MemberVO vo);
	public MemberVO loginSearch(MemberVO vo);

	//주윤 결제과정 포인트사용
	public int usedPointUpdate(MemberVO vo);
	//주윤 결제과정 배송요청 업데이트
	public int shippingInfoUpdate(MemberVO vo);
}
