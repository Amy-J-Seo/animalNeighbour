package co.animal.prj.sales.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.comments.service.CommentsService;
import co.animal.prj.comments.serviceImpl.CommentsServiceImpl;
import co.animal.prj.sales.vo.SalesVO;


@WebServlet("/CommentInsertServ")
public class CommentInsertServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CommentInsertServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json;charset=utf-8");
		
		CommentsService comDao = new CommentsServiceImpl();
		SalesVO vo = new SalesVO();
		
		HttpSession session = request.getSession();
		
		vo.setsNo(Integer.valueOf(request.getParameter("cMainNum")));
		vo.setCmId(String.valueOf(session.getAttribute("mId")));
		vo.setcMainNum(Integer.valueOf(request.getParameter("cMainNum")));
		vo.setcContents(request.getParameter("cContent"));
		
		comDao.commentsInsert(vo);
		
		request.setAttribute("sNo", vo.getsNo());
		
		
		Gson gson = new GsonBuilder().create();
		try {
			response.getWriter().print(gson.toJson(vo));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

}
