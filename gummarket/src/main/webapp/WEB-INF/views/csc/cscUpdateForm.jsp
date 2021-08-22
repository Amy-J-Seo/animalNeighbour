<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>csc 수정하기</title>

<style>
	
	 input::placeholder, textarea::placeholder {
        /* color: rgb(255, 190, 83) !important; */
        font-weight: 100;
        font-style: italic;
      }

</style>

</head>
<body id="page-top">
	<div class="container" >
	<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4"  style="margin-left: 4rem; margin-right: 4rem">
			<div class="card-header py-3">
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >Contect us...
				 </h3>	
			</div>
			<div class="card-body">
			<div class="container" >
			<form class="user" id="frm" name="frm" action="csUpdate.do" method="post" >
		    	<div class="row">
		    		<div class="col-lg-6 col-sm-6 mb-3 mb-sm-0" align="left">
		    		<br><br>
						<label for="csTitle"><i class="fas fa-question-circle">&nbsp;title</i></label><br>
						<input type="text" class="form-control" id="csTitle" name="csTitle" value='${csc.csTitle }'>	<br><br>
						<label for="csContents"><i class="far fa-edit">&nbsp;contents</i></label><br>
						<textarea rows="5" cols="50" class="form-control" id="csContents" name="csContents">${csc.csContents }</textarea>	    
		    		</div>
		    		<!-- csc에 넣을만한 예쁜 사진 필요...! -->
		    		<div class="col-lg-1 mb-sm-0">
		    		</div>
		    		
		    		<div class="col-lg-5 col-sm-6 mb-3 mb-sm-0">
		    			<br>
		    			<img class="card-img" src="img/cscPic2.png" alt="csc" height="330px" style="margin-top: 30px;"/>
		    		</div>
		    		 <input type="hidden" id="csNo" name="csNo" value="${csc.csNo}">
				</div>
				<!-- 입력 버튼! -->
				<br>
				<div class="row" >
					<div class="col-lg-6 col-sm-6 mb-3 mb-sm-0" align="center">
						<button class="btn btn-md mr-6"  type="submit" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);"><i class="far fa-check-circle"></i>수정하기</button>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
	</div>
     
</body>
</html>