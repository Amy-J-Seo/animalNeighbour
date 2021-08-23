package co.animal.prj.answer.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.answer.serviceImpl.AnswerServiceImpl;
import co.animal.prj.answer.vo.AnswerVO;
import co.animal.prj.comments.serviceImpl.CommentsServiceImpl;
import co.animal.prj.csc.serviceImpl.CscServiceImpl;
import co.animal.prj.csc.vo.CscVO;
import co.animal.prj.sales.vo.SalesVO;


@WebServlet("/DeleteAnswerServ")
public class DeleteAnswerServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteAnswerServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int csNo = Integer.valueOf(request.getParameter("csNo"));
		
		AnswerServiceImpl answerDao = new AnswerServiceImpl();
		AnswerVO vo = new AnswerVO();
		
		vo.setCsNo(csNo);
		System.out.println(vo.getCsNo());
		System.out.println(answerDao.answerDelete(vo));
		
		//삭제하고 답변중으로 바꾸기
		CscServiceImpl cDao = new CscServiceImpl();
		CscVO cVo = new CscVO();
		cVo.setCsNo(vo.getCsNo());
		cDao.answerDeleteUpdate(cVo);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
