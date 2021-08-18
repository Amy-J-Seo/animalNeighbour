package co.animal.prj.comments.service;

import java.util.List;

import co.animal.prj.comments.vo.CommentsVO;

public interface CommentsServiceMapper {
	public List<CommentsVO> commentsSelectList();
	public List<CommentsVO> fhCommentsSelectList(CommentsVO vo);
	public List<CommentsVO> commentsInsertSelect();
	public CommentsVO commentsSelect(CommentsVO vo);
	public int commentsUpdate(CommentsVO vo);
	public int commentsDelete(CommentsVO vo);
	public int commentsInsert(CommentsVO vo);
	public int fhCommentsInsert(CommentsVO vo);
	public int fhCommentsUpdate(CommentsVO vo);
	public int fhCommentsDelete(CommentsVO vo);
}
