package co.animal.prj.offerhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.offerhelp.serviceImpl.OfferHelpServiceImpl;
import co.animal.prj.offerhelp.vo.OfferHelpVO;

public class OhItemDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		OfferHelpServiceImpl ohDao = new OfferHelpServiceImpl();
		OfferHelpVO vo = new OfferHelpVO();
		int ohNo = Integer.valueOf(request.getParameter("ohDelNo"));
		vo.setOhNo(ohNo);
		vo.setOhHide("h");
		
		ohDao.offerHelpDelete(vo);
		
		request.setAttribute("list", ohDao.offerHelpSelectList());
		return "offerhelp/ohMain";
	}

}
