<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기 페이지</title>
<!-- 삭제버튼 누르면 alert -->
<script>
	function confirmDel(n) {
	   alert("글을 삭제할까요?");
	   if(confirm("삭제되었습니다.")){
	    frm.sNo.value= n;
		frm.submit();
	    location.href='deleteSales.do';
	   }else{
	    return false;
	   }
	  }
</script>
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
	<!-- 게시글 삭제 버튼 -->
	<!-- 삭제는 게시글 작성자만 볼 수 있게 c:if써야합니다~ -->
	<input type="button" id="deleteBtn" class="btn btn-danger" value="글 삭제하기" onclick="confirmDel()" />
 </div>
 	<form id="frm" name="frm" action="deleteSales.do" method="post">
			<input type= "hidden" id="sNo" name="sNo">
		</form>
</body>
</html>