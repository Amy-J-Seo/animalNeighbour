package co.animal.prj.offerhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.offerhelp.serviceImpl.OfferHelpServiceImpl;
import co.animal.prj.offerhelp.vo.OfferHelpVO;

public class OhItemUpdateForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//offerHelp one item main 글 수정
		OfferHelpServiceImpl ohDao = new OfferHelpServiceImpl();
		OfferHelpVO vo = new OfferHelpVO();
		int ohNo =Integer.valueOf(request.getParameter("ohNo"));
		vo.setOhNo(ohNo);
		
		
		vo = ohDao.offerHelpSelect(vo);
		request.setAttribute("itemToUpdate", vo);
		// 여기서 게시글 셀렉트 하고
		// 그걸 리퀘스트.셋 어트리뷰트 해서 리스트 
		return "offerhelp/ohEditForm";
	}

}
