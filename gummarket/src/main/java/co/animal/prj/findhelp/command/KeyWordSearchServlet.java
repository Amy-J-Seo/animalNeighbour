package co.animal.prj.findhelp.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;

@WebServlet("/keyWordSerchServlet")
public class KeyWordSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public KeyWordSearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");

		request.setCharacterEncoding("utf-8");
		FindHelpServiceImpl fDao = new FindHelpServiceImpl();
		FindHelpVO vo = new FindHelpVO();
		List<FindHelpVO> list = new ArrayList<FindHelpVO>();
		
		String keyword = request.getParameter("keyWord");
		System.out.println(request.getParameter(keyword));
		vo.setFhTitle(keyword);
		list = fDao.findHelpSelectListByKeyWord(vo);
		System.out.println(list.toString() +"from keywordsearchserv");
		request.setAttribute("list", list);
		
	
	}

}
