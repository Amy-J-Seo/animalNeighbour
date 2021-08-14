<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움찾기 전체 리스트</title>


<script>
function getDetails(num) {
	getFhNo.fhNo.value = num;
	getFhNo.submit();
}
</script>

</head>
<body id="page-top">

	<!-- page wrapper -->
	<div id="wrapper">

	<!-- Main page search Form -->
	<div id="content-wrapper" class="d-flex flex-column">
		<div class="continer my-auto pb-3">
			<p class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">I need your help!</p>
		</div>
		<div class="continer my-auto">
		<!-- Main Content -->
		<div id="content" class ="mt-4 mb-4" style="margin: 0 auto; width:250px;">
		
			<!-- 메인화면 Search 폼-->
			<form class="d-none d-sm-inline-block form-inline navbar-search" style="display: block;">
				<div class="input-group">
					<input type="text" class="form-control border-0 small" style="background-color: rgb(244, 244, 244);"
						placeholder="Search for..." aria-label="Search"
						aria-describedby="basic-addon2">
					<div class="input-group-append">
					<!-- 서치버튼 색 바꾸고 싶으면 바꾸어도 됩니다. -->
						<button class="btn" type="button"  style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		</div>
	

	<!-- Main page card items area -->
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<!-- 모든 도움찾기 글 카드로 보여주기!! -->	
			 <c:forEach var="item" items="${list}"> 
	            <div class="col mb-5">
	                <div class="card h-100">
	                  
	                    <!-- find help image-->
	                    <img class="card-img-top" src="img/fourDogs.jpg" alt="" />
	                    <!-- find help details-->
	                    <div class="card-body pt-4 pr-4 pl-4 pb-0">
	                        <div class="text-center">
	                            <!-- find help title-->
	                            <h5 class="fw-bolder">${item.fhTitle}</h5>
	                            <h6>${item.fhCategory } | ${item.fhAnimal }</h6>
	                            <P>${item.fhNeed }</P>
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><button type="button" class="btn btn-outline-warning mt-auto" onclick="getDetails(${item.fhNo})">Read more</button></div>
	                    </div>
	                    <form id="getFhNo" name="getFhNo" action="fhDetail.do" method="post">
	                    	<input type="hidden" id="fhNo" name="fhNo">
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
  border-radius: 0.35rem" href="#">
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


</body>
</html>

