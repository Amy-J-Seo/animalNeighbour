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
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.css" rel="stylesheet">
<style type="text/css">

	@font-face {
	    font-family: 'SeoulNamsanM';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	@font-face {
	    font-family: 'Cafe24SsurroundAir';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
	    font-family: 'Cafe24Ssurround';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
</style>

</head>

<body  style="font-family: SeoulNamsanM;">
	<!-- Page Wrapper -->
	<div>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<nav class="topbar fixed-top">
			<!-- Topbar -->
			<nav class="navbar navbar-expand "
				style="height: 2rem; background-color: rgb(252, 221, 33); font-family: SeoulNamsanM;">
				<ul class="navbar-nav ml-auto" style="text-align: center;">

					<!-- 노란헤더 이벤트, 공지사항 링크 -->
					<li class="nav-item mt-2"><a href="eventMain.doBB"
						style="text-decoration: none; color: rgb(53, 53, 53);"> <span
							class="mr-2  d-lg-inline small">이벤트</span>
					</a></li>
					<li class="mt-2 mr-2">|</li>
					<li class="nav-item mt-2"><a href="noticeMain.doBB"
						style="text-decoration: none; color: rgb(53, 53, 53);"> <span
							class="mr-2 d-lg-inline small">공지사항</span>
					</a></li>
				</ul>
			</nav>
			<!-- End of Topbar -->
			
			<!-- 여기부터 회색헤더 -->
			<!-- Topbar -->
			<nav class="navbar navbar-expand topbar static-top "
				style="background-color: rgb(244, 244, 244);" >
				
				<!-- 로그인 세션 없을 시 로그인 페이지로 -->
				<c:if test="${not empty session.mId }">
				<a href="home.do"><img src="img/logo1.png"
					style="width: 85px; height: 85px;"></a>
				</c:if>
				<c:if test="${empty session.mId }">
				<a href="loginForm.do"><img src="img/logo1.png"
					style="width: 85px; height: 85px;"></a>
				</c:if>
				
				<ul class="navbar-nav ml-auto" style="font-family: SeoulNamsanM; font-size:35px">
					<li style="padding-right: 8rem;">&nbsp;&nbsp;&nbsp;</li>
					<li style="margin: auto;">
						<a href="salesListAll.do" style="text-decoration: none; color: rgb(94, 94, 94)">중고장터</a>
						&nbsp;|&nbsp; <a href="findHelpMain.doBB" style="text-decoration: none; color: rgb(94, 94, 94)">멍냥케어&nbsp;</a>
					</li>
						
						
				</ul>

				<ul class="navbar-nav ml-auto">
					<!-- 사용자 세션 로그인 기록에 아이디가 있으면 이름과 사진 보여주기 -->
					<c:if test="${not empty session.mId }">
						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow">
						<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="mr-2 d-none d-lg-inline text-gray-600 large">${session.nickname }님</span>
							<img class="img-profile rounded-circle" src="img/undraw_profile.svg">
						</a> 
						<!-- Dropdown - User Information -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown" style="font-size: 15px">
								<!-- 유저 로그인 시 -->
								<c:if test="${session.role eq 'USER' }">
								<a class="dropdown-item" href="memberCheck.do?mId=${session.mId }">
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 나의 정보
								</a>
								<a class="dropdown-item" href="memberMyPage.doBB?mId=${session.mId }">
									<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 마이 페이지
								</a>
								<a class="dropdown-item" href="#"> 
									<i class="fas fa-question-circle fa-sm fa-fw mr-2 text-gray-400"></i> 내 문의내역
								</a>
								
								<div class="dropdown-divider"></div>
								
								<a class="dropdown-item" href="" data-toggle="modal" data-target="#logoutModal"> 
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
								</c:if>
								<!-- 어드민 로그인 시 -->
								<c:if test="${session.role eq 'ADMIN' }">
									<a class="dropdown-item" href="adminMain.doBB">
										<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 관리자 메인
									</a>
								 <a class="dropdown-item" href="memberCheck.do?mId=${session.mId }">
										<i class="fas fa-address-card fa-sm fa-fw mr-2 text-gray-400"></i> 나의 정보
									</a>
								<a class="dropdown-item" href="#"> 
									<i class="fas fa-question-circle fa-sm fa-fw mr-2 text-gray-400"></i> 회원 문의
								</a>
									<a class="dropdown-item" href="memberList.do"> <i
										class="fas fa-user-cog fa-sm fa-fw mr-2 text-gray-400"></i> 회원 관리
									</a>
								
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="" data-toggle="modal" data-target="#logoutModal">
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
								</c:if>
							</div>
						</li>
					</c:if>
					
					<c:if test="${empty session.mId }">
						<li><button class="btn mt-3"
								onclick="location.href='loginForm.do'"
								style="background-color: rgb(252, 221, 33);">로 그 인</button></li>
					</c:if>
				</ul>
			</nav>
			</nav>
			<!-- End of Topbar -->
			
 <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">밤빵마켓은 사랑입니다</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">정말로 떠나실 건가요?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">머물기</button>
                    <a class="btn btn-warning btn-user btn-block" href="logout.do">로그아웃</a>
                </div>
            </div>
        </div>
    </div>


		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->
	

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>
</body>

</html>