package co.animal.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class Test implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberServiceImpl dao= new MemberServiceImpl();
		request.setAttribute("list", dao.memberSelectList());
		return "Test/test";
	}

}
