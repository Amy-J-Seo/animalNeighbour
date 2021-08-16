package co.animal.prj.findhelp.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;

@WebServlet("/GetLikeNoServlet")
public class GetLikeNoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public GetLikeNoServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");

		request.setCharacterEncoding("utf-8");
		
		int fhNo = Integer.valueOf(request.getParameter("no"));

		FindHelpVO vo = new FindHelpVO();
		vo.setFhNo(fhNo);
		
		FindHelpServiceImpl fhDao = new FindHelpServiceImpl();
		vo= fhDao.findHelpLike(vo);
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(vo));
	}

}
