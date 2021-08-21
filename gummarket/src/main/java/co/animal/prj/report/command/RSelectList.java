package co.animal.prj.report.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.report.serviceImpl.ReportServiceImpl;

public class RSelectList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		ReportServiceImpl rDao = new ReportServiceImpl();

		request.setAttribute("list", rDao.reportSelectList());
		
		return "admin/totalReportTableView";
	}

}
