package co.animal.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class WithdrawalForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberVO vo =new MemberVO();
		MemberService dao = new MemberServiceImpl();
		vo.setmId(request.getParameter("mId"));
		System.out.println(vo.getmId()+"님 회원삭제");
//		String mId=vo.getmId();
//		request.setAttribute("list", mId);
		request.setAttribute("list", dao.memberSelect(vo));
		
		return "member/withdrawalForm";
	}

}
