package co.animal.prj.sales.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;

public class FindFood implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		SalesService serviceDao = new SalesServiceImpl();
		
		request.setAttribute("list", serviceDao.findFood());
		return "sales/findFood";	}

}
