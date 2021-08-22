package co.animal.prj.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class SearchId implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
			MemberService dao = new MemberServiceImpl();
			MemberVO vo =new MemberVO();
			vo.setEmail(request.getParameter("email"));
			vo.setmName(request.getParameter("mName"));
			vo=dao.loginSearch(vo);
			String page="";
			if(vo !=null) {
				request.setAttribute("message", vo);
				page="login/searchId";
			}else {
				request.setAttribute("message", "아이디 혹은 이메일 정보가 없습니다. 다시입력해주세요.");
				page="login/searchIdForm";
			}
		return page;
	}

}
