<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>회원가입</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	<!-- 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수 -->

	function checkValue(){
			if(!document.frm.mId.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			if(!document.frm.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			<!-- 비밀번호와 비밀번호 확인이 같은 값인지 확인 -->
			if(document.frm.password.value != document.frm.passwordok.value){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
		}
		
		function winopen(){
			window.open("idCheckForm.do", "아이디 중복 체크", "width=400, height=350");
		}
		
		function winopen1(){
			frm = document.getElementById('frm');
			window.open("", "a", "width=600, height=600");
			frm.action="registerCheck.do";
			frm.method="post";
			frm.submit();
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
							<div class="col-lg-8 col-sm-4 mb-3 mb-sm-0">
								<img src="img/1market.png" style="width: 70px; height: 70px;">
								<p class="h3"
									style="color: rgb(255, 190, 83); font-weight: 900;">회원가입</p>

								<br>
								<form id="frm" name="frm" action="signUpCheck.do" target="a"
									method="post" onsubmit="return checkValue()">
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">아이디</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="text" id="mId" name="mId" placeholder="아이디"
												required="required" class="form-control form-control-user">
										</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<button onclick="winopen()"
												class="btn btn-warning btn-user btn-block">중복체크</button>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">비밀번호</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="password" id="password" name="password"
												placeholder="비밀번호" required="required"
												class="form-control form-control-user">
										</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="password" id="passwordok" name="passwordok"
												placeholder="비밀번호 확인" class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">이 름</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="text" id="mName" name="mName" placeholder="이름"
												required="required" class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">닉네임</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="text" id="nickname" name="nickname"
												placeholder="닉네임" required="required"
												class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">휴대폰번호</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="text" id="phone" name="phone" placeholder="휴대번호"
												required="required" class="form-control form-control-user">
										</div>
										<div class="col-lg-3 col-sm- mb-3 mb-sm-0 ">
											<button onclick="phone()"
												class="btn btn-warning btn-user btn-block">인증하기</button>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">이 메 일</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="email" id="email" name="email" placeholder="이메일"
												required="required" class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">멍냥이 정보</div>
										<div class="col-lg-10 col-sm- mb-3 mb-sm-0 ">
											<textarea id="petInfo" name="petInfo"
												class="form-control form-control-user"
												placeholder="멍냥이 정보를 입력해보아요."></textarea>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">주 소</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="text" id="address" name="address"
												class="form-control form-control-user">
										</div>
									</div>
									<div class="custom-control custom-checkbox">
										<p style="color: rgb(255, 190, 83); font-weight: 900;">
											<label> <input type="checkbox" id="admit"
												name="admit" required="required">이용약관동의(필수)
											</label><br> <label> <input type="checkbox" id="admit"
												name="admit" required="required">이용약관동의(필수)
											</label><br> <label> <input type="checkbox" id="admit"
												name="admit" required="required">개인정보 수집 이용동의(필수)
											</label><br> <label> <input type="checkbox" id="admit"
												name="admit" required="required">본인은 만 14세 이상입니다.
											</label> <br>
										</p>
									</div>
									<button type="submit" onclick="winopen1()"
										class="btn btn-warning btn-user btn-block">회원 가입</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>