package co.animal.prj.offerhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.offerhelp.serviceImpl.OfferHelpServiceImpl;
import co.animal.prj.offerhelp.vo.OfferHelpVO;

public class OhItemUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//actual ohItem delete
		OfferHelpServiceImpl ohDao = new OfferHelpServiceImpl();
		OfferHelpVO vo = new OfferHelpVO();
		
		
		String selectedItem = request.getParameter("ohNo");
		
		int ohNo = Integer.valueOf(selectedItem);
		vo.setOhNo(ohNo);
		vo.setOhCategory(request.getParameter("ohCategory"));
		vo.setOhTitle(request.getParameter("ohTitle"));
		vo.setOhAddress(request.getParameter("ohAddress"));
		vo.setOhCharacter(request.getParameter("ohCharacter"));
		vo.setOhDetails(request.getParameter("ohDetails"));
		
		int n = ohDao.offerHelpUpdate(vo);
		
		String path = "";
		if (n !=0) {
			
			request.setAttribute("item", ohDao.offerHelpSelect(vo));
			path = "offerhelp/ohItemDetail";
		}else {
			request.setAttribute("message","오류가 발생했습니다. 다시 시도해 주세요.");
			path = "home/error";
		}
		return path;
	}

}
