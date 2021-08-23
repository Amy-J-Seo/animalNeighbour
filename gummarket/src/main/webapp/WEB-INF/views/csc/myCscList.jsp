<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- Links for Table  -->
    <!-- Table css Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<!--End of Links for Table  -->
	
<script type="text/javascript">
	function getMyCsc(n) {
		frm.csNo.value = n;
		frm.submit();
	}
	
	/*주윤: 사용자 나의문의 리스트에서 유저메인으로 갈 때
	아이디 전달해서 구매 내역과 개인 정보 불러오기 */
	function backToUserMain(mId){
		alert($('#toUserMainFrm #mId').val())
		$('#toUserMainFrm').submit();
	}	/* 끝 : 사용자 나의문의 리스트에서 유저메인으로 갈 때
	아이디 전달해서 구매 내역과 개인 정보 불러오기 */
</script>

</head>
<body id="page-top">
 <!-- Begin Page Content -->
		        <div class="container-fluid">
		            <!-- Page Heading -->
					<div class="continer my-auto pl-4 pb-3">
							<p id="itemCategory" class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;"> 고 객 센 터</p>
					</div>		          
		            <!--table with all recipe-->
		            <div class="card shadow mb-4 mr-4 ml-4 pl-3 pr-3">
		                
		                <div class="card-body"> 
		                    <div class="table-responsive">
		                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		                            <thead>
		                                <tr>
	                                        <th>제목</th>
	                                        <th>작성일</th>
	                                        <th>답변완료 여부</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            <c:forEach var="csc" items="${list }">
		                                <tr onmouseover="this.style.background='#ebebeb'; this.style.cursor='pointer'" 
		                                onmouseout="this.style.background='white'" onclick="getMyCsc(${csc.csNo})">
		                           
                                            <td>${csc.csTitle }</td>
                                            <td>${csc.csDate }</td>
                                            <td>${csc.csStatus }
		                                </tr>
		                            </c:forEach>
		                            </tbody>
				                 </table>
				                 	<form id="frm" name="frm" action="myCscDetail.do" method="post">
										<input type="hidden" id="csNo" name="csNo">
									</form>
							 </div>
				       </div>
		                
		                <!-- return to menu btn...  and to the list btn -->
		               
             <c:if test="${session.role eq 'ADMIN' }">
             <!-- return to menu btn...  and to the list btn -->
             <div class="pb-3 mx-auto" style="align-items: center;">
                 <button class="btn btn-md mr-5" type="button" onclick="location.href='adminMain.doBB'"
                     style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
                     <i class="fas fa-user-cog fa-2x"></i>&nbsp;  관리자 메인으로</button>
             </div>
             <!-- end of return to menu btn...  and to the list btn -->
             </c:if>
           
             <c:if test="${session.role eq 'USER' }">
             <!-- return to menu btn...  and to the list btn -->
             <div class="pb-3 mx-auto d-flex" style="align-items: center;">
                    
					<button class="btn btn-md mr-5" type="button" onclick="location.href='cscForm.do'" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
					<i class="far fa-edit fa-2x"></i> 새 문의 작성</button>
            		 <form id="toUserMainFrm" name="toUserMainFrm" action="memberMyPage.doBB" method="post">
            		 	<input type="hidden" id="mId" name="mId" value="${session.mId}">
	                	 <button class="btn btn-md mr-5" type="submit" onClick="backToUserMain()"
	                	  style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
	                     <i class="fas fa-user fa-2x"></i>&nbsp;  유저 메인으로</button>
                     </form>
             </div>
             <!-- end of return to menu btn...  and to the list btn -->
             </c:if>
						</div>
						<!-- end of return to menu btn...  and to the list btn -->
	          </div>
	
	      </div>
          <!-- /.container-fluid -->
		          
		          

    
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

	
		
    <!-- Table bootstrap -->
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>
        
    
</body>
</html>