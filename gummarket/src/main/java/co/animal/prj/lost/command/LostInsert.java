package co.animal.prj.lost.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.lost.serviceImpl.LostServiceImpl;
import co.animal.prj.lost.vo.LostVO;

public class LostInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		LostServiceImpl dao = new LostServiceImpl();
		LostVO vo = new LostVO();
		
		String writerId = request.getParameter("mId");
		
		vo.setmId(writerId);
		vo.setlTitle(request.getParameter("lTitle"));
		vo.setlName(request.getParameter("lName"));
		vo.setlGender(request.getParameter("lGender"));
		vo.setlWhen(request.getParameter("lWhen"));
		vo.setlWhere(request.getParameter("lWhere"));
		vo.setlCharacter(request.getParameter("lCharacter"));
		System.out.println(vo +"LostInsert Java vo print");
		
		int n = dao.lostInsert(vo);
		System.out.println(n+"item added successfully+LostInsert.java");
//		------insert finished---------
		
		
//		-----get lNo of inserted Item and return to detailed page------
		dao = new LostServiceImpl();
		request.setAttribute("list", dao.lostSelectList());
		
		return "lost/lostMain";
	}

}
