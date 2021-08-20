package co.animal.prj.csc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animal.prj.common.Command;
import co.animal.prj.csc.serviceImpl.CscServiceImpl;
import co.animal.prj.csc.vo.CscVO;

public class CscInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		CscServiceImpl cscDao = new CscServiceImpl();
		CscVO vo = new CscVO();
		HttpSession session = request.getSession();
		vo.setmId((String)session.getAttribute("mId"));
		vo.setCsContents(request.getParameter("csContents"));
		vo.setCsTitle(request.getParameter("csTitle"));
		
		int no = cscDao.cscInsert(vo);
		System.out.println(no);
		//입력된거 가져와서 바로 디테일 페이지로!
		vo.setCsNo(no);
		request.setAttribute("csc", cscDao.cscSelect(vo));
		
		return "csc/myCscDetail";
	}

}
