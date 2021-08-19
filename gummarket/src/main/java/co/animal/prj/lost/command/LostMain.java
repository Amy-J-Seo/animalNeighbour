package co.animal.prj.lost.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.lost.serviceImpl.LostServiceImpl;

public class LostMain implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		LostServiceImpl dao = new LostServiceImpl();
		request.setAttribute("list", dao.lostSelectList());
		
		return "lost/lostMain";
	}

}
