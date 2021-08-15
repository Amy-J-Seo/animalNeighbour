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
import co.animal.prj.findhelp.command.FhTest;
import co.animal.prj.login.command.IdCheckForm;
import co.animal.prj.login.command.IdCheckPro;
import co.animal.prj.login.command.Login;
import co.animal.prj.login.command.LoginForm;
import co.animal.prj.login.command.RegisterCheck;
import co.animal.prj.member.command.RegisterForm;
import co.animal.prj.member.command.Test;
import co.animal.prj.sales.command.salesSelect;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		//
		map.put("/home.do", new Home());
		map.put("/loginForm.do", new LoginForm());
		map.put("/login.do",new Login());
		map.put("/registerForm.do", new RegisterForm());
		map.put("/idCheckForm.do", new IdCheckForm());
		map.put("/idCheckPro.do", new IdCheckPro());
		map.put("/registerCheck.do", new RegisterCheck());
		
		
		
		
		map.put("/test.do", new Test());
		map.put("/fhtest.do", new FhTest());
		map.put("/salesSelect.do", new salesSelect());
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
