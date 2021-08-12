<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${list[0].mId }
	<div align="center">
		<h1>리스트연습</h1>

		<c:forEach var="member" items="${list }">
		멤버아이디: ${member.mId }  <br>
		멤버네임: ${member.mName}  <br>
		멤버닉네임:${member.nickname } <br>
		멤버주소:${member.address } <br>
		멤버전번:${member.phone } <br>
		멤버후기포인트:${member.reviewPoint } <br>
		멤버권한:${member.role } <br>
		</c:forEach>
	</div>
</body>
</html>