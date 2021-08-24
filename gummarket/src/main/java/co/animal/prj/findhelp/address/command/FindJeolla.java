package co.animal.prj.findhelp.address.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;

public class FindJeolla implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		FindHelpServiceImpl dao= new FindHelpServiceImpl();
		request.setAttribute("list", dao.findJeolla());
		return "findhelp/fhJeolla";
	}

}
