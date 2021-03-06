package co.animal.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class Withdrawal implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		String after = request.getParameter("password");
		vo.setmId(request.getParameter("mId"));
		vo= dao.memberSelect(vo);
		
		String page = "";
		if (vo.getPassword().equals(after)) {
		
		vo.setmName(request.getParameter("mName"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setAddress(request.getParameter("address"));
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

			System.out.println(vo.getState()+"회원탈퇴");
			
			if (n != 0) {
				HttpSession session = request.getSession();
				session.invalidate(); // 세션 삭제
				String message = "그동안 저희 개껌마켓을 사랑해주셔서 진심으로 감사드립니다.";
				request.setAttribute("message", message);
				page = "login/loginForm";
			} else {
				String message = "오류가 발생했습니다. 잠시 후에 시도해주세요.";
				request.setAttribute("message", message);
				page = "member/memberCheck";
			}

		} else {
			String message = "비밀번호가 정확하지 않습니다.";
			request.setAttribute("message", message);
			page = "member/memberCheck";
		}
		return page;
	}

}
