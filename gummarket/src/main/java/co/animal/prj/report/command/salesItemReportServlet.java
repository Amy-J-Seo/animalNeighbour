package co.animal.prj.report.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.report.serviceImpl.ReportServiceImpl;
import co.animal.prj.report.vo.ReportVO;


@WebServlet("/salesItemReportServlet")
public class salesItemReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public salesItemReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");

		request.setCharacterEncoding("utf-8");
		
		String category = request.getParameter("category");
		String rWhy = request.getParameter("rWhy");
		int sNo = Integer.valueOf(request.getParameter("sNo"));
		
		ReportVO vo = new ReportVO();
		vo.setCategory(category);
		vo.setrWhy(rWhy);
		vo.setMainNo(sNo);
		
		System.out.println(vo.toString());
		
		ReportServiceImpl rDao = new ReportServiceImpl();
		rDao.reportInsert(vo);
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(vo));
	}

}
