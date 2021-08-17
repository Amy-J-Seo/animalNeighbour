package co.animal.prj.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.board.serviceImpl.BoardServiceImpl;
import co.animal.prj.common.Command;

public class EventMain implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardServiceImpl bDao = new BoardServiceImpl();
		request.setAttribute("list", bDao.boardSelectListEvent());
		
		
		System.out.println(bDao.boardSelectListEvent()+ " eventMain.java");
		return "noticeEvent/eventMain";
		
	}

}
