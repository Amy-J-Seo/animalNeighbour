package co.animal.prj.comments.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.comments.serviceImpl.CommentsServiceImpl;
import co.animal.prj.comments.vo.CommentsVO;

@WebServlet("/DeleteFhCommentServlet")
public class DeleteFhCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteFhCommentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cNo = Integer.valueOf(request.getParameter("cNo"));
		
		CommentsServiceImpl commDao = new CommentsServiceImpl();
		CommentsVO vo = new CommentsVO();
		
		vo.setcNo(cNo);
		commDao.fhCommentsDelete(vo);
	}

}
