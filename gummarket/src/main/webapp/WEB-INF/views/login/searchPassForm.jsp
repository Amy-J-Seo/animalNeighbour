<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css">

<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

	<script type="text/javascript">
		// 모달창 표시
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
      				$("#passError").modal("show");
      			}
      		}
      	})
		
      	var code = "";
		function emailAuthentication() {
			if (!emailValCheck()){
		    	return false;
		    }
			$.ajax({
				url: "requestAuthEmail.do?email=" + frm.email.value,
				type: "GET",
				dataType: 'json',
				success: function (data) {
					console.log(data);
					localStorage.setItem('emailAuthent', data);
					document.frm.inputEmailForm.readOnly = true;
					document.frm.authCodeCheckBtn.disabled = false;
					document.frm.inputAuthCode.disabled = false;
					code = data;
					console.log(code);
				},
				error: function () {
					alert("에러")
				}
			});
		}
		function emailValCheck(){
			var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var email = frm.email.value;
			if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
				return false;
			}
			alert("인증번호가 전송되었습니다.")
			document.frm.eamilAuthBtn.disabled = true;
		    return true;
		}
		function check(pattern, taget, message) {
			if(pattern.test(taget)) {
		    	return true;
		    }
		    alert(message);
		    return false;
		}
		function authCodeCheck() {

			var inputCode = $("#inputAuthCode").val(); // 입력코드
			var checkResult = $("#mail_check_input_box_warn"); // 비교 결과
			code = localStorage.getItem('emailAuthent');
			
			console.log(code, ',', inputCode)
			if (inputCode == code) { // 일치할 경우
				checkResult.html("인증번호가 일치합니다.");
				document.frm.authCodeCheckBtn.disabled = true;
				document.frm.inputAuthCode.disabled = true;
				
				
				$("#authPass").attr("value", true);
				console.log(document.frm.authPass.value);

			} else { // 일치하지 않을 경우
				checkResult.html("인증번호를 다시 확인해주세요.");

			}

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
							<div class="col-lg-9 col-sm-3 mb-3 mb-sm-0 ">
								<div class="continer my-auto pb-3">

									<p class="h3" align="left"
										style="color: rgb(255, 190, 83); font-weight: 900;">비밀번호
										찾기</p>
									<p align="left">회원님의 이름과 이메일을 입력해주세요.</p>
								</div>
								<form id="frm" name="frm" action="searchPass.do" method="post" onsubmit="return checkValue()">
									<div class="form-group">
										<input type="text" id="mName" name="mName"
											placeholder="회원님의 이름을 입력해주세요."
											class="form-control form-control-user" required="required">
										<br>

										<div class="form-group row">
											<div class="col-lg-5 col-sm- mb-3 mb-sm-0 ">
												<input type="email" id="inputEmailForm" name="email"
													placeholder="회원님의 이메일을 입력해주세요." required="required"
													class="form-control form-control-user">
											</div>
											<div class="col-lg-3 col-sm- mb-3 mb-sm-0 ">
												<button onclick="emailAuthentication()" id="eamilAuthBtn"
													class="btn btn-warning btn-user btn-block">인증메일보내기</button>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-5 col-sm-3 mb-3 mb-sm-0 ">
												<input type="text" id="inputAuthCode" name="authCode"
													placeholder="인증번호를 입력해주세요." required="required"
													class="form-control form-control-user" >
											</div>
											
											<div class="col-lg-3 col-sm- mb-3 mb-sm-0 ">
												<button onclick="authCodeCheck()" id="authCodeCheckBtn"
													class="btn btn-warning btn-user btn-block"
													disabled="disabled">인증하기</button>
											</div>
											<span id="mail_check_input_box_warn"></span>
										</div>
											<input type="hidden" name="authPass" id="authPass">

										<br>
										<button type="submit" onclick=""
											class="btn btn-warning btn-user btn-block">확인</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="passError" role="dialog"
		style="z-index: 100000">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">사용자 오류 안내</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-body">
					<p>message</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning btn-user btn-block"
						data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>