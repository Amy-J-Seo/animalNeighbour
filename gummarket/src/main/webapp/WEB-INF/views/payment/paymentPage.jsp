<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Begin Page Content -->
	<div class="container-fluid" >
		<div class="continer my-auto pl-4 pb-3">
			<p id="itemCategory" class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83);text-align:center; font-weight: 900;">  결 제 페 이 지</p>
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
					수령인 : ${member.mName }<br>
					주소 : ${member.address }<br>
					전화번호 : ${member.phone }<br>
					배송요청 : <input type="text" id="request" name = "request"><button class="btn btn-warning">저장</button> <br>
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
					상품명 : ${sale.sTitle }<br>
					판매자 : ${sale.mId }<br>
					가격 : ${sale.sPrice }<br>
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
				<div class="">
					보유한 포인트 : ${member.buyPoint }원<br><br>
					사용할 포인트 : <input type="text" id="pointUse" name = "pointUse" placeholder="얼마를 사용하시겠습니까?"><button class="btn btn-warning">사용</button><br>
				</div>
				
			</div>
			<!-- 끝 적립금 사용 -->
			</div>
			
			<div class="card mb-2" style="border:none;  border-radius:0; ">
			<!-- 결제 금액 사용 -->
				<div class="card-header py-3" style="float:right;">결제 금액</div>
				<div class="card-body row mb-2" style="float:right;">
					<div class="col-lg-9">
						상품금액 : ${sale.sPrice }<br>
						<!-- 배송비 칼럼? -->
						배송비 : ${sale.sPrice }<br>
						<!-- ?? -->
						할인금액 : ${sale.sPrice }<br>
						<hr>
						총액 : ${sale.sNetPrice }<br>
					</div>
					<div class="col-lg-3">
						<div style="float:right;">
						</div> 
					</div>
				</div>
			<!-- 끝 적립금 사용 -->
			</div>
			
			<div class="mx-auto pb-4" style="align-items: center;">
				<button class="btn btn-warning btn-lg justfy-item-center mr-2">결 제 하 기</button>
				<button class="btn btn-danger btn-lg justfy-item-center ml-2"> 취   소 </button>
			</div>
			
		
		
	</div>
	</div>
	<!-- /.container-fluid -->
	</div>
	</div>
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
	
 
	
</body>
</html>