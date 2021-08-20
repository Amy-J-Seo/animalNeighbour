package co.animal.prj.csc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.csc.serviceImpl.CscServiceImpl;
import co.animal.prj.csc.vo.CscVO;

public class CsItemUpdateForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO csc update
		CscServiceImpl cscDao = new CscServiceImpl();
		CscVO vo = new CscVO();
		
		vo.setCsNo(Integer.valueOf(request.getParameter("csNo")));
		
		request.setAttribute("csc", cscDao.cscSelect(vo));
		
		return "csc/cscUpdateForm";
	}

}
