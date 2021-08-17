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
</head>

<body>
	<!-- Page Wrapper -->
	<div>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Topbar -->
			<nav class="navbar navbar-expand topbar"
				style="height: 2rem; background-color: rgb(252, 221, 33);">
				<ul class="navbar-nav ml-auto" style="text-align: center;">

					<!-- 노란헤더 이벤트, 공지사항 링크 -->
					<li class="nav-item mt-2"><a href="#"
						style="text-decoration: none; color: rgb(53, 53, 53);"> <span
							class="mr-2  d-lg-inline small">이벤트</span>
					</a></li>
					<li class="mt-2 mr-2">|</li>
					<li class="nav-item mt-2"><a href="#"
						style="text-decoration: none; color: rgb(53, 53, 53);"> <span
							class="mr-2 d-lg-inline small">공지사항</span>
					</a></li>
				</ul>
			</nav>
			<!-- End of Topbar -->
			<!-- 여기부터 회색헤더 -->
			<!-- Topbar -->
			<nav class="navbar navbar-expand topbar static-top"
				style="background-color: rgb(244, 244, 244);">
				<a href="home.do"><img src="img/1market.png"
					style="width: 85px; height: 85px;"></a>
				<ul class="navbar-nav ml-auto">
					<li style="padding-right: 8rem;">&nbsp;&nbsp;&nbsp;</li>
					<li style="margin: auto;"><a href="#"
						style="text-decoration: none; color: rgb(94, 94, 94)">&nbsp;중고장터</a>&nbsp;
						|&nbsp; <a href="#"
						style="text-decoration: none; color: rgb(94, 94, 94)">멍냥케어&nbsp;</a></li>
				</ul>

				<ul class="navbar-nav ml-auto">
					<!-- 사용자 세션 로그인 기록에 아이디가 있으면 이름과 사진 보여주기 -->
					<c:if test="${not empty session.mId }">
						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">
									${session.nickname }님</span> <img class="img-profile rounded-circle"
								src="img/undraw_profile.svg">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="test.do"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 나의 정보
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 마이 페이지
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 내 문의내역
								</a>
								<c:if test="${session.role eq 'ADMIN' }">
									<a class="dropdown-item" href="memberList.do"> <i
										class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 회원 관리
									</a>
								</c:if>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div></li>
					</c:if>
					
					<c:if test="${empty session.mId }">
						<li><button class="btn mt-3"
								onclick="location.href='loginForm.do'"
								style="background-color: rgb(252, 221, 33);">로 그 인</button></li>
					</c:if>
				</ul>
			</nav>
			<!-- End of Topbar -->



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