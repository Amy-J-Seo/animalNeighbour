<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트공지메인</title>

<script type="text/javascript">

$(document).ready(function () {
    //Like btn function
		$('#likeFrm').on('submit', function (e) {
    		
    		e.preventDefault();
	        
    		$.ajax({
	            url: $('#likeFrm').attr('action'), //'../AddItemServlet.do'
	            method: 'post',
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
	                console.error(reject);
	            }
	    }); 
    });
    
    
    //======comments===================
     	console.log(${item.bCategory})
   		//hide comment update field
		$('#showComUpdate').hide();
    	$.ajax({
    		url:'FhCommentsListServlet',
    		method:'post',
    		data:{
    			fhNo:$('#cMainNum').val()
    		},
    		dataType:'json',
    		success: fhCommentsListFnc,
    		error:function(e){
    			console.error(e);
    		}
    	});
    
    		let fields = ['cContents', 'cmId' ];
    		function fhCommentsListFnc(data) {

    		    for (let i = 0; i < data.length; i++) {
    		        const divCase = $('<div />').addClass('d-flex justify-content-between mb-3').attr("id", data[i]['cNo']);
    		        
    		            const divMain = $('<div /> ').addClass('d-flex align-items-center');
    		            let img = $('<img />').attr("src","img/undraw_profile_1.svg").css('width', "2rem").css('height','2rem');
    		            let userName = $('<span />').css("font-size", "1.5rem").addClass("pl-2").text(data[i]['cmId']);
    		            const blankSpace = $('<span />').css("margin-left", "30px").text("   ");
    		            let comment = $('<span />').attr('id', data[i]['cNo']+"selectedComment").css("font-size", "1.5rem").text(data[i]['cContents']);
    		            $(divMain).append(img, userName, blankSpace, comment);
    		           
    		            $(divCase).append(divMain)
    		            
	    		            const btnDiv = $(' <div /> ');
	    		            const delBtn = $('<button />').addClass("btn btn-warning mr-2").css("float", "right").text("Delete");
	    		            const editBtn = $('<button />').addClass("btn btn-warning mr-2").css("float", "right").text("Edit");
	    		            delBtn.click(deleteComment);
	    		            editBtn.click(showUpdateInput);

	    		            btnDiv.append(delBtn, editBtn);
    		            let writer = "${session.mId}";
	    		       if (writer == data[i]['cmId']) {
	    		            $(divCase).append(btnDiv);    		            
    		           	}   
    		        
    		        $('#commentsBody').append(divCase);
    		    }
    		}
    		
    		//댓글 입력 ajax
    		$('#reply').on('submit', function (event) {
    			event.preventDefault();
    			let s = $('#reply').serialize();

    			//폼 전송처리
    			$.ajax({
    				url: 'FhCommentInsertServlet', //='../AddItemServ.do'
    				method: 'post',
    				data: $('#reply').serialize(), //파라미터로 넘김
    				dataType: 'json', //받아오는 값
    				success: addItemFunc,
    				error: function (reject) {
    					console.error(reject);
    				}
    			})
    		})
    		
    
    
});
//=========END of AJAX=============
	
	//comment insert
let fields = ['cmId', 'cContents'];
	//입력처리 후 콜백함수
	function addItemFunc(data) {
	
		const divCase = $('<div />').addClass('d-flex justify-content-between mb-3').attr('id',data.cNo) ;
		//for (let field of fields) {
			const divMain = $('<div /> ').addClass('d-flex align-items-center');
            let img = $('<img />').attr("src","img/undraw_profile_1.svg").css('width', "2rem").css('height','2rem');
            let userName = $('<span />').css("font-size", "1.5rem").text('${mId}');
            const blankSpace = $('<span />').css("margin-left", "30px").text("   ");
            let comment = $('<span />').attr('id', data.cNo+"selectedComment").css("font-size", "1.5rem").text(data['cContents']);
            $(divCase).append(divMain)
            
            const btnDiv = $(' <div /> ');
            const delBtn = $('<button />').addClass("btn btn-warning mr-2").css("float", "right").text("Delete");
            const editBtn = $('<button />').addClass("btn btn-warning mr-2").css("float", "right").text("Edit");
            delBtn.click(deleteComment);
            editBtn.click(showUpdateInput);
            btnDiv.append(delBtn, editBtn);
            
            $(divMain).append(img, userName, blankSpace, comment);
            
            let writer = "${session.mId}";
		       if (writer == data['cmId']) {
		            $(divCase).append(btnDiv);    		            
	           	}   
        
        $('#commentsBody').append(divCase);
	}
	//End of comment insert
	
	//댓글 삭제하기
	function deleteComment(e) {
		
		$.ajax({
			url: 'DeleteFhCommentServlet',
			method:'post',
			data: {
				cNo: $(this).parent().parent().attr('id')
			},
			success: function () {
				e.target.parentNode.parentNode.remove();
			},
			error: function () {
				alert("삭제에서 에러발생!!")
			}
		})
	}
	
	//edit btn-> show input area
	function showUpdateInput(e){
		let modForm = $("#showComUpdate");
		$(this).parent().parent().append(modForm);
		let cNo = $(this).parent().parent().attr('id');// tr의 id값 가져옴~
		let content = $('#'+cNo+'selectedComment').text();
		
		$("#showComUpdate #cUpdated").val(content);
		$("#showComUpdate #cNo").val(cNo);
		modForm.show();
		
	}
	//===end of updateTest??===
	//업데이트 -> 성공! 이름 
	function updateCom(){
		event.preventDefault(); 
		let s = $('#updateRep').serialize();
		//폼 전송처리
		$.ajax({
			url: $('#updateRep').attr('action'), 
			method: 'post',
			data: $('#updateRep').serialize(), //파라미터로 넘김
			dataType: 'json', //받아오는 값
			success: updateFhCommentFnc,
			error: function (reject) {
				console.error(reject);
			}
		})
	}
	//===end of update Comment==
