<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기 페이지</title>
</head>
<body>
 <div align="center">
 	<h5>제품 상세보기페이지</h5>
 	<div align="center">
		<h5>게시글 한 건 조회</h5>
		게시글이름${list[0].sTitle } 
		판매자: ${list[0].mId }
	</div>
	<div align="center">
		<h5>댓글조회</h5>
		<c:forEach var="list" items="${list }">
			${list.mId }:
			${list.cContents }<br>
		</c:forEach>
	</div>
 </div>
</body>
</html>