<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm</title>
</head>
<body>
	<div align="center">
		<form id="frm" action="home.do" method="post">
			<h2>Login</h2>
			<table border="1">
				<tr>
					<th>로 그 인</th>
					<td><input type="text" id="id" name="id" class="id"
						placeholder="ID" required="required"></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" id="password" name="password"
						class="pw" placeholder="PW" required="required"></td>
				</tr>
			</table>
			<div>
				<input type="submit" value="로그인">
			</div>
		</form>
	</div>
</body>
</html>