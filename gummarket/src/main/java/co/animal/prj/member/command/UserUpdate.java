package co.animal.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class UserUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		String address="";
		address= request.getParameter("address1");
		if(address !="") {
			System.out.println(request.getParameter("address1")+"null값이 아니다.");
		address= request.getParameter("address1");
		address+=" ";
		address+=request.getParameter("address2");
		address+=" ";
		address+=request.getParameter("address3");
		vo.setAddress(address);
		}else {
		vo.setAddress(request.getParameter("address"));
		}
		vo.setmId(request.getParameter("mId"));
		vo.setmName(request.getParameter("mName"));
		vo.setNickname(request.getParameter("nickname"));
		
		
		vo.setPhone(request.getParameter("phone"));
		vo.setPetInfo(request.getParameter("petInfo"));
		vo.setReviewPoint(Integer.valueOf(request.getParameter("reviewPoint")));
		vo.setRole(request.getParameter("role"));
		vo.setState(request.getParameter("state"));
		vo.setPassword(request.getParameter("password"));
		vo.setGrade(request.getParameter("grade"));
		vo.setEmail(request.getParameter("email"));
		System.out.println(vo);
		int n = dao.memberUpdate(vo);
		System.out.println(n);
		String page = "";
		if (n != 0) {
			String message = vo.getmName() + "님의 정보를 성공적으로 수정완료했습니다.";
			request.setAttribute("message", message);
			page = "memberSelect.do";
		} else {
			String message1 ="예기치 못한 오류가 발생했습니다. 잠시후 시도해주세요.";
			request.setAttribute("message1", message1);
			page="memberSelect.do";
		}
		return page;
	}
}