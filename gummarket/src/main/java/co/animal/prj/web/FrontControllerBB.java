package co.animal.prj.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.command.FhDetail;
import co.animal.prj.findhelp.command.FhItemDelete;
import co.animal.prj.findhelp.command.FhItemUpdate;
import co.animal.prj.findhelp.command.FhItemUpdateForm;
import co.animal.prj.findhelp.command.FhTest;
import co.animal.prj.findhelp.command.FindHelpInsert;
import co.animal.prj.findhelp.command.FindHelpMain;
import co.animal.prj.findhelp.command.WriteFHForm;




@WebServlet("*.doBB")
public class FrontControllerBB extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontControllerBB() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
			
		//주윤 맵
		map.put("/findHelpMain.doBB", new FindHelpMain());
		map.put("/fhtest.doBB", new FhTest());
		map.put("/fhDetail.doBB", new FhDetail());
		map.put("/writeFHForm.doBB", new WriteFHForm());
		map.put("/findHelpInsert.doBB", new FindHelpInsert());
		map.put("/fhItemUpdate.doBB", new FhItemUpdate());
		map.put("/fhItemUpdateForm.doBB", new FhItemUpdateForm());
		map.put("/fhItemDelete.doBB", new FhItemDelete());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());

		Command command = map.get(path);

		String viewPage = command.execute(request, response);

		// making view resolve..
		if (!viewPage.endsWith(".doBB")) { // home.do
			if (!viewPage.endsWith(".jsp")) { // use tiles
				viewPage = viewPage + ".tiles"; // home/home
			} else { // 타일즈 안태울거야
				viewPage = "/WEB-INF/views/" + viewPage; // home/home.jsp no tiles and use jsp
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
