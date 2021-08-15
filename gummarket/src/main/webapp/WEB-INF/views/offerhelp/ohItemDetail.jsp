<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움드려요 상세보기</title>
</head>
<body>
<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >${item.ohTitle }</h3>
				
			</div>
			<div class="card-body">
				<div>
					<img src="">
				</div>
				<br>
				<p>
				<h6 class="m-0 font-weight-bold text-primary">
					<span>${item.ohContents }</span> : 
					<span>${item.ohHistory }</span> : 
					<span>${item.ohAddress }</span>
					</h6>
				</p>
				<br />
				<p></p>
				<div class="card shadow mb-4">
				<div class="card-header py-3">이런 성격입니다.</div>
				<div class="card-body">${item.ohCharacter }<br>${item.ohDetails }</div>
				</div>
				<p></p>
				<%-- <div class="card shadow mb-4">
				<div class="card-header py-3">Recipe method</div>
				<div class="card-body">${recipe.rpMethod }</div>
				</div> --%>
				
			</div>
			
			<div>
			<!-- To do style again -->
				&nbsp;&nbsp;&nbsp;<button class="btn btn-secondary" style="float: right;" onclick="location.href='home.do'">To Main</button> &nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;<button class="btn btn-secondary" style="float: right;" onclick="location.href='allRecipeList.do'">To List</button>&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		
		
		
	</div>
	<!-- /.container-fluid -->
</body>
</html>