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
<!-- daum.address -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
//ajax시작
$(document).ready(function(){
	

	/* 배송요청사항 */
	$('#shippingInfoSaveBtn').on('click', function(){
		let shippingRequest = $('#bRequest').val()
		
		$('#bShippingInfo').text(shippingRequest);
		/* 적용버튼 누르면 디비업데이트 */
		$.ajax({
         	   url:'UpdateShippingInfoServlet', //'../AddItemServlet.do'
	   	            method: 'post',
	   	            data: {
	   	            	shippingInfo: shippingRequest,
            			mId:'${member.mId}'
	   	            },
	   	            success: function(response){
	   	            	console.log(response);
	   	            },
	   	            error: function (reject) {
	   	                console.error(reject);
	   	            } 
            	});
		})
	
	
		/* 할인하기 */
	$('#applyDiscountBtn').click(
			function applyDiscount(){
				let origP = ${sale.sNetPrice};
				let point=$('#pointToUse').val();
				$('#discountFee').text(point);
				let netP = origP-point;
				$('#totalAmount').text(netP);	
				let buyerId='${member.mId}';
				
				/* 적용버튼 누르면 디비업데이트 */
				$.ajax({
		         	   url:'UpdatePointServlet', //'../AddItemServlet.do'
			   	            method: 'post',
			   	            data: {
			   	            	usedPoint: $('#pointToUse').val(),
		            			mId:buyerId
			   	            },
			   	            success: function(response){
			   	            	console.log(response);
			   	            },
			   	            error: function (reject) {
			   	                console.error(reject);
			   	            } 
		            	});
				
				
				}
		);
	//아임포트 결제 API	
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
	            			payAmount: rsp.paid_amount,
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
	            	//리스트에서 아이템 지우기...
	            	
	            } else {	
		               alert("결제에 실패하였습니다. " + rsp.error_msg);
	            }
        	
        });
                      
       }
   );//import 결제 API 끝
            
});//ajax 끝

/* 다음 주소 연동 */
function execution_daum_address() {
	new daum.Postcode({
		oncomplete: function (data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				addr += extraAddr;
			} else {
				addr += ' ';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			$("#address1").val(data.zonecode);
			//$("[name=memberAddr1]").val(data.zonecode); // 대체가능
			$("#address2").val(addr);
			//$("[name=memberAddr2]").val(addr); // 대체가능
			// 커서를 상세주소 필드로 이동한다.
			$("#address3").attr("readonly", false);
			$("#address3").focus();

		}
	}).open();
}//다음주소 연동 끝

//주소 가져온 후 업데이트 버튼
function updateAddressFunc(){
	
	 $.ajax({
        url: $('#updateAddress').attr('action'), //'../AddItemServlet.do'
        method: 'post',
        data: {
        	address1: $("#address1").val(),
        	address2: $("#address2").val(),
        	address3: $("#address3").val(),
        	memberMId: '${session.mId}'
        },
        dataType: 'json',
        success: function(data){
        	alert("배송지(주소)가 업데이트 되었습니다!");
    		$('#closeRModal').click();
        	$('#bAddress').text(data.address);
        },
        error: function (reject) {
            console.log(reject);
        }
	});
}//주소 가져온 후 업데이트 버튼 끝



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
					<p>배송요청사항 : <span id="bShippingInfo">${member.shippingInfo }</span></p>
					<p>배송요청 업데이트 : <input type="text" id="bRequest" name = "request">
					<button id="shippingInfoSaveBtn" class="btn btn-warning">저장</button></p>
				</div>
				<div class="col-lg-3">
					<div style="float:right;">
					<!-- modal ? -->
						<button class="btn btn-warning" data-toggle="modal" data-target="#addressUpdateModal" >배송지 변경</button>
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
					<img src="img/salesImg/${sale.sImg }" style="width:150px; height:150px" ><br>
				</div>
				<div class="col-lg-7 pt-3" style="font-size: 1.3rem">
					<p>상품명 : <span id="itemName">${sale.sTitle }</span></p>
					<p>판매자 : <span id="itemSeller">${sale.mId }</span></p>
					<p>가격 : <span id="itemPrice">${sale.sNetPrice }</span></p>
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
						<p>상품금액 : <span>${sale.sNetPrice }</span></p>
						<!-- 배송비 칼럼? -->
						<p>배송비 : <span id="shippingFee">0</span></p>
						<!-- ?? -->
						<p>할인금액 : <span id="discountFee">0</span></p>
						<hr>
						<p>총액 : <span id="totalAmount">${sale.sNetPrice }</span></p>
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
				<button class="btn btn-danger btn-lg justfy-item-center ml-2" onclick="window.history.back()"> 취   소 </button>
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
    <!-- 배송지 업데이트 모달 -->
    <div class="modal fade" id="addressUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                    <h5 class="modal-title pt-2" id="exampleModalLabel"><i class="fas fa-bullhorn"></i> 배송지를 변경할까요?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                
                <form id="updateAddress" name="updateAddress" action="UpdateAddressServlet">
                 <div class="modal-body">
					<div class="form-group row">
						<div class="col-lg-2 col-sm-2 mb-2 mb-sm-0 ">주 소</div>
						<%-- <input type="hidden" id="memberMId" id="memberMId" value="'${session.mId }'"> --%>
						<div class="col-lg-5 col-sm-3 mb-3 mb-sm-0 ">
							<input type="text" id="address1" name="address1" readonly="readonly"
								class="form-control form-control-user" placeholder="우편번호">
						</div>
						<div class="btn btn-warning btn-user btn-block col-lg-4 col-sm-3 mb-2 mb-sm-0 address_button"
							onclick="execution_daum_address()">
							<span>우편번호찾기</span>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-lg-2 col-sm-2 mb-2 mb-sm-0 "></div>

						<div class="col-lg-5 col-sm-6 mb-3 mb-sm-0 ">
							<input type="text" id="address2" name="address2" readonly="readonly"
								class="form-control form-control-user" placeholder="주소">
						</div>
						<div class="col-lg-4 col-sm-6 mb-3 mb-sm-0 ">
							<input type="text" id="address3" name="address3" readonly="readonly"
								class="form-control form-control-user" placeholder="상세주소">
						</div>
					</div>
		                <div class="modal-footer">
		                    <button class="btn btn-secondary" type="button" id="closeRModal" data-dismiss="modal">취소</button>
		                    <button class="btn btn-warning" type="button" id="updateAddressBtnInModal" onclick="updateAddressFunc()"><i class="fas fa-home"></i> 주소 업데이트</button>
		                </div>
	                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 배송지 업데이트 모달 끝-->
<script>


</script>
</body>
</html>