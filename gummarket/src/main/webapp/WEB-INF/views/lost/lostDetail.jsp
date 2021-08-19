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
	    frm.lNo.value= n;
	    console.log(n);
		frm.submit();
	  
	   }else{
	    return false;
	   }
	  }
	
	
	
	//글 수정
	function updateSales(n) {
		frm1.lNo.value=n;
		frm1.submit();
		//location.href='updateSales.do';
	}
	
	function ohItemUpdate(no){
		location.href = 'lostItemUpdateForm.do?ohNo='+no;
	}
	
</script>

<body>

<!-- Begin Page Content -->
	<div class="container-fluid" >
		<!-- DataTales Example -->
		<div class="card shadow mb-4"  style="margin-left: 4rem; margin-right: 4rem">
			<div class="card-header py-3">
				
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >${item.lTitle }
				 <!-- 로그인세션확인해서 본인만 글 수정하고 삭제 가능하도록 -->
				
					<button class="btn btn-sm" id="deleteBtn" onclick="confirmDel('${item.lNo}')" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255); float:right;"><i class="far fa-trash-alt"></i> 글 삭제</button>
					<button class="btn btn-sm mr-3" id="updateBtn" onclick="ohItemUpdate('${item.lNo}')" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;"><i class="far fa-edit"></i> 글 수정</button>
				 
				 </h3>	
			</div>
			<div class="card-body">
				
	
				<div class="card shadow mb-4">
				<div class="card-header py-3">${item.lTitle }</div>
				<div class="card-body">
				이름? : ${item.lName  }<br>
				성별? : ${item.lGender }<br>
				나이? : ${item.lAge  }<br>
				언제?: ${item.lWhen }<br>
				어디서? : ${item.lWhere }<br>
				
				</div>
				</div>
						<!-- 댓글조회 -->
				<div class="card shadow mb-4">
				<div class="card-header py-3">댓글</div>
				<div class="card-body">
				<!-- 댓글 보기+ 수정 , 삭제 버튼 -->
					<div id="show"></div>
				
					<%-- <c:forEach var="list" items="${list }">
						${list.cmId }:
						${list.cContents }<br>
					</c:forEach> --%>
				</div>
				</div> 
				<!-- 댓글 입력 -->
				<div class="card mb-2">
					<div class="card-header bg-light">
					     <i class="fa fa-comment fa"></i> REPLY
					</div>
					<div class="card-body">
						<form id="reply" action="CommentInsertServ" method="post">
							<ul class="list-group list-group-flush">
							    <li class="list-group-item">
							 
								<input type="hidden" id="ohNo" name="lNo" value="${item.lNo }">
								<textarea class="form-control" id="lTitle" name="lTitle" rows="3"></textarea>
								<button type="submit" class="btn btn-dark mt-3">post reply</button>
							    </li>
							</ul>
						</form>
					</div>
				</div>
			</div>
			
			
			
			
			
			<br>
			<div class="pb-3 mx-auto"  style="align-items: center;">
				<!-- To do style again -->
				<!-- Like btn form -->
				<form id="likeFrm" name="likeFrm" action="UpdSalesLikeServlet" method="post">
					<input type="hidden" id="mainNo" name="mainNo" value="${item.lNo }">
					
				
				<button class="btn btn-md mr-5"  onclick="location.href='#'" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);"><i class="far fa-credit-card"></i> 메세지 보내기</button>
				<a class="btn btn-danger btn-md" href="#" data-toggle="modal"
					data-target="#reportModal"><i class="fas fa-bullhorn"></i> 신고하기</a>
			
				</form>	
			</div>
			
		
			
		</div>
		
			
		</div>
		
		<form id="frm" name="frm" action="deleteSales.do" method="post">
			<input type= "hidden" id="lNo" name="lNo">
		</form>
		<form id="frm1" name="frm1" action="updateSales.do" method="post">
			<input type= "hidden" id="lNo" name="lNo">
		</form>
		
	</div>
	<!-- /.container-fluid -->
</body>
</html>