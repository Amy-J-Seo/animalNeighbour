package co.animal.prj.findhelp.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;

public class KeywordSearch implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		FindHelpServiceImpl fDao = new FindHelpServiceImpl();
		FindHelpVO vo = new FindHelpVO();
		List<FindHelpVO> list = new ArrayList<FindHelpVO>();
		
		String keyword = request.getParameter("keyWord");
		vo.setFhTitle(keyword);
		
		list = fDao.findHelpSelectListByKeyWord(vo);
		
		request.setAttribute("list", list);
		return "findhelp/fhMain";
	}
}
