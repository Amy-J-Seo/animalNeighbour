package co.animal.prj.board.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.board.serviceImpl.BoardServiceImpl;
import co.animal.prj.board.vo.BoardVO;


@WebServlet("/BUpdateLikeServlet")
public class BUpdateLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BUpdateLikeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int bNo = Integer.valueOf(request.getParameter("mainNo"));
		System.out.println(request.getParameter("mainNo"));
		
		BoardVO vo = new BoardVO();
		vo.setbNo(bNo);
		
		BoardServiceImpl bDao = new BoardServiceImpl();
		int n =bDao.bUpdateLike(vo);
		System.out.println(n);
	}

}
