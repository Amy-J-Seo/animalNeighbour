package co.animal.prj.offerhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.offerhelp.serviceImpl.OfferHelpServiceImpl;
import co.animal.prj.offerhelp.vo.OfferHelpVO;

public class OhDetail implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		OfferHelpServiceImpl dao = new OfferHelpServiceImpl();
		OfferHelpVO vo = new OfferHelpVO();
		
		String selectdeNo = request.getParameter("ohNo");
		int ohNo=Integer.parseInt(selectdeNo);
		vo.setOhNo(ohNo);
		System.out.println(vo.getOhNo());
		request.setAttribute("item", dao.offerHelpSelect(vo));
		
		return "offerhelp/ohItemDetail";
	}

}
