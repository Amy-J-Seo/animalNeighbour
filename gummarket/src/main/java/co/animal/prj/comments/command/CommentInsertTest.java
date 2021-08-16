package co.animal.prj.comments.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.comments.service.CommentsService;
import co.animal.prj.comments.serviceImpl.CommentsServiceImpl;
import co.animal.prj.common.Command;
import co.animal.prj.sales.vo.SalesVO;

public class CommentInsertTest implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 댓글입력 ajax 테스트
		
		CommentsService comDao = new CommentsServiceImpl();
		SalesVO vo = new SalesVO();
		
		return null;
	}

}
