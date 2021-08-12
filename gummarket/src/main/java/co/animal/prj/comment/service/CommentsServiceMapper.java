package co.animal.prj.comment.service;

import java.util.List;

import co.animal.prj.comments.vo.CommentsVO;

public interface CommentsServiceMapper {
	public List<CommentsVO> commentSelectList();
	public CommentsVO commentSelect(CommentsVO vo);
	public int commentUpdate(CommentsVO vo);
	public int commentDelete(CommentsVO vo);
	public int commentInsert(CommentsVO vo);
}
