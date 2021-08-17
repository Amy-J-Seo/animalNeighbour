package co.animal.prj.member.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class MemberDetail implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberService dao =new MemberServiceImpl();
		MemberVO vo =new MemberVO();
		vo.setmId(request.getParameter("mId"));
		request.setAttribute("list", dao.memberSelect(vo));
		
		return "member/memberDetail";
	}

}
