<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Error page! 아무나 사용가능! 그 전 페이지에서 set attribute로 message 전달해서 받으세용~-->
				
				<!-- Begin Page Content -->	
                <div class="container-fluid">

                    <!-- 404 Error Text -->
                    <div class="text-center">
                        <img alt="" src="img/dog.png">
                        <p class="lead text-gray-800 mb-5">${message }</p>
                        <p class="text-gray-500 mb-0">So sorry~~~!!! Something went wrong...</p>
                        <a href="home.do">&larr; Back to Main</a>
                    </div>

                </div>
                <!-- /.container-fluid -->
</body>
</html>