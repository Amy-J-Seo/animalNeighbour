<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- Custom fonts for this template from register.html-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">



<script src="http://developers.kakao.com/sdk/js/kakao.js"></script>
<script>	
	window.Kakao.init("b170e6c8bb0d86b449f0f677f1ae873f");
	
	 function kakaoLogin(){
	        window.Kakao.Auth.login({
	            scope:'profile_nickname, account_email,',
	            success: function(authObj) {
	            console.log(authObj);
	            window.Kakao.API.request({
	                url:'/v2/user/me',
	                success: res => {
	                    const kakao_account = res.kakao_account;
	                    console.log(kakao_account);
	                    this.login(kakao_account);
	                }
	            });
	            },
	            
	        });
	    }
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
											class="form-control form-control-user"><br> <input
											type="submit" value="로그인"
											class="btn btn-warning btn-user btn-block"> <a
											href="javascript:kakaoLogin();"><br> <img
											src="http://gi.esmplus.com/buybye1/page/kakao-login.png"
											style="height: 40px; width: auto"></a>
									</div>
								</form>
							</div>
							<div class="form-group">
								<a href="registerForm.do">아이디/비밀번호 찾기</a><br>
								회원이 아니신가요?&nbsp;&nbsp;<a href="registerForm.do">회원가입</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>