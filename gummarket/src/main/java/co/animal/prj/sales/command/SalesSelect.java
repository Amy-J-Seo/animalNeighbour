package co.animal.prj.sales.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class SalesSelect implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 상품 디테일페이지 + 안에 댓글도 가져오기.
		SalesService salesDao = new SalesServiceImpl();
		
		SalesVO vo = new SalesVO();
		
		vo.setsNo(Integer.valueOf(request.getParameter("sNo")));
		
		int sHit = Integer.valueOf(request.getParameter("sHit"));
		vo.setsHit(sHit);
		salesDao.hitUpdate(vo);
		
		List<SalesVO> list = new ArrayList<SalesVO>();
		list = salesDao.salesSelect(vo);
		

		request.setAttribute("list", list);
		
		return "sales/salesDetail";
	
	}

}