<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	console.log($('#cMainNum'));
	//전체 데이터 출력.
	$.ajax({
		url: 'SelectReplyServ',
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
if(data[0]['cNo']!=0){ //글 있을 때만 보이게 하기 위해 
	
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
		         	= $('<a />').addClass("btn btn-danger btn-sm")
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
	const divCase = $('<div />').attr('class', 'd-flex justify-content-between').attr('id',data[cNo]);
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

</head>
<body id="page-top">
<!-- Begin Page Content -->
	<div class="container">
	<div class="continer my-auto pl-4 pb-3">
			
	</div>
		<!-- DataTales Example -->
		<div class="card shadow mt-4 mb-4" style="margin-left: 4rem; margin-right: 4rem">
			<div class="card-header py-3">
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >${item.bTitle }
				<!-- 로그인세션확인해서 본인만 글 수정하고 삭제 가능하도록 -->
				 </h3>
				 <c:if test="${session.role != 'ADMIN' }">
					<button class="btn btn-sm"  onclick="csItemDelete(${csc.csNo })" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255); float:right;">
					<i class="far fa-trash-alt"></i> 글 삭제</button>
				 	<button class="btn btn-sm mr-3"  onclick="csItemUpdate(${csc.csNo  })" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
					<i class="far fa-edit"></i> 글 수정</button>
				</c:if>			
			</div>
			<div class="card-body">
				<div style="width:100%" class="d-flex justify-content-center">
					<img class="card" src="img/cscPic2.png" width="350px" height="300px">
				</div>
				<br><br />
				<hr>				   
				<div class="card-header py-3">
					${csc.mId } : ${csc.csTitle }
				</div>
				
				<div class="card-body">
					<div>
					${csc.csContents }
					</div>
				</div>
			</div>
				<p></p>
				
				<div class="pb-3 mx-auto"  style="align-items: center;">
				
				
				<button class="btn btn-md mr-5" type="button" onclick="location.href='myCscList.do'" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
				<i class="fas fa-undo-alt"></i>목록으로</button>
				
				</div>
				
			</div>
			
			
		</div>
	<!-- /.container-fluid -->
	

	<!-- bItem 메인 글 수정, 삭제 폼 -->
		<form id="csUpdate" name="csUpdate" action="csItemUpdateForm.do" method="post">
			<input type="hidden" id="csNo" name="csNo">
		</form>

		<form id="csDelete" name="csDelete" action="csItemDelete.do" method="post">
			<input type="hidden" id="csNo" name="csNo">
		</form>
	<!--End of bItem 메인 글 수정, 삭제 폼 -->
	
	<!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
	 <!-- End of Scroll to Top Button-->
	 
	
	
	
</body>
</html>