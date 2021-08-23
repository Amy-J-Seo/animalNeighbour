package co.animal.prj.board.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.animal.prj.board.serviceImpl.BoardServiceImpl;
import co.animal.prj.board.vo.BoardVO;
import co.animal.prj.common.Command;

public class BoardInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
	      String fileName1 = "";
	      String orgfileName1 = "";
	      
	      String uploadPath = "C:\\Users\\admin\\git\\animalNeighbour\\gummarket\\src\\main\\webapp\\img\\noticeEvent\\"; // upload는 폴더명 / 폴더의 경로를 구해옴
	      String page ="";
	      try {
	         MultipartRequest multi = new MultipartRequest( // MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
	               request, 
	               uploadPath, // 파일을 저장할 디렉토리 지정
	               10 * 1024 * 1024, // 첨부파일 최대 용량 설정(bite) / 10KB / 용량 초과 시 예외 발생
	               "utf-8", // 인코딩 방식 지정
	               new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
	         );
	      
	         fileName1 = multi.getFilesystemName("thumbNailFile"); // name=thumbNailFile의 업로드된 시스템 파일명을 구함(중복된 파일이 있으면, 중복 처리 후 파일 이름)
	         orgfileName1 = multi.getOriginalFileName("thumbNailFile"); // name=thumbNailFile의 업로드된 원본파일 이름을 구함(중복 처리 전 이름)
		
	         
		BoardServiceImpl bDao = new BoardServiceImpl();
		BoardVO vo = new BoardVO();
		
		String writerId =multi.getParameter("mId");
		

		vo.setmId(writerId);
		vo.setbCategory(multi.getParameter("bCategory"));
		vo.setbDate(Date.valueOf(multi.getParameter("bDate")));
		vo.setbTitle(multi.getParameter("bTitle"));
		vo.setbContents(multi.getParameter("bContents"));
		vo.setbImg(fileName1);
		int n = bDao.boardInsert(vo);
		System.out.println(n + "item added successfully + BoardInsert.java");
		
		if(n != 0) {
			bDao= new BoardServiceImpl();
			
			request.setAttribute("item", bDao.boardSelect(vo));
			page ="noticeEvent/bItemDetail";
			
		}else {
	         page="home/error";
	      }	
		
      } catch (Exception e) {
          e.getStackTrace();
       } // 업로드 종료
	      
	       return page;
		}
	
		
	

}
