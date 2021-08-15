<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 삭제버튼 누르면 alert -->
<script>
	function confirmDel(n) {
	   alert("글을 삭제할까요?");
	    sNo.value= n;
		submit();
	   if(confirm("삭제되었습니다.")){
	    location.href='deleteSales.do';
	   }else{
	    return false;
	   }
	  }
	
	
	function updateSales(n) {
		frm.sNo.value=n;
		frm.submit();
		location.href='updateSales.do';
	}
</script>

<body>

<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >판매상품 상세페이지</h3>
				
			</div>
			<div class="card-body">
				<!-- 여기에 이미지도 넣기 -->
				<div>
					<img src="" alt="제품 상세 이미지" width="100px" height="200px">
				</div>
				<br>
				<p>
				<h6 class="m-0 font-weight-bold text-primary">
					<span>조회 수 : ${list[0].sHit }</span> |
					<span>찜 수 : ${list[0].sLike }</span>
					</h6>
				</p>
				<br />
				<p></p>
				<div class="card shadow mb-4">
				<div class="card-header py-3">${list[0].sTitle }</div>
				<div class="card-body">
				판매자 : ${list[0].mId }<br>
				언제 샀어요? : ${list[0].sPurchasedDate }<br>
				얼마나 썼어요? : ${list[0].sUseDays }<br>
				왜 팔아요?: ${list[0].sReason }<br>
				제품 상태는요? 상세하게 기술해주세요~ : ${list[0].sCondition }<br>
				
				
				</div>
				</div>
				<p></p>
				<!-- 댓글조회 -->
				<div class="card shadow mb-4">
				<div class="card-header py-3">댓글</div>
				<div class="card-body">
					<c:forEach var="list" items="${list }">
						${list.mId }:
						${list.cContents }<br>
					</c:forEach>
				</div>
				</div> 
				
			</div>
			
			<div>
			<!-- To do style again -->
				&nbsp;&nbsp;&nbsp;<button class="btn btn-secondary" style="float: right;" onclick="location.href='home.do'">To Main</button> &nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;<button class="btn btn-secondary" style="float: right;" onclick="location.href='salesListAll.do'">To List</button>&nbsp;&nbsp;&nbsp;
			</div>
			<br>
			<div align="center">
				<!-- 게시글 삭제, 수정 버튼 -->
				<!-- 삭제, 수정은 게시글 작성자만 볼 수 있게 c:if써야합니다~ -->
				<%-- <c:if test="${list[0].mId eq '로그인된mid' }"> --%>
					<input type="button" id="deleteBtn" class="btn btn-danger" value="글 삭제하기" onclick="confirmDel(${list[0].sNo})" />
					<input type="button" id="updateBtn" class="btn btn-warning" value="글 수정하기" onclick="updateSales(${list[0].sNo})" />
				<%-- </c:if> --%>
			</div>
		</div>
		
		<form id="frm" name="frm" method="post">
			<input type= "hidden" id="sNo" name="sNo">
		</form>
		
	</div>
	<!-- /.container-fluid -->
</body>
</html>