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
import co.animal.prj.comments.command.CommentInsert;
import co.animal.prj.common.Command;
import co.animal.prj.csc.command.CscForm;
import co.animal.prj.csc.command.CscInsert;
import co.animal.prj.login.command.IdCheckForm;
import co.animal.prj.login.command.IdCheckPro;
import co.animal.prj.login.command.Login;
import co.animal.prj.login.command.LoginForm;
import co.animal.prj.login.command.Logout;
import co.animal.prj.login.command.RegisterCheck;
import co.animal.prj.login.command.RegisterForm;

import co.animal.prj.lost.command.LostDetail;
import co.animal.prj.lost.command.LostInsert;
import co.animal.prj.lost.command.LostItemDelete;
import co.animal.prj.lost.command.LostItemUpdate;
import co.animal.prj.lost.command.LostItemUpdateForm;
import co.animal.prj.lost.command.LostMain;
import co.animal.prj.lost.command.WritelostForm;
import co.animal.prj.member.command.MemberCheck;

import co.animal.prj.member.command.MemberDetail;
import co.animal.prj.member.command.MemberList;
import co.animal.prj.member.command.MemberSelect;
import co.animal.prj.member.command.MemberUpdate;
import co.animal.prj.member.command.RequestAuthEmail;
import co.animal.prj.member.command.SearchId;
import co.animal.prj.member.command.Test;
import co.animal.prj.member.command.UserUpdate;
import co.animal.prj.member.command.Withdrawal;
import co.animal.prj.member.command.WithdrawalForm;
import co.animal.prj.offerhelp.command.OfferHelpInsert;
import co.animal.prj.offerhelp.command.OfferHelpMain;
import co.animal.prj.offerhelp.command.OhDetail;
import co.animal.prj.offerhelp.command.OhItemDelete;
import co.animal.prj.offerhelp.command.OhItemUpdate;
import co.animal.prj.offerhelp.command.OhItemUpdateForm;
import co.animal.prj.offerhelp.command.WriteOHForm;
import co.animal.prj.sales.command.DeleteSales;
import co.animal.prj.sales.command.SalesInsert;
import co.animal.prj.sales.command.SalesInsertForm;
import co.animal.prj.sales.command.SalesListAll;
import co.animal.prj.sales.command.SalesSelect;
import co.animal.prj.sales.command.SalesUpdate;
import co.animal.prj.sales.command.UpdateSales;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		//호준 맵
		map.put("/home.do", new Home());//인기상품 조회
		map.put("/loginForm.do", new LoginForm()); //로그인 폼
		map.put("/login.do",new Login());//로그인 중
		map.put("/logout.do",new Logout());//로그아웃
		map.put("/registerForm.do", new RegisterForm());//회원가입
		map.put("/idCheckForm.do", new IdCheckForm());//아이디 중복 조회 폼
		map.put("/idCheckPro.do", new IdCheckPro());//아이디 중복 조회
		map.put("/searchId.do", new SearchId()); //아이디 비밀번호 찾기
		map.put("/registerCheck.do", new RegisterCheck());//회원가입완료
		map.put("/withdrawalForm.do", new WithdrawalForm());//회원탈퇴폼
		map.put("/withdrawal.do", new Withdrawal());//회원탈퇴완료
		
		
		map.put("/memberList.do",new MemberList()); //관리자 맴버리스트
		map.put("/memberDetail.do",new MemberDetail()); //관리자 맴버 상세보기
		map.put("/memberUpdate.do", new MemberUpdate()); //관리자 회원 정보수정
		map.put("/userUpdate.do",new UserUpdate());		//회원 수정페이지
		map.put("/memberCheck.do", new MemberCheck());	//회원 수정 비밀번호
		map.put("/memberSelect.do", new MemberSelect()); //유저 마이페이지
		map.put("/requestAuthEmail.do",new RequestAuthEmail());
		
		
		
		
		map.put("/test.do", new Test());

		//인영 맵
		map.put("/salesListAll.do", new SalesListAll()); //전체 상품 조회
		map.put("/salesSelect.do", new SalesSelect());//상품 단건 조회
		map.put("/deleteSales.do", new DeleteSales());//상품 글 삭제
		map.put("/updateSalesForm.do", new UpdateSales());//상품 글 업데이트 폼으로
		map.put("/salesUpdate.do", new SalesUpdate());
		map.put("/salesInsertForm.do", new SalesInsertForm());//글 입력 폼
		map.put("/salesInsert.do", new SalesInsert());//글 입력
		
		map.put("/commentInsert.do", new CommentInsert());//댓글 입력
		
		map.put("/cscForm.do", new CscForm()); // csc입력폼
		map.put("/cscInsert.do", new CscInsert());//csc 입력


		//제은 맵 offerhelp
		map.put("/offerHelpMain.do", new OfferHelpMain());
		map.put("/ohDetail.do", new OhDetail());
		map.put("/writeOHForm.do", new WriteOHForm());
		map.put("/offerHelpInsert.do", new OfferHelpInsert());
		map.put("/ohItemUpdate.do", new OhItemUpdate());
		map.put("/ohItemUpdateForm.do", new OhItemUpdateForm());
		map.put("/ohItemDelete.do", new OhItemDelete());
		map.put("/ohItemDetail.do", new OhDetail());

		//제은 맵 lost
		map.put("lostMain.do", new LostMain());
		map.put("/lostDetail.do", new LostDetail());
		map.put("/writelostForm.do", new WritelostForm());	
		map.put("/lostInsert.do", new LostInsert());
		map.put("/lostItemUpdate", new LostItemUpdate());
		map.put("/lostItemUpdateForm.do", new LostItemUpdateForm());
		map.put("/lostItemDelete.do", new LostItemDelete());
		
		
		
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());
		System.out.println(path);
		Command command = map.get(path);
		System.out.println(command);
		
		String viewPage = command.execute(request, response);
		
		if(viewPage.equals("json"))
			return;

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
