package co.animal.prj.member.command;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;
import co.animal.prj.offerhelp.serviceImpl.OfferHelpServiceImpl;
import co.animal.prj.offerhelp.vo.OfferHelpVO;
import co.animal.prj.report.serviceImpl.ReportServiceImpl;
import co.animal.prj.report.vo.ReportVO;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

@WebServlet("/GetTotalNumbersServlet")
public class GetTotalNumbersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetTotalNumbersServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		String mId = request.getParameter("mId");

		SalesServiceImpl sDao = new SalesServiceImpl();
		SalesVO sVo = new SalesVO();
		sVo.setmId(mId);
		int salesNo = sDao.memberTotalS(sVo);
		
		ReportServiceImpl rDao = new ReportServiceImpl();
		ReportVO rVo = new ReportVO();
		rVo.setmId(mId);
		int reportNo = rDao.memberTotalR(rVo);

		FindHelpServiceImpl fhDao = new FindHelpServiceImpl();
		FindHelpVO fhVo = new FindHelpVO();
		fhVo.setmId(mId);
		int findhelpNo = fhDao.memberTotalfh(fhVo);
		
		OfferHelpServiceImpl ohDao = new OfferHelpServiceImpl();
		OfferHelpVO ohVo = new OfferHelpVO();
		ohVo.setmId(mId);
		int offerhelpNo = ohDao.memberTotalOh(ohVo);
				
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("salesNo", salesNo);
		map.put("reportNo", reportNo);
		map.put("fhNo", findhelpNo);
		map.put("ohNo", offerhelpNo);
		
		
		 Gson gson = new GsonBuilder().create();
		 response.getWriter().print(gson.toJson(map));
		
		
	}

}
