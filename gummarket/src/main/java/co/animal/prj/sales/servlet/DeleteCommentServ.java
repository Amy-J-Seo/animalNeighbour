package co.animal.prj.sales.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.comments.serviceImpl.CommentsServiceImpl;
import co.animal.prj.sales.vo.SalesVO;


@WebServlet("/DeleteCommentServ")
public class DeleteCommentServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteCommentServ() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO 댓글 삭제기능
//String itemNo = request.getParameter("itemNo");
//		
//		ShopDAO dao = new ShopDAO();
//		ShopVO vo = new ShopVO();
//		vo.setItemNo(itemNo);
//		dao.deleteItem(vo);
		
		int cNo = Integer.valueOf(request.getParameter("cNo"));
		
		CommentsServiceImpl commDao = new CommentsServiceImpl();
		SalesVO vo = new SalesVO();
		
		vo.setcNo(cNo);
		commDao.commentsDelete(vo);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
