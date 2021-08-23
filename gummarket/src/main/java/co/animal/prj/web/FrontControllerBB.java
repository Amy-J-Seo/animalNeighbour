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
import co.animal.prj.board.command.BItemDelete;
import co.animal.prj.board.command.BItemUpdateForm;
import co.animal.prj.board.command.BoardDetail;
import co.animal.prj.board.command.BoardInsert;
import co.animal.prj.board.command.BoardUpdate;
import co.animal.prj.board.command.EventMain;
import co.animal.prj.board.command.NoticeMain;
import co.animal.prj.board.command.SearchNoticeItem;
import co.animal.prj.board.command.TotalEventTable;
import co.animal.prj.board.command.WriteBoardForm;
import co.animal.prj.common.Command;
import co.animal.prj.findhelp.command.FhDetail;
import co.animal.prj.findhelp.command.FhItemDelete;
import co.animal.prj.findhelp.command.FhItemUpdate;
import co.animal.prj.findhelp.command.FhItemUpdateForm;
import co.animal.prj.findhelp.command.FhTest;
import co.animal.prj.findhelp.command.FindHelpInsert;
import co.animal.prj.findhelp.command.FindHelpMain;
import co.animal.prj.findhelp.command.GetTotalFindHelp;
import co.animal.prj.findhelp.command.KeywordSearch;
import co.animal.prj.findhelp.command.TotalCareTableView;
import co.animal.prj.findhelp.command.WriteFHForm;
import co.animal.prj.member.command.MemberMyPage;
import co.animal.prj.member.command.getTotalSales;
import co.animal.prj.offerhelp.command.GetTotalOfferHelp;
import co.animal.prj.payment.command.MakePayment;
import co.animal.prj.payment.command.Payresult;
import co.animal.prj.payment.command.ReturnItem;
import co.animal.prj.payment.command.ToPayResult;
import co.animal.prj.report.command.GetMainPost;
import co.animal.prj.report.command.GetTotalReports;
import co.animal.prj.report.command.RSelectList;




@WebServlet("*.doBB")
public class FrontControllerBB extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontControllerBB() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
			
		//주윤 맵 findHelp
		map.put("/findHelpMain.doBB", new FindHelpMain());
		map.put("/fhtest.doBB", new FhTest());
		map.put("/fhDetail.doBB", new FhDetail());
		map.put("/writeFHForm.doBB", new WriteFHForm());
		map.put("/findHelpInsert.doBB", new FindHelpInsert());
		map.put("/fhItemUpdate.doBB", new FhItemUpdate());
		map.put("/fhItemUpdateForm.doBB", new FhItemUpdateForm());
		map.put("/fhItemDelete.doBB", new FhItemDelete());
		map.put("/keywordSearch.doBB", new KeywordSearch());
		
		//주윤 맵 이벤트+노티스
		map.put("/eventMain.doBB", new EventMain());
		map.put("/noticeMain.doBB", new NoticeMain());
		map.put("/writeBoardForm.doBB", new WriteBoardForm());
		map.put("/boardInsert.doBB", new BoardInsert());
		map.put("/bDetail.doBB",new BoardDetail());
		map.put("/bItemDelete.doBB", new BItemDelete());
		map.put("/bItemUpdateForm.doBB", new BItemUpdateForm());
		map.put("/boardUpdate.doBB", new BoardUpdate());
		map.put("/searchNoticeItem.doBB", new SearchNoticeItem());
		
		//주윤 맵 관리자 메인페이지 + 이벤트/공지사항 등
		map.put("/adminMain.doBB", new AdminMain());
		map.put("/totalEventTable.doBB", new TotalEventTable()); //전체이벤트테이블
		map.put("/rSelectList.doBB", new RSelectList()); //전체 신고리스트
		map.put("/getMainPost.doBB", new GetMainPost()); //신고 메인글 가기
		map.put("/totalCareTableView.doBB", new TotalCareTableView()); //전체 도움주고받기 테이블 뷰 ..
		
		//주윤 유저 마이페이지
		map.put("/memberMyPage.doBB", new MemberMyPage());
		map.put("/getTotalSales.doBB", new getTotalSales());
		map.put("/getTotalReports.doBB", new GetTotalReports());
		map.put("/getTotalFindHelp.doBB", new GetTotalFindHelp());
		map.put("/getTotalOfferHelp.doBB", new GetTotalOfferHelp());
		map.put("/returnItem.doBB", new ReturnItem()); //상품반품신청 -> csc로
		
		//주윤 거래아이템 결제 페이지
		map.put("/makePayment.doBB", new MakePayment());
		map.put("/payresult.doBB", new Payresult());
		map.put("/toPayResult.doBB", new ToPayResult());
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
