<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<head>
		<title>회원가입</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- jQuery -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<!-- iamport.payment.js -->

		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">

			// < !--필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수-- >

			function checkValue() {
				if (!document.frm.mId.value) {
					alert("아이디를 입력하세요.");
					return false;
				}

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

			function winopen() {
				window.open("idCheckForm.do", "아이디 중복 체크", "width=400, height=250");
			}

			function winopen1() {
				frm = document.getElementById('frm');
				window.open("", "a", "width=600, height=600");
				frm.action = "registerCheck.do";
				frm.method = "post";
				frm.submit();
			}
			/* 다음 주소 연동 */
			function execution_daum_address() {
				new daum.Postcode({
					oncomplete: function (data) {
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
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== '' && data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							addr += extraAddr;
						} else {
							addr += ' ';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						$("#address1").val(data.zonecode);
						//$("[name=memberAddr1]").val(data.zonecode); // 대체가능
						$("#address2").val(addr);
						//$("[name=memberAddr2]").val(addr); // 대체가능
						// 커서를 상세주소 필드로 이동한다.
						$("#address3").attr("readonly", false);
						$("#address3").focus();

					}
				}).open();
			}
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
						alert("이메일 전송되었습니다.")
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
								<div class="col-lg-8 col-sm-4 mb-3 mb-sm-0">
									<img src="img/1market.png" style="width: 70px; height: 70px;">
									<p class="h3" style="color: rgb(255, 190, 83); font-weight: 900;">회원가입</p>

									<br>
									<form id="frm" name="frm" action="registerCheck.do" target="a"
										 method="post" onsubmit="return checkValue()">
										<div class="form-group row">
											<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">아이디</div>
											<div class="col-lg-5 col-sm- mb-3 mb-sm-0 ">
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
											<div class="col-lg-5 col-sm- mb-3 mb-sm-0 ">
												<input type="password" id="password" name="password" placeholder="비밀번호"
													required="required" class="form-control form-control-user">
											</div>
											<div class="col-lg-4 col-sm- mb-3 mb-sm-0 ">
												<input type="password" id="passwordok" name="passwordok"
													placeholder="비밀번호 확인" class="form-control form-control-user">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">이 름</div>
											<div class="col-lg-5 col-sm- mb-3 mb-sm-0 ">
												<input type="text" id="mName" name="mName" placeholder="이름"
													required="required" class="form-control form-control-user">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">닉네임</div>
											<div class="col-lg-5 col-sm- mb-3 mb-sm-0 ">
												<input type="text" id="nickname" name="nickname" placeholder="닉네임"
													required="required" class="form-control form-control-user">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">휴대폰번호</div>
											<div class="col-lg-2 col-sm- mb-1 mb-sm-0 ">
												<input type="text" id="phone1" name="phone1" maxlength="3" pattern="^01[0-9]{1}"
													required="required" class="form-control form-control-user"
													onkeyup="next(this.value,3,'phone2');">
											</div>
											<div class="col-lg-2 col-sm- mb-1 mb-sm-0 ">
												<input type="text" id="phone2" name="phone2" maxlength="4"pattern="[0-9]{4}"
													required="required" class="form-control form-control-user"
													onkeyup="next(this.value,4,'phone3');">
											</div>
											<div class="col-lg-2 col-sm- mb-1 mb-sm-0 ">
												<input type="text" id="phone3" name="phone3" maxlength="4"pattern="[0-9]{4}"
													required="required" class="form-control form-control-user">
											</div>

										</div>



										<div class="form-group row">
											<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">이 메 일</div>
											<div class="col-lg-5 col-sm- mb-3 mb-sm-0 ">
												<input type="email" id="inputEmailForm" name="email" placeholder="이메일"
													required="required" class="form-control form-control-user">
											</div>
											<div class="col-lg-3 col-sm- mb-3 mb-sm-0 ">
												<button onclick="emailAuthentication()" id="eamilAuthBtn"
													class="btn btn-warning btn-user btn-block">인증메일보내기</button>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">이메일인증</div>
											<div class="col-lg-3 col-sm-3 mb-3 mb-sm-0 ">
												<input type="text" id="inputAuthCode" name="authCode"
													placeholder="인증번호입력" class="form-control form-control-user"
													disabled="disabled" required="required">
											</div>
											<span id="mail_check_input_box_warn"></span>
											<div class="col-lg-3 col-sm- mb-3 mb-sm-0 ">
												<button onclick="authCodeCheck()" id="authCodeCheckBtn"
													class="btn btn-warning btn-user btn-block"
													disabled="disabled">인증하기</button>
											</div>
										</div>
										<input type="hidden" name="authPass" id="authPass">



										<div class="form-group row">
											<div class="col-lg-2 col-sm- mb-3 mb-sm-0 ">멍냥이 정보</div>
											<div class="col-lg-10 col-sm- mb-3 mb-sm-0 ">
												<textarea id="petInfo" name="petInfo"
													class="form-control form-control-user"
													placeholder="멍냥이 정보를 입력해보아요."></textarea>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-2 col-sm-2 mb-2 mb-sm-0 ">주 소</div>
											<div class="col-lg-5 col-sm-3 mb-3 mb-sm-0 ">
												<input type="text" id="address1" name="address1" readonly="readonly"
													class="form-control form-control-user" placeholder="우편번호">
											</div>
											<div class="btn btn-warning btn-user btn-block col-lg-4 col-sm-3 mb-2 mb-sm-0 address_button"
												onclick="execution_daum_address()">
												<span>우편번호찾기</span>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-2 col-sm-2 mb-2 mb-sm-0 "></div>

											<div class="col-lg-5 col-sm-6 mb-3 mb-sm-0 ">
												<input type="text" id="address2" name="address2" readonly="readonly"
													class="form-control form-control-user" placeholder="주소">
											</div>
											<div class="col-lg-4 col-sm-6 mb-3 mb-sm-0 ">
												<input type="text" id="address3" name="address3" readonly="readonly"
													class="form-control form-control-user" placeholder="상세주소">
											</div>
										</div>
										<br> <br>



										<div class="custom-control custom-checkbox col-lg-6 col-sm-6 mb-3 mb-sm-0 ">
											<h6>
												<p style="color: rgb(255, 190, 83); font-weight: 900;">
													<label> <input type="checkbox" id="admit" name="admit"
															required="required">이용약관동의(필수)
													</label><br> <label> <input type="checkbox" id="admit" name="admit"
															required="required">이용약관동의(필수)
													</label><br> <label> <input type="checkbox" id="admit" name="admit"
															required="required">개인정보 수집 이용동의(필수)
													</label><br> <label> <input type="checkbox" id="admit" name="admit"
															required="required">본인은 만 14세 이상입니다.
													</label> <br>
												</p>
											</h6>
										</div>
										<button type="submit" onclick="" class="btn btn-warning btn-user btn-block">회원
											가입</button>
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