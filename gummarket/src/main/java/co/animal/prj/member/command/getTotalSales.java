package co.animal.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class getTotalSales implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		SalesServiceImpl sDao = new SalesServiceImpl();
		SalesVO vo = new SalesVO();
		vo.setmId(request.getParameter("mIdForTotalS"));
		
		request.setAttribute("list", sDao.salesListByMember(vo));
		System.out.println(sDao.salesListByMember(vo).toString()+"getTOtalsales java");
		return "admin/totalSalesTableView";
	}

}
