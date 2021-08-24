package co.animal.prj.member.command;

import java.util.ArrayList;
import java.util.List;

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
		
		
		MemberVO mVo =new MemberVO();
		MemberService mDao = new MemberServiceImpl();
		String mId = request.getParameter("mId");
		mVo.setmId(mId);
		PaymentServiceImpl pDao = new PaymentServiceImpl();
		PaymentVO pVo = new PaymentVO();
		pVo.setmId(mId);
		
		List<PaymentVO> list = new ArrayList<PaymentVO>();
		
		request.setAttribute("member", mDao.memberSelect(mVo));
		
		list = pDao.memberPaymentSelectList(pVo);
		
		request.setAttribute("list", list );
		
		return "member/memberMyPage";
	}

}
