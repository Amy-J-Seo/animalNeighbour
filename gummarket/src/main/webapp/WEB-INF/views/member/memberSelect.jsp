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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
   				$("#member").modal("show");
   			}
   		}
   	})
   	
   	function execution_daum_address(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    addr += extraAddr;
	                } else {
	                	 addr += ' ';
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                 $("#address1").val(data.zonecode);
            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            $("#address2").val(addr);
            //$("[name=memberAddr2]").val(addr);            // 대체가능
	                // 커서를 상세주소 필드로 이동한다.
            $("#address3").attr("readonly",false);
            $("#address3").focus();            
		 
		        }
		    }).open();   
		}
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
								<form id="frm" name="frm" action="userUpdate.do" method="post">

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
												value="${list.nickname }"
												class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">휴대폰번호</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<input type="text" id="phone" name="phone"
												value="${list.phone }"
												class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">이메일</div>
										<div class="col-lg-6 col-sm- mb-3 mb-sm-0 ">
											<input type="email" id="email" name="email"
												value="${list.email }"
												class="form-control form-control-user">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">멍냥이 정보</div>
										<div class="col-lg-10 col-sm- mb-3 mb-sm-0 ">
											<textarea id="petInfo" name="petInfo" style="resize: none;" rows="5"
												class="form-control form-control-user">${list.email }</textarea>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm-2 mb-2 mb-sm-0 ">주 소</div>
										<div class="col-lg-10 col-sm-6 mb-3 mb-sm-0 " align="left">${list.address}</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm-2 mb-2 mb-sm-0 "></div>
										<div class="col-lg-5 col-sm-3 mb-3 mb-sm-0 ">
											<input type="text" id="address1" name="address1"readonly="readonly"
												class="form-control form-control-user"placeholder="우편번호">
										</div>
										<div class="btn btn-warning btn-user btn-block col-lg-4 col-sm-3 mb-2 mb-sm-0 address_button"
										 onclick="execution_daum_address()">
											<span>우편번호수정하기</span>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-2 col-sm-2 mb-2 mb-sm-0 "></div>

										<div class="col-lg-5 col-sm-6 mb-3 mb-sm-0 ">
											<input type="text" id="address2" name="address2"readonly="readonly"
												class="form-control form-control-user"placeholder="주소">
										</div>
										<div class="col-lg-4 col-sm-6 mb-3 mb-sm-0 ">
											<input type="text" id="address3" name="address3"readonly="readonly"
												class="form-control form-control-user"placeholder="상세주소">
										</div>
									</div>
									<div class="form-group row" style="display: none">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">권한</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<select class="form-control" id="role" name="role">
												<option selected>${list.role }</option>
												<option value="USER">USER</option>
												<option value="ADMIN">ADMIN</option>
											</select>
										</div>
									</div>

									<div class="form-group row" style="display: none">
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
												value="${list.reviewPoint }" readonly
												class="form-control form-control-user">
										</div>
									</div>
										<!-- off가 휴면상태 입니다 -->
										<div class="form-group row">
										<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">회원등급</div>
										<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
											<select class="form-control" id="buyPoint" name="buyPoint">
												<option selected>${list.buyPoint }</option>
												<option value="1" disabled>1</option>
												<option value="2" disabled>2</option>
											</select>
										</div>
									</div>
									<br>
									<input type="hidden" id="password" name="password"
										value="${list.password }">
									<button type="submit" onclick=""
										class="btn btn-danger btn-md btn-user btn-block"
										style="background-color: red; color: rgb(255, 255, 255);">
										<i class="fas fa-user-cog fa-2x"></i>&nbsp;수정하기
									</button>

									<button class="btn btn-md mr-5 btn-md btn-user btn-block"
										type="button" onclick="location.href='home.do'"
										style="background-color: rgb(255, 190, 83); color: rgb(255, 255, 255);">
										<i class="fas fa-user-cog fa-2x"></i>&nbsp; 홈으로가기
									</button>
								</form>
								<br>
								<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
									<a href="withdrawalForm.do?mId=${list.mId }">회원탈퇴하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 수정 실패 모달 -->
	<div class="modal fade" id="member" role="dialog"
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
