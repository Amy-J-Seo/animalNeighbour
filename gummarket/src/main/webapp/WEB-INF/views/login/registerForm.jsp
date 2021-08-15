<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
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

	<div align="center">
		<div><h2>회원가입</h2></div>
		<form id="frm" name="frm" action="signUpCheck.do" target="a"
			method="post" onsubmit="return checkValue()">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" id="mId" name="mId" placeholder="아이디"
						required="required"></td>

					<td>
						<button onclick="winopen()">중복체크</button>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="password" name="password"
						placeholder="비밀번호" required="required"></td>
					<td><input type="password" id="passwordok" name="passwordok"
						placeholder="비밀번호 확인"></td>
				</tr>
				<tr>
					<th>이 름</th>
					<td><input type="text" id="mName" name="mName" placeholder="이름"
						required="required"></td>
				</tr>
				<tr>
					<th>닉 네 임</th>
					<td><input type="text" id="nickName" name="nickName"
						placeholder="닉네임" required="required"></td>
				</tr>
				<tr>
					<th>휴 대 번 호</th>
					<td><input type="text" id="phone" name="phone"
						placeholder="휴대번호" required="required"></td>
				</tr>
				<tr>
					<th>이 메 일</th>
					<td><input type="email" id="email" name="email"
						placeholder="이메일" required="required"></td>
				</tr>
				<tr>
					<th>멍냥이 정보</th>
					<td><input type="text" id="petInfo" name="petInfo"></td>
				</tr>
				<tr>
					<th>주 소</th>
					<td><input type="text" id="address" name="address"></td>
				</tr>
			</table>

			<label> <input type="checkbox" id="admit" name="admit">이용약관동의(필수)
			</label><br>
			 <label> <input type="checkbox" id="admit"
				name="admit">이용약관동의(필수)
			</label><br>
			 <label> <input type="checkbox" id="admit"
				name="admit">이용약관동의(필수)
			</label><br>
			 <label> <input type="checkbox" id="admit"
				name="admit">이용약관동의(필수)
			</label> <br>
			<button type="submit" onclick="winopen1()">회원 가입</button>
		</form>
	</div>
</body>

</html>