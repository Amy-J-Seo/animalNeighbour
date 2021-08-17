package co.animal.prj.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.board.serviceImpl.BoardServiceImpl;
import co.animal.prj.board.vo.BoardVO;
import co.animal.prj.common.Command;

public class BoardUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BoardServiceImpl bDao = new BoardServiceImpl();
		BoardVO vo = new BoardVO();
		
		String selectedItem = request.getParameter("bNo");
		int bNo = Integer.valueOf(selectedItem);
		vo.setbNo(bNo);
		vo.setbCategory(request.getParameter("bCategory"));
		vo.setbTitle(request.getParameter("bTitle"));
		vo.setbContents(request.getParameter("bContents"));
		
		int n = bDao.boardUpdate(vo);
		
		String path ="";
		if(n!=0) {
			request.setAttribute("item", bDao.boardSelect(vo));
			path="noticeEvent/bItemDetail";
		}else {
			request.setAttribute("message", "오류가 발생했습니다. 다시 시도해 주세요.");
			path = "home/error";
		}
		
		return path;
	}

}
