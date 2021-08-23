<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

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
   function getRecord(n){
      frm.ohNo.value = n;
      frm.submit();
   }
</script>
<head>

<style>
	tr {
		background: white;
	}
	tr:hover {
		background: rgb(255, 190, 83);;
	}
</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Tables</title>

<!-- Table css Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Main Content -->
	<div id="content" >

		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Main page search Form -->
			<div id="content-wrapper" class="d-flex flex-column mt-4">

				<div class="continer my-auto pt-4 pb-3 ">
			<a class="h3 ml-5" style="color: rgb(255, 190, 83); font-weight: 500; font-size: 1.5rem;" href="findHelpMain.doBB">도와줘요 멍냥이웃!</a>
			<a class="h3 mr-5" style="color: rgb(255, 190, 83); font-weight: 900; font-size:2.5rem; float: right;" href="offerHelpMain.do">내가 도와줄게요~</a>
		</div>

				<div class="table-responsive">
					<table class="table table-bordered" width="100%" cellspacing="0">
						<thead>
							<tr>

								<th>No.</th>
								<th>글제목</th>
								<th>작성자</th>
							</tr>

						</thead>
						<tbody>
							<c:forEach var="help" items="${list }">
								<tr onclick="getRecord(${help.ohNo })">
									<td>${help.ohNo }</td>
									<td>${help.ohTitle }</td>
									<td>${help.mName }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<form id="frm" name="frm" action="ohItemDetail.do" method="post">
						<input type="hidden" id="ohNo" name="ohNo">
					</form>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->



			<!-- 스타일 수정완료했습니다. 어떤 이유인지 css에서 충돌이 있는지 클래스가 적용되지 않았어요... -->
			<!-- write btn-->
			<a
				style="position: fixed; right: 1rem; bottom: 4rem; display: inline; width: 2.75rem; height: 2.75rem; text-align: center; color: #fff; background: rgb(252, 221, 33); line-height: 46px; border-radius: 0.35rem"
				href="writeOHForm.do"> <i class="fas fa-edit"></i>
			</a>






			<!-- Table bootstrap -->
			<!-- Bootstrap core JavaScript-->
			<script src="vendor/jquery/jquery.min.js"></script>
			<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>