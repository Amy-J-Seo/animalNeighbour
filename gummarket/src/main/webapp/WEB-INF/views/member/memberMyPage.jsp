<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- memberInfo modal -->
    <div class="modal fade" id="memberInfo" tabindex="-1" role="dialog" aria-labelledby="memberIfoModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" >
            <div class="modal-content">
               	<!-- 메인 카드 for payment -->	
				<div class="card-body">
					<div class="card mb-4">
						<div class="card mb-2" style="border:none;  border-radius:0; ">
						<div class="card-header py-3">
							회 원 정 보
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        	<span aria-hidden="true">×</span>
		                    </button>
	                    </div>
						
						<div class="card-body row">
							<!-- 사용자 프로필 사진+이름 -->
							<div class=" col-lg-4 text-center align-items-center">
								<img class="rounded-circle" src="img/undraw_profile_1.svg" style="width: 2.5rem; height:2.5rem;">
								<p>${member.mId }</p>
								<p>${member.nickname } 님</p>
							</div>
							
							<div class=" col-lg-8 text-center align-items-center">
								<h5>${member.mId }님의 리뷰 포인트: ${member.reviewPoint }</h5>
								<p>판매 물품 확인하기</p>
								<!-- ajax로 불러온 정보 붙이는 div -->
								<div>
								<!-- 판매물품...리스트 카드형식 -->
									<div id="toAddSalesListDiv" class="card-body row"></div>
									<!-- end of 판매물품...리스트 카드형식 -->						
								</div>
							</div>
							
						</div>
							
						</div>
						
					
					</div>
				</div>
            </div>
        </div>
    </div>
	<!-- End of memberInfo modal -->
</body>
</html>