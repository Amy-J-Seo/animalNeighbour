package co.animal.prj.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class Login implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();

		HttpSession session = request.getSession();
		vo.setmId(request.getParameter("mId"));
		vo.setPassword(request.getParameter("password"));
		vo = dao.Login(vo);
		System.out.println(vo.getNickname()+vo.getmId()+vo.getRole());
		String page = "";
		if (vo.getNickname() != null) {
			session.setAttribute("nickname", vo.getNickname());
			session.setAttribute("mId", vo.getmId());
			session.setAttribute("role", vo.getRole());
			session.setAttribute("session", vo);
			page = "home/home";
		} else {
			String message = "존재하지 않는 아이디 혹은 비밀번호가 틀렸습니다.";
			request.setAttribute("message", message);
			page = "home/loginError.jsp";
		}
		return page;
	}

}
