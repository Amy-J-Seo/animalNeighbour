package co.animal.prj.lost.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.lost.serviceImpl.LostServiceImpl;
import co.animal.prj.lost.vo.LostVO;

public class LostItemDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		LostServiceImpl lostDao = new LostServiceImpl();
		LostVO vo = new LostVO();
		int lNo = Integer.valueOf(request.getParameter("lNo"));
		vo.setlNo(lNo);
		vo.setlHide("h");
		
		lostDao.lostDelete(vo);
		
		request.setAttribute("list", lostDao.lostSelectList());
		return "lost/lostMain";
	}

}
