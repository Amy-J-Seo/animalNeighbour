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
	
	
	
	//메시지 보내기
	function updateSales(n) {
		frm1.ohNo.value=n;
		frm1.submit();
		//location.href='updateSales.do';
	}
	
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
				<!-- 댓글 입력 -->
				<div class="card mb-2">
					<div class="card-header bg-light">
					        <i class="fa fa-comment fa"></i> REPLY
					</div>
					<div class="card-body">
						<form action="commentInsert.do" method="post">
							<ul class="list-group list-group-flush">
							    <li class="list-group-item">
								<div class="form-inline mb-2">
									<i class="fas fa-cat"></i>&nbsp;&nbsp;
									
								</div>
								<input type="hidden" id="cMainNum" name="cMainNum" value="${item.ohNo }">
								<textarea class="form-control" id="cContent" name="cContent" rows="3"></textarea>
								<button type="submit" class="btn btn-dark mt-3">post reply</button>
							    </li>
							</ul>
						</form>
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
					<input type="button" id="deleteBtn" class="btn btn-danger" value="글 삭제하기" onclick="confirmDel(${item.ohNo})" />
					<input type="button" id="updateBtn" class="btn btn-warning" value="메시지 보내기" onclick="updateSales(${item.ohNo})" />
				<%-- </c:if> --%>
			</div>
		
			
		</div>
		
		<form id="frm" name="frm" action="deleteSales.do" method="post">
			<input type= "hidden" id="sNo" name="sNo">
		</form>
		<form id="frm1" name="frm1" action="updateSales.do" method="post">
			<input type= "hidden" id="sNo" name="sNo">
		</form>
		
	</div>
	<!-- /.container-fluid -->
</body>
</html>