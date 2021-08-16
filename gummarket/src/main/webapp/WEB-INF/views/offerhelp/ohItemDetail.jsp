<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- like button css -->
<style>
	
</style>



<script>
	
	//삭제버튼 누르면 alert
	function confirmDel(n) {
	   alert("글을 삭제할까요?");
	   console.log(n);
	   if(confirm("삭제되었습니다.")){
	    frm.ohNo.value= n;
	    console.log(n);
		frm.submit();
	  
	   }else{
	    return false;
	   }
	  }
	
	//글 수정
	function updateSales(n) {
		frm1.ohNo.value=n;
		frm1.submit();
		//location.href='updateSales.do';
	}
	
	
	//좋아요 버튼js
	
</script>

<body>

<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >멍냥케어 상세페이지</h3>
				
			</div>
			<div class="card-body">
				
	
				<div class="card shadow mb-4">
				<div class="card-header py-3">${item.ohTitle }</div>
				<div class="card-body">
				제목 : ${item.ohCategory  }<br>
				닉네임? : ${item.mId }<br>
				나의 특징? : ${item.ohHistory  }<br>
				나의 동네?: ${item.ohAddress }<br>
				무슨 도움? : ${item.ohDetails }<br>
				
				</div>
				</div>
				
			<!-- To do style again -->
				&nbsp;&nbsp;&nbsp;<button class="btn btn-secondary" style="float: right;" onclick="location.href='home.do'">To Main</button> &nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;<button class="btn btn-secondary" style="float: right;" onclick="location.href='salesListAll.do'">To List</button>&nbsp;&nbsp;&nbsp;
			</div>
			<br>
			<div align="center">
				<!-- 게시글 삭제, 수정 버튼 -->
				<!-- 삭제, 수정은 게시글 작성자만 볼 수 있게 c:if써야합니다~ -->
				<%-- <c:if test="${list[0].mId eq '로그인된mid' }"> --%>
					<input type="button" id="deleteBtn" class="btn btn-danger" value="글 삭제하기" onclick="confirmDel()" />
					<input type="button" id="updateBtn" class="btn btn-warning" value="메세지 보내기" onclick="updateSales()" />
				<%-- </c:if> --%>
			</div>
		
	<!-- /.container-fluid -->
</body>
</html>