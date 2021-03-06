<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

            <script type="text/javascript">
            function getDetails(n, h) {
				$('#frm #bNo').val(n);
				$('#frm #bHit').val(h);
            	$('#frm').submit();
            }
            </script>

        </head>

        <body id="page-top">
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="continer my-auto pl-4 pb-3">
                    <p id="itemCategory" class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">
                        전 체 이 벤 트 리 스 트</p>
                </div>
                <!--table with all recipe-->
                <div class="card shadow mb-4 mr-4 ml-4 pl-3 pr-3">

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>조회</th>
                                        <th>좋아요수</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${list }">
                                        <tr onmouseover="this.style.background='#ebebeb'; this.style.cursor='pointer'"
                                            onmouseout="this.style.background='white'"
                                            onclick="getDetails(${item.bNo},${item.bHit})">
                                                <td>${item.bNo }</td>
                                                <td>${item.bCategory }</td>
                                                <td>${item.mId }</td>
                                                <td>${item.bDate }</td>
                                                <td>${item.bHit }</td>
                                                <td>${item.bLike }</td>
                                                <td>${item.bIsOn }</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <form id="frm" name="frm" action="bDetail.doBB" method="post">
                                <input type="hidden" id="bNo" name="bNo">
                                <input type="hidden" id="bHit" name="bHit">
                            </form>
                        </div>
                    </div>

                    <!-- return to menu btn...  and to the list btn -->
                    <div class="pb-3 mx-auto" style="align-items: center;">
                        <button class="btn btn-md mr-5" type="button" onclick="location.href='adminMain.doBB'"
                            style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
                            <i class="fas fa-user-cog fa-2x"></i>&nbsp;  관리자 메인으로</button>
                    </div>
                    <!-- end of return to menu btn...  and to the list btn -->
                </div>

            </div>
            <!-- /.container-fluid -->

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