<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkok(){
		opener.parent.location="loginForm.do";
		window.close();
	}
</script>
</head>
<body>
	<div id="wrap">
        <br><br>
        <font color="blue">가입을 축하드립니다.</font>
        
        <br>
        <input type="button" value="확인" onclick="checkok()">
    </div>
</body>
</html>