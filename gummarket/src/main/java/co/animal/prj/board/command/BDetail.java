package co.animal.prj.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.board.serviceImpl.BoardServiceImpl;
import co.animal.prj.board.vo.BoardVO;
import co.animal.prj.common.Command;

public class BDetail implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardServiceImpl bDao = new BoardServiceImpl();
		BoardVO vo = new BoardVO();
		
		String selectedNo =request.getParameter("bNo");
		int bNo=Integer.parseInt(selectedNo);
		vo.setbNo(bNo);
		
		request.setAttribute("item", bDao.boardSelect(vo));
		
		return "noticeEvent/bItemDetail";
	}

}
