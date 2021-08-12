package co.animal.prj.answer.service;

import java.util.List;

import co.animal.prj.answer.vo.AnswerVO;

public interface AnswerService {
	public List<AnswerVO> answerSelectList();
	public AnswerVO answerSelect(AnswerVO vo);
	public int answerUpdate(AnswerVO vo);
	public int answerDelete(AnswerVO vo);
	public int answerInsert(AnswerVO vo);
}
