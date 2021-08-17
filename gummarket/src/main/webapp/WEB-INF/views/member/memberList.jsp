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


<div class="container">

	<div class="card o-hidden border-0 shadow-lg my-5">
		<div class="card-body p-0">
			<!-- Nested Row within Card Body -->
			<div class="row">

				<div class="col-lg-12">
					<div class="p-5" align="center">
						<p class="h3 mb-0 mt-5"
							style="color: rgb(255, 190, 83); font-weight: 900;">회원리스트</p>
						<br>
						<div class="form-group row col-lg-12">
						<div class="col-lg-6 col-sm-4 mb-3 mb-sm-0 " align="left">
							<!-- search -->
							<form class="d-none d-sm-inline-block form-inline navbar-search"
								style="display: block">
								<div class="input-group">
									<input type="text" class="form-control bg-light border-0 small"
										placeholder="" aria-label="Search"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<!-- 서치버튼 색 바꾸고 싶으면 바꾸어도 됩니다. -->
										<button class="btn btn-warning btn-user btn-block"
											type="button">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
						</div>

						<div class="card o-hidden border-0 shadow-lg my-5">
							<div class="table-responsive">
								<table class="table table-bordered table-hover ">
									<thead>
										<tr>
											<th>아이디</th>
											<th>이메일</th>
											<th>닉네임</th>
											<th>이름</th>
											<th>주소</th>
											<th>휴대번호</th>
											<th>상태</th>
											<th>권한</th>
											<th>리뷰포인트</th>
											<th>구매포인트</th>
											<th>펫정보</th>
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
												<td>${member.role }</td>
												<td>${member.reviewPoint }</td>
												<td>${member.buyPoint }</td>
												<td>${member.petInfo }</td>
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
						<div class="form-group row col-lg-12">

							<div class="col-lg-4 col-sm- mb-1 mb-sm-0 ">
								<button onclick="location.href='home.do'"
									class="btn btn-warning btn-user btn-block">홈으로</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


