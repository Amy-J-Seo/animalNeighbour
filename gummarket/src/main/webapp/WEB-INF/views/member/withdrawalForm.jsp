<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
								<div class="continer my-auto pb-3">

									<p class="h3" align="left"
										style="color: rgb(255, 190, 83); font-weight: 900;">회원탈퇴안내</p>
									<hr>
									<p align="left">고객님께서 회원 탈퇴를 원하신다니 저희 개껌장터의 서비스가 많이 부족하고 미흡했나봅니다.
									앞으로 고객님의 불편함을 해결해 나가는 개껌장터가 되겠습니다. 감사합니다.</p>
								</div>
								<form id="frm" name="frm" action="withdrawal.do" method="post">
									<input type="password" id="password" name="password"
										placeholder="비밀번호확인" required="required"
										class="form-control form-control-user"> <br>
										
									<input type="hidden" id="mId" name="mId" value="${list.mId }">
									<input type="hidden" id="mName" name="mName"value="${list.mName }"> 
									
									<input type="hidden" id="nickname" name="nickname" value="${list.nickname }">
									<input type="hidden" id="phone" name="phone"value="${list.phone }">
									<input type="hidden" id="email" name="email" value="${list.email }">
									
									<input type="hidden" id="address" name="address"value="${list.address }">
									<input type="hidden" id="role" name="role" value="${list.role }">
									 <input type="hidden" id="petInfo" name="petInfo"value="${list.petInfo }">
									<!-- 회원상태 휴면으로 변경 -->
									<input type="hidden" id="state" name="state" value="OFF">
									<input type="hidden" id="reviewPoint" name="reviewPoint"value="0"> 
									<input type="hidden" id="buyPoint"name="buyPoint" value="0">
									
									
									<input type="submit" value="탈퇴하기"class="btn btn-warning btn-user btn-block">
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