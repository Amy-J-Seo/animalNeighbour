package co.animal.prj.payment.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

@WebServlet("/UpdateShippingInfoServlet")
public class UpdateShippingInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateShippingInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberServiceImpl mDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();

		String mId = request.getParameter("mId");
		System.out.println(mId);
		String shippingRequest =request.getParameter("shippingInfo");
		
		vo.setmId(mId);
		vo.setShippingInfo(shippingRequest);
		
		System.out.println(vo.toString() +"       updateShipping servlet");

		int n = mDao.shippingInfoUpdate(vo);
		System.out.println(n +"건 업데이트 처리 완료");
		
		
		
	}

}
