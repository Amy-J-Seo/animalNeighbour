package co.animal.prj.sales.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animal.prj.common.Command;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class salesInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 상품 입력하기~
		SalesService salesDao = new SalesServiceImpl();
		SalesVO vo = new SalesVO();
		
		HttpSession session = request.getSession();
		
		System.out.println(session.getAttribute("mId"));
		
		vo.setsTitle(request.getParameter("stitle"));
		vo.setmId(String.valueOf(session.getAttribute("mId"))); 
		vo.setsCategory(request.getParameter("scategory"));
		vo.setsPurchasedDate(Date.valueOf(request.getParameter("spurchasedate")));
		vo.setsUseDays(Integer.valueOf(request.getParameter("susedays")));
		vo.setsPrice(Integer.valueOf(request.getParameter("sprice")));
		vo.setsNetPrice(Integer.valueOf(request.getParameter("snetprice")));
		vo.setsReason(request.getParameter("sreason"));
		vo.setsCondition(request.getParameter("scondition"));
		
		String page ="";
		
		int n = salesDao.salesInsert(vo);
		
		if( n !=0) {
			request.setAttribute("rptitle", vo.getsTitle());
			request.setAttribute("message", "글이 등록 되었습니다. 사진을 입력하시겠습니까?");
			page="sales/salesPhotoInsertForm";
		}else {
			page="Test/ErrorPage";
		}
		
		return page;
	}

}
