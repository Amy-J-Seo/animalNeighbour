package co.animal.prj.comments.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.animal.prj.comments.service.CommentsService;
import co.animal.prj.comments.serviceImpl.CommentsServiceImpl;
import co.animal.prj.comments.vo.CommentsVO;
import co.animal.prj.common.Command;

public class CommentInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 댓글 등록하기
		
		CommentsService comDao = new CommentsServiceImpl();
		CommentsVO vo = new CommentsVO();
		
		HttpSession session = request.getSession();
		
		vo.setmId((String)session.getAttribute("mId"));
		vo.setcMainNum(Integer.valueOf(request.getParameter("cMainNum")));
		vo.setcContents(request.getParameter("cContent"));
		
		comDao.commentsInsert(vo);
		System.out.println(vo.getcContents()+ vo.getcMainNum() +vo.getmId());
		
		return "sales/salesDetail";
	}

}
