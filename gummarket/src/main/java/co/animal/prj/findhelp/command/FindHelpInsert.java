package co.animal.prj.findhelp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.animal.prj.common.Command;
import co.animal.prj.findhelp.serviceImpl.FindHelpServiceImpl;
import co.animal.prj.findhelp.vo.FindHelpVO;
import co.animal.prj.image.service.ImageService;
import co.animal.prj.image.serviceImpl.ImageServiceImpl;
import co.animal.prj.image.vo.ImageVO;

public class FindHelpInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		

      String id = "";
      String fileName1 = "";
      String fileName2 = "";
      String orgfileName1 = "";
      String orgfileName2 = "";

      
      String uploadPath = "C:\\Users\\User\\git\\animalNeighbour\\gummarket\\src\\main\\webapp\\img\\fhImg\\"; // upload는 폴더명 / 폴더의 경로를 구해옴
      //out.print(uploadPath);

      String page ="";
      try {
         MultipartRequest multi = new MultipartRequest( // MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
               request, 
               uploadPath, // 파일을 저장할 디렉토리 지정
               10 * 1024 * 1024, // 첨부파일 최대 용량 설정(bite) / 10KB / 용량 초과 시 예외 발생
               "utf-8", // 인코딩 방식 지정
               new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
         );
         //id = multi.getParameter("stitle"); // form의 name="id"인 값을 구함
      

         fileName1 = multi.getFilesystemName("thumbNailFile"); // name=thumbNailFile의 업로드된 시스템 파일명을 구함(중복된 파일이 있으면, 중복 처리 후 파일 이름)
         orgfileName1 = multi.getOriginalFileName("thumbNailFile"); // name=thumbNailFile의 업로드된 원본파일 이름을 구함(중복 처리 전 이름)

         fileName2 = multi.getFilesystemName("uploadFile1");
         orgfileName2 = multi.getOriginalFileName("uploadFile1");
		
		
		
		FindHelpServiceImpl dao= new FindHelpServiceImpl();
		FindHelpVO vo = new FindHelpVO();
		
		ImageService imgDao = new ImageServiceImpl();
		ImageVO iVo = new ImageVO();
      
		HttpSession session = request.getSession();
		String writerId =String.valueOf(session.getAttribute("mId"));
		vo.setmId(writerId);
		vo.setFhCategory(multi.getParameter("fhCategory"));
		vo.setFhTitle(multi.getParameter("fhTitle"));	
		vo.setFhAnimal(multi.getParameter("fhAnimal"));
		vo.setFhSize(multi.getParameter("fhSize"));
		vo.setFhAge(Integer.valueOf(multi.getParameter("fhAge")));
		vo.setFhCharacter(multi.getParameter("fhCharacter"));
		vo.setFhNeed(multi.getParameter("fhNeed"));
		vo.setFhHow(multi.getParameter("fhHow"));
		vo.setFhImg(fileName1);
			
		int n = dao.findHelpInsert(vo);
		System.out.println(n + "item added successfully + FindHelpInsert.java");
//		------insert finished---------

		if( n !=0) {
//		작성된 글 디테일 페이지로 이동
	    	  dao= new FindHelpServiceImpl();
	  		
	  		request.setAttribute("item", dao.findHelpSelect(vo));
	         page ="findhelp/fhItemDetail";
	      }
      } catch (Exception e) {
          e.getStackTrace();
       } // 업로드 종료
      
       return page;
	}

}
