package co.animal.prj.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;
import lombok.Setter;

public class RegisterCheck implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberService dao =new MemberServiceImpl();
		MemberVO vo =new MemberVO();
		vo.setmId(request.getParameter("mId"));
		vo.setPassword(request.getParameter("password"));
		vo.setmName(request.getParameter("mName"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setPhone(request.getParameter("phone"));
		vo.setEmail(request.getParameter("email"));
		vo.setPetInfo(request.getParameter("petInfo"));
		vo.setAddress(request.getParameter("address"));
		System.out.println(vo.getNickname() + "스팟1");
		int result = dao.memberInsert(vo);
		System.out.println(vo);
		String page= "";
		if(result !=0) {
			page="login/registerCheck";
			request.setAttribute("member", vo.getNickname());
		}
		return page;
	}

}
