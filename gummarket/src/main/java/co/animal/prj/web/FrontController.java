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

import co.animal.prj.admin.command.AdminMain;
import co.animal.prj.command.Home;
import co.animal.prj.comments.command.CommentInsert;
import co.animal.prj.common.Command;
import co.animal.prj.csc.command.CsItemDelete;
import co.animal.prj.csc.command.CsItemUpdateForm;
import co.animal.prj.csc.command.CsUpdate;
import co.animal.prj.csc.command.CscForm;
import co.animal.prj.csc.command.CscInsert;
import co.animal.prj.csc.command.EveryCscList;
import co.animal.prj.csc.command.MyCscDetail;
import co.animal.prj.csc.command.MyCscList;
import co.animal.prj.findhelp.address.command.FindBusan;
import co.animal.prj.findhelp.address.command.FindChungCheong;
import co.animal.prj.findhelp.address.command.FindDeagu;
import co.animal.prj.findhelp.address.command.FindDeajeon;
import co.animal.prj.findhelp.address.command.FindGangWon;
import co.animal.prj.findhelp.address.command.FindGwangju;
import co.animal.prj.findhelp.address.command.FindGyeongGi;
import co.animal.prj.findhelp.address.command.FindGyeongSang;
import co.animal.prj.findhelp.address.command.FindIncheon;
import co.animal.prj.findhelp.address.command.FindJeju;
import co.animal.prj.findhelp.address.command.FindJeolla;
import co.animal.prj.findhelp.address.command.FindSeoul;
import co.animal.prj.findhelp.address.command.FindUlsan;
import co.animal.prj.login.command.IdCheckForm;
import co.animal.prj.login.command.IdCheckPro;
import co.animal.prj.login.command.Login;
import co.animal.prj.login.command.LoginForm;
import co.animal.prj.login.command.Logout;
import co.animal.prj.login.command.RegisterCheck;
import co.animal.prj.login.command.RegisterForm;

import co.animal.prj.login.command.SearchId;
import co.animal.prj.login.command.SearchIdForm;
import co.animal.prj.login.command.SearchPass;
import co.animal.prj.login.command.SearchPassForm;
import co.animal.prj.login.command.SearchPassUp;

import co.animal.prj.member.command.MemberCheck;
import co.animal.prj.member.command.MemberDetail;
import co.animal.prj.member.command.MemberList;
import co.animal.prj.member.command.MemberSelect;
import co.animal.prj.member.command.MemberUpdate;
import co.animal.prj.member.command.RequestAuthEmail;
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

import co.animal.prj.sales.command.KeywordSearchSales;

