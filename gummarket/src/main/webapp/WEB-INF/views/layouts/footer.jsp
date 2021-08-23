<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.css" rel="stylesheet">
    
    
    <style type="text/css">
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: rgb(252, 221, 33); text-decoration: underline;}
	</style>


</head>

<body>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Footer -->
            <footer class="sticky-footer" style="background-color: rgb(244, 244, 244); padding-top:0; padding-bottom:0.5rem">
                <div>
                	<br><br>
                	<div class="row">
                		<div class="col-lg-3 col-sm-3 mb-3 mb-sm-0 ">
	                    	<a href="home.do"><img style="width: 120px; height: 140px; padding-top:15px; margin-left:100px;" src="img/1market.png"></a>
	                    </div>
	                    <div class="col-lg-2 col-sm-2 mb-2 mb-sm-0" >
	                    	<p></p><p></p>
							<a href="home.do" style="font-weight: bold; margin-top: 10px;">개껌장터</a><br><br>
							<a href="findClothing.do">의류/하네스</a><br> 
							<a href="findFood.do">음식</a><br>  
							<a href="findEtc.do">기타</a><br>  
							<a href="findShare.do">나눔</a>                  
	                    </div>
	                    <div class="col-lg-2 col-sm-2 mb-2 mb-sm-0" >
	                    	<p></p><p></p>
							<a href="findHelpMain.doBB" style="font-weight: bold; margin-top: 10px;">멍냥케어</a><br><br>
							<a href="findHelpMain.doBB">도움 찾아요!</a><br> 
							<a href="offerHelpMain.do">도움 드려요! </a><br>
						</div>
						<div class="col-lg-2 col-sm-2 mb-2 mb-sm-0" > 
							<p></p><p></p>
							<a href="#" style="font-weight: bold; margin-top: 10px;">게시판</a><br><br>
							<a href="eventMain.doBB">이벤트</a><br> 
							<a href="noticeMain.doBB">공지사항</a><br>                 
	                    </div>
	                    <div class="col-lg-3 col-sm-6 mb-3 mb-sm-0">
		                    <c:if test="${session.role=='ADMIN' }">
			                    <span><a href="everyCscList.do" class="customer-service-link" style="margin-right: 100px"><i class="fas fa-headset"></i> 고객센터</a></span>
		                    </c:if>
		                    <c:if test="${session.role=='USER' }">
			                    <span><a href="myCscList.do" class="customer-service-link" style="margin-right: 100px"><i class="fas fa-headset"></i> 고객센터</a></span>
		                    </c:if>
		                 </div>
                    
					</div>
					<br><br>
	                <div class="container my-auto">
	                    <div class="copyright text-center my-auto">
	                    	<p></p>
	                    	<span>대 표 자 : 밤빵 | 주 소 : 대구광역시 중구 남일동 중앙대로 403 | 연 락 처 : 053-421-2460 </span><br><br>
	                        <span>Copyright &copy; 개껌장터 2021</span>
	                    </div>
	                </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->


</body>

</html>