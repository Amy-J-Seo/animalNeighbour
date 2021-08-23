package co.animal.prj.findhelp.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;

public class GetTotalFindHelp implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		FindHelpServiceImpl fhDao = new FindHelpServiceImpl();
		FindHelpVO vo = new FindHelpVO();
		
		String mId = request.getParameter("mIdForTotalFH");
		vo.setmId(mId);
		
		List<FindHelpVO> list = new ArrayList<FindHelpVO>();
		list =fhDao.findHelpSelectListByMember(vo);
		
		String path="";
		if(!(list.isEmpty())) {
		request.setAttribute("list", list);
		path="admin/totalFHTableView";
		}else {
			request.setAttribute("message", "작성한 도움찾기 글이 없습니다~~");
			path="admin/totalFHTableView";
		}
		return path;
	}

}
