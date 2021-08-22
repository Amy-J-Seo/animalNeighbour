package co.animal.prj.answer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.csc.serviceImpl.CscServiceImpl;
import co.animal.prj.csc.vo.CscVO;


@WebServlet("/SelectAnswerServ")
public class SelectAnswerServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectAnswerServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json;charset=utf-8");
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println(request.getParameter("csNo") + " answer csno");
		
		CscServiceImpl csDao = new CscServiceImpl();
		CscVO vo = new CscVO();
		vo.setCsNo(Integer.valueOf(request.getParameter("csNo")));
		
		//request.setAttribute("list", list);
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(csDao.cscSelect(vo))); 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
