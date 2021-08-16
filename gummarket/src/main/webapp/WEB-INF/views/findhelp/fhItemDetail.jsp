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
	//set up function on submit the form for report
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
    
});



function fhItemUpdate(n) {
	fhUpdate.fhNo.value=n;
	console.log(fhUpdate.fhNo.value);
	
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
	<div class="continer my-auto pb-3">
			<p id="itemCategory" class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">도움 찾아요!</p>
	</div>
		<!-- DataTales Example -->
		<div class="card shadow mt-4 mb-4" style="margin-left: 4rem; margin-right: 4rem">
			<div class="card-header py-3">
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >${item.fhTitle }
				<!-- 로그인세션확인해서 본인만 글 수정하고 삭제 가능하도록 -->
				 <%-- <c:if test="${session.mId == item.mId}"> --%>
				<button class="btn btn-sm"  onclick="fhItemDelete(${item.fhNo })" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255); float:right;"><i class="far fa-trash-alt"></i> 글 삭제</button>
				 <button class="btn btn-sm mr-3"  onclick="fhItemUpdate(${item.fhNo })" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;"><i class="far fa-edit"></i> 글 수정</button>
				 <%-- </c:if> --%>
				 </h3>				
			</div>
			<div class="card-body">
				<div>
				<!-- img class card-img 하고 싶은데 그러면 풀 화면일때 이미지가 너무 커서 줄이려고 해 봤지만 ㅠㅠ 안되네요... -->
					<img class="card" src="img/rabbitWalk.webp">
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
				
				<div class="card-header py-3">${item.fhCategory } : ${item.fhTitle }</div>
				
				<div class="card-body">
				<div class="pb-1">
				<img class="rounded-circle" src="img/undraw_profile_1.svg" style="width: 2.5rem; height:2.5rem;"><span class="pl-3" style="font-size: 2rem;">${item.nickname }</span>
				</div>
				<hr>
				<div>
				${item.fhNeed }<br>${item.fhHow }
				</div>
				
				</div>
				</div>
				<p></p>
				<%-- <div class="card shadow mb-4">
				<div class="card-header py-3">Recipe method</div>
				<div class="card-body">${recipe.rpMethod }</div>
				</div> --%>
				
				<div class="pb-3 mx-auto"  style="align-items: center;">
				
				<!-- To do style again -->
				<button class="btn btn-md mr-5"  onclick="location.href='#'" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);"><i class="fab fa-gratipay"></i> 좋아요!</button>
				<button class="btn btn-md mr-5"  onclick="location.href='#'" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);"><i class="fas fa-phone-alt"></i> 연락하기</button>
				<a class="btn btn-danger btn-md" href="#" data-toggle="modal"
					data-target="#reportModal"><i class="fas fa-bullhorn"></i> 신고하기</a>
				
				</div>
				
			</div>
			
			
		</div>
	<!-- /.container-fluid -->
	
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
	
	
	    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- report moral -->
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
	
	<!-- fhItem 메인 글 수정, 삭제 폼 -->
		<form id="fhUpdate" name="fhUpdate" action="fhItemUpdateForm.doBB" method="post">
			<input type="hidden" id="fhNo" name="fhNo">
		</form>

		<form id="fhDelete" name="fhDelete" action="fhItemDelete.doBB" method="post">
			<input type="hidden" id="fhNo" name="fhNo">
		</form>
	
	
	
	
	
</body>
</html>