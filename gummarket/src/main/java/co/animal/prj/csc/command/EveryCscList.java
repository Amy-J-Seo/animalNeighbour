package co.animal.prj.csc.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.csc.serviceImpl.CscServiceImpl;
import co.animal.prj.csc.vo.CscVO;

public class EveryCscList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO csc 전체보기!
		CscServiceImpl cscDao = new CscServiceImpl();
		
		List<CscVO> list= cscDao.cscSelectList();
		
		
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
