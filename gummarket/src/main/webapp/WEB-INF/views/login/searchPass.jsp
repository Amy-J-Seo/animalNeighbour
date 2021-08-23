<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="en">
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

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<script type="text/javascript">

function checkValue() {
	if (!document.frm.password.value) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	// < !--비밀번호와 비밀번호 확인이 같은 값인지 확인-- >
	if (document.frm.password.value != document.frm.passwordok.value) {
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}
}
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
      				$("#passUp").modal("show");
      			}
      		}
      	})
		</script>
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

									<p class="h3" align="left"
										style="color: rgb(255, 190, 83); font-weight: 900;">비밀번호
										찾기</p>
									<p align="left">${info.mName }회원님 새 비밀번호 등록</p>
								</div>
								<form id="frm" name="frm" action="searchPassUp.do" method="post">
									<div class="form-group">
										<input type="password" name="password" id="password" placeholder="새 비밀번호를 입력해주세요."
											 class="form-control form-control-user"required="required">
										<br> <input type="password" id="passwordok" name="passwordok"
											placeholder="새 비밀번호를 한번 더 입력해주세요" required="required"
											class="form-control form-control-user">
											
											
											 <input
											type="hidden" value="${info.mName }" name="mName"><input
											type="hidden" value="${info.email }" name="email">
										<br> <button type="submit" 
											class="btn btn-warning btn-user btn-block"><i class="fas fa-check"></i>확인</button>									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="passUp" role="dialog"
		style="z-index: 100000">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">사용자 오류</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-body">
					<p>message</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning btn-user btn-block"
						data-dismiss="modal"><i class="fas fa-times-circle"></i>닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>