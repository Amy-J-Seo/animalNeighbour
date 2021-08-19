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
		
		String page = "";
		String state ="ON";
		
		if (vo.getmId() !=null){
			
			System.out.println(vo.getNickname()+vo.getmId()+vo.getRole() +"  Login.java");
			
			session.setAttribute("nickname", vo.getNickname());
			session.setAttribute("mId", vo.getmId());
			session.setAttribute("role", vo.getRole());
			session.setAttribute("state", vo.getState());
			session.setAttribute("session", vo);
			
			if(session.getAttribute("state").equals(state)) {
				
				System.out.println(state +"Login.java");
			
				if(session.getAttribute("role").equals("ADMIN")) {
					page = "admin/adminMain";
				}else {
					page = "home.do";					
				}
			
			}else {
				String message ="현재 휴면계정입니다. 관리자에게 문의하세요";
				System.out.println(message +"  Login.java");
				session.invalidate(); // 세션 삭제
				request.setAttribute("message", message);
				page="login/loginForm";
			}
		}
		
		else{
			String message = "존재하지 않는 아이디 혹은 비밀번호가 틀렸습니다.";
			System.out.println(message);
			request.setAttribute("message", message);
			page = "login/loginForm";
		}
		return page;
	}

}
