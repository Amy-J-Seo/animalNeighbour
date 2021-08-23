package co.animal.prj.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.board.service.BoardService;
import co.animal.prj.board.serviceImpl.BoardServiceImpl;
import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.report.serviceImpl.ReportServiceImpl;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;

public class AdminMain implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		//인영
		//1.멤버 수 가져오기
		MemberServiceImpl memDao = new MemberServiceImpl();
		request.setAttribute("memberNum", memDao.memberNum());
		
		//2. 리포트 수 가져오기 
		ReportServiceImpl reqDao = new ReportServiceImpl();
		request.setAttribute("reportNum", reqDao.reportNum());
		
		//3.sales수
		SalesServiceImpl salDao = new SalesServiceImpl();
		request.setAttribute("sales", salDao.salesNum());
		
		//4. 멍냥케어 게시글 수 
		FindHelpServiceImpl fhDao = new FindHelpServiceImpl();
		request.setAttribute("care", fhDao.careNum());
		
		
		//5. 이벤트 게시글 수 
		BoardService bDao = new BoardServiceImpl();
		request.setAttribute("event", bDao.eventNum());
		
		//6. 공지사항 게시글 수 
		request.setAttribute("notice", bDao.noticeNum());
		
		return "admin/adminMain";
	}

}
