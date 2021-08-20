package co.animal.prj.sales.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;


@WebServlet("/SelectCommentServ")
public class SelectCommentServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SelectCommentServ() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json;charset=utf-8");
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println(request.getParameter("sNo"));
		
		SalesService salesDao = new SalesServiceImpl();
		SalesVO vo = new SalesVO();
		vo.setsNo(Integer.valueOf(request.getParameter("sNo")));
		
		
		
		List<SalesVO> list = new ArrayList<SalesVO>();
		list = salesDao.salesSelect(vo);
		
		//request.setAttribute("list", list);
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(list)); 
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}

}
