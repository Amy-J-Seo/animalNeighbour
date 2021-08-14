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

import co.animal.prj.command.Home;
import co.animal.prj.common.Command;
import co.animal.prj.findhelp.command.FhDetail;
import co.animal.prj.findhelp.command.FhTest;
import co.animal.prj.findhelp.command.FindHelpMain;
import co.animal.prj.login.command.Login;
import co.animal.prj.login.command.LoginForm;
import co.animal.prj.member.command.RegisterForm;
import co.animal.prj.member.command.Test;
import co.animal.prj.sales.command.DeleteSales;
import co.animal.prj.sales.command.SalesSelect;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		//
		map.put("/home.do", new Home());//인기상품 조회
		map.put("/loginForm.do", new LoginForm());
		map.put("/login.do",new Login());
		map.put("/registerForm.do", new RegisterForm());
		
		map.put("/test.do", new Test());

		//인영 맵
		map.put("/salesSelect.do", new SalesSelect());//상품 단건 조회
		map.put("/deleteSales.do", new DeleteSales());//상품 글 삭제

		
		
		
		//주윤 맵
		map.put("/fhtest.do", new FhTest());
		map.put("/findHelpMain.do", new FindHelpMain());
		map.put("/fhDetail.do", new FhDetail());
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
		if (!viewPage.endsWith(".do")) { // home.do
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
