<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움찾기 전체 리스트</title>
<!--Hover css-->
<link rel="stylesheet" href="{% static 'css/stylesheet.css'%}" type="text/css">
<style type="text/css">
	.card {
		border-radius: 4px;
		background: #fff;
		box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
		transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
		cursor: pointer;
	}

	.card:hover {
		transform: scale(1.05);
		box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
	}
</style>

<script>
function getDetails(n, h) {
	$('#frm #bNo').val(n);
	$('#frm #bHit').val(h);
	
	$('#frm').submit();
}
</script>

</head>
<body id="page-top">
	<!-- page wrapper -->
	<div id="wrapper">

	<!-- Main page search Form -->
	<div id="content-wrapper" class="d-flex flex-column">
		<div class="continer my-auto pb-3">
			<p class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">어떤 이벤트가 진행되고 있을까요?</p>
		</div>
		<div class="continer my-auto">
		<!-- Main Content -->
		<!-- 메인화면 Search 폼-->
			<div id="content" class ="mt-4 mb-4" style="margin: 0 auto; width:250px;">
				<form id="searchFrm" name="searchFrm" method="post" action="keywordSearch.doBB" class="d-none d-sm-inline-block form-inline navbar-search" style="display: block;">
					<div class="input-group">
						<input id="keyWord" name="keyWord" type="text" class="form-control border-0 small" style="background-color: rgb(244, 244, 244);"
							placeholder="Search title for..." aria-label="Search" aria-describedby="basic-addon2">
						<input id="category" name="category" type="hidden" value="event">
						<div class="input-group-append">
							<button class="btn" type="submit" id="searchBtn"  style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<!-- End of 메인화면 Search 폼-->
		</div>
	

	<!-- Main page card items area -->
    <div class="container px-4 px-lg-5 mt-5">
	    <c:if test="${not empty message }">
		 	<div class="align-center d-flex justify-content-center" style="width: 100%; height: 400px; ">
		 		<h2 class="text-center justify-content-center">${message }</h2>
		 	
		 	</div>
		 </c:if>
	    
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        	
        
			<!-- 모든 도움찾기 글 카드로 보여주기!! -->	
			 <c:forEach var="item" items="${list}"> 
	            <div class="col mb-5">
	                <div class="card h-100">
	                  
	                    <!-- find help image-->
	                    <img class="card-img-top" src="img/noticeEvent/${item.bImg }" alt="" />
	                    <!-- find help details-->
	                    <div class="card-body pt-4 pr-4 pl-4 pb-0">
	                        <div class="text-center">
	                            <!-- find help title-->
	                            <h4 class="fw-bolder">${item.bTitle}</h4>
	                            <h5>${item.bCategory }</h5>
	                            
	                            조회수: ${item.bHit }
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><button type="button" class="btn btn-outline-warning mt-auto" onclick="getDetails(${item.bNo},${item.bHit })">Read more</button></div>
	                    </div>
	                    <form id="frm" name="frm" action="bDetail.doBB" method="post">
	                    	<input type="hidden" id="bNo" name="bNo" >
	             			<input type="hidden" id="bHit" name="bHit">
	                    </form>
	                </div>
	            </div>       
			 </c:forEach> 
        </div>
    </div>
    <!-- Main page card items area -->
    </div>
	<!-- End of Main page search Form -->
    </div>
    <!-- End of page wrapper -->
    
    
    
    
    <!-- 스타일 수정완료했습니다. 어떤 이유인지 css에서 충돌이 있는지 클래스가 적용되지 않았어요... -->
	<!-- write btn-->
	<c:if test="${session.role == 'ADMIN' }">
    <a style="position: fixed;
  right: 1rem;
  bottom: 4rem;
  display: inline;
  width: 2.75rem;
  height: 2.75rem;
  text-align: center;
  color: #fff;
  background: rgb(255, 190, 83);
  line-height: 46px;
  border-radius: 0.35rem" href="writeBoardForm.doBB">
        <i class="fas fa-edit"></i>
    </a>
    </c:if>
    <!-- End of write btn-->
    
    
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>



</body>
</html>

