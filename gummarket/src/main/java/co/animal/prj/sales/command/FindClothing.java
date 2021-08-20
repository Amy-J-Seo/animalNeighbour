package co.animal.prj.sales.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;

public class FindClothing implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 의류 카테고리 들고오기
		SalesService serviceDao = new SalesServiceImpl();
		
		request.setAttribute("list", serviceDao.findClothing());
		return "sales/findClothing";
	} 

}
