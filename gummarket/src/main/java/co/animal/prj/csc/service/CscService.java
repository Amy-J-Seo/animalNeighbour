package co.animal.prj.csc.service;

import java.util.List;

import co.animal.prj.csc.vo.CscVO;


public interface CscService {
	public List<CscVO> cscSelectList();
	public CscVO cscSelect(CscVO vo);
	public int cscUpdate(CscVO vo);
	public int cscDelete(CscVO vo);
	public int cscInsert(CscVO vo);
	
	public List<CscVO> cscMyList(CscVO vo);
	
	//답변 입력하면 status 변경
	public int cscAnswer(CscVO vo);
	
	//답변 삭제하면 status 변경
	public int answerDeleteUpdate(CscVO vo);
}
