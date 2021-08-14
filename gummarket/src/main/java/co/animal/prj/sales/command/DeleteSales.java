package co.animal.prj.sales.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class DeleteSales implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 게시글 삭제하기= shide가 y로 바뀜
		
		SalesService salesDao = new SalesServiceImpl();
		SalesVO vo = new SalesVO();
		
		vo.setsNo(Integer.valueOf(request.getParameter("sNo")));
		System.out.println("넘어온 번호는"+vo.getsNo());
		int n = salesDao.salesDelete(vo);
		String page ="";
		
		if(n !=0) {
			page ="home.do";
		} else {
			 page="Test/ErrorPage";
		}
		
		return page;
		
	}

}
