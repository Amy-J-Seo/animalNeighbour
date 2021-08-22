package co.animal.prj.payment.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.animal.prj.member.serviceImpl.MemberServiceImpl;
import co.animal.prj.member.vo.MemberVO;

@WebServlet("/UpdatePointServlet")
public class UpdatePointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UpdatePointServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		MemberServiceImpl mDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();

		String mId = request.getParameter("mId");
		System.out.println(mId);
		int usedPoint = Integer.valueOf(request.getParameter("usedPoint"));
		vo.setmId(mId);
		vo.setReviewPoint(usedPoint);
		System.out.println(vo.toString() +"             updatePoinst servlet");
//		이게 작동안함 ㅠㅠㅠㅠ 고쳐야해....
		int n = mDao.usedPointUpdate(vo);
		System.out.println(n +"건 업데이트 처리 완료");
		
		
	}

}
