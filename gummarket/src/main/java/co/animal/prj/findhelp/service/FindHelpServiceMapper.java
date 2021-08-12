package co.animal.prj.findhelp.service;

import java.util.List;

import co.animal.prj.findhelp.vo.FindHelpVO;

public interface FindHelpServiceMapper {
	public List<FindHelpVO> findHelpSelectList();
	public FindHelpVO findHelpSelect(FindHelpVO vo);
	public int findHelpUpdate(FindHelpVO vo);
	public int findHelpDelete(FindHelpVO vo);
	public int findHelpInsert(FindHelpVO vo);
}
