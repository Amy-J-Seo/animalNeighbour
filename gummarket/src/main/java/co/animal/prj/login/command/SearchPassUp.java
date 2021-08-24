package co.animal.prj.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class SearchPassUp implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberVO vo =new MemberVO();
		MemberService dao= new MemberServiceImpl();
		String name=request.getParameter("mName");
		vo.setmName(name);
		vo.setEmail(request.getParameter("email"));
		vo.setPassword(request.getParameter("password"));
		 int u=dao.updatePassword(vo);
		String page="";
		if(u != 0) {
			request.setAttribute("message", name+"님의 비밀번호를 성공적으로 수정했습니다.");
			page="loginForm.do";
		}else {
			request.setAttribute("message", "예상치 못한 오류가 발생했습니다. 잠시후 시도해주세요");
			page="loginForm.do";
		}
		return page;
	}

}
