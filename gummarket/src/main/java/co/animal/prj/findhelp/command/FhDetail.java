package co.animal.prj.findhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;

public class FhDetail implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		FindHelpServiceImpl dao= new FindHelpServiceImpl();
		FindHelpVO vo = new FindHelpVO();
		
		String selectedNo =request.getParameter("fhNo");
		int fhNo=Integer.parseInt(selectedNo);
		vo.setFhNo(fhNo);
		System.out.println(vo.getFhNo());
		request.setAttribute("item", dao.findHelpSelect(vo));
		
		return "findhelp/fhItemDetail";
	}

}
