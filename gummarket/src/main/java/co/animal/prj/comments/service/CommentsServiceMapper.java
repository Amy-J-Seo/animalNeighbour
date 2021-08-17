package co.animal.prj.comments.service;

import java.util.List;

import co.animal.prj.comments.vo.CommentsVO;

public interface CommentsServiceMapper {
	public List<CommentsVO> commentsSelectList();
	public List<CommentsVO> commentsInsertSelect();
	public CommentsVO commentsSelect(CommentsVO vo);
	public int commentsUpdate(CommentsVO vo);
	public int commentsDelete(CommentsVO vo);
	public int commentsInsert(CommentsVO vo);
}
