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
	

	//주윤 멤버정보모달 탑3 아이템 조회
	public List<SalesVO> salesListTop3(SalesVO vo);
	public List<SalesVO> salesSelectListByKeyWord(SalesVO vo); //searchBar
	public List<SalesVO> salesListByMember(SalesVO vo); //사용자의 글 리스트 조회
	public int memberTotalS(SalesVO vo); //사용자 글 숫자

  //카테고리별로 찾아오기
	public List<SalesVO> findClothing();
	public List<SalesVO> findFood();
	public List<SalesVO> findEtc();
	public List<SalesVO> findShare();
	
	
	//admin main page
	public int salesNum();
}
