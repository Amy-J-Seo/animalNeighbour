<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email 확인</title>
</head>
<%! String email = ""; %>
<% email = request.getParameter("email"); %>

<script type="text/javascript">

	function cancel() {
		self.close();
	}

	function requestAuthEamil(){
		var url = "requestAuthEmail.do?email=" + "<%=email%>";
		open(url, "authEmailSend",
				"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	}
	
</script>
<body>

	<c:set var="emailDupleCheckResult" value="${emailDupleCheckResult }" />
	<c:choose>
		<c:when test="${emailDupleCheckResult == 'useable' }">
			<a>인증메일을 전송중입니다. 팝업창을 허용해주세요.</a>
			<script type="text/javascript">requestAuthEamil();</script>
		</c:when>
		<c:otherwise>
			<h4> ${email }은 사용 불가능한 email입니다.</h4>
		</c:otherwise>
	</c:choose>
	<br><br>
	<button type="button" onclick="cancel()" class="btnCancel">확인</button>

</body>
</html>