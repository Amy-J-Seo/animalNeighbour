package co.animal.prj.csc.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animal.prj.common.Command;
import co.animal.prj.csc.serviceImpl.CscServiceImpl;
import co.animal.prj.csc.vo.CscVO;

public class CsItemDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO delete
		CscServiceImpl cscDao = new CscServiceImpl();
		CscVO vo = new CscVO();
		
		vo.setCsNo(Integer.valueOf(request.getParameter("csNo")));
		cscDao.cscDelete(vo);
		
		HttpSession session = request.getSession();
		
		vo.setmId((String)session.getAttribute("mId"));
		
		List<CscVO> list = cscDao.cscMyList(vo);
		
		String status = "";
		
		for(int i=0; i<list.size(); i++) {
			status = list.get(i).getCsStatus();
			if (status.equals("n")) {
				list.get(i).setCsStatus("답변중");
			}else {
				list.get(i).setCsStatus("답변완료");
			}
		}
		
		
		request.setAttribute("list", list);
		
		return "csc/myCscList";
	}

}
