package co.animal.prj.comments.command;

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
import co.animal.prj.comments.vo.CommentsVO;


@WebServlet("/NECommentInsertServlet")
public class NECommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public NECommentInsertServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json;charset=utf-8");
		
		request.setCharacterEncoding("utf-8");
		CommentsService comDao = new CommentsServiceImpl();
		CommentsVO vo = new CommentsVO();
		HttpSession session = request.getSession();
				
		vo.setCmId(String.valueOf(session.getAttribute("mId")));
		vo.setcType(request.getParameter("cType"));
		vo.setcMainNum(Integer.valueOf(request.getParameter("cMainNum")));
		vo.setcContents(request.getParameter("cContent"));
		comDao.neCommentsInsert(vo);
		
		request.setAttribute("bNo", vo.getcMainNum());
		
		
		try {
			Gson gson = new GsonBuilder().create();
			response.getWriter().print(gson.toJson(vo));
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}

}
