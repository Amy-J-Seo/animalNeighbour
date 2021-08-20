<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.css" rel="stylesheet">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<script>
$(document).ready(function(){
		/* 할인하기 */
	$('#applyDiscountBtn').click(
			function applyDiscount(){
				let origP = ${sale.sPrice}
				let discP=$('#pointToUse').val()
				alert(discP);
				alert(origP);
				$('#discountFee').text(discP);
				let netP = origP-discP
				$('#totalAmount').text(netP)	
				alert(netP)
				}
		);
		
	$("#payment_process").click(
        function requestPay() {
           var IMP = window.IMP; // 생략가능
           IMP.init("imp25885979");
           let buyerName= $('#buyer').text();
           let buyerId='${member.mId}';
           let sNo = "${sale.sNo}";
           let productId ="";
    	   let payMount ="";
       	   let payConfirmNum="";
       	   
       	IMP.request_pay({ // param
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: "${sale.sNo }_${sale.sTitle }_${sale.mId }"+new Date().getTime(),
            name: "${sale.sTitle }",
            amount: $('#totalAmount').text(),
            buyer_email: $('#bEmail').text(),
            buyer_name: $('#buyer').text(),
            buyer_tel: $('#bPhone').text(),
            buyer_addr: $('#bAddress').text(),
            buyer_postcode: "우편번호",
            m_redirect_url: 'http://localhost/gummarket/payresult.doBB'
        }, function (rsp) { // callback
            console.log(rsp);
     	   	var msg="";
            if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
			 
            alert("결제 성공");
            
            /* 결제 성공 시 결과 저장 */
            $.ajax({
         	   url:'payresult.doBB', //'../AddItemServlet.do'
	   	            method: 'post',
	   	            data: {
	   	            	buyerId: buyerId,
            			sNo: sNo,
            			productId: rsp.merchant_uid,
            			paymentAmount: rsp.paid_amount,
            			payConfirmNum:rsp.apply_num
	   	            },
	   	            success: function(response){
	   	            	console.log(response);
	   	            	$('#toPayResult').submit();
	   	            	
	   	            },
	   	            error: function (reject) {
	   	                console.error(reject);
	   	            } 
            	});
            
            	$('#toPayResult').submit();
            } else {	
	               alert("결제에 실패하였습니다. :" + rsp.error_msg);
            }
        	
        });
                      
       }
   );
            
});





</script>



</head>
<body>

<!-- Begin Page Content -->
	<div class="container-fluid" >
		<div class="continer my-auto pl-4 pb-3">
			<p id="itemCategory" class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83);text-align:center; font-weight: 900;">
			  결 제 페 이 지</p>
		</div>
		<!-- DataTales Example -->
		<div class="card mb-4"  style="margin-left: 4rem; margin-right: 4rem">
	
	
	<!-- 메인 카드 for payment -->	
	<div class="card-body">
			
		<div class="card mb-4">
		
			<div class="card mb-2" style="border:none;  border-radius:0; ">
			<!--배송지 확인+업데이트+신규  -->
			<div class="card-header py-3">배송지 확인</div>
			<div class="card-body row">
				<div class="col-lg-9">
					<p>구매자 : <span id="buyer">${member.mName }</span></p>
					<p>주소 : <span id="bAddress">${member.address }</span></p>
					<p>이메일 : <span id="bEmail">${member.email }</span></p>
					<p>전화번호 : <span id="bPhone">${member.phone }</span></p>
					<p>배송요청 : <input type="text" id="bRequest" name = "request">
					<button class="btn btn-warning">저장</button></p>
				</div>
				<div class="col-lg-3">
					<div style="float:right;">
					<!-- modal ? -->
						<button class="btn btn-warning">배송지 변경</button>
						<button class="btn btn-warning">신규 배송지</button>
					</div> 
				</div>
			</div>
			<!--끝 배송지 확인+업데이트+신규  -->
			</div>
			
			<div class="card mb-2" style="border:none;  border-radius:0; ">
			<!--주문상품 확인+업데이트+신규  -->
			<div class="card-header py-3" style="float:right;">주문상품 확인</div>
			<div class="card-body row mb-2" style="float:right;">
				<div class="col-lg-2">
					<img src="img/pink.webp" style="width:150px; height:150px" ><br>
				</div>
				<div class="col-lg-7 pt-3" style="font-size: 1.3rem">
					<p>상품명 : <span id="itemName">${sale.sTitle }</span></p>
					<p>판매자 : <span id="itemSeller">${sale.mId }</span></p>
					<p>가격 : <span id="itemPrice">${sale.sPrice }</span></p>
				</div>
				<div class="col-lg-3">
					<div style="float:right;">
					
					</div> 
				</div>
			</div>
			<!-- 끝 업데이트 -->
			</div>
			
			<div class="card mb-2" style="border:none;  border-radius:0; ">
			<!-- 적립금 사용 -->
			<div class="card-header py-3" style="float:right;">적립금 사용하기</div>
			<div class="card-body mb-2"style="float:right;" >
				<div class="discountArea">
					<p>보유한 포인트 : <span id="usablePoint">${member.reviewPoint }</span>원</p>
					<p>사용할 포인트 : 
					
					<input type="text" id="pointToUse" name = "pointToUse" placeholder="얼마를 사용하시겠습니까?">
                        <button id="applyDiscountBtn" class="btn btn-warning">사용</button></p>
				</div>
				
			</div>
			<!-- 끝 적립금 사용 -->
			</div>
			
			<div class="card mb-2" style="border:none;  border-radius:0; ">
			<!-- 결제 금액 사용 -->
				<div class="card-header py-3" style="float:right;">결제 금액</div>
				<div class="card-body row mb-2" style="float:right;">
					<div class="col-lg-9">
						<p>상품금액 : <span>${sale.sPrice }</span></p>
						<!-- 배송비 칼럼? -->
						<p>배송비 : <span id="shippingFee">0</span></p>
						<!-- ?? -->
						<p>할인금액 : <span id="discountFee">0</span></p>
						<hr>
						<p>총액 : <span id="totalAmount">${sale.sPrice }</span></p>
					</div>
					<div class="col-lg-3">
						<div style="float:right;">
						</div> 
					</div>
				</div>
			<!-- 끝 적립금 사용 -->
			</div>
			
			<div class="mx-auto pb-4" style="align-items: center;">
				<button type="button" id="payment_process" class="btn btn-warning btn-lg justfy-item-center mr-2">결 제 하 기</button>
				<button class="btn btn-danger btn-lg justfy-item-center ml-2"> 취   소 </button>
			</div>
			
		
		
	</div>
	</div>
	<!-- /.container-fluid -->
	</div>
	</div>
	
	
	<!-- 페이지이동 폼 -->
	<form id="toPayResult" name="toPayResult" action="toPayResult.doBB"></form>
	
	
	
	<!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>


    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
    
<script>


</script>
</body>
</html>