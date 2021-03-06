package co.animal.prj.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class SearchPass implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo =new MemberVO();
		String auth = request.getParameter("authPass");
		if (auth == null) {

			String message = "인증에 실패했습니다. 다시시도해주세요";
			request.setAttribute("message", message);
			return "searchPassForm.do";
		} else {
			vo.setEmail(request.getParameter("email"));
			vo.setmName(request.getParameter("mName"));
			vo=dao.loginSearch(vo);
			String page="";
			if(vo !=null) {
				request.setAttribute("info", vo);
				System.out.println(vo + "이메일값 받나요?");
				page="login/searchPass";
			}else {
				request.setAttribute("message", "아이디 혹은 이메일 정보가 없습니다. 다시입력해주세요.");
				page="login/searchPassForm";
			}
			return page;
		}
	}
}
