package co.animal.prj.sales.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;


@WebServlet("/UpdSalesLikeServlet")
public class UpdSalesLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdSalesLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int sNo = Integer.valueOf(request.getParameter("mainNo"));
		//int sLike = Integer.valueOf(request.getParameter("sLike"));
		SalesVO vo = new SalesVO();
		vo.setsNo(sNo);
		//vo.setsLike(sLike);
		
		SalesServiceImpl saDao = new SalesServiceImpl();
		
		saDao.updateLike(vo);
	}

}
