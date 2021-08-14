package co.animal.prj.sales.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class salesSelect implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		SalesService salesDao = new SalesServiceImpl();
		SalesVO vo = new SalesVO();
		
		vo.setmId(request.getParameter("sNo"));
		request.setAttribute("list", salesDao.salesSelect(vo));
		
		return "test/salesSelectTest";
	
	}

}