<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장터 메인페이지 - 인기상품</title>
  <!--Hover css-->
  <link rel="stylesheet" href="{% static 'css/stylesheet.css'%}" type="text/css">
  <style type="text/css">
  	.card{
	    border-radius: 4px;
	    background: #fff;
	    box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
	    transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
	  	cursor: pointer;
	}

	.card:hover{
     	transform: scale(1.05);
  		box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
	}
  </style>
</head>
<body id="page-top">
	<section>
		
    <div class="container px-4 px-lg-5 mt-5">
		<div id="continer my-auto pb-3" >
			<div class="row  mt-10">
				<p class="h3 mb-20 mt-10 " style="color: rgb(255, 190, 83); font-weight: 900;">인기상품 top 10 !</p>
			</div>
			<p></p>
		</div>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <!--인기메뉴 카드로 보여주기 c:foreach활용! -->
        	<c:forEach var="list" items="${list }">
		   		<div class="col mb-5">
	                <div class="card h-100">
	                    <!-- 인기상품 badge-->
	                    <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">인기상품
	                    </div>
	                    <!-- 상품 썸네일-->
	                    <img class="card-img-top" src="img/salesImg/${list.sImg }" alt="상품 썸네일이미지" />
	                    <!-- 상품 details-->
	                    <div class="card-body p-4">
	                        <div class="text-left">
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
	                            <i class="fas fa-paw"></i>조회수 :${list.sHit }<br>
	                            <i class="fas fa-paw"></i>카테고리: ${list.sCategory }<br>
	                            <i class="fas fa-paw"></i>가격: ${list.sPrice }<br>
	                           	<i class="fas fa-paw"></i> 할인 된 가격: ${list.sNetPrice }<br>
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><button type="button" class="btn btn-outline-warning mt-auto" onclick="getSalesDetail(${list.sNo},${list.sHit })">Read more</button></div>
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
		<div align ="center">
			<!-- 더보기 버튼 -->
			<button type="button" class="btn btn-outline-warning mt-auto" onclick="location.href='salesListAll.do'" ><i class="fas fa-search-plus"></i>더 많은 상품 보기</button>
		</div>
   		<p></p>	
   		<br>
   		<hr>
   		<!-- 이벤트 베너 (해당 이벤트 페이지 만들고 링크 걸기) -->
   		<div align="center">
   		<h4> * 진 행 중 이 벤 트 *</h4>
   		</div>
   		<div class="row" >
   			<div class="col-lg-6 col-sm-3 mb-3 mb-sm-0 " >
   				<img alt="배너1" src="img/이벤트배너1.png" width="500px">
   			</div>
   			<div class="col-lg-6 col-sm-3 mb-3 mb-sm-0 mt-50">
   				<img alt="배너2" src="img/공유하기배너.png" width="550px" height="150px" class="img-responsive center-block" >
   			</div>
   			<br>
   		</div>
   		<br>
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