package co.animal.prj.payment.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.payment.serviceImpl.PaymentServiceImpl;
import co.animal.prj.payment.vo.PaymentVO;

@WebServlet("/ConfirmPurchaseServlet")
public class ConfirmPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConfirmPurchaseServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int pNo = Integer.valueOf(request.getParameter("pNo"));
		String confirm = request.getParameter("confirmPurchase");
		PaymentVO vo = new PaymentVO();
		
		vo.setpNo(pNo);
		vo.setConfirmPurchase(confirm);
		PaymentServiceImpl pDao = new PaymentServiceImpl();
		pDao.confirmPurchase(vo);		
		
	}

}
