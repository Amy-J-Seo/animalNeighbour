package co.animal.prj.findhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;

public class FindHelpMain implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		FindHelpServiceImpl dao= new FindHelpServiceImpl();
		request.setAttribute("list", dao.findHelpSelectList());
		//System.out.println(dao.findHelpSelectList());
		return "findhelp/fhMain";
	}

}
