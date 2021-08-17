package co.animal.prj.findhelp.service;

import java.util.List;

import co.animal.prj.findhelp.vo.FindHelpVO;


public interface FindHelpService {
	public List<FindHelpVO> findHelpSelectList();
	public FindHelpVO findHelpSelect(FindHelpVO vo);
	public FindHelpVO findHelpLike(FindHelpVO vo);
	public int findHelpUpdate(FindHelpVO vo);
	public int findHelpDelete(FindHelpVO vo);
	public int findHelpInsert(FindHelpVO vo);
	public int updateLike(FindHelpVO vo);
	
}
