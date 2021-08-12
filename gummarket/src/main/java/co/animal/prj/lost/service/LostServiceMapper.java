package co.animal.prj.lost.service;

import java.util.List;

import co.animal.prj.lost.vo.LostVO;

public interface LostServiceMapper {
	public List<LostVO> lostSelectList();
	public LostVO lostSelect(LostVO vo);
	public int lostUpdate(LostVO vo);
	public int lostDelete(LostVO vo);
	public int lostInsert(LostVO vo);
}
