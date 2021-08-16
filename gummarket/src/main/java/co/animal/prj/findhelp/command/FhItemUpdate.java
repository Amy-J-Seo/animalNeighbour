package co.animal.prj.findhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;

public class FhItemUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//actual fhItem delete
		FindHelpServiceImpl fhDao = new FindHelpServiceImpl();
		FindHelpVO vo = new FindHelpVO();
		
		
		String selectedItem = request.getParameter("fhNo");
				
		int fhNo = Integer.valueOf(selectedItem);
		vo.setFhNo(fhNo);
		vo.setFhCategory(request.getParameter("fhCategory"));
		vo.setFhTitle(request.getParameter("fhTitle"));
		vo.setFhNeed(request.getParameter("fhNeed"));
		vo.setFhCharacter(request.getParameter("fhCharacter"));		
		vo.setFhHow(request.getParameter("fhHow"));	
		
		int n = fhDao.findHelpUpdate(vo);
	
		
		String path = "";
		if (n != 0) {
			
			request.setAttribute("item", fhDao.findHelpSelect(vo));
			path = "findhelp/fhItemDetail";
		} else {
			request.setAttribute("message", "오류가 발생했습니다. 다시 시도해 주세요.");
			path = "home/error";
		}
		return path;
	}

}
