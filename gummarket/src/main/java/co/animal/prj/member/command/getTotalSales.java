package co.animal.prj.member.command;

import java.util.ArrayList;
import java.util.List;

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
		
		List<SalesVO> list = new ArrayList<SalesVO>();
		list = sDao.salesListByMember(vo);

		String path="";
		if(!(list == null)) {
			request.setAttribute("list", list);
			path ="admin/totalSalesTableView";
		}else {
			request.setAttribute("message", "작성한 판매 글이 없습니다~~");
			path="admin/totalSalesTableView";
		}
		return path;
	}

}
