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
	    frm.sNo.value= n;
	    console.log(n);
		frm.submit();
	  
	   }else{
	    return false;
	   }
	  }
	
	//글 수정
	function updateSales(n) {
		frm1.sNo.value=n;
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
				
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >${list[0].sTitle }
				 <%-- <c:if test="${session.mId == item.mId}">  --%>
				 <%-- <input type="button" id="deleteBtn" class="btn btn-danger" value="글 삭제하기" onclick="confirmDel(${list[0].sNo})" />
					<input type="button" id="updateBtn" class="btn btn-warning" value="글 수정하기" onclick="updateSales(${list[0].sNo})" /> --%>
					<button class="btn btn-sm" id="deleteBtn" onclick="confirmDel(${list[0].sNo})" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255); float:right;"><i class="far fa-trash-alt"></i> 글 삭제</button>
					<button class="btn btn-sm mr-3" id="updateBtn" onclick="updateSales(${list[0].sNo})" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;"><i class="far fa-edit"></i> 글 수정</button>
				 <%-- </c:if> --%>
				 </h3>	
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
				<p></p>
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
				<!-- 좋아요버튼 -->
				
				
				<!-- 댓글조회 -->
				<div class="card shadow mb-4">
				<div class="card-header py-3">댓글</div>
				<div class="card-body">
				<!-- 댓글 보기+ 수정 , 삭제 버튼 -->
					<c:forEach var="list" items="${list }">
						${list.cmId }:
						${list.cContents }<br>
					</c:forEach>
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
									<span> ${nickname }</span>
								</div>
								<input type="hidden" id="cMainNum" name="cMainNum" value="${list[0].sNo }">
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
					<%-- <input type="button" id="deleteBtn" class="btn btn-danger" value="글 삭제하기" onclick="confirmDel(${list[0].sNo})" />
					<input type="button" id="updateBtn" class="btn btn-warning" value="글 수정하기" onclick="updateSales(${list[0].sNo})" /> --%>
				<%-- </c:if> --%>
			</div>
		
			
		</div>
		
		<form id="frm" name="frm" action="deleteSales.do" method="post">
			<input type= "hidden" id="sNo" name="sNo">
		</form>
		<form id="frm1" name="frm1" action="updateSalesForm.do" method="post">
			<input type= "hidden" id="sNo" name="sNo">
		</form>
		
	</div>
	<!-- /.container-fluid -->
</body>
</html>