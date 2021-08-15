<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Custom fonts for this template from register.html-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">


</head>
<body>
${message }
                   <div class="row">
                                <!-- file upload form -->
	                                 <form method="post" action="photoUpload.do" enctype="multipart/form-data">
		                                 <div class="form-group">
										    사진 업로드를 하시겠습니까?  <input type="file" name="uploadFile" multiple="multiple" class="btn btn-user "/>
										 
										 <div class="row">
                                	<div class="col-lg-9 col-sm-6 mb-3 mb-sm-0 ">
                                	<input type="hidden" id="rptitle" name="rptitle" value="${rptitle }">
                                	<!-- 위에 레시피 입력 폼에있는 제목 값을 넣어서 넘겨야함 -->
										        <input type="submit" value="Upload"  class="btn btn-primary btn-user btn-block"/>
                                	</div>
                                	
                                	
                                	
                                	
	                                	<div class="col-lg-3 col-sm-6 mb-3 mb-sm-0 ">
											<input type="reset" class="btn btn-danger btn-user btn-block"  value="cancel">
	                                	</div>
                                	</div>
							 	</div>
							</form>	
                                	
                               
                               </div>
                               
                               
                                <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
                               
                               
                               
</body>
</html>