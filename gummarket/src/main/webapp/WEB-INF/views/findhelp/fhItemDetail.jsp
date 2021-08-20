<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움찾아요 상세보기</title>

<script type="text/javascript">
//ajax
$(document).ready(function () {
	//set up function on submit the form for report()
    $("#itemReportBtn").click(function () {
   
    	 //set up a function for onSubmit
        $('#fhReport').on('submit', function (e) {
            e.preventDefault();
            
            //let s = $('#fhReport').serialize();
            
            //processing form submit;
            $.ajax({
                url: $('#fhReport').attr('action'), //'../AddItemServlet.do'
                method: 'post',
                //data: $('#fhReport').serialize(),
                data: {category: $('#itemCategory').text(),
                		rWhy: $('#fhReport input[name="reason"]').val(),
                		mainNo: $('#fhReport #fhNo').val()
                },
                dataType: 'json',
                success: function(response){
                	alert("신고가 접수 되었습니다. 감사합니다 :) ");
            		$('#closeRModal').click();
                },
                error: function (reject) {
                    console.log(reject);
                }

            });
        });
        
    });
  //End ofset up function on submit the form for report(신고접수 모달)
  
  //좋아요 버튼 기능
		$('#likeFrm').on('submit', function (e) {
    		
    		e.preventDefault();
	        
    		$.ajax({
	            url: $('#likeFrm').attr('action'), //'../AddItemServlet.do'
	            method: 'post',
	            //data: $('#likeFrm').serialize(),
	            data: {mainNo: $('#likeFrm #mainNo').val()},
	            success: function(response){
	            	alert("게시글 좋아요 눌렀어요 ");
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
    //end of 좋아요 버튼 기능
    
    
    //======get comments===================
     	
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
//end of ajax

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
		
		
	
function fhItemUpdate(n) {
	fhUpdate.fhNo.value=n;
	
	fhUpdate.submit();
}

function fhItemDelete(n) {	
	  let result = confirm(" 정말 삭제하시겠습니까?? ");
	  if(result) {
		  fhDelete.fhNo.value=n;
		  fhDelete.submit();
	 	 }
	}
	
	
</script>

</head>
<body id="page-top">
<!-- Begin Page Content -->
	<div class="container-fluid">
	<div class="continer my-auto pl-4 pb-3">
			<p id="itemCategory" class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">  도움 찾아요!</p>
	</div>
		<!-- DataTales Example -->
		<div class="card shadow mt-4 mb-4" style="margin-left: 4rem; margin-right: 4rem">
			<div class="card-header py-3">
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >${item.fhTitle }</h3>
				<!-- 로그인세션확인해서 본인만 글 수정하고 삭제 가능하도록 -->
				 <c:if test="${session.mId == item.mId}">
					<button class="btn btn-sm"  onclick="fhItemDelete(${item.fhNo })" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255); float:right;">
					<i class="far fa-trash-alt"></i> 글 삭제</button>
					 <button class="btn btn-sm mr-3"  onclick="fhItemUpdate(${item.fhNo })" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
					 <i class="far fa-edit"></i> 글 수정</button>
				 </c:if>				
			</div>
			<div class="card-body">
				<div style="width:100%" class="d-flex justify-content-center">
				<!-- img class card-img 하고 싶은데 그러면 풀 화면일때 이미지가 너무 커서 줄이려고 해 봤지만 ㅠㅠ 안되네요... -->
					<img class="card" src="img/fhImg/${item.fhImg }">
				</div>
				<br>
				<div>
				<h5 class="m-0 font-weight-bold pr-5" style="float:right;">
				<i class="fas fa-paw"></i>
					<span>${item.fhAnimal }</span> <i class="fas fa-paw"></i>
					<span>size : ${item.fhSize }</span> <i class="fas fa-paw"></i>
					<span>${item.fhAge } Months Old</span>
					</h5>
				</div>
				<br />
				<p><hr></p>
				
				<div class="card-header py-3">
				${item.fhCategory } : ${item.fhTitle }
				
					 <a class="btn btn-danger btn-sm ml-3" style="float:right;" href="#" data-toggle="modal"
					data-target="#reportModal" ><i class="fas fa-bullhorn"></i> 신고하기</a>
					
					<c:if test="${item.fhLike > 0 }">
						<span class="pr-3" style="float:right; font-size: 20px;" id="likeNum"><i class="far fa-thumbs-up"></i> ${item.fhLike}
					</span>
					</c:if>
					
				</div>
				
					<div class="card-body">
						<div class="pb-1 d-flex align-items-center">
							<div>
								<img class="rounded-circle" src="img/undraw_profile_1.svg" style="width: 2.5rem; height:2.5rem;">
								<span class="pl-3" style="font-size: 2rem;">${item.nickname }</span>
							</div>				
						</div>
					<hr>
						<div>
							${item.fhNeed }<br>${item.fhHow }
						</div>
					
					</div>
				</div>
				
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
								
								<input type="hidden" id="cMainNum" name="cMainNum" value="${item.fhNo }">
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
				
				<!-- Like, to contact, to main BTN -->
				<div class="pb-3 mx-auto"  style="align-items: center;">
					<!-- Like btn form -->
					<form id="likeFrm" name="likeFrm" action="UpdateLikeServlet" method="post">
						<input type="hidden" id="mainNo" name="mainNo" value="${item.fhNo }">
						<button class="btn btn-md mr-5" type="submit" id="likeBtn" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);">
						<i class="fab fa-gratipay" id="likeBTNicon"></i><span id="likeText"> 좋아요!</span></button>
						<button class="btn btn-md mr-5" type="button" onclick="location.href='#'" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
						<i class="fas fa-phone-alt"></i> 연락하기</button>
						<button class="btn btn-md mr-5" type="button" onclick="location.href='findHelpMain.doBB'" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
						<i class="fas fa-undo-alt"></i> 메인으로</button>
					</form>	
				</div>
				<!-- End ofLike, to contact, to main BTN -->
			</div>
			
			
		</div>
	<!-- /.container-fluid -->
	

	<!-- fhItem 메인 글 수정, 삭제 폼 -->
		<form id="fhUpdate" name="fhUpdate" action="fhItemUpdateForm.doBB" method="post">
			<input type="hidden" id="fhNo" name="fhNo">
		</form>

		<form id="fhDelete" name="fhDelete" action="fhItemDelete.doBB" method="post">
			<input type="hidden" id="fhNo" name="fhNo">
		</form>
	
		
	
	<!-- write btn-->
    <a style="position: fixed;
  right: 1rem;
  bottom: 4rem;
  display: inline;
  width: 2.75rem;
  height: 2.75rem;
  text-align: center;
  color: #fff;
  background: rgb(252, 221, 33);
  line-height: 46px;
  border-radius: 0.35rem" href="writeFHForm.doBB">
        <i class="fas fa-edit"></i>
    </a>
	<!-- End of write btn-->
	
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
	 <!-- End of Scroll to Top Button-->
	 
    <!-- report modal -->
    <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-bullhorn"></i> 이 게시글을 신고하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                	<form id="fhReport" name="fhReport" action="FhItemReportServlet" method="post">
                <div class="modal-body">
						  <input type="radio" id="bannedItem" name="reason" value="banItem">
						  <label for="bannedItem">판매금지 품목이에요</label><br>
						  <input type="radio" id="notSecondHand" name="reason" value="notForSecondhand">
						  <label for="notSecondHand">중고거래 게시글이 아니에요</label><br>
						  <input type="radio" id="repeated" name="reason" value="repeated">
						  <label for="repeated">중복 게시글이에요</label><br>
						  <input type="radio" id="profSeller" name="reason" value="profSeller">
						  <label for="profSeller">전문 판매업자 같아요</label><br>
						  <input type="radio" id="scam" name="reason" value="scam">
						  <label for="scam">사기 글이에요</label><br>
						  <input type="radio" id="notSecondHand" name="reason" value="notForSecondhand">
						  <label for="notSecondHand">기타 이유</label><br>
						  <input type="hidden" id="fhNo" name="fhNo" value="${item.fhNo }">
                </div>
                
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" id="closeRModal" data-dismiss="modal">취소</button>
                    <button class="btn btn-danger" type="submit" id="itemReportBtn"><i class="far fa-angry"></i> 신고</button>
                </div>
					</form>
            </div>
        </div>
    </div>
	<!-- End of report modal -->

	
</body>
</html>