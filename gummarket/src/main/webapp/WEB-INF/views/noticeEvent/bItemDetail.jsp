<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움찾아요 상세보기</title>

<script type="text/javascript">

$(document).ready(function () {
    //Like btn function
		$('#likeFrm').on('submit', function (e) {
    		
    		e.preventDefault();
	        
    		$.ajax({
	            url: $('#likeFrm').attr('action'), //'../AddItemServlet.do'
	            method: 'post',
	            //data: $('#likeFrm').serialize(),
	            data: {mainNo: $('#likeFrm #mainNo').val()},
	            success: function(response){
	            	alert("게시글 좋아요 눌렀어요 :) ");
    				$('#likeBtn').css("background-color", "RGB(146, 168, 209)");
    				$('#likeText').html(" Liked It!");
    				$('#likeBTNicon').css("color", "#F7CAC9");
	            	let a = parseInt($('#likeNum').text())+1;
	            	$('#likeNum').html('<i class="far fa-thumbs-up"></i> '+ a);
	            	
	            },
	            error: function (reject) {
	                console.log(reject);
	            }
	    }); 
    });
});


function bItemUpdate(n) {
	bUpdate.bNo.value=n;
	console.log(bUpdate.bNo.value);
	
	bUpdate.submit();
}

function bItemDelete(n) {	
	  let result = confirm(" 정말 삭제하시겠습니까?? ");
	  if(result) {
		  bDelete.bNo.value=n;
		  bDelete.submit();
	 	 }
	}
</script>

</head>
<body id="page-top">
<!-- Begin Page Content -->
	<div class="container-fluid">
	<div class="continer my-auto pl-4 pb-3">
			<p id="itemCategory" class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">
			<c:if test="${item.bCategory =='event' }">
			Event
			</c:if>
			<c:if test="${item.bCategory =='notice' }">
			Notice
			</c:if>
			
			</p>
	</div>
		<!-- DataTales Example -->
		<div class="card shadow mt-4 mb-4" style="margin-left: 4rem; margin-right: 4rem">
			<div class="card-header py-3">
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >${item.bTitle }
				<!-- 로그인세션확인해서 본인만 글 수정하고 삭제 가능하도록 -->
				 </h3>
				 <c:if test="${session.role == 'admin' }">
				<button class="btn btn-sm"  onclick="bItemDelete(${item.bNo })" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255); float:right;">
				<i class="far fa-trash-alt"></i> 글 삭제</button>
				 <button class="btn btn-sm mr-3"  onclick="bItemUpdate(${item.bNo })" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
				 <i class="far fa-edit"></i> 글 수정</button>
				</c:if>			
			</div>
			<div class="card-body">
				<div style="width:100%" class="d-flex justify-content-center">
				<!-- img class card-img 하고 싶은데 그러면 풀 화면일때 이미지가 너무 커서 줄이려고 해 봤지만 ㅠㅠ 안되네요... -->
					<img class="card" src="img/event/개껌장터.jpg" width="350px" height="600px">
				</div>
				<br>
				<br />
				<hr>				
				<div class="card-header py-3">${item.bCategory } : ${item.bTitle }
					<c:if test="${item.bLike > 0 }">
						<span class="pr-3" style="float:right;" id="likeNum"><i class="far fa-thumbs-up"></i> ${item.bLike}</span>
					</c:if>
				</div>
				
				<div class="card-body">
				<div>
				${item.bContents }
				</div>
				
				</div>
				</div>
				<p></p>
				
				<div class="pb-3 mx-auto"  style="align-items: center;">
				
				
				<!-- Like btn form -->
				<form id="likeFrm" name="likeFrm" action="UpdateLikeServlet" method="post">
					<input type="hidden" id="mainNo" name="mainNo" value="${item.bNo }">
					
				<button class="btn btn-md mr-5" type="submit" id="likeBtn" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);">
				<i class="fab fa-gratipay" id="likeBTNicon"></i><span id="likeText"> 좋아요!</span></button>
				<button class="btn btn-md mr-5" type="button" onclick="location.href='eventMain.doBB'" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
				<i class="fas fa-undo-alt"></i> 메인으로</button>
				</form>	
				
				</div>
				
			</div>
			
			
		</div>
	<!-- /.container-fluid -->
	

	<!-- bItem 메인 글 수정, 삭제 폼 -->
		<form id="bUpdate" name="bUpdate" action="bItemUpdateForm.doBB" method="post">
			<input type="hidden" id="bNo" name="bNo">
		</form>

		<form id="bDelete" name="bDelete" action="bItemDelete.doBB" method="post">
			<input type="hidden" id="bNo" name="bNo">
			<input type="hidden" id="bCategory" name="bCategory" value="${item.bCategory}">
		</form>
	<!--End of bItem 메인 글 수정, 삭제 폼 -->
	
	<!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
	 <!-- End of Scroll to Top Button-->
	 
	
	
	
</body>
</html>