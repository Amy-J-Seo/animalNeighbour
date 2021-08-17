<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function getRecord(n) {
		frm.mId.value = n;
		frm.submit();
	};
</script>
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/datatables-demo.js"></script>
<script type="text/javascript" src="vendor/jquery/jquery.js"></script>


	<div class="container-fluid">

		<h1 class="h3 mb-2 text-gray-800" align="center">회원관리</h1>
		<div class="card shadow mb-4">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered table-hover" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이메일</th>
								<th>닉네임</th>
								<th>이름</th>
								<th>주소</th>
								<th>휴대번호</th>
								<th>상태</th>
								<th>펫정보</th>
								<th>리뷰포인트</th>
								<th>구매포인트</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${list }">
								<tr onclick="getRecord('${member.mId}')">
									<td>${member.mId }</td>
									<td>${member.email }</td>
									<td>${member.nickname }</td>
									<td>${member.mName }</td>
									<td>${member.address }</td>
									<td>${member.phone }</td>
									<td>${member.state }</td>
									<td>${member.petInfo }</td>
									<td>${member.reviewPoint }</td>
									<td>${member.buyPoint }</td>
								</tr>
							</c:forEach>
							</tbody>
					</table>
				</div>
			</div>
			<div>
			<form id="frm" name="frm" action="memberDetail.do" method="post">
				<input type="hidden" id="mId" name="mId">
			</form>
		</div>
		<button onclick="location.href='home.do'" class="btn btn-dark mx-2">홈으로</button>
		</div>
	</div>



