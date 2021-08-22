package co.animal.prj.lost.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.lost.serviceImpl.LostServiceImpl;
import co.animal.prj.lost.vo.LostVO;

public class LostItemUpdateForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//lost one item main 글 수정
		LostServiceImpl lostDao = new LostServiceImpl();
		LostVO vo = new LostVO();
		int lNo =Integer.valueOf(request.getParameter("lNo"));
		vo.setlNo(lNo);
		
		
		vo=lostDao.lostSelect(vo);
		request.setAttribute("itemToUpdate", vo);
		
		return "lost/lostEditForm";
	}

}
