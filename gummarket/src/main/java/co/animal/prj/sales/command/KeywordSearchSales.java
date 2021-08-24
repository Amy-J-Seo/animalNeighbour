package co.animal.prj.sales.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class KeywordSearchSales implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		SalesServiceImpl sDao = new SalesServiceImpl();
		SalesVO vo = new SalesVO();
		List<SalesVO> list = new ArrayList<SalesVO>();
		
		vo.setsTitle(request.getParameter("keyWord"));
		
		list = sDao.salesSelectListByKeyWord(vo);
		
		String path="";
		
		if(!(list.isEmpty())) {
			request.setAttribute("list", list);
			path= "sales/salesListAll";
		}else {
			request.setAttribute("message", "그런 제목의 글은 없어요... 다시 검색해 주세요.");
			path= "sales/salesListAll";
		}
		
		
		return path;
	}

}
