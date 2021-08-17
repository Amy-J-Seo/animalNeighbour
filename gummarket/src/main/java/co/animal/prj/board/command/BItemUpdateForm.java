package co.animal.prj.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.board.serviceImpl.BoardServiceImpl;
import co.animal.prj.board.vo.BoardVO;
import co.animal.prj.common.Command;

public class BItemUpdateForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		BoardServiceImpl bDao = new BoardServiceImpl();
		BoardVO vo = new BoardVO();
		
		int bNo = Integer.valueOf(request.getParameter("bNo"));
		vo.setbNo(bNo);
		
		vo=bDao.boardSelect(vo);
		request.setAttribute("itemToUpdate", vo);
		
		
		return "noticeEvent/boardEditForm";
	}

}
