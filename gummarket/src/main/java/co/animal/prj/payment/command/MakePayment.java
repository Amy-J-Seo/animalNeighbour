package co.animal.prj.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animal.prj.common.Command;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class MakePayment implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberServiceImpl mDao = new MemberServiceImpl();
		SalesServiceImpl sDao = new SalesServiceImpl();
		
		MemberVO mVo = new MemberVO();
		SalesVO sVo = new SalesVO();
		
		HttpSession session = request.getSession();
		
		mVo.setmId(String.valueOf(session.getAttribute("mId")));
		sVo.setsNo(Integer.parseInt(request.getParameter("saleNo")));
		
		mVo = mDao.memberSelect(mVo);
		sVo = sDao.salesOne(sVo);
		
		
		request.setAttribute("member", mVo);
		request.setAttribute("sale", sVo);
		
		return "payment/paymentPage";
	}

}
