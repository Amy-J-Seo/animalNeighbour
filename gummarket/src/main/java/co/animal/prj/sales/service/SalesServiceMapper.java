package co.animal.prj.sales.service;

import java.util.List;

import co.animal.prj.sales.vo.SalesVO;

public interface SalesServiceMapper {
	public List<SalesVO> salesSelectList();
	public List<SalesVO> salesListTOP10(); //인기상품 조회
	public List<SalesVO> salesSelect(SalesVO vo);
	public SalesVO salesOne(SalesVO vo);
	public int salesUpdate(SalesVO vo);
	public int salesDelete(SalesVO vo);
	public int salesInsert(SalesVO vo);
	
	
	public int hitUpdate(SalesVO vo);
	public int updateLike(SalesVO vo);
	
	//카테고리별로 찾아오기
	public List<SalesVO> findClothing();
	public List<SalesVO> findFood();
	public List<SalesVO> findEtc();
	public List<SalesVO> findShare();
}
