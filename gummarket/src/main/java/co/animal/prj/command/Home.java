package co.animal.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;

public class Home implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 인기상품 리스트 보여주기
		SalesService serviceDao = new SalesServiceImpl();

		request.setAttribute("list", serviceDao.salesListTOP10());
		
		return "home/home2";
	}

}
