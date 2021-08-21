package co.animal.prj.report.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.report.serviceImpl.ReportServiceImpl;
import co.animal.prj.report.vo.ReportVO;

public class GetTotalReports implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ReportServiceImpl rDao = new ReportServiceImpl();
		ReportVO vo = new ReportVO();
		
		String path="";
		String mId=request.getParameter("mIdForTotalR");
		vo.setmId(mId);
		
		List<ReportVO> list = new ArrayList<ReportVO>();
		list = rDao.reportSelectListByMember(vo);
		System.out.println(list.toString() +"getTotalREport");
		
		if(!(list.isEmpty())) {
			request.setAttribute("list",list);
			path="admin/totalReportTableView";
		}else {
			request.setAttribute("message", "신고 글이 없습니다~~");
			path="admin/totalReportTableView";
		}
			
		
		return path;
	}

}
