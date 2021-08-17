<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">게시판</h1>
		<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h5 class="m-0 font-weight-bold">${list.mName }</h5>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div>
						아이디<input type="text" disabled value="${list.mId}"><br>
						<input type="text" disabled value="${list.mName}"><br>
						<input type="text" disabled value="${list.mName}"><br>
						<input type="text" disabled value="${list.mName}"><br>
						<input type="text" disabled value="${list.mName}"><br>
						
						
						<form id="fra" name="fra" action="deleteSns.do" method="post">
							<input type="hidden" name="sNo" value="" id="sNo">
							<input type="submit" value="휴면계정화" class="btn btn-secondary">
						</form>
						<br />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>