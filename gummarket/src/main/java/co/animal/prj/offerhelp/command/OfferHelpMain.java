package co.animal.prj.offerhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.offerhelp.serviceImpl.OfferHelpServiceImpl;

public class OfferHelpMain implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		OfferHelpServiceImpl dao = new OfferHelpServiceImpl();
		request.setAttribute("list", dao.offerHelpSelectList());
		
		return "offerhelp/ohMain";
	}

}
