package co.animal.prj.sales.service;

import java.util.List;

import co.animal.prj.sales.vo.SalesVO;


public interface SalesService {
	public List<SalesVO> salesSelectList();//전체목록
	public List<SalesVO> salesListTOP10(); //인기상품 조회
	public List<SalesVO> salesSelect(SalesVO vo); //상품 하나 조회+댓글 여러개
	public SalesVO salesOne(SalesVO vo);//댓글 없이 상품만 조회
	public int salesUpdate(SalesVO vo);
	public int salesDelete(SalesVO vo);
	public int salesInsert(SalesVO vo);
	
	public int hitUpdate(SalesVO vo);//조회수 증가
	public int updateLike(SalesVO vo); //like 증가
}
