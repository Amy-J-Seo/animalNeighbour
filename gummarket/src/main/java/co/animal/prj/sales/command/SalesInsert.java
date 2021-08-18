package co.animal.prj.sales.command;


import java.sql.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import co.animal.prj.common.Command;
import co.animal.prj.image.service.ImageService;
import co.animal.prj.image.serviceImpl.ImageServiceImpl;
import co.animal.prj.image.vo.ImageVO;
import co.animal.prj.sales.service.SalesService;
import co.animal.prj.sales.serviceImpl.SalesServiceImpl;
import co.animal.prj.sales.vo.SalesVO;

public class SalesInsert implements Command {
	
	private static final String UPLOAD_DIR = "C:\\animalNaver\\src\\main\\webapp\\img";
	private static final int MEMORY_TRESHOLD = 1024 * 1024 * 3; // 3mb
	private static final long MAX_FILE_SIZE = 1024 * 1024 * 100; // 100mb
	private static final long MAX_REQUEST_SIZE = 1024 * 1024 * 100; // 100mb


	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 상품 입력하기~
		MultipartRequest multi= new MultipartRequest() {
			
			@Override
			public String getMultipartContentType(String paramOrFileName) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public MultiValueMap<String, MultipartFile> getMultiFileMap() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public List<MultipartFile> getFiles(String name) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Iterator<String> getFileNames() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Map<String, MultipartFile> getFileMap() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public MultipartFile getFile(String name) {
				// TODO Auto-generated method stub
				return null;
			}
		};
		SalesService salesDao = new SalesServiceImpl();
		SalesVO vo = new SalesVO();
		
		ImageService imgDao = new ImageServiceImpl();
		ImageVO iVo = new ImageVO();
		
		HttpSession session = request.getSession();
		
		
		vo.setsTitle(request.getParameter("stitle"));
		vo.setmId(String.valueOf(session.getAttribute("mId"))); 
		vo.setsCategory(request.getParameter("scategory"));
		vo.setsPurchasedDate(Date.valueOf(request.getParameter("spurchasedate")));
		vo.setsUseDays(Integer.valueOf(request.getParameter("susedays")));
		vo.setsPrice(Integer.valueOf(request.getParameter("sprice")));
		vo.setsNetPrice(Integer.valueOf(request.getParameter("snetprice")));
		vo.setsReason(request.getParameter("sreason"));
		vo.setsCondition(request.getParameter("scondition"));
		vo.setsImg(request.getParameter("thumbNailFile")); //썸네일 이미지 넣기~?
		
		
		int n = salesDao.salesInsert(vo); //insert return값이 sNo이당!
		
		
		iVo.setImgPath(request.getParameter("uploadFile1"));
		iVo.setiMainNum(n);
		imgDao.imageInsert(iVo);
		
		String page ="";
		
		
		if( n !=0) {
//			request.setAttribute("rptitle", vo.getsTitle());
//			request.setAttribute("message", "글이 등록 되었습니다. 사진을 입력하시겠습니까?");
//			page="sales/salesPhotoInsertForm";
			page ="salesListAll.do";
		}else {
			page="Test/ErrorPage";
		}
		
		return page;
	}

}
