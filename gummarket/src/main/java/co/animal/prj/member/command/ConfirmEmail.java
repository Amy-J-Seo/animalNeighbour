package co.animal.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;

public class ConfirmEmail implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//중복체크
		MemberService dao = new MemberServiceImpl();
		String email = request.getParameter("email");
		
		String result = dao.emailDupleCheck(email);
		
		request.setAttribute("emailDupleCheckResult", result);
		request.setAttribute("email", email);
		
		
		return "member/confirmEmail";
	
	}
		
}
