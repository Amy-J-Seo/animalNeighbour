package co.animal.prj.board.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.board.serviceImpl.BoardServiceImpl;
import co.animal.prj.board.vo.BoardVO;
import co.animal.prj.common.Command;

public class BItemDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardServiceImpl bDao = new BoardServiceImpl();
		BoardVO vo = new BoardVO();
		
		int bNo = Integer.valueOf(request.getParameter("bNo"));
		vo.setbNo(bNo);
		//bIsOn values = n : new, o : old, f: finished, d: deleted
		vo.setbIsOn("d"); 
		int n = bDao.boardDelete(vo);
		System.out.println(n + " item delted BitemDelete.java");
		//===============delete done==========
		
		String path="";
		String cat = request.getParameter("bCategory");
		bDao=new BoardServiceImpl();
		if( cat == "event") {
			System.out.println(cat);
			List <BoardVO> list = new ArrayList<BoardVO>();
			list =  bDao.boardSelectListEvent();
			System.out.println(list);
//			request.setAttribute("list", bDao.boardSelectListEvent());
			path="noticeEvent/eventMain";
		}else {
			System.out.println(cat);
			request.setAttribute("list", bDao.boardSelectListNotice());
			path="noticeEvent/noticeMain";
		}
	
		return path;
	}

}
