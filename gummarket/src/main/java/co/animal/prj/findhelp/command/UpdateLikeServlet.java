package co.animal.prj.findhelp.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;


@WebServlet("/UpdateLikeServlet")
public class UpdateLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateLikeServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int fhNo = Integer.valueOf(request.getParameter("mainNo"));

		FindHelpVO vo = new FindHelpVO();
		vo.setFhNo(fhNo);
		
		FindHelpServiceImpl fhDao = new FindHelpServiceImpl();
		fhDao.updateLike(vo);		
		
		
	}

}
