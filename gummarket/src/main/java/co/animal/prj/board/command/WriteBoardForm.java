package co.animal.prj.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;

public class WriteBoardForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "noticeEvent/writeBoardForm";
	}

}
