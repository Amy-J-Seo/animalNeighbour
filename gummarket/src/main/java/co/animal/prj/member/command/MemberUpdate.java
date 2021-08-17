package co.animal.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class MemberUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setmId(request.getParameter("mId"));
		vo.setmName(request.getParameter("mName"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setAddress(request.getParameter("address"));
		vo.setPhone(request.getParameter("phone"));
		vo.setPetInfo(request.getParameter("petInfo"));
		vo.setReviewPoint(Integer.valueOf(request.getParameter("reviewPoint")));
		vo.setRole(request.getParameter("role"));
		vo.setState(request.getParameter("state"));
		vo.setPassword(request.getParameter("password"));
		vo.setBuyPoint(Integer.valueOf(request.getParameter("buyPoint")));
		vo.setEmail(request.getParameter("email"));
		int n =dao.memberUpdate(vo);
		
		String page="";
		if(n !=0) {
			page="memberList.do";
		}else {
			page="Test/ErrorPage";
		}
		return page;
	}

}