import co.animal.prj.sales.command.FindClothing;
import co.animal.prj.sales.command.FindEtc;
import co.animal.prj.sales.command.FindFood;
import co.animal.prj.sales.command.FindShare;

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
		//?????? ???
		map.put("/home.do", new Home());//???????????? ??????
		map.put("/loginForm.do", new LoginForm()); //????????? ???
		map.put("/login.do",new Login());//????????? ???
		map.put("/logout.do",new Logout());//????????????
		map.put("/registerForm.do", new RegisterForm());//????????????
		map.put("/idCheckForm.do", new IdCheckForm());//????????? ?????? ?????? ???
		map.put("/idCheckPro.do", new IdCheckPro());//????????? ?????? ??????
		map.put("/searchIdForm.do", new SearchIdForm());
		map.put("/searchId.do", new SearchId()); //????????? ??????
		map.put("/searchPassForm.do",new SearchPassForm()); //?????????????????? ???
		map.put("/searchPassUp.do", new SearchPassUp()); // ??? ???????????? ??????
		map.put("/searchPass.do", new SearchPass()); //??????????????????
		map.put("/registerCheck.do", new RegisterCheck());//??????????????????
		map.put("/withdrawalForm.do", new WithdrawalForm());//???????????????
		map.put("/withdrawal.do", new Withdrawal());//??????????????????
		
		
		map.put("/memberList.do",new MemberList()); //????????? ???????????????
		map.put("/memberDetail.do",new MemberDetail()); //????????? ?????? ????????????
		map.put("/memberUpdate.do", new MemberUpdate()); //????????? ?????? ????????????
		map.put("/userUpdate.do",new UserUpdate());		//?????? ???????????????
		map.put("/memberCheck.do", new MemberCheck());	//?????? ?????? ????????????
		map.put("/memberSelect.do", new MemberSelect()); //?????? ?????????????????? (???????????????. ?????????????????? ?????? ???+????????? ????????????)
		map.put("/requestAuthEmail.do",new RequestAuthEmail()); //???????????????
		
		
		
		map.put("/test.do", new Test());

		//?????? ???
		map.put("/salesListAll.do", new SalesListAll()); //?????? ?????? ??????
		map.put("/salesSelect.do", new SalesSelect());//?????? ?????? ??????
		map.put("/deleteSales.do", new DeleteSales());//?????? ??? ??????
		map.put("/updateSalesForm.do", new UpdateSales());//?????? ??? ???????????? ?????????
		map.put("/salesUpdate.do", new SalesUpdate());
		map.put("/salesInsertForm.do", new SalesInsertForm());//??? ?????? ???
		map.put("/salesInsert.do", new SalesInsert());//??? ??????
		
		map.put("/commentInsert.do", new CommentInsert());//?????? ??????
		
		//???????????????
		map.put("/findClothing.do", new FindClothing());
		map.put("/findFood.do", new FindFood());
		map.put("/findEtc.do", new FindEtc());
		map.put("/findShare.do", new FindShare());
	
		//csc
		map.put("/myCscList.do", new MyCscList()); //????????? - ??? ?????? ??????
		map.put("/cscForm.do", new CscForm()); // csc?????????
		map.put("/cscInsert.do", new CscInsert());//csc ??????
		map.put("/myCscDetail.do", new MyCscDetail());//csc????????????
		map.put("/csItemUpdateForm.do", new CsItemUpdateForm());//csc update
		map.put("/csUpdate.do", new CsUpdate());
		map.put("/csItemDelete.do", new CsItemDelete());
		map.put("/everyCscList.do", new EveryCscList());//???????????? ?????? ?????? ?????????
		
		//???????????? frontController admin?????? ????????? ??????????????? ?????????..!
		map.put("/adminMain.do", new AdminMain());
		
		//?????? ???????????? ????????? ?????????
		map.put("/findDeagu.do", new FindDeagu());
		map.put("/findSeoul.do", new FindSeoul());
		map.put("/findIncheon.do", new FindIncheon());
		map.put("/findBusan.do", new FindBusan());
		map.put("/findDeajeon.do", new FindDeajeon());
		map.put("/findGwangju.do", new FindGwangju());
		map.put("/findGyeongSang.do", new FindGyeongSang());
		map.put("/findChungCheong.do", new FindChungCheong());
		map.put("/findJeolla.do", new FindJeolla());
		map.put("/findGyeongGi.do", new FindGyeongGi());
		map.put("/findGangWon.do", new FindGangWon());
		map.put("/findUlsan.do", new FindUlsan());
		map.put("/findJeju.do", new FindJeju());
	
		
		
		//?????? ????????? ???????????? ??????
		map.put("/KeywordSearchSales.do", new KeywordSearchSales());
		
		//?????? ??? offerhelp
		map.put("/offerHelpMain.do", new OfferHelpMain());
		map.put("/ohDetail.do", new OhDetail());
		map.put("/writeOHForm.do", new WriteOHForm());
		map.put("/offerHelpInsert.do", new OfferHelpInsert());
		map.put("/ohItemUpdate.do", new OhItemUpdate());
		map.put("/ohItemUpdateForm.do", new OhItemUpdateForm());
		map.put("/ohItemDelete.do", new OhItemDelete());
		map.put("/ohItemDetail.do", new OhDetail());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());
		System.out.println("PATH:: " + path);
		Command command = map.get(path);
		System.out.println("COMMAND :::" + command);
		
		String viewPage = command.execute(request, response);
		
		if(viewPage.equals("json"))
			return;

		// making view resolve..
		if (!viewPage.endsWith(".do")) { // home.do
			if (!viewPage.endsWith(".jsp")) { // use tiles
				viewPage = viewPage + ".tiles"; // home/home
			} else { // ????????? ???????????????
				viewPage = "/WEB-INF/views/" + viewPage; // home/home.jsp no tiles and use jsp
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
