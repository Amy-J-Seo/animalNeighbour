package co.animal.prj.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.payment.serviceImpl.PaymentServiceImpl;
import co.animal.prj.payment.vo.PaymentVO;

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
		
		return null;
	}

}
