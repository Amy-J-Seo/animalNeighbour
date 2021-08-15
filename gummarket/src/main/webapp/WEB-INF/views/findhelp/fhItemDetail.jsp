<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움찾아요 상세보기</title>
</head>
<body id="page-top">
<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- DataTales Example -->
		<div class="card shadow mt-4 mb-4" style="margin-left: 4rem; margin-right: 4rem">
			<div class="card-header py-3">
				
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >${item.fhTitle }</h3>
				
			</div>
			<div class="card-body">
				<div>
				<!-- img class card-img 하고 싶은데 그러면 풀 화면일때 이미지가 너무 커서 줄이려고 해 봤지만 ㅠㅠ 안되네요... -->
					<img class="card" src="img/rabbitWalk.webp">
				</div>
				<br>
				<div>
				<h5 class="m-0 font-weight-bold pr-5" style="float:right;">
				<i class="fas fa-paw"></i>
					<span>${item.fhAnimal }</span> <i class="fas fa-paw"></i>
					<span>size : ${item.fhSize }</span> <i class="fas fa-paw"></i>
					<span>${item.fhAge } Months Old</span>
					</h5>
				</div>
				<br />
				<p><hr></p>
				
				<div class="card-header py-3">${item.fhCategory } : ${item.fhTitle }</div>
				
				<div class="card-body">
				<div class="pb-1">
				<img class="rounded-circle" src="img/undraw_profile_1.svg" style="width: 2.5rem; height:2.5rem;"><span class="pl-3" style="font-size: 2rem;">${item.nickname }</span>
				</div>
				<hr>
				<div>
				${item.fhNeed }<br>${item.fhHow }
				</div>
				
				</div>
				</div>
				<p></p>
				<%-- <div class="card shadow mb-4">
				<div class="card-header py-3">Recipe method</div>
				<div class="card-body">${recipe.rpMethod }</div>
				</div> --%>
				
				<div class="pb-3 mx-auto"  style="align-items: center;">
				
				<!-- To do style again -->
				<button class="btn btn-md mr-5"  onclick="location.href='#'" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);"><i class="fab fa-gratipay"></i> 좋아요!</button>
				<button class="btn btn-md mr-5"  onclick="location.href='#'" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);"><i class="fas fa-phone-alt"></i> 연락하기</button>
				<a class="btn btn-danger btn-md" href="#" data-toggle="modal"
					data-target="#logoutModal"><i class="fas fa-bullhorn"></i> 신고하기</a>
				
				</div>
				
			</div>
			
			
		</div>
	<!-- /.container-fluid -->
	
		<!-- write btn-->
    <a style="position: fixed;
  right: 1rem;
  bottom: 4rem;
  display: inline;
  width: 2.75rem;
  height: 2.75rem;
  text-align: center;
  color: #fff;
  background: rgb(252, 221, 33);
  line-height: 46px;
  border-radius: 0.35rem" href="writeFHForm.doBB">
        <i class="fas fa-edit"></i>
    </a>
	
	
	    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
	
	
</body>
</html>