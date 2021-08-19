package co.animal.prj.lost.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.lost.serviceImpl.LostServiceImpl;
import co.animal.prj.lost.vo.LostVO;

public class LostItemUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		LostServiceImpl lostDao = new LostServiceImpl();
		LostVO vo = new LostVO();
		
		
		String selectedItem = request.getParameter("lNo");
		
		int lNo = Integer.valueOf(selectedItem);
		vo.setlNo(lNo);
		vo.setlTitle(request.getParameter("lTitle"));
		vo.setlName(request.getParameter("lName"));
		vo.setlGender(request.getParameter("lGender"));
		vo.setlWhen(request.getParameter("lWhen"));
		vo.setlWhere(request.getParameter("lWhere"));
		
		int n = lostDao.lostUpdate(vo);
		
		String path = "";
		if (n !=0) {
			
			request.setAttribute("item", lostDao.lostSelect(vo));
			path = "lost/lostItemDetail";
		}else {
			request.setAttribute("message", "오류가 발생했습니다. 다시 시도해 주세요.");
			path = "home/error";
		}
		
		return path;
	}

}
