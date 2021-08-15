package co.animal.prj.findhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;

public class FindHelpInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		FindHelpServiceImpl dao= new FindHelpServiceImpl();
		FindHelpVO vo = new FindHelpVO();
		
		String writerId =request.getParameter("mId");
		
		
		vo.setmId(writerId);
		vo.setFhCategory(request.getParameter("fhCategory"));
		vo.setFhTitle(request.getParameter("fhTitle"));
		vo.setFhAnimal(request.getParameter("fhAnimal"));
		vo.setFhSize(request.getParameter("fhSize"));
		vo.setFhAge(Integer.valueOf(request.getParameter("fhAge")));
		vo.setFhCharacter(request.getParameter("fhCharacter"));
		vo.setFhNeed(request.getParameter("fhNeed"));
		vo.setFhHow(request.getParameter("fhHow"));
		System.out.println(vo +"FindHelpInsert Java vo print");
			
		int n = dao.findHelpInsert(vo);
		System.out.println(n + "item added successfully + FindHelpInsert.java");
//		------insert finished---------
		
		
//		-----get fhNo of inserted Item and return to detailed page------
		dao= new FindHelpServiceImpl();
		request.setAttribute("list", dao.findHelpSelectList());
		
		return "findhelp/fhMain";
	}

}
