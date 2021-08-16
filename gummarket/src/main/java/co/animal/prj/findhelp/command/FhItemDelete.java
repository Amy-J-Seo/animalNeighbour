package co.animal.prj.findhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;

public class FhItemDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		FindHelpServiceImpl fhDao = new FindHelpServiceImpl();
		FindHelpVO vo = new FindHelpVO();
		int fhNo = Integer.valueOf(request.getParameter("fhNo"));
		vo.setFhNo(fhNo);
		vo.setFhHide("h");
		
		fhDao.findHelpDelete(vo);
		
		request.setAttribute("list", fhDao.findHelpSelectList());
		return "findhelp/fhMain";
	}

}
