package co.animal.prj.report.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;
import co.animal.prj.offerhelp.serviceImpl.OfferHelpServiceImpl;
import co.animal.prj.offerhelp.vo.OfferHelpVO;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class GetMainPost implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String category = request.getParameter("category");
		int mainNo = Integer.valueOf(request.getParameter("mainNo"));
		
		String path="";
		
		if(category.equals("findhelp")) {
			FindHelpServiceImpl fhDao = new FindHelpServiceImpl();
			FindHelpVO fhVo = new FindHelpVO();
		
			HttpSession session = request.getSession();
			
			MemberServiceImpl mDao = new MemberServiceImpl();
			MemberVO mVo = new MemberVO();
			mVo.setmId((String) session.getAttribute("mId"));
			fhVo.setFhNo(mainNo);
			
			request.setAttribute("item", fhDao.findHelpSelect(fhVo));
			request.setAttribute("member", mDao.memberSelect(mVo));
			path="findhelp/fhItemDetail";
		
		}else if(category.equals("sales")) {
			SalesService salesDao = new SalesServiceImpl();
			
			SalesVO sVo = new SalesVO();
			
			sVo.setsNo(mainNo);
			
			List<SalesVO> list = new ArrayList<SalesVO>();
			list = salesDao.salesSelect(sVo);
			
			request.setAttribute("list", list);
			
			path= "sales/salesDetail";
		}else {
			OfferHelpServiceImpl ohDao = new OfferHelpServiceImpl();
			OfferHelpVO ohVo = new OfferHelpVO();
		
			ohVo.setOhNo(mainNo);
			
			request.setAttribute("item", ohDao.offerHelpSelect(ohVo));
			
			path= "offerhelp/ohItemDetail";
		}

		return path;
	}

}
