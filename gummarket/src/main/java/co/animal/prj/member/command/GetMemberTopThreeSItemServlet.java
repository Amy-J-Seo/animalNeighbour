package co.animal.prj.member.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

@WebServlet("/GetMemberTopThreeSItemServlet")
public class GetMemberTopThreeSItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetMemberTopThreeSItemServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json;charset=utf-8");

		request.setCharacterEncoding("utf-8");

		SalesServiceImpl sDao = new SalesServiceImpl();
		SalesVO vo = new SalesVO();
		
		String mId = request.getParameter("mId");
		vo.setmId(mId);
		List<SalesVO> list = new ArrayList<SalesVO>();
		list = sDao.salesListTop3(vo);
		
		System.out.println(list);
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(list));
	}

}
