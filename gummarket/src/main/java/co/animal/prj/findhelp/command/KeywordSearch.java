package co.animal.prj.findhelp.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.board.serviceImpl.BoardServiceImpl;
import co.animal.prj.board.vo.BoardVO;
import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;

public class KeywordSearch implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		
		String path="";
		String keyword = request.getParameter("keyWord");
		String category = request.getParameter("category");
		
		if(category.equals("findhelp")) {
			FindHelpServiceImpl fDao = new FindHelpServiceImpl();
			FindHelpVO vo = new FindHelpVO();
			List<FindHelpVO> list = new ArrayList<FindHelpVO>();
			vo.setFhTitle(keyword);
			list = fDao.findHelpSelectListByKeyWord(vo);
			
			if(!(list.isEmpty())) {
				request.setAttribute("list", list);
				path= "findhelp/fhMain";
			}else {
				request.setAttribute("message", "그런 제목의 글은 없어요... 다시 검색해 주세요.");
				path= "findhelp/fhMain";
			}
		} else {
			BoardServiceImpl bDao = new BoardServiceImpl();
			BoardVO bVo = new BoardVO();
			List<BoardVO> list = new ArrayList<BoardVO>();
			bVo.setbTitle(keyword);
			bVo.setbCategory(category);
			list = bDao.boardSelectListByKeyWord(bVo);
			if(!(list.isEmpty())) {
				request.setAttribute("list", list);
				path="noticeEvent/eventMain";
			}else {
				request.setAttribute("message", "그런 제목의 글은 없어요... 다시 검색해 주세요.");
				path="noticeEvent/eventMain";
			}
					
		}
		
		
		return path;
	}
}
