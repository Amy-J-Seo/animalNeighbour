package co.animal.prj.sales.command;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class SalesUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 폼에 넣은거 업데이트 해주기
		SalesServiceImpl salesDao = new SalesServiceImpl();
		SalesVO vo = new SalesVO();
		
		String selectItem = request.getParameter("sNo");
		int sNo = Integer.valueOf(selectItem);
		
		vo.setsNo(sNo);
		
		vo.setsTitle(request.getParameter("sTitle"));
		vo.setsCategory(request.getParameter("sCategory"));
		vo.setsReason(request.getParameter("sReason"));

		vo.setsPurchasedDate(Date.valueOf(request.getParameter("sPurchasedDate")));
		vo.setsUseDays(Integer.valueOf(request.getParameter("sUseDays")));
		vo.setsCondition(request.getParameter("sCondition"));
		vo.setsPrice(Integer.valueOf(request.getParameter("sPrice")));
		vo.setsNetPrice(Integer.valueOf(request.getParameter("sNetPrice")));
		
		int n = salesDao.salesUpdate(vo);
		
		List<SalesVO> list = new ArrayList<SalesVO>();
		list = salesDao.salesSelect(vo);
		
		String page="";
			
		if (n != 0) {
				
				request.setAttribute("list", list);
				page = "sales/salesDetail";
			} else {
				request.setAttribute("message", "오류가 발생했습니다. 다시 시도해 주세요.");
				page = "home/error";
			}
			
		//detail페이지로 성공하면
		
		return page;
	}

}
