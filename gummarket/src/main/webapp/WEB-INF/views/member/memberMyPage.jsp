<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Begin Page Content -->
<div class="container-fluid">
	 <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between my-auto pl-4 pb-4">
		<p id="itemCategory" class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">
		<i class="fas fa-user"></i>  회원 마이페이지</p>
        <!-- <h1 class="h3 mb-0 text-gray-800">Cards</h1> -->
    </div>
	
	<!-- 간략 프로필 아이콘/닉네임/리뷰포인트 -->
	<div class="text-center align-items-center row">
		<div class="col-lg-4">
			<img class="rounded-circle pt-1" src="img/undraw_profile_1.svg" style="width: 5rem; height:5rem;">
			<p style="font-size:30px">${member.nickname } 님</p>
		</div>
		<div class="col-lg-8" >
			<h3>${member.mId }님의 리뷰 포인트: ${member.reviewPoint }</h3>
		</div>
	</div>
	
	<div class="row pl-3 pr-3 mt-3">
		<div class="col-xl-5 col-md-6 mb-4">
	    <!-- 나의 구매내역 -->
		<div class="card shadow mr-2 ml-2 mb-4 mt-2">
			<div class="card-header py-3">
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >${item.fhTitle }</h3>
			</div>
			<div class="card-body">
				<div style="width:100%" class="d-flex justify-content-center">
					<img class="card" src="img/fhImg/${item.fhImg }">
				</div>
				
				<div class="card-header py-3">
				${item.fhCategory } : ${item.fhTitle }
									
				</div>
				
					<div class="card-body">
					<!-- user info -->
						<div class="pb-1 d-flex align-items-center">
							<div>
								<img class="rounded-circle" src="img/undraw_profile_1.svg" style="width: 2.5rem; height:2.5rem;">
								<span class="pl-3" style="font-size: 2rem;">
								<a id="memberInfoModal" data-toggle="modal" data-target="#memberInfo" >${item.mId }</a></span>
							</div>				
						</div>
					<!-- end of user info -->
					<hr>
						<div>
							<p>${item.fhNeed }</p>
							<p>${item.fhHow }</p>
						</div>
					</div>
				</div>
			</div>
		
		
		
		</div>
		<div class="col-xl-7 col-md-6 mb-4">
		<!-- 나의 활동내역 카드-->
		<div class="row pl-3 pr-3 mt-2">
			       <!-- 나의 구매내역 -->
        <div class="col-xl-6 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
            	<div class="card-header py-3">
					<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >나의 판매글
					 </h3>
					 <button class="btn btn-sm mr-1"  onclick="location.href='memberList.do'" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
					 <i class="fas fa-search-plus"></i> 더보기</button>
				</div>
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                총 회원 수</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">100</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-4x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
         <!-- 총 신고수 -->
        <div class="col-xl-6 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
            	<div class="card-header py-3">
					<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >나의 신고글
					 </h3>
					 <!-- To add report table view page link BB-->
					 <button class="btn btn-sm mr-1"  onclick="location.href='rSelectList.doBB'" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
					 <i class="fas fa-search-plus"></i> 더보기</button>
				</div>
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                신고 게시글 수</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-bell fa-4x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
		</div>
		<div class="row pl-4 pr-4 mt-5">
			<div class="col-xl-6 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
            	<div class="card-header py-3">
					<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >나의 도움주기 글
					 </h3>
					 <button class="btn btn-sm mr-1"  onclick="location.href='memberList.do'" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
					 <i class="fas fa-search-plus"></i> 더보기</button>
				</div>
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                총 회원 수</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">100</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-4x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
         <!-- 총 신고수 -->
        <div class="col-xl-6 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
            	<div class="card-header py-3">
					<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >나의 도움찾기 글
					 </h3>
					 <!-- To add report table view page link BB-->
					 <button class="btn btn-sm mr-1"  onclick="location.href='rSelectList.doBB'" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
					 <i class="fas fa-search-plus"></i> 더보기</button>
				</div>
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                신고 게시글 수</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-bell fa-4x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		</div>
		</div>
		
	</div>






    
    

   

</div>
<!-- /.container-fluid -->
</body>
</html>