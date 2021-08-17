package co.animal.prj.board.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.board.serviceImpl.BoardServiceImpl;
import co.animal.prj.board.vo.BoardVO;
import co.animal.prj.common.Command;

public class BoardInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardServiceImpl bDao = new BoardServiceImpl();
		BoardVO vo = new BoardVO();
		
		String writerId =request.getParameter("mId");
		
		vo.setmId(writerId);
		vo.setbCategory(request.getParameter("bCategory"));
		vo.setbDate(Date.valueOf(request.getParameter("bDate")));
		vo.setbTitle(request.getParameter("bTitle"));
		vo.setbContents(request.getParameter("bContents"));
		
		
		int n = bDao.boardInsert(vo);
		System.out.println(n + "item added successfully + BoardInsert.java");
		
//		===========================================================================
		bDao= new BoardServiceImpl();
		
		request.setAttribute("item", bDao.boardSelect(vo));
		System.out.println(vo + " + BoardInsert.java");
		
		return "noticeEvent/bItemDetail";
	}

}
