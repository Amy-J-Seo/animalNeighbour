package co.animal.prj.findhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

public class FhDetail implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		FindHelpServiceImpl dao= new FindHelpServiceImpl();
		FindHelpVO vo = new FindHelpVO();
		MemberServiceImpl mDao = new MemberServiceImpl();
		MemberVO mVo = new MemberVO();
		
		String selectedNo =request.getParameter("fhNo");
		String memberId = request.getParameter("mId");
		int fhNo=Integer.parseInt(selectedNo);
		vo.setFhNo(fhNo);
		mVo.setmId(memberId);
		
		request.setAttribute("item", dao.findHelpSelect(vo));
		request.setAttribute("member", mDao.memberSelect(mVo));
		return "findhelp/fhItemDetail";
	}

}
