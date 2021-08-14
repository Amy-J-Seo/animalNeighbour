<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<script type="text/javascript">
	<!-- 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수 -->
		function checkValue(){
			if(!document.frm.id.value){
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
			window.open("idCheckForm.lo", "아이디 중복 체크", "width=400, height=350");
		}
		
		function winopen1(){
			frm = document.getElementById('frm');
			window.open("", "a", "width=600, height=600");
			frm.action="signUpCheck.lo";
			frm.method="post";
			frm.submit();
		}
	</script>

</head>

<body>

	<div align="center">
		<form class="user" id="frm" name="frm" action="signUpCheck.lo"
			target="a" method="post" onsubmit="return checkValue()">
			<input type="text" id="id" name="id" placeholder="아이디"
				required="required">
			<button onclick="winopen()">중복체크</button><br>
			<input type="password" id="password" name="password"placeholder="비밀번호" required="required"> 
			<br>
			<input type="password" id="passwordok" name="passwordok" placeholder="비밀번호 확인">
			<br>
			 <input type="text" id="name" name="name" placeholder="이름">
			  <br>
			  <input type="number" id="age"name="age" placeholder="나이"><br> 성별: &nbsp;&nbsp; <label>
				<br>
				<input type="radio" id="gender" name="gender" value="남자">남자</label>&nbsp;&nbsp;&nbsp;
			<label>
			<input type="radio" id="gender" name="gender"
				value="여자">여자</label>
				<br>
			<button type="submit" onclick="winopen1()">회원 가입</button>
		</form>
	</div>
</body>

</html>