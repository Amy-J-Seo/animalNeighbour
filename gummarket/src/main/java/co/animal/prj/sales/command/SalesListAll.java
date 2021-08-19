package co.animal.prj.sales.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animal.prj.common.Command;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;

public class SalesListAll implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 그냥 전체 상품 다 조회
		
		SalesService serviceDao = new SalesServiceImpl();
		
		String path="";
		HttpSession session = request.getSession();
		String role = String.valueOf(session.getAttribute("role"));
		//세션정보 가져와서 어드민->총 거래 테이블 리스트로 보내기..
		if( role.equals("ADMIN")) {
			request.setAttribute("list", serviceDao.salesSelectList());
			path="admin/totalSalesTableView";
		}else {
			//세션이 유저일 경우 -> 세일 메인페이지
			request.setAttribute("list", serviceDao.salesSelectList());
			path="sales/salesListAll";
		}
		return path;
	}

}
