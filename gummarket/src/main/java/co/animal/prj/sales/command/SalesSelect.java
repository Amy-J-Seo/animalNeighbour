package co.animal.prj.sales.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.image.serviceImpl.ImageServiceImpl;
import co.animal.prj.image.vo.ImageVO;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class SalesSelect implements Command {


	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 상품 디테일페이지 + 안에 댓글도 가져오기.
		SalesService salesDao = new SalesServiceImpl();
		ImageServiceImpl imgDao = new ImageServiceImpl();
		MemberServiceImpl memDao = new MemberServiceImpl(); //작성자 포인트 가져오기
		
		SalesVO vo = new SalesVO();
		ImageVO iVo = new ImageVO();
		MemberVO mVo = new MemberVO();
		
		
		//조회수
		int sHit;
		
		if(request.getAttribute("afterInsert") != null) {
			vo.setsNo((Integer) request.getAttribute("sNo"));
			iVo.setiMainNum((Integer) request.getAttribute("sNo"));
			sHit = (Integer) request.getAttribute("sHit");
		} else {
			vo.setsNo(Integer.valueOf(request.getParameter("sNo")));
			sHit = Integer.valueOf(request.getParameter("sHit"));
			iVo.setiMainNum(Integer.valueOf(request.getParameter("sNo")));
		}

		
		vo.setsHit(sHit);
		salesDao.hitUpdate(vo);
		
		
		//sales에서 값 가져오기
		List<SalesVO> list = new ArrayList<SalesVO>();
		list = salesDao.salesSelect(vo);
		System.out.println(list.get(0).getcNo() + "cNo( salesSelect.do)");
		request.setAttribute("list", list);
		
		//member테이블에서 정보 가져오기
		mVo.setmId(list.get(0).getmId());
		request.setAttribute("member", memDao.memberSelect(mVo));
		
		
		return "sales/salesDetail";
	
	}

}