//=======updateCommentFnc callback====
	function updateFhCommentFnc(data){
		        
		$('#'+data.cNo+"selectedComment").text(data['cContents']);
        
		$("#showComUpdate #cUpdated").val("");
		$('#showComUpdate').hide();
	}
//====end of updateComment callback====
		

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
		<!-- DataTables Example -->
		<div class="card shadow mt-4 mb-4" style="margin-left: 4rem; margin-right: 4rem">
			<div class="card-header py-3">
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >${item.bTitle }
				<!-- 로그인세션확인해서 본인만 글 수정하고 삭제 가능하도록 -->
				 </h3>
				 <c:if test="${session.role == 'ADMIN' }">
				<button class="btn btn-sm"  onclick="bItemDelete(${item.bNo })" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255); float:right;">
				<i class="far fa-trash-alt"></i> 글 삭제</button>
				 <button class="btn btn-sm mr-3"  onclick="bItemUpdate(${item.bNo })" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
				 <i class="far fa-edit"></i> 글 수정</button>
				</c:if>			
			</div>
			
			<!-- 본문 -->
			<div class="card-body">
					<div style="width:100%" class="d-flex justify-content-center">
				
					<img class="card" src="img/event/개껌장터.jpg" width="350px" height="600px">
					</div>
					<br>
					<br />
					<hr>				
					<div class="card-header py-3">${item.bCategory } : ${item.bTitle }
						
							<span class="pr-3" style="float:right;" id="likeNum"><i class="far fa-thumbs-up"></i> ${item.bLike}</span>
						
					</div>
					
					<div class="card-body">
					<div>
					${item.bContents }
					</div>
					
					</div>
				</div>
				<!-- 본문 끝 -->
				<p></p>
				<div class="card-body">		    
				    <div class="card-header">
				        <h3>Comments</h3> 
				    </div>
				
				    <div class="card-body" >
				        <div id="commentsBody"></div>
				        
				        <!-- 댓글 입력 -->
					<div class="card mb-2">
					<div class="card-header bg-light">
					     <i class="fa fa-comment fa"></i> Comments
					</div>
					<div class="card-body">
						<form id="reply" action="FhCommentsInsertServlet" method="post">
							<ul class="list-group list-group-flush">
							    <li class="list-group-item">
							    <img class="rounded-circle" src="img/undraw_profile_1.svg" style="width: 2.5rem; height:2.5rem;"><span class="pl-3" style="font-size: 2rem;">${nickname }</span>
								
								<input type="hidden" id="cMainNum" name="cMainNum" value="${item.bNo }">
								<textarea class="form-control" id="cContent" name="cContent" rows="3"></textarea>
								<button type="submit" class="btn btn-warning mt-3" style="float:right;">댓글 등록</button>
							    </li>
							</ul>
						</form>
					</div>
				</div>
				    </div>
				    <hr>
				    <!-- 댓글 수정하면 보이게 (테스트)-->
				    <!-- css 다시 -->
					<div id="showComUpdate">
						<form id="updateRep" name="updateRep" action="UpdateFhCommentServlet" method="post">
							<input type="hidden" id="cNo" name="cNo"><input type="hidden" id="fhNo" name="fhNo" value="${item.fhNo }">
							<input type="text" id="cContents" name="cContents">
							<button class="btn btn-warning" type="submit" id="updated" name="updated" onclick="updateCom()">수정하기!</button>
						</form>
						</div>
					<!-- end of 댓글 수정하면 보이게 (테스트)-->
					</div>
				
				
				<!-- 좋아요 메인으로  -->
				<div class="pb-3 mx-auto"  style="align-items: center;">
				
				
				<!-- Like btn form -->
				<form id="likeFrm" name="likeFrm" action="BUpdateLikeServlet" method="post">
					<input type="hidden" id="mainNo" name="mainNo" value="${item.bNo }">
							
					<button class="btn btn-md mr-5" type="submit" id="likeBtn" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);">
					<i class="fab fa-gratipay" id="likeBTNicon"></i><span id="likeText"> 좋아요!</span></button>
					
					<!-- 그 전페이지가 이벤트-> 이벤트메인//노티스면 노티스메인 -->
					<c:if test="${item.bCategory =='event' }">
					<button class="btn btn-md mr-5" type="button" onclick="location.href='eventMain.doBB'" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
					<i class="fas fa-undo-alt"></i> 메인으로</button>
					</c:if>
	
					<c:if test="${item.bCategory =='notice' }">
					<button class="btn btn-md mr-5" type="button" onclick="location.href='noticeMain.doBB'" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
					<i class="fas fa-undo-alt"></i> 메인으로</button>
						
					</c:if>
					</form>	
				<!-- end of like btn -->
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