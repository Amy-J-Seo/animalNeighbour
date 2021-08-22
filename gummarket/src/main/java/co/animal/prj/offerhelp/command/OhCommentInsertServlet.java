package co.animal.prj.offerhelp.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.offerhelp.service.OhCommentsService;
import co.animal.prj.offerhelp.serviceImpl.OhCommentsServiceImpl;
import co.animal.prj.offerhelp.vo.CommentsVO;


@WebServlet("/OhCommentInsertServlet")
public class OhCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public OhCommentInsertServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		
		request.setCharacterEncoding("utf-8");
		
		OhCommentsService comDao = new OhCommentsServiceImpl();
		CommentsVO vo = new CommentsVO();
		HttpSession session = request.getSession();
		
		vo.setCmId(String.valueOf(session.getAttribute("mId")));
		vo.setcMainNum(Integer.valueOf(request.getParameter("cMainNum")));
		vo.setcContents(request.getParameter("cContent"));
		comDao.ohCommentsInsert(vo);
		
		request.setAttribute("ohNo", vo.getcMainNum());
		
		try {
			Gson gson = new GsonBuilder().create();
			response.getWriter().print(gson.toJson(vo));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
