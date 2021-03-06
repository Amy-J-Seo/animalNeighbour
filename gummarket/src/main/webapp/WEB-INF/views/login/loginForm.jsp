<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>LoginForm</title>
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css">
<!-- Custom fonts for this template from register.html-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- 카카오 API -->

<script type="text/javascript">	
	 
	 $(() => {
   		var result = '<c:out value="${message}" />';
   		checkModal(result);
   		history.replaceState({}, null, null);
   		
   		function checkModal(result) {
   			if(result === '' || history.state){
   				return;
   			}else{
   				// 모달창에 들어갈 메세지
   				$(".modal-body").html(result);
   				// 모달창 띄워주기
   				$("#loginError").modal("show");
   			}
   		}
   	})
	 
	 
	</script>
</head>
<body>
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">

					<div class="col-lg-12">
						<div class="p-5" align="center">
							<div class="col-lg-4 col-sm-4 mb-3 mb-sm-0">
								<div class="continer my-auto pb-3">

									<img src="img/1market.png" style="width: 70px; height: 70px;">
									<p class="h3"
										style="color: rgb(255, 190, 83); font-weight: 900;">환영합니다!</p>
								</div>
								<form id="frm" action="login.do" method="post">
									<div class="form-group">
										<input type="text" id="mId" name="mId" placeholder="아이디"
											required="required" class="form-control form-control-user"><br>


										<input type="password" id="password" name="password"
											placeholder="비밀번호" required="required"
											class="form-control form-control-user"><br> <button
											type="submit" 
											class="btn btn-warning btn-user btn-block"><i class="fas fa-paw"></i>로그인</button>
									</div>
								</form>
							</div>
							<div class="form-group">
								<a href="searchIdForm.do">아이디</a>/<a href ="searchPassForm.do">비밀번호 찾기</a><br> 회원이
								아니신가요?&nbsp;&nbsp;<a href="registerForm.do">회원가입</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 로그인 실패 모달 -->
	<div class="modal fade" id="loginError" role="dialog"
		style="z-index: 100000">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title" >개껌장터 사용자알림</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-body">
					<p>message</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning btn-user btn-block" data-dismiss="modal"><i class="fas fa-check"></i>확인</button>
				</div>
			</div>
		</div>
		</div>
</body>
</html>