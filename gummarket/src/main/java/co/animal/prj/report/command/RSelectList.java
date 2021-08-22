package co.animal.prj.report.command;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.report.serviceImpl.ReportServiceImpl;
import co.animal.prj.report.vo.ReportVO;

public class RSelectList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		ReportServiceImpl rDao = new ReportServiceImpl();
		
		List<ReportVO> list = new ArrayList<ReportVO>();
		list = rDao.reportSelectList();

		String path ="";
		if(!(list == null)) {
			request.setAttribute("list",list);
			path="admin/totalReportTableView";
		} else {
			request.setAttribute("message", "신고된 글이 없습니다~~");
			path="admin/totalReportTableView";
		}
		
		return path;
	}

}
