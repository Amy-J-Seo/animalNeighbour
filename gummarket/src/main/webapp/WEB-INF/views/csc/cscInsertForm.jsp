<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>csc 입력 폼 만들기!</title>
</head>
<body id="page-top">
	<div class="container-fluid" >
	<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4"  style="margin-left: 4rem; margin-right: 4rem">
			<div class="card-header py-3">
				
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >Contect us...
				 </h3>	
			</div>
			<div class="card-body">
			<form class="user" id="frm" name="frm" action="cscInsert.do" method="post" >
		    	<div class="row">
		    		<div class="col-lg-6 col-sm-6 mb-3 mb-sm-0" align="center">
		    		<br><br>
		    			<i class="fas fa-envelope">email</i><br>
						<input type="text" id="cscEmail" name="cscEmail" placeholder="이메일을 입력해주세요"><br><br>
						<i class="fas fa-mobile">phone</i><br>
						<input type="text" id="cscPhone" name="cscPhone" placeholder="전화번호를 입력해주세요">	<br><br>
						<i class="fas fa-question-circle">title</i><br>
						
						<input type="text" id="csTitle" name="csTitle" placeholder="무엇에 관한 내용인가요">	<br><br>
						<i class="far fa-edit">contents</i><br>
						<textarea rows="5" cols="50" id="csContents" name="csContents" placeholder="내용을 입력해주세요">
						</textarea>	    		
		    		</div>
		    		<div class="col-lg-6 col-sm-6 mb-3 mb-sm-0">
		    			<br>
		    			<img class="card-img-top" src="img/rabbitWalk.webp" alt="csc" width="80%" height="80%"/>
		    		</div>
		    	
				</div>
				<!-- 입력 버튼! -->
				<div class="row" >
					<div class="col-lg-6 col-sm-6 mb-3 mb-sm-0" align="center">
						<button class="btn btn-md mr-6"  type="submit" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);"><i class="far fa-check-circle"></i> 글 등 록</button>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
     
</body>
</html>