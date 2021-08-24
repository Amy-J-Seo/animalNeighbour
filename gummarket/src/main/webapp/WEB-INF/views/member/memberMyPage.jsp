<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//ajax 시작
$(document).ready(function () {
	// 총 작성 글 넘버들 불러오기
	 $.ajax({
         url: "GetTotalNumbersServlet", //'../AddItemServlet'
         method: 'post',
         data: {
        	 mId: '${session.mId}',
         },
         success: function(data){
         	$('#totalOHNo').text(data['ohNo']);
         	$('#totalFHNo').text(data['fhNo']);
         	$('#totalSaleNo').text(data['salesNo']);
         	$('#totalReportNo').text(data['reportNo']);
         },
         error: function (reject) {
             console.log(reject);
         }

     });
	
	
	//구매확정 버튼 작동+ 테이블 업데이트 주윤
	$('#acceptItemBtn').on('click', function(e){
		e.preventDefault();
		
		 $.ajax({
             url: "ConfirmPurchaseServlet", //'../AddItemServlet'
             method: 'post',
             //data: $('#fhReport').serialize(),
             data: {
            	 pNo: $('#confirmItemPFrm #pNo').val(),
            	 confirmPurchase: "yes",
             },
             success: function(response){
             	alert("구매확정 되었습니다 :) ");
         		$('#closeRModal').click();
         		$('#confirmPBtn').remove();
         		$('#BtnReturnItemBtn').remove();
             },
             error: function (reject) {
                 console.log(reject);
             }

         });
		
	})//끝 구매확정 버튼 작동+ 테이블 업데이트 주윤

	
	
});//ajax끝


function getTotalSales(){
	$('#frmForTotalS').submit();
}
function getTotalReports(){
	$('#frmForTotalR').submit();
}
function getTotalFH(){
	$('#frmForTotalFH').submit();
}
function getTotalOH(){
	$('#frmForTotalOH').submit();
}

//반품함수
function returnItem(){
	//반품하기 버튼 누르고 멤버페이지 버튼, 테이블 업데이트 주윤
	let div1=$('#returnItemBtn').parent();
	console.log($(div1).attr('id'))
		//ajax사용해서 반품 버튼이 눌리면 페이먼트 테이블 confirmpurchase -> return으로 바꾸고
		//버튼 삭제하고 -> 반품 진행중 넣어주기
		$.ajax({
	        url: 'ReturnItemRequestServlet', //'../AddItemServlet'
	        method: 'post',
	        //data: $('#fhReport').serialize(),
	        data: {
	       	 pNo: $('#returnItemPNo').val(),
	       	 confirmPurchase: "return",
	        },
	        success: function(response){
	        	let div= document.getElementById(response);
	        	console.log($(div))
	    		//이러니까 제일 위에꺼? 그게 바뀌던데... 디브에 아이디를 줘야할듯...
	    		$('#closeRModal').click();
	    		//$('#returnItemForm').submit(); //환불신청 폼 열어주기.
	        },
	        error: function (reject) {
	            console.log(reject);
	        }
	
	    });
}//끝 반품하기 버튼 누르고 멤버페이지 버튼, 테이블 업데이트 주윤



