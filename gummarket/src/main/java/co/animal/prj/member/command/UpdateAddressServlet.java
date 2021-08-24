package co.animal.prj.member.command;

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

@WebServlet("/UpdateAddressServlet")
public class UpdateAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateAddressServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json;charset=utf-8");

		request.setCharacterEncoding("utf-8");
	
		MemberServiceImpl mDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		String address ="";
		address= request.getParameter("address1");
		address+=" ";
		address+=request.getParameter("address2");
		address+=" ";
		address+=request.getParameter("address3");
		
		vo.setAddress(address);
		vo.setmId(request.getParameter("memberMId"));
		mDao.updateAddress(vo);
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(vo));
	}

}
