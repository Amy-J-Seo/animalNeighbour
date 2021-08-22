package co.animal.prj.offerhelp.command;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.offerhelp.serviceImpl.OfferHelpServiceImpl;
import co.animal.prj.offerhelp.vo.OfferHelpVO;

public class GetTotalOfferHelp implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		OfferHelpServiceImpl ofDao = new OfferHelpServiceImpl();
		OfferHelpVO vo = new OfferHelpVO();
		
		vo.setmId(request.getParameter("mIdForTotalOH"));
		
		List<OfferHelpVO> list = new ArrayList<OfferHelpVO>();
		list =  ofDao.offerHelpSelectListByMember(vo);

		String path="";
		if(!(list == null)) {
			request.setAttribute("list", list);
			path= "admin/totalOHTableView";
		}else {
			request.setAttribute("message", "작성한 도움주기 글이 없습니다~~");
			path="admin/totalOHTableView";
		}
		return path;
	}

}
