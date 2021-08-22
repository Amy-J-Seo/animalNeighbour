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
    <div class="d-sm-flex align-items-center justify-content-between my-auto pl-4 pb-3">
		<p id="itemCategory" class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">
		<i class="fas fa-user-cog"></i>  관리자 메인 페이지</p>
        <!-- <h1 class="h3 mb-0 text-gray-800">Cards</h1> -->
    </div>

	<!-- member & report card -->
    <div class="row pl-4 pr-4 mt-5">
        <!--총 회원 수 -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
            	<div class="card-header py-3">
					<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >Total Member
					 </h3>
					 <button class="btn btn-sm mr-1"  onclick="location.href='memberList.do?mId='${session.mId}" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
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
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
            	<div class="card-header py-3">
					<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >Report to Check
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
        <!-- total sales -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
            	 <div class="card-header py-3">
					<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >Total Sales
					 </h3>
					 <!-- To addl link to Total sales table view page BB -->
					 <button class="btn btn-sm mr-1"  onclick="location.href='salesListAll.do'" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;"><i class="fas fa-search-plus"></i> 더보기</button>
				</div>
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                총 거래 게시글</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">500</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-money-bill-wave fa-4x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Total help -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
            <div class="card-header py-3">
				<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >Total Help
				 </h3>
				 <!-- To add Total help table page -->
				 <button class="btn btn-sm mr-1"  onclick="location.href='totalCareTableView.doBB'" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
				 <i class="fas fa-search-plus"></i> 더보기</button>
			</div>
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">멍냥케어 게시글 수
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">120</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div class="progress-bar bg-info" role="progressbar" style="width: 50%"
                                            aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-dog fa-4x text-gray-300"></i>
                            <i class="fas fa-cat fa-4x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End of member/report/sale/help status -->
    
    
    <!-- End of Event and Notice status -->
    <div class="row pl-4 pr-4 mt-5">
		<div class="col-xl-2 col-md-6 mb-4"></div>
         <!-- 총 신고수 -->
        <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
            	<div class="card-header py-3">
					<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >Total Event
					 </h3>
					 <!-- To add total event table view link -->
					 <button class="btn btn-sm mr-1"  onclick="location.href='totalEventTable.doBB'" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
					 <i class="fas fa-search-plus"></i> 더보기</button>
				</div>
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                이벤트 글 수</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-bell fa-4x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <!-- total sales -->
        <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
            	 <div class="card-header py-3">
					<h3 class="m-0 font-weight-bold text-dark pb-3" style="text-align: center;" >Total Notice
					 </h3>
					 <button class="btn btn-sm mr-1"  onclick="location.href='noticeMain.doBB'" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;">
					 <i class="fas fa-search-plus"></i> 더보기</button>
				</div>
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                공지 글 수</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">500</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-money-bill-wave fa-4x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		
        
        <div class="col-xl-2 col-md-6 mb-4"></div>
    </div>
 	<!-- End of Event and Notice status -->
 	
 	
   

</div>
<!-- /.container-fluid -->
</body>
</html>