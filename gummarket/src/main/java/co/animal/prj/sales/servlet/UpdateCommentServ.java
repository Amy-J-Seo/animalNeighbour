package co.animal.prj.sales.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.comments.serviceImpl.CommentsServiceImpl;
import co.animal.prj.comments.vo.CommentsVO;

@WebServlet("/UpdateCommentServ")
public class UpdateCommentServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateCommentServ() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO 댓글 수정하기
		
		response.setContentType("text/json;charset=utf-8");
		
		CommentsServiceImpl comDao = new CommentsServiceImpl();
		CommentsVO vo  = new CommentsVO();
		
		vo.setcNo(Integer.valueOf(request.getParameter("cNo")));
		
		comDao.commentsUpdate(vo);
//		
//		String page ="";
//		if(r !=0) {
//			page="";
//		}
		
	}

}
