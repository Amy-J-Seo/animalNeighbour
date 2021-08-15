<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="co.animal.prj.member.serviceImpl.MemberServiceImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 

	<jsp:useBean id="dao" class="co.animal.prj.member.serviceImpl.MemberServiceImpl"/>
	<jsp:setProperty property="*" name="dao"/>
	<% //1) 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기 위함
		String mId=request.getParameter("mId"); 
		int cnt= dao.checkId(mId); 
		out.println("입력 ID : <strong>" + mId + "</stong>");
		if(cnt==0){ 
			out.println("<p>사용 가능한 아이디입니다.</p>"); 
			out.println("<a href='javascript:apply(\"" + mId + "\")'>[적용]</a>"); 
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
		
	<hr> 
	<a href="javascript:history.back()">[다시시도]</a> 
	&nbsp; &nbsp; 
	<a href="javascript:window.close()">[창닫기]</a> 
</body>
</html>