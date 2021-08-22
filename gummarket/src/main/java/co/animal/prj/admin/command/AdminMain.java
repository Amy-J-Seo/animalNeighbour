package co.animal.prj.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.common.Command;
import co.animal.prj.member.serviceImpl.MemberServiceImpl;

public class AdminMain implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		//인영
		//1.멤버 수 가져오기
		System.out.println("여기가 admin main");
		MemberServiceImpl memDao = new MemberServiceImpl();
		System.out.println(memDao.memberNum()+" 회원수");
		request.setAttribute("memberNum", memDao.memberNum());
		
		//2. 리포트 수 가져오기 
		return "admin/adminMain";
	}

}
