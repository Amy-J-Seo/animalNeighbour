package co.animal.prj.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;

public class ReturnItem implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String message = request.getParameter("returnMsg");
		String returnItemPNo = request.getParameter("returnItemPNo");
		
		request.setAttribute("message", message);
		request.setAttribute("pNo", returnItemPNo);
		return "csc/cscInsertForm";
	}

}
