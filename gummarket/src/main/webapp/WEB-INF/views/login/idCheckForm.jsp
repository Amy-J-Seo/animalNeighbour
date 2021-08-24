<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.css" rel="stylesheet">
<style type="text/css">

	@font-face {
	    font-family: 'SeoulNamsanM';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	@font-face {
	    font-family: 'Cafe24SsurroundAir';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
	    font-family: 'Cafe24Ssurround';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
</style>
<head >
<meta charset="UTF-8">
<title>아이디 중복체크</title>
</head>
<body style="font-family: SeoulNamsanM;"> 
	<div align= "center" class="p-5">
	<div class="col-lg-12 col-sm-9 mb-8 mb-sm-0">
	<img src="img/1market.png" style="width: 50px; height: 50px;">
	<p class="h3" style="color: rgb(255, 190, 83); font-weight: 900;">아이디중복체크</p> 
	<br>
		<form method="post" action="idCheckPro.do" onsubmit="return blankCheck(this)"> 
			<input type="text" id="mId" name="mId" maxlength="10" autofocus
			required="required" class="form-control form-control-user"
			placeholder="아이디를 입력해주세요.">
		    <br>
		    <button type="submit" 
		    class="btn btn-warning btn-user btn-block"><i class="fas fa-check"></i>중복확인</button>
		</form> 
		</div>
	</div> 
	
	<script> 
		function blankCheck(f){ 
			var mId=f.mId.value; 
			mId=mId.trim(); 
			
			if(mId.length<3){ 
				alert("아이디는 3자 이상 입력해주십시오."); 
				return false; 
			}//if end 
			return true; 
		}//blankCheck() end 
	</script> 
</body>
</html>