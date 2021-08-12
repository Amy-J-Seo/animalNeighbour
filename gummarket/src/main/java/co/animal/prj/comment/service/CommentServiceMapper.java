package co.animal.prj.comment.service;

import java.util.List;

import co.animal.prj.comment.vo.CommentVO;

public interface CommentServiceMapper {
	public List<CommentVO> commentSelectList();
	public CommentVO commentSelect(CommentVO vo);
	public int commentUpdate(CommentVO vo);
	public int commentDelete(CommentVO vo);
	public int commentInsert(CommentVO vo);
}
