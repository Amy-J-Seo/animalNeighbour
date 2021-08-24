package co.animal.prj.answer.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.answer.serviceImpl.AnswerServiceImpl;
import co.animal.prj.answer.vo.AnswerVO;
import co.animal.prj.comments.serviceImpl.CommentsServiceImpl;
import co.animal.prj.comments.vo.CommentsVO;


@WebServlet("/UpdateAnswerServ")
public class UpdateAnswerServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateAnswerServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json;charset=utf-8");
		AnswerServiceImpl ansDao = new AnswerServiceImpl();	
		AnswerVO vo = new AnswerVO();
		
		vo.setaNo(Integer.valueOf(request.getParameter("aNo")));
		vo.setaContents(request.getParameter("aContents"));
		vo.setaTitle(request.getParameter("aTitle"));
		System.out.println(vo.toString());
		
		System.out.println(ansDao.answerUpdate(vo));;
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(vo)); 
	}

}
