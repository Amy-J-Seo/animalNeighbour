package co.animal.prj.sales.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.image.serviceImpl.ImageServiceImpl;
import co.animal.prj.image.vo.ImageVO;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class SalesSelect implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 상품 디테일페이지 + 안에 댓글도 가져오기.
		SalesService salesDao = new SalesServiceImpl();
		ImageServiceImpl imgDao = new ImageServiceImpl();
		
		SalesVO vo = new SalesVO();
		ImageVO iVo = new ImageVO();
		
		int sHit;
		
		if(request.getAttribute("afterInsert") != null) {
			vo.setsNo((Integer) request.getAttribute("sNo"));
			iVo.setiMainNum((Integer) request.getAttribute("sNo"));
			sHit = (Integer) request.getAttribute("sHit");
		} else {
			vo.setsNo(Integer.valueOf(request.getParameter("sNo")));
			sHit = Integer.valueOf(request.getParameter("sHit"));
			iVo.setiMainNum(Integer.valueOf(request.getParameter("sNo")));
		}

		
		
		vo.setsHit(sHit);
		salesDao.hitUpdate(vo);
		
		List<SalesVO> list = new ArrayList<SalesVO>();
		list = salesDao.salesSelect(vo);
		System.out.println(list.get(0).getcNo() + "cNo( salesSelect.do)");
		
		request.setAttribute("list", list);
		
		return "sales/salesDetail";
	
	}

}