</script>
</head>
<body>
<!-- Begin Page Content -->
<div class="container-fluid">
	 <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between my-auto pl-4 pb-4">
		<p id="itemCategory" class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">
		<i class="fas fa-user"></i>  회원 마이페이지</p>
        <!-- <h1 class="h3 mb-0 text-gray-800">Cards</h1> -->
    </div>
	
	<!-- 간략 프로필 아이콘/닉네임/리뷰포인트 -->
	<div class="text-center align-items-center row">
		<div class="col-lg-4">
			<img class="rounded-circle pt-1" src="img/undraw_profile_1.svg" style="width: 5rem; height:5rem;">
			<p style="font-size:30px">${member.nickname } 님</p>
		</div>
		<div class="col-lg-8" >
			<h3>${member.mId }님의 리뷰 포인트: ${member.reviewPoint }</h3>
		</div>
	</div>
	
	<div class="row pl-3 pr-3 mt-3">
		<div class="col-xl-5 col-md-6 mb-4">
	    	<!-- 나의 구매내역 -->
			<div class="card shadow mr-2 ml-2 mb-4 mt-2">
				<div class="card-header py-3">
					<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;">나의 구매 내역</h3>
				</div>
				<div class="card-body">
					<c:forEach var="item" items="${list}" varStatus="status">
					<div style="width:100%" class="row no-gutters align-items-center  border border-left-primary mb-3">
		            	<div class="col-3" style="baorder:none">
							<img class="align-items-center " src="img/salesImg/${item.sImg }" style="width:120px; height:120px">
						</div>
		                <div class="col-9 card-body pl-3 pr-3" >
		                   <div class="row">
		                   		<div class="col-8 align-items-center ">
			                   		<p>카테고리: ${item.sCategory }</p>
			                   		<p>상품명: ${item.sTitle }</p>
		                   		</div>
		                   		<div class="col-4" >
			                   		<c:if test="${item.confirmPurchase == 'n'}">
			                   		<button id="confirmPBtn" class="btn" style="background-color:rgb(252, 221, 33); color: rgb(94, 94, 94);" 
			                   		data-toggle="modal" data-target="#confirmP">구매확정</button>
			                   		</c:if>
			                   		<c:if test="${item.confirmPurchase == 'yes'}">
			                   		<button id="" class="btn">구매확정 완료!</button>
			                   		</c:if>
			                   		<c:if test="${item.confirmPurchase == 'return'}">
			                   		<button  class="btn">반품절차 시작!</button>
			                   		</c:if>
			                   		<!-- confirm purchase modal 주윤-->
								    <div class="modal fade" id="confirmP" tabindex="-1" role="dialog" aria-labelledby="confirmPModalLabel"
								        aria-hidden="true">
								        <div class="modal-dialog" role="document">
								            <div class="modal-content">
								                <div class="modal-header">
								                    <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-bullhorn"></i> 구매확정 하시겠어요?</h5>
								                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
								                        <span aria-hidden="true">×</span>
								                    </button>
								                </div>
								                	<form id="confirmItemPFrm" name="confirmItemPFrm" action="returnItemApply.doBB" method="post">
										                <div class="modal-footer">
										                	<input type="hidden" id="pNo" name="pNo" value="${item.pNo }">
										                    <button class="btn btn-secondary" type="button" id="closeRModal" data-dismiss="modal">취소</button>
										                    <button class="btn" style="background-color:rgb(252, 221, 33); color: rgb(94, 94, 94);" type="button" id="acceptItemBtn">
										                    	<i class="far fa-smile-wink"></i> 네!</button>
										                </div>
													</form>
								            </div>
								        </div>
								    </div>
									<!-- End of confirm purchase modal 주윤-->
		                   		</div>
		                   </div>
		                   <div class="row">
		                   		<div class="col-8 align-items-center ">
		                   		<p>구매금액: ${item.payAmount }</p>
		                   		<p>결제일자: ${item.pDate }</p>
		                   		</div>
		                   		<div class="col-4 align-items-center">
		                   		<p></p>
		                   		<c:if test="${item.confirmPurchase =='n'}">
			                   		<a id="BtnReturnItemBtn" class="btn"
			                   		 style="background-color:rgb(235, 76, 36);color:white;" data-toggle="modal" data-target="#returnItemModal">반품신청</a>
		                   		</c:if>
		                   		
								<!-- return item modal 주윤-->
								    <div class="modal fade" id="returnItemModal" tabindex="-1" role="dialog" aria-labelledby="returnItemModalLabel"
								        aria-hidden="true">
								        <div class="modal-dialog" role="document">
								            <div class="modal-content">
								                <div class="modal-header">
								                    <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-bullhorn"></i> 반품 하시겠어요?</h5>
								                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
								                        <span aria-hidden="true">×</span>
								                    </button>
								                </div>
								                	<form id="returnItemForm" name="returnItemForm" method="post" action="returnItemForm.doBB">
								                   		<input type="hidden" id="returnItemPNo" name="returnItemPNo" value="${item.pNo }">
								               		 <div class="modal-body">
														  <input type="radio" id="damagedItem" name="reason" value="damagedItem">
														  <label for="damagedItem">부서진 상품이 왔어요</label><br>
														  <input type="radio" id="differentShape" name="reason" value="differentShape">
														  <label for="differentShape">모양이 광고와 달라요</label><br>
														  <input type="radio" id="differentColor" name="reason" value="differentColor">
														  <label for="differentColor">색깔이 광고와 달라요</label><br>
														  <input type="radio" id="wrongSize" name="reason" value="wrongSize">
														  <label for="wrongSize">사이즈가 광고와 달라요</label><br>
														  <input type="radio" id="unableToUse" name="reason" value="unableToUse">
														  <label for="unableToUse">사용할 수 없어요</label><br>
														  <input type="radio" id="changeOfMind" name="reason" value="changeOfMind">
														  <label for="changeOfMind">단순 변심</label><br>
								                </div>
								                
								                <div id="${item.pNo }" class="modal-footer">
								                    <button class="btn btn-secondary" type="button" id="closeRModal" data-dismiss="modal">취소</button>
								                    <button class="btn btn-danger" type="button" id="returnItemBtn" onclick="returnItem()"><i class="far fa-angry"></i> 반품</button>
								                </div>
													</form>
								            </div>
								        </div>
								    </div>
									<!-- End of return item modal 주윤-->
		                   		</div>
		                   </div>
		                </div>
					</div>
					
					
					
					
					
					
					
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="col-xl-7 col-md-6 mb-4">
		<!-- 나의 활동내역 카드-->
			<div class="row pl-3 pr-3 mt-2">
				       <!-- 나의 구매내역 -->
		        <div class="col-xl-6 col-md-6 mb-4">
		            <div class="card border-left-primary shadow h-100 py-2">
		            	<div class="card-header py-3">
							<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >나의 판매글
							 </h3>
							 <form id="frmForTotalS" name="frmForTotalS" method="post" action="getTotalSales.doBB">
							 <input id="mIdForTotalS" name="mIdForTotalS" type="hidden" value="${member.mId}">
							 <button class="btn btn-sm mr-1"  onclick="getTotalSales()" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
							 <i class="fas fa-search-plus"></i> 더보기</button>
							 </form>
						</div>
		                <div class="card-body">
		                    <div class="row no-gutters align-items-center">
		                        <div class="col mr-2">
		                            <div class="text-md font-weight-bold text-primary text-uppercase mb-1">
		                                총 물품 수</div>
		                            <div id="totalSaleNo" class="h5 mb-0 font-weight-bold text-gray-800"><i class="far fa-meh-rolling-eyes"></i></div>
		                        </div>
		                        <div class="col-auto">
		                            <i class="fas fa-users fa-4x text-gray-300"></i>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		         <!-- 총 신고수 -->
		        <div class="col-xl-6 col-md-6 mb-4">
	            <div class="card border-left-warning shadow h-100 py-2">
	            	<div class="card-header py-3">
						<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >나의 신고글
						 </h3>
						 <form id="frmForTotalR" name="frmForTotalR" method="post" action="getTotalReports.doBB">
						 <input id="mIdForTotalR" name="mIdForTotalR" type="hidden" value="${member.mId}">
						 <!-- To add report table view page link BB-->
						 <button class="btn btn-sm mr-1"  onclick="getTotalReports()" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
						 <i class="fas fa-search-plus"></i> 더보기</button>
						 </form>
					</div>
	                <div class="card-body">
	                    <div class="row no-gutters align-items-center">
	                        <div class="col mr-2">
	                            <div class="text-md font-weight-bold text-warning text-uppercase mb-1">
	                                총 신고 게시글 수</div>
	                            <div id="totalReportNo" class="h5 mb-0 font-weight-bold text-gray-800"><i class="far fa-meh-rolling-eyes"></i></div>
	                        </div>
	                        <div class="col-auto">
	                            <i class="fas fa-bell fa-4x text-gray-300"></i>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
			</div>
		
			<div class="row pl-4 pr-4 mt-5">
				<div class="col-xl-6 col-md-6 mb-4">
	            <div class="card border-left-primary shadow h-100 py-2">
	            	<div class="card-header py-3">
						<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >나의 도움찾기 글
						 </h3>
						 <form id="frmForTotalFH" name="frmForTotalFH" method="post" action="getTotalFindHelp.doBB">
						 <input id="mIdForTotalFH" name="mIdForTotalFH" type="hidden" value="${member.mId}">
						 <button class="btn btn-sm mr-1"  onclick="getTotalFH()" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
						 <i class="fas fa-search-plus"></i> 더보기</button>
						 </form>
					</div>
	                <div class="card-body">
	                    <div class="row no-gutters align-items-center">
	                        <div class="col mr-2">
	                            <div class="text-md font-weight-bold text-primary text-uppercase mb-1">
	                                총 도움찾기 수</div>
	                            <div id="totalFHNo" class="h5 mb-0 font-weight-bold text-gray-800"><i class="far fa-meh-rolling-eyes"></i></div>
	                        </div>
	                        <div class="col-auto">
	                            <i class="fas fa-users fa-4x text-gray-300"></i>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	         	<!-- 총 신고수 -->
		        <div class="col-xl-6 col-md-6 mb-4">
	            <div class="card border-left-warning shadow h-100 py-2">
	            	<div class="card-header py-3">
						<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >나의 도움주기 글
						 </h3>
						 <form id="frmForTotalOH" name="frmForTotalOH" method="post" action="getTotalOfferHelp.doBB">
						 <input id="mIdForTotalOH" name="mIdForTotalOH" type="hidden" value="${member.mId}">
						 <button class="btn btn-sm mr-1"  onclick="getTotalOH()" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
						 <i class="fas fa-search-plus"></i> 더보기</button>
						 </form>
					</div>
	                <div class="card-body">
	                    <div class="row no-gutters align-items-center">
	                        <div class="col mr-2">
	                            <div class="text-md font-weight-bold text-warning text-uppercase mb-1">
	                                총 도움주기 수</div>
	                            <div id="totalOHNo" class="h5 mb-0 font-weight-bold text-gray-800"><i class="far fa-meh-rolling-eyes"></i></div>
	                        </div>
	                        <div class="col-auto">
	                            <i class="fas fa-bell fa-4x text-gray-300"></i>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
			</div>
		</div>
		
	</div>






</div>
<!-- /.container-fluid -->
</body>
</html>