package co.animal.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class MemberSelect implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberService dao =new MemberServiceImpl();
		MemberVO vo =new MemberVO();
		vo.setmId(request.getParameter("mId"));
		vo.setPassword(request.getParameter("password"));
		vo =dao.Login(vo);
		String page="";
		
		if(vo != null) {
			request.setAttribute("list", dao.memberSelect(vo));
			page="member/memberSelect";
		}else {
		String message="비밀번호를 정확하게 입력해 주세요.";
		page="member/memberCheck";
		request.setAttribute("message", message);
		
		}
		return page;
	}

}
