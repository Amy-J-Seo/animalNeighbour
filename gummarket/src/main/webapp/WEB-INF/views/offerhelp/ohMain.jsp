<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title></title>

  <!-- Table css Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    
    <script>
   function getRecord(n){
      frm.ohNo.value = n;
      frm.submit();
   }
</script>

<style>
	tr {
		background: white;
	}
	tr:hover {
		background: rgb(255, 190, 83);;
	}
</style>
</head>

<body id="page-top">

    <!-- Main Content -->
    <div id="content" class="mt-4" >

        <!-- Begin Page Content -->
        <div class="container-fluid">
			
                <div class="continer my-auto mb-2 pt-4 pb-3">
					<a class="h3 ml-5" style="color: rgb(255, 190, 83); font-weight: 500; font-size: 1.5rem;"
                        href="findHelpMain.doBB">도와줘요 멍냥이웃!</a>
                    <a class="h3 mr-5" style="color: rgb(255, 190, 83); font-weight: 900; font-size:2.5rem; float: right;"
                        href="offerHelpMain.do">내가 도와줄게요~</a>
				</div>

            <!-- DataTales Example -->
            <div class="card mb-4 mr-4 ml-4 mt-3 pl-3 pr-3">
                
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                        <form id="frm" name="frm" action="ohItemDetail.do" method="post">
                            <input type="hidden" id="ohNo" name="ohNo">
                        </form>
                    </div>
                </div>
            </div>
			</div>
        </div>
        <!-- /.container-fluid -->

    
    <!-- End of Main Content -->

    <!-- write btn-->
    <a style="position: fixed; right: 1rem; bottom: 4rem; display: inline; width: 2.75rem; height: 2.75rem; text-align: center; color: #fff; background: rgb(252, 221, 33); line-height: 46px; border-radius: 0.35rem"
        href="writeOHForm.do"> <i class="fas fa-edit"></i>
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