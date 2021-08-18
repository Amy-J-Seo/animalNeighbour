<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장터 전체 상품 조회</title>

</head>
<body>
	<section>
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="continer my-auto pb-3">
				<p class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">On sale items!</p>
			</div>
			<div class="continer my-auto">
				<!-- Main Content -->
				<div id="content" class ="mt-4 mb-4" style="margin: 0 auto; width:250px;">
					<!-- 검색창 -->
					<form class="d-none d-sm-inline-block form-inline navbar-search" style="display: block">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small" style="background-color: rgb(244, 244, 244);"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
							<!-- 서치버튼 색 바꾸고 싶으면 바꾸어도 됩니다. -->
								<button class="btn btn-primary" type="button" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);" >
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <!--인기메뉴 카드로 보여주기 c:foreach활용! -->
        	<c:forEach var="list" items="${list }">
		   		<div class="col mb-5">
	                <div class="card h-100">
	                
	                <!-- 전체조회에서는 좋아요가 10개 이상이면 인기상품벳지 -->
	                    <!-- 인기상품 badge-->
	                    <c:if test="${list.sHit gt 10}">
		                    <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">인기상품
		                    </div>
	                    </c:if>
	                    <!-- 상품 썸네일-->
	                    <img class="card-img-top" src="img/${list.sImg }" alt="상품이미지" />
	                    <!-- 상품 details-->
	                    <div class="card-body p-4">
	                        <div class="text-center">
	                            <!-- 상품 타이틀-->
	                            <h5 class="fw-bolder">${list.sTitle}</h5>
	                            <!-- 상품 별점?-->
	                            <div class="d-flex justify-content-center small text-warning mb-2">
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                            </div>
	                            <!-- 조회수-->
	                            <div>조회수 :${list.sHit }</div>
	                            <div>카테고리: ${list.sCategory }</div>
	                            <div>가격: ${list.sPrice }</div>
	                            <div>할인 된 가격: ${list.sNetPrice }</div>
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><button type="button" class="btn btn-outline-dark mt-auto" onclick="getSalesDetail(${list.sNo},${list.sHit })">Read more</button></div>
	                    </div>
	                  </div>
	            	</div>
   				</c:forEach>
   				<!-- 버튼 누르면 salesSelect.do로가서 상세보기 페이지로 넘어감. -->
               	<form id="salesFrm" name="salesFrm" action="salesSelect.do" method="post">
					<input type="hidden" id="sNo" name="sNo">
					<input type="hidden" id="sHit" name="sHit">
				</form>
		</div>
	</div>
	
	 <!-- 스타일 수정완료했습니다. 어떤 이유인지 css에서 충돌이 있는지 클래스가 적용되지 않았어요... -->
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
		  border-radius: 0.35rem" href="salesInsertForm.do">
     <i class="fas fa-edit"></i>
    </a>
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
	
	</section>
	
	<script>
	function getSalesDetail(n,h) {
		console.log(n);
		console.log(h);
		salesFrm.sNo.value = n;
		salesFrm.sHit.value = h;
		salesFrm.submit();
	}
</script>
	
	
</body>
</html>