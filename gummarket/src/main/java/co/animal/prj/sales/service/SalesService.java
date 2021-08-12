package co.animal.prj.sales.service;

import java.util.List;

import co.animal.prj.sales.vo.SalesVO;


public interface SalesService {
	public List<SalesVO> salesSelectList();
	public SalesVO salesSelect(SalesVO vo);
	public int salesUpdate(SalesVO vo);
	public int salesDelete(SalesVO vo);
	public int salesInsert(SalesVO vo);
}
