package co.animal.prj.findhelp.service;

import java.util.List;

import co.animal.prj.findhelp.vo.FindHelpVO;

public interface FindHelpServiceMapper {
	public List<FindHelpVO> findHelpSelectList();
	public List<FindHelpVO> findHelpSelectListByKeyWord(FindHelpVO vo);
	public List<FindHelpVO> findHelpSelectListByMember(FindHelpVO vo);
	public FindHelpVO findHelpSelect(FindHelpVO vo);
	public FindHelpVO findHelpLike(FindHelpVO vo);
	public int findHelpUpdate(FindHelpVO vo);
	public int findHelpDelete(FindHelpVO vo);
	public int findHelpInsert(FindHelpVO vo);
	public int updateLike(FindHelpVO vo);
	public int memberTotalfh(FindHelpVO vo);
	
	public int careNum();
}
