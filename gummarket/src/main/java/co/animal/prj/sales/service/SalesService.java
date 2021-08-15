package co.animal.prj.sales.service;

import java.util.List;

import co.animal.prj.sales.vo.SalesVO;


public interface SalesService {
	public List<SalesVO> salesSelectList();//전체목록
	public List<SalesVO> salesListTOP10(); //인기상품 조회
	public List<SalesVO> salesSelect(SalesVO vo); //상품 하나 조회+댓글 여러개
	public int salesUpdate(SalesVO vo);
	public int salesDelete(SalesVO vo);
	public int salesInsert(SalesVO vo);
}
