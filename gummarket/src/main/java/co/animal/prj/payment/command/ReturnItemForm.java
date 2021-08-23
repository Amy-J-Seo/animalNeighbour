package co.animal.prj.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;

public class ReturnItemForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String returnItemPNo = request.getParameter("returnItemPNo");
		String reason = request.getParameter("reason");
		
		String message = returnItemPNo + "건의 주문을 "+ reason + " 의 이유로 반품 신청합니다.";
		System.out.println(message);
		
		request.setAttribute("message", message);
		request.setAttribute("pNo", returnItemPNo);
		
		return "csc/cscInsertForm";
	}

}
