<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css">

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
   				$("#confirm").modal("show");
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
							<div class="col-lg-8 col-sm-4 mb-3 mb-sm-0">
								<img src="img/1market.png" style="width: 70px; height: 70px;">
								<p class="h3"
									style="color: rgb(255, 190, 83); font-weight: 900;">${list.mName }회원님
									회원정보</p>
								<br>
								<form id="frm" name="frm" action="memberUpdate.do" method="post">

									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">아이디</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="text" id="mId" name="mId" value="${list.mId }"
												readonly class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">이름</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="text" id="mName" name="mName"
												value="${list.mName }" readonly
												class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">닉네임</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="text" id="nickname" name="nickname"
												value="${list.nickname }" readonly
												class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">휴대폰번호</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="text" id="phone" name="phone" readonly
												value="${list.phone }"
												class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">이메일</div>
										<div class="col-lg-6 col-sm- mb-3 mb-sm-0 ">
											<input type="email" id="email" name="email" readonly
												value="${list.email }"
												class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">멍냥이 정보</div>
										<div class="col-lg-10 col-sm- mb-3 mb-sm-0 ">
											<textarea id="petInfo" name="petInfo"
												class="form-control form-control-user" readonly>${list.email }</textarea>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">주소</div>
										<div class="col-lg-10 col-sm- mb-3 mb-sm-0 ">
											<input type="text" id="address" name="address" readonly
												value="${list.address }"
												class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">권한</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<select class="form-control" id="role" name="role">
												<option selected>${list.role }</option>
												<option value="USER">USER</option>
												<option value="ADMIN">ADMIN</option>
											</select>
										</div>
									</div>

									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">휴면상태</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<select class="form-control" id="state" name="state">
												<option selected>${list.state }</option>
												<option value="ON">ON</option>
												<option value="OFF">OFF</option>
												<!-- off가 휴면상태 입니다 -->
											</select>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">리뷰포인트</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="text" id="reviewPoint" name="reviewPoint"
												value="${list.reviewPoint }"
												class="form-control form-control-user">
										</div>
										<!-- off가 휴면상태 입니다 -->
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">회원등급</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<select class="form-control" id="grade" name="grade">
												<option selected>${list.grade }</option>
												<option value="병아리">병아리</option>
												<option value="강아지">강아지</option>
												<option value="소">소</option>
												<option value="호랑이">호랑이</option>
											</select>
										</div>
									</div><br>
									<input type="hidden" id="password" name="password"
										value="${list.password }">
									<button type="submit" onclick=""
										class="btn btn-danger btn-md btn-user btn-block"
										style="background-color: red; color: rgb(255, 255, 255);">
										<i class="fas fa-user-cog"></i>&nbsp;수정하기
									</button>

									<button class="btn btn-md mr-5 btn-md btn-user btn-block"
										type="button" onclick="location.href='memberList.do'"
										style="background-color: rgb(255, 190, 83); color: rgb(255, 255, 255);">
										<i class="fas fa-list"></i>&nbsp; 맴버리스트 보기
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 수정 실패 모달 -->
	<div class="modal fade" id="confirm" role="dialog"
		style="z-index: 100000">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">개껌장터 사용자알림</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-body">
					<p>message</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning btn-user btn-block"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
