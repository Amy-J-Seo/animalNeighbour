package co.animal.prj.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;

public class ToPayResult implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		return "payment/payResult";
	}

}
