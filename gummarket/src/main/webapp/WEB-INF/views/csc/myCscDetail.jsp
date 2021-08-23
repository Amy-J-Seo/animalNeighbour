<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트공지메인</title>

<script type="text/javascript">

function csItemUpdate(n) {
	csUpdate.csNo.value=n;
	console.log(csUpdate.csNo.value);
	
	csUpdate.submit();
}

function csItemDelete(n) {	
	  let result = confirm(" 정말 삭제하시겠습니까?? ");
	  if(result) {
		  csDelete.csNo.value=n;
		  csDelete.submit();
	 	 }
	}
	
	
	
//댓글 불러오기 ajax
$(document).ready(function(){
	// 수정 폼 숨기기
	$('#showComUpdate').hide();
	
	console.log($('#csNo').val());
	//전체 데이터 출력.
	$.ajax({
		url: 'SelectAnswerServ',
		method:'post',
		dataType: 'json',
		data: {
			csNo:$('#csNo').val()
			//	aNo : 
		},
		success: itemListFnc,
		error: function (error) {
			console.log(error);
		}
});
	
	console.log($('#commentsBody #wateForAnswer').text());

let fields = ['aTitle', 'aContents'];
//답글 조회 콜백함수
function itemListFnc(data) {
	console.log(data);
	if(data['aNo']!=0){ //글 있을 때만 보이게 하기 위해 
	
	//for (let i = 0; i < data.length; i++) {  
		const divCase = $('<div />').attr('class', ' justify-content-between').attr("id", data['csNo']);
        const divMain = $('<div />').attr('class', 'align-items-left');
       
         let title = $('<div />').css("font-size","1.3rem").text(data['aTitle']).addClass("pl-2");
         let br =$('<br/>')
         let comment = $('<div />').css({"font-size": "1rem",}).text(data['aContents']);
         $(divMain).append(title,br,comment);
         
        //console.log(data[i]['cmId']);
         $(divCase).append(divMain);
        	 
	         const btnDiv =$('<div />');
	         const delBtn=$('<button />').attr("class", "btn btn-warning mr-2").css("float", "right").text("Delete");
	         const updBtn=$('<button />').attr("class", "btn btn-warning mr-2").css("float", "right").text("Edit");
	         
	         delBtn.click(kill);
			 updBtn.click(update);
	         btnDiv.append(delBtn, updBtn);
     		
	         
	         //$(divMain).append(btnDiv);
	         $(divCase).append(btnDiv);
		  	console.log(divCase);
			$('#commentsBody').append(divCase);
			$('#commentsBody h4').remove(); // 답변중 h4테그 숨기기!
        // }
    
}
      
}


//댓글 입력 ajax
$('#reply').on('submit', function (event) {
	event.preventDefault(); //디폴트값은 못들어가게
	let s = $('#reply').serialize();
	console.log(s);

	//폼 전송처리
	$.ajax({
		url: $('#reply').attr('action'), 
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

let fields = ['mId', 'aContents'];
//입력처리 후 콜백함수
function addItemFunc(data) { //{itmeNo: ?, itemName:? ......}
	console.log(data)
	const divCase = $('<div />').attr('class', 'd-flex justify-content-between').attr("id", data['csNo']);
    const divMain = $('<div />').attr('class', 'align-items-center');
       
         let title = $('<div />').css("font-size","1.5rem").text(data['aTitle']).addClass("pl-2");
         let comment = $('<span />').css({"font-size": "1.5rem","margin-left": "30px" }).text(data['aContents']);
         $(divMain).append(title, comment);
         
        //console.log(data[i]['cmId']);
         $(divCase).append(divMain);
        	 
	         const btnDiv =$('<div />');
	         const delBtn=$('<button />').attr("class", "btn btn-warning mr-2").css("float", "right").text("Delete");
	         const updBtn=$('<button />').attr("class", "btn btn-warning mr-2").css("float", "right").text("Edit");
	         
	         delBtn.click(kill);
			 updBtn.click(update);
	         btnDiv.append(delBtn, updBtn);
     		
	         
	         $(divCase).append(btnDiv);
		  	console.log(divCase);
			$('#commentsBody').append(divCase);
			$('#commentsBody h4').remove();// 답변중 h4테그 숨기기! 
	
     
}
	

//댓글 삭제하기
function kill(e) {
	console.log(e.target.parentNode.parentNode);
	let csNo = $(this).parent().parent().attr('id')
	//location.href='../DeleteServ.do?itemNo='+$(this).parent().children().eq(0).text();
	$.ajax({
		url: 'DeleteAnswerServ',
		data: {
			csNo: csNo
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
	let csNo = $(this).parent().parent().attr('id');
	console.log($(this).parent().parent().children().eq(1));
	let content = $(this).parent().parent().children().eq(0).children().eq(2).text();
	/* $(this).children().eq(0).hide(); */
	modForm.show();
	
	$(modForm).find("#cUpdated").val(content);
	$(modForm).find('#csNo').val(csNo);
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
		url: 'UpdateAnswerServ',
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

</head>
<body id="page-top">
	<!-- Begin Page Content -->
	<div class="container">
		<div class="continer my-auto pl-4 pb-3"></div>
		<!-- DataTales Example -->
		<div class="card shadow mt-4 mb-4"
			style="margin-left: 4rem; margin-right: 4rem">
			<div class="card-header py-3">
				<h3 class="m-0 font-weight-bold text-dark"
					style="text-align: center;">${item.bTitle }
					<!-- 로그인세션확인해서 본인만 글 수정하고 삭제 가능하도록 -->
				</h3>
				<c:if test="${session.role != 'ADMIN' }">
					<button class="btn btn-sm" onclick="csItemDelete(${csc.csNo })"
						style="background-color: rgb(255, 190, 83); color: rgb(255, 255, 255); float: right;">
						<i class="far fa-trash-alt"></i> 글 삭제
					</button>
					<button class="btn btn-sm mr-3"
						onclick="csItemUpdate(${csc.csNo  })"
						style="background-color: rgb(255, 190, 83); color: rgb(255, 255, 255); float: right;">
						<i class="far fa-edit"></i> 글 수정
					</button>
				</c:if>
			</div>
			<div class="card-body">
				<div style="width: 100%" class="d-flex justify-content-center">
					<img class="card" src="img/1market.png" width="350px"
						height="300px">
				</div>
				<br> <br />
				<hr>
				<div class="card-header py-3">
					<i class="fas fa-paw"></i>작성자 : ${csc.mId }&nbsp;|&nbsp; <i
						class="fas fa-paw"></i>글 제목 : ${csc.csTitle }&nbsp;|&nbsp; <i
						class="fas fa-paw"></i>작성일 : ${csc.csDate }
				</div>

				<div class="card-body">
					<!-- 관리자만 회원 등급, 이메일, 번호 볼 수 있게? -->
					<c:if test="${session.role == 'ADMIN' }">
						전화번호 : ${csc.phone }<br>
						이메일 : ${csc.email} <br>
						등급 : ${csc.grade }<br>

					</c:if>

					<div>
						문의하신 내용: <br> ${csc.csContents }
					</div>
				</div>
			</div>
			<p></p>
			<!-- 답변 대기중 화면 => 답변 달리면 그 답변이 올라오게! -->
			<div class="card mb-2">
				<div class="card-header bg-light">
					<i class="fa fa-comment fa"></i> 답 변
				</div>
				<div class="card-body">
					<div id="commentsBody" align="center">
						<h4 id="wateForAnswer">조금만 기다려주시면 곧 답을 드릴게요! (*'▽'*)</h4>
					</div>
				</div>
			</div>
			<p></p>
			<c:if test="${session.role =='ADMIN' }">
				<!-- 답글 입력 -->
				<div class="card mb-2">
					<div class="card-header bg-light">
						<i class="fa fa-comment fa"></i> REPLY
					</div>
					<div id ="answerInput"class="card-body">
						<form id="reply" action="AnswerInsertServ" method="post">
							<ul class="list-group list-group-flush">

								<li class="list-group-item"><input class="form-control"
									type="text" id="aTitle" name="aTitle" placeholder="글제목">
									<br> <input type="hidden" id="csNo" name="csNo"
									value="${csc.csNo }"> <textarea class="form-control"
										id="aContents" name="aContents" rows="3"
										placeholder="답변내용을 입력해주세요"></textarea>
									<div align="right">
										<button type="submit" class="btn btn-dark mt-3">답변 등록</button>
									</div></li>
							</ul>
						</form>
					</div>
				</div>
			</c:if>

			<p></p>

			<div class="pb-3 mx-auto" style="align-items: center;">
				<c:if test="${session.role =='ADMIN' }">
					<button class="btn btn-md mr-5" type="button"
					onclick="location.href='everyCscList.do'"
					style="background-color: rgb(255, 190, 83); color: rgb(255, 255, 255);">
					<i class="fas fa-undo-alt"></i>목록으로
					</button>
				</c:if>
				<c:if test="${session.role !='ADMIN' }">
					<button class="btn btn-md mr-5" type="button"
						onclick="location.href='myCscList.do'"
						style="background-color: rgb(255, 190, 83); color: rgb(255, 255, 255);">
						<i class="fas fa-undo-alt"></i>목록으로
					</button>
				</c:if>
			</div>

		</div>


	</div>
	<!-- /.container-fluid -->


	<!-- bItem 메인 글 수정, 삭제 폼 -->
	<form id="csUpdate" name="csUpdate" action="csItemUpdateForm.do"
		method="post">
		<input type="hidden" id="csNo" name="csNo">
	</form>

	<form id="csDelete" name="csDelete" action="csItemDelete.do"
		method="post">
		<input type="hidden" id="csNo" name="csNo">
	</form>
	<!--End of bItem 메인 글 수정, 삭제 폼 -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!-- End of Scroll to Top Button-->




</body>
</html>