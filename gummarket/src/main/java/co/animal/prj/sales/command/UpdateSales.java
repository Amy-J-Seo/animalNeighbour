package co.animal.prj.sales.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class UpdateSales implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO salesDetail페이지에서 글 수정
		SalesService salesDao = new SalesServiceImpl();
		SalesVO vo = new SalesVO();
		
		int sNo = Integer.valueOf(request.getParameter("sNo"));
		vo.setsNo(sNo);
		
		vo = salesDao.salesOne(vo);
		request.setAttribute("update", vo);	
		
		return "sales/updateSales";
	}

}
