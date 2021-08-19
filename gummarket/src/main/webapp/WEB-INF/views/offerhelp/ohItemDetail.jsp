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

			
			
			
			//------------------------------댓글용-------------------------------//

			//댓글 불러오기 ajax
			$(document).ready(function(){
				// 수정 폼 숨기기
				$('#showComUpdate').hide();
				
				console.log($('#cMainNum'));
				//전체 데이터 출력.
				$.ajax({
					url: 'SelectCommentServ',
					method:'post',
					dataType: 'json',
					data: {
						sNo:$('#cMainNum').val()
					},
					success: itemListFnc,
					error: function () {
						console.log("으악")
					}
			});
				

			let fields = ['cmId', 'cContents'];
			//댓글 조회 콜백함수
			function itemListFnc(data) {
				console.log(data);	
			
				for (let i = 0; i < data.length; i++) {  
					const divCase = $('<div />').attr('class', 'd-flex justify-content-between').attr("id", data[i]['cNo']);
			         const divMain = $('<div />').attr('class', 'd-flex align-items-center');
			         let img =$('<img />').attr('class', 'rounded-circle').attr('src','img/undraw_profile_1.svg').css({
			               "width": "2rem",
			               "height": "2rem"
			             });
			         let userName = $('<span />').css("font-size","1.5rem").text(data[i]['cmId']).addClass("pl-2");
			         let comment = $('<span />').css({"font-size": "1.5rem","margin-left": "30px" }).text(data[i]['cContents']);
			         divMain.append(img ,userName, comment);
			         
			         console.log(data[i]['cmId']);
			         $(divCase).append(divMain);
			        	 
				         const btnDiv =$('<div />');
				         const delBtn=$('<button />').attr("class", "btn btn-warning mr-2").css("float", "right").text("Delete");
				         const updBtn=$('<button />').attr("class", "btn btn-warning mr-2").css("float", "right").text("Edit");
				         
					         //신고하기(신고하기 어디로???)
					         const reportForm = $('<form/>').attr('action', '#');
					         const reportBtn 
					         	= $('<a />').addClass("btn btn-danger btn-md")
					         				.attr({
					         					'href':"#",
					         					"data-toggle":"modal",
					         					"data-target":"#reportModal"
					         					})
					         				.append($('<i/>').addClass("fas fa-bullhorn").text('신고하기'));
				         
				         reportForm.append(reportBtn);
				         
				         reportBtn.click();
				         
				         delBtn.click(kill);
						 updBtn.click(update);
				         btnDiv.append(delBtn, updBtn);
				         
			         var mId = "<%=(String)session.getAttribute("mId")%>";
			         console.log(mId);
			         if(mId == data[i]['cmId']){
			        	 
				         $(divCase).append(btnDiv);
			         }
			         if(mId != data[i]['cmId']){
				         $(divCase).append(reportForm);
			         }
			         
			         
				$('#commentsBody').append(divCase);
			      
			}
			}
			
			//댓글 입력 ajax
			$('#reply').on('submit', function (event) {
				event.preventDefault(); //디폴트값은 못들어가게
				let s = $('#reply').serialize();
				console.log(s);

				//폼 전송처리
				$.ajax({
					url: $('#reply').attr('action'), //='../AddItemServ.do'
					method: 'post',
					data: $('#reply').serialize(), //파라미터로 넘김
					dataType: 'json', //받아오는 값
					success: addItemFunc,
					error: function (reject) {
						console.error(reject);
					}
				})
			})
		});

			let fields = ['cmId', 'cContents'];
			//입력처리 후 콜백함수
			function addItemFunc(data) { //{itmeNo: ?, itemName:? ......}
				console.log(data)
				const divCase = $('<div />').attr('class', 'd-flex justify-content-between').attr('id',data.cNo);
			    const divMain = $('<div />').attr('class', 'd-flex align-items-center');
				
			        let img =$('<img />').attr('class', 'rounded-circle').attr('src','img/undraw_profile_1.svg').css({
			              "width": "2rem",
			              "height": "2rem"
			            });
			        let userName = $('<span />').css("font-size","1.5rem").text(data['cmId']);
			        let comment = $('<span />').css({"font-size": "1.5rem","margin-left": "30px" }).text(data['cContents']);
			        divMain.append(img, userName, comment);
			        
			        const btnDiv =$('<div />');
			        const delBtn=$('<button />').attr("class", "btn btn-warning mr-2").css("float", "right").text("Delete");
			        const updBtn=$('<button />').attr("class", "btn btn-warning mr-2").css("float", "right").text("Edit");
			        btnDiv.append(delBtn, updBtn);
			        delBtn.click(kill);
					updBtn.click(update);
			        $(divCase).append(divMain, btnDiv)
				$('#commentsBody').append(divCase);
			     
			}
				

			//댓글 삭제하기
			function kill(e) {
				console.log(e.target.parentNode.parentNode);
				//location.href='../DeleteServ.do?itemNo='+$(this).parent().children().eq(0).text();
				$.ajax({
					url: 'DeleteCommentServ',
					data: {
						cNo: $(this).parent().parent().attr('id')
					},
					success: function () {
						e.target.parentNode.parentNode.remove();
					},
					error: function () {
						alert("삭제에서 에러발생!!")
					}
				})
			}
			
			
			
			//업데이트 폼나오게 테스트! -> 성공!
			function update(e){
				
				let modForm = $("#showComUpdate");
				$(this).parent().append(modForm);
				console.log($(this).parent().parent().children().eq(0).children().eq(2).text());
				let content = $(this).parent().parent().children().eq(0).children().eq(2).text();
				let cNo = $(this).parent().parent().attr('id');// tr의 id값 가져옴~
				/* $(this).children().eq(0).hide(); */
				modForm.show();
				
				$(modForm).find("#cUpdated").val(content);
				$(modForm).find('#cNo').val(cNo);
			}
			
			//업데이트 -> 성공! 이름 
			function updateCom(){
				event.preventDefault(); //디폴트값은 못들어가게
				let s = $('#updateRep').serialize();

				//폼 전송처리
				$.ajax({
					url: $('#updateRep').attr('action'), 
					method: 'post',
					data: $('#updateRep').serialize(), //파라미터로 넘김
					dataType: 'json', //받아오는 값
					success: updateItemFunc,
					error: function (reject) {
						console.error(reject);
					}
				})
			}
			
			function updateItemFunc(data){
				
				$.ajax({
					url: 'UpdateCommentServ',
					data: {
						cNo: $(this).parent().attr('id')
					},
					success: function () {
						$('#'+data.cNo).children().eq(0).children().eq(2).text(data.cContents); //$('#'+data.cNo) :data.cNo를 id로 가진 tr을 가져옴~
						$('#showComUpdate').hide();
					},
					error: function (e) {
						alert("수정에서 에러발생!!")
						console.error(e);
					}
				})
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