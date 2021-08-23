package co.animal.prj.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class RegisterCheck implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberService dao =new MemberServiceImpl();
		MemberVO vo =new MemberVO();
		String auth= request.getParameter("authPass");
		if(auth == null) {
			
			String message="인증에 실패했습니다. 다시시도해주세요";
			request.setAttribute("message", message);
			return "login/loginForm";
					}else {
		
			
		String address ="";
		address= request.getParameter("address1");
		address+=" ";
		address+=request.getParameter("address2");
		address+=" ";
		address+=request.getParameter("address3");
		
		vo.setmId(request.getParameter("mId"));
		vo.setPassword(request.getParameter("password"));
		vo.setmName(request.getParameter("mName"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setPhone(request.getParameter("phone"));
		vo.setEmail(request.getParameter("email"));
		vo.setPetInfo(request.getParameter("petInfo"));
		vo.setAddress(address);
		
		int result = dao.memberInsert(vo);
		String page= "";
		if(result !=0) {
			String message= vo.getNickname()+"님 개껌장터에 가입하신걸 환영합니다!";
			request.setAttribute("message", message);
			page="login/loginForm";
		}else {
			String message="오류가 발생했습니다. 잠시 후에 시도해주세요.";
			request.setAttribute("message", message);
			page="login/loginForm";
		}
		return page;
	}
	}
}
