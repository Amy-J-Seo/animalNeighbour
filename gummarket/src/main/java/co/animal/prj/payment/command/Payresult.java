package co.animal.prj.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.payment.serviceImpl.PaymentServiceImpl;
import co.animal.prj.payment.vo.PaymentVO;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class Payresult implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		PaymentServiceImpl pDao = new PaymentServiceImpl();
		PaymentVO vo = new PaymentVO();
		
		vo.setmId(request.getParameter("buyerId"));
		vo.setsNo(Integer.valueOf(request.getParameter("sNo")));
		vo.setProductId(request.getParameter("productId"));
		vo.setPayAmount(Integer.valueOf(request.getParameter("payAmount")));
		vo.setPayConfirmNum(Integer.valueOf(request.getParameter("payConfirmNum")));
		int n =pDao.paymentInsert(vo);
		System.out.println(n +"건 입력 페이리저트 자바");
		
		SalesServiceImpl sDao = new SalesServiceImpl();
		SalesVO sVo = new SalesVO();
		
		sVo.setsNo(Integer.valueOf(request.getParameter("sNo")));
		int u = sDao.salesDelete(sVo);
		System.out.println(u +"건 세일즈리스트에서 지움. payresult.java");
		
		
		return null;
	}

}
