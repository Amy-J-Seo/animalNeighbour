package co.animal.prj.sales.command;


import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.animal.prj.common.Command;
import co.animal.prj.image.service.ImageService;
import co.animal.prj.image.serviceImpl.ImageServiceImpl;
import co.animal.prj.image.vo.ImageVO;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class SalesInsert implements Command {
   

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) {
      // TODO 상품 입력하기~
      
      /* String id = request.getParameter("id");
      out.print(id); // request.getParameter() 사용 불가  */
      
      
      
      String id = "";
      String fileName1 = "";
      String fileName2 = "";
      String orgfileName1 = "";
      String orgfileName2 = "";
      
      //name 오류나면 path 확인 꼭!
      String uploadPath = "C:\\Users\\Admin\\git\\animalNeighbour\\gummarket\\src\\main\\webapp\\img\\salesImg";//이거 주윤이집 컴터....
      //String uploadPath = "C:\\Users\\admin\\git\\animalNeighbour\\gummarket\\src\\main\\webapp\\img\\salesImg"; // upload는 폴더명 / 폴더의 경로를 구해옴
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

      

         fileName1 = multi.getFilesystemName("thumbNailFile"); // name=thumbNailFile의 업로드된 시스템 파일명을 구함(중복된 파일이 있으면, 중복 처리 후 파일 이름)
         orgfileName1 = multi.getOriginalFileName("thumbNailFile"); // name=thumbNailFile의 업로드된 원본파일 이름을 구함(중복 처리 전 이름)

         fileName2 = multi.getFilesystemName("uploadFile1");
         orgfileName2 = multi.getOriginalFileName("uploadFile1");

      
      SalesService salesDao = new SalesServiceImpl();
      SalesVO vo = new SalesVO();
      
      ImageService imgDao = new ImageServiceImpl();
      ImageVO iVo = new ImageVO();
      
      HttpSession session = request.getSession();
      
      vo.setsTitle(multi.getParameter("stitle"));
      vo.setmId(String.valueOf(session.getAttribute("mId"))); 
      vo.setsCategory(multi.getParameter("scategory"));
      vo.setsPurchasedDate(Date.valueOf(multi.getParameter("spurchasedate")));
      vo.setsUseDays(Integer.valueOf(multi.getParameter("susedays")));
      vo.setsPrice(Integer.valueOf(multi.getParameter("sprice")));
      vo.setsNetPrice(Integer.valueOf(multi.getParameter("snetprice")));
      vo.setsReason(multi.getParameter("sreason"));
      vo.setsCondition(multi.getParameter("scondition"));
      vo.setsImg(fileName1); //썸네일 이미지 넣기~?
      
     // System.out.println(vo.toString());
      
      int n = salesDao.salesInsert(vo); //insert return값이 sNo이당!
      
      System.out.println(n+"Sno번호");
      
      iVo.setImgPath(fileName2);
      iVo.setiMainNum(n);
      
      
    //  System.out.println(iVo.toString());
      int nn = imgDao.imageInsert(iVo);
      
      request.setAttribute("afterInsert", true);
      request.setAttribute("sNo", n);
      request.setAttribute("sHit", 0);
      //System.out.println(nn);
      if( nn !=0) {
         page ="salesSelect.do";
      }else {
         page="Test/ErrorPage";
      }
      
      } catch (Exception e) {
         e.getStackTrace();
      } // 업로드 종료
      System.out.println(page);
      return page;
   }

}
