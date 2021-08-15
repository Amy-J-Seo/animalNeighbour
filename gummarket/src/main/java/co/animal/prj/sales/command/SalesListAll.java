package co.animal.prj.sales.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;

public class SalesListAll implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 그냥 전체 상품 다 조회
		
		SalesService serviceDao = new SalesServiceImpl();

		request.setAttribute("list", serviceDao.salesSelectList());
		
		
		return "sales/salesListAll";
	}

}
