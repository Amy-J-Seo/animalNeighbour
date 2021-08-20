<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
		<script type="text/javascript">

	alert("인증메일 전송 완료");
	opener.document.frm.inputEmailForm.readOnly = true; 
	opener.document.frm.eamilAuthBtn.readOnly = true;
	opener.document.frm.authCodeCheckBtn.disabled = false;
	opener.document.frm.inputAuthCode.disabled = false;
	self.close();
	opener.close();

</script>
<body>
</body>
</html>