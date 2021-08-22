package co.animal.prj.offerhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.offerhelp.serviceImpl.OfferHelpServiceImpl;
import co.animal.prj.offerhelp.vo.OfferHelpVO;

public class OfferHelpInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		OfferHelpServiceImpl dao = new OfferHelpServiceImpl();
		OfferHelpVO vo = new OfferHelpVO();
		
		String writerId =request.getParameter("mId");
		
		
		vo.setmId(writerId);
		vo.setOhCategory(request.getParameter("ohCategory"));
		vo.setOhTitle(request.getParameter("ohTitle"));
		vo.setOhContents(request.getParameter("ohContents"));
		vo.setOhHistory(request.getParameter("ohHistory"));
		vo.setOhHistory(request.getParameter("ohAddress"));
		vo.setOhCharacter(request.getParameter("ohCharacter"));
		vo.setOhDetails(request.getParameter("ohDetails"));
		System.out.println(vo +"OfferHelpInsert Java vo print");
		
		int n = dao.offerHelpInsert(vo);
		System.out.println(n+"item added successfully+OfferHelpInsert.java");
//		------insert finished---------
		
		
//		-----get ohNo of inserted Item and return to detailed page------		
		dao= new OfferHelpServiceImpl();
		request.setAttribute("list", dao.offerHelpSelectList());
		
		return "offerhelp/ohMain";
	}

}
