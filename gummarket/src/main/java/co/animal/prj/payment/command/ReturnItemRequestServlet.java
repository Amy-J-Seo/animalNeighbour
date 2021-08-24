package co.animal.prj.payment.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.payment.serviceImpl.PaymentServiceImpl;
import co.animal.prj.payment.vo.PaymentVO;

@WebServlet("/ReturnItemRequestServlet")
public class ReturnItemRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReturnItemRequestServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      	 //멤버마이페이지에서 반품 모달 반품 버튼 누르면 테이블에 confirmpurchase칼럼 업데이트
      	PaymentServiceImpl pDao = new PaymentServiceImpl();
      	PaymentVO vo = new PaymentVO();
		
		int pNo = Integer.valueOf(request.getParameter("pNo"));
		String confirmP = request.getParameter("confirmPurchase");
		
		vo.setpNo(pNo);
		vo.setConfirmPurchase(confirmP);
		System.out.println(vo.toString() +"  returnItemRequestServ");
		pDao.confirmPurchase(vo);
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(pNo));
	}

}
