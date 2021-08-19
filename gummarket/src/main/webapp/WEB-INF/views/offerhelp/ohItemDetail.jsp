<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<!-- like button css -->
		<style>

		</style>



		<script>

			//삭제버튼 누르면 alert
			function confirmDel(n) {
				alert("글을 삭제할까요?");
				console.log(n);
				if (confirm("삭제되었습니다.")) {
					frm.ohDelNo.value = n;
					console.log(n);
					frm.submit();

				} else {
					return false;
				}
			}
			function OhItemDelete(no) {
				location.href = 'ohItemDelete.do?ohdelNo=' + no;
			}


			//글 수정
			function updateSales(n) {
				frm1.ohNo.value = n;
				frm1.submit();
				//location.href='updateSales.do';
			}

			function ohItemUpdate(no) {
				location.href = 'ohItemUpdateForm.do?ohNo=' + no;
			}

		</script>

		<body>

			<!-- Begin Page Content -->
			<div class="container-fluid">
				<!-- DataTales Example -->
				<div class="card shadow mb-4" style="margin-left: 4rem; margin-right: 4rem">
					<div class="card-header py-3">

						<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;">${item.ohTitle }
							<!-- 로그인세션확인해서 본인만 글 수정하고 삭제 가능하도록 -->

							<button class="btn btn-sm" id="deleteBtn" onclick="confirmDel('${item.ohNo}')"
								style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255); float:right;"><i
									class="far fa-trash-alt"></i> 글 삭제</button>
							<button class="btn btn-sm mr-3" id="updateBtn" onclick="ohItemUpdate('${item.ohNo}')"
								style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;"><i
									class="far fa-edit"></i> 글 수정</button>

						</h3>
					</div>
					<div class="card-body">


						<div class="card shadow mb-4">
							<div class="card-header py-3">${item.ohTitle }</div>
							<div class="card-body">
								제목 : ${item.ohCategory }<br>
								닉네임? : ${item.mId }<br>
								나의 특징? : ${item.ohHistory }<br>
								나의 동네?: ${item.ohAddress }<br>
								무슨 도움? : ${item.ohDetails }<br>

							</div>
						</div>
						<!-- 댓글조회 -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">댓글</div>
							<div class="card-body">
								<!-- 댓글 보기+ 수정 , 삭제 버튼 -->
								<div id="show"></div>

								<%-- <c:forEach var="list" items="${list }">
									${list.cmId }:
									${list.cContents }<br>
									</c:forEach> --%>
							</div>
						</div>
						<!-- 댓글 입력 -->
						<div class="card mb-2">
							<div class="card-header bg-light">
								<i class="fa fa-comment fa"></i> REPLY
							</div>
							<div class="card-body">
								<form id="reply" action="CommentInsertServ" method="post">
									<ul class="list-group list-group-flush">
										<li class="list-group-item">

											<input type="hidden" id="ohNo" name="ohNo" value="${item.ohNo }">
											<textarea class="form-control" id="ohContents" name="ohContents"
												rows="3"></textarea>
											<button type="submit" class="btn btn-dark mt-3">post reply</button>
										</li>
									</ul>
								</form>
							</div>
						</div>
					</div>

					<br>
					<div class="pb-3 mx-auto" style="align-items: center;">
						<!-- To do style again -->
						<!-- Like btn form -->
						<form id="likeFrm" name="likeFrm" action="UpdSalesLikeServlet" method="post">
							<input type="hidden" id="mainNo" name="mainNo" value="${item.ohNo }">


							<button class="btn btn-md mr-5" onclick="location.href='#'"
								style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);"><i
									class="far fa-credit-card"></i> 메세지 보내기</button>
							<a class="btn btn-danger btn-md" href="#" data-toggle="modal" data-target="#reportModal"><i
									class="fas fa-bullhorn"></i> 신고하기</a>

						</form>
					</div>
				</div>
			</div>

			<form id="frm" name="frm" action="ohItemDelete.do
			" method="post">
				<input type="hidden" id="ohDelNo" name="ohDelNo">
			</form>
			<form id="frm1" name="frm1" action="updateSales.do" method="post">
				<input type="hidden" id="ohNo" name="ohNo">
			</form>

			<!-- report moral -->
			<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-bullhorn"></i> 이 게시글을
								신고하시겠습니까?</h5>
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<form id="fhReport" name="fhReport" action="FhItemReportServlet" method="post">
							<div class="modal-body">
								<input type="radio" id="bannedItem" name="reason" value="banItem">
								<label for="bannedItem">판매금지 품목이에요</label><br>
								<input type="radio" id="notSecondHand" name="reason" value="notForSecondhand">
								<label for="notSecondHand">중고거래 게시글이 아니에요</label><br>
								<input type="radio" id="repeated" name="reason" value="repeated">
								<label for="repeated">중복 게시글이에요</label><br>
								<input type="radio" id="profSeller" name="reason" value="profSeller">
								<label for="profSeller">전문 판매업자 같아요</label><br>
								<input type="radio" id="scam" name="reason" value="scam">
								<label for="scam">사기 글이에요</label><br>
								<input type="radio" id="notSecondHand" name="reason" value="notForSecondhand">
								<label for="notSecondHand">기타 이유</label><br>
								<input type="hidden" id="ohNo" name="ohNo" value="${item.ohNo }">
							</div>

							<div class="modal-footer">
								<button class="btn btn-secondary" type="button" id="closeRModal"
									data-dismiss="modal">취소</button>
								<button class="btn btn-danger" type="submit" id="itemReportBtn"><i
										class="far fa-angry"></i> 신고</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- End of report modal -->

		</body>

		</html>