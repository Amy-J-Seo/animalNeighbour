package co.animal.prj.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;

public class IdCheckPro implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberService dao =new MemberServiceImpl();
		String mId =request.getParameter("mId");
		int result =dao.checkId(mId);
		
		request.setAttribute("cnt", result);
		
		return "login/idCheckPro";
	}

}
