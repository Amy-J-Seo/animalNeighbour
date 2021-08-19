package co.animal.prj.lost.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.lost.serviceImpl.LostServiceImpl;
import co.animal.prj.lost.vo.LostVO;

public class LostDetail implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		LostServiceImpl dao = new LostServiceImpl();
		LostVO vo = new LostVO();
		
		String selectedNo = request.getParameter("lNo");
		System.out.println(selectedNo);
		int lNo=Integer.parseInt(selectedNo);
		vo.setlNo(lNo);
		System.out.println(vo.getlNo());
		request.setAttribute("item", dao.lostSelect(vo));
		
		return "lost/lostDetail";
	}

}
