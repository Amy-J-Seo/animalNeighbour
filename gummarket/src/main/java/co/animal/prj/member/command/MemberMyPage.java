package co.animal.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.service.MemberService;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;
import co.animal.prj.payment.serviceImpl.PaymentServiceImpl;
import co.animal.prj.payment.vo.PaymentVO;

public class MemberMyPage implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		MemberVO mVo =new MemberVO();
		MemberService mDao = new MemberServiceImpl();
		mVo.setmId(mId);
		
		PaymentServiceImpl pDao = new PaymentServiceImpl();
		PaymentVO pVo = new PaymentVO();
		pVo.setmId(mId);
		
		
		request.setAttribute("member", mDao.memberSelect(mVo));
		
		return "member/memberMyPage";
	}

}
