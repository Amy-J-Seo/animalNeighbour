package co.animal.prj.offerhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.totalcare.serviceImpl.TotalCareServiceImpl;

public class TotalCareTableViewW implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		TotalCareServiceImpl tDao = new TotalCareServiceImpl();
		
		request.setAttribute("list", tDao.totalCareSelectList());	
		return "admin/totalCareTableViewW";
	}

}
