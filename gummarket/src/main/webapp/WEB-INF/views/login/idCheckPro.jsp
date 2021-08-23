<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="co.animal.prj.member.serviceImpl.MemberServiceImpl" %>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>idCheck</title>
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.css" rel="stylesheet">
<style type="text/css">

	@font-face {
	    font-family: 'SeoulNamsanM';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	@font-face {
	    font-family: 'Cafe24SsurroundAir';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
	    font-family: 'Cafe24Ssurround';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="font-family: SeoulNamsanM;"> 
	<div align= "center" class="p-5">
	<div class="col-lg-12 col-sm-9 mb-8 mb-sm-0">
	<jsp:useBean id="dao" class="co.animal.prj.member.serviceImpl.MemberServiceImpl"/>
	<jsp:setProperty property="*" name="dao"/>
	<% //1) 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기 위함
		String mId=request.getParameter("mId"); 
		int cnt= dao.checkId(mId); 
		out.println("<p class='h3'> 입력 ID :" + mId + "</p>");
		if(cnt==0){ 
			out.println("<p class='h5'>사용 가능한 아이디입니다.</p>"); 
			out.println("<a class='h4' href='javascript:apply(\"" + mId + "\")'>사용하기</a>"); 
	%>
		<script> 
		function apply(mId){ 
		//2) 중복확인 id를 부모창에 적용 
		//부모창 opener 
			opener.document.frm.mId.value=mId; 
			window.close(); //창닫기 
		}//apply () end 	
	</script> 
	
	<% 
	}else{ 
		out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>"); 
		}//if end 
	%> 
	<br>
	<br>	
	<hr> 
	<button type="button" onclick="javascript:history.back()" class="btn btn-warning btn-user btn-block">다시시도</button>
	<br>
	<button type="button" onclick="javascript:window.close()" class="btn btn-warning btn-user btn-block">창닫기</button>
	</div>
	</div> 
</body>
</html>