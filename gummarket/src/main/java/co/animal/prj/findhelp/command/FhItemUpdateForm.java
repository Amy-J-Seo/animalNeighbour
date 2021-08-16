package co.animal.prj.findhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;

public class FhItemUpdateForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//findHelp one item main 글 수정
		FindHelpServiceImpl fhDao = new FindHelpServiceImpl();
		FindHelpVO vo = new FindHelpVO();
		int fhNo = Integer.valueOf(request.getParameter("fhNo"));
		vo.setFhNo(fhNo);
		
		
		vo =fhDao.findHelpSelect(vo);
		request.setAttribute("itemToUpdate", vo);
		// 여기서 게시글 셀렉트 하고
		// 그걸 리퀘스트.셋 어트리뷰트 해서 리스트 
		return "findhelp/fhEditForm";
	}

}
