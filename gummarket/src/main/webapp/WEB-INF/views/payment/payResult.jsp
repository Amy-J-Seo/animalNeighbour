<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


</script>


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
			
			<div class="card-header py-3">결제가 완료되었습니다.</div>
				<div class="card-body">
					<div class="text-center align-items-center">
						<h3>구매해 주셔서 감사합니다.</h3>
					<p>판매자가 확인 후 상품을 보낼 예정입니다.</p>
					<p>결제 정보는 마이페이지에서 확인 가능합니다.</p>
					<form id="frm" name="frm" action="memberMyPage.doBB" method="post">
					<input type="hidden" id="mId" name="mId" value="${session.mId }">
						<button class="btn btn-md mr-5" type="submit" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
							<i class="fas fa-undo-alt"></i> 마이페이지로</button>
						<button class="btn btn-md mr-5" type="button" onclick="location.href='salesListAll.do'" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
						<i class="fas fa-undo-alt"></i> 장터메인으로</button>
					</form>
					</div>
					
				</div>
				
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