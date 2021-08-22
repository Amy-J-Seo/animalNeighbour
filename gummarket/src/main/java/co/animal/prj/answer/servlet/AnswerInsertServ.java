package co.animal.prj.answer.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.answer.serviceImpl.AnswerServiceImpl;
import co.animal.prj.answer.vo.AnswerVO;
import co.animal.prj.comments.service.CommentsService;
import co.animal.prj.comments.serviceImpl.CommentsServiceImpl;
import co.animal.prj.sales.vo.SalesVO;


@WebServlet("/AnswerInsertServ")
public class AnswerInsertServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AnswerInsertServ() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		AnswerServiceImpl ansDao = new AnswerServiceImpl();
		AnswerVO vo = new AnswerVO();
		
		vo.setCsNo(Integer.valueOf(request.getParameter("csNo")));
		vo.setaTitle(request.getParameter("aTitle"));
		vo.setaContents(request.getParameter("aContents"));
		
		System.out.println( vo.getaContents()+" acontents");
		
		ansDao.answerInsert(vo);
		
		//request.setAttribute("sNo", vo.getsNo());
		
		
		Gson gson = new GsonBuilder().create();
		try {
			response.getWriter().print(gson.toJson(vo));
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}

}
