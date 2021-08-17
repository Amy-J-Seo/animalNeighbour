<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
 <html lang="en">
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="">
   <meta name="author" content="">

   <title>상품 수정하기</title>

<!-- Custom fonts for this template from register.html-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">


</head>

 <body>

     <div class="container">

         <div class="card o-hidden border-0 shadow-lg my-5">
             <div class="card-body p-0">
                 <!-- Nested Row within Card Body -->
                 <div class="row">
                     
                     <div class="col-lg-12">
                         <div class="p-5" align="center">
                             <div class="continer my-auto pb-3" align="center">
                                 <p class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">상품 수정하기</p>
                             </div>
                             <p></p>
                             <br>
                             <!-- form start -->
                             <form class="user" id="frm" name="frm" action="salesUpdate.do" method="post">
                             
                          <input type="hidden" id="sNo" name="sNo" value="${update.sNo}">
                             
                             <!-- 테스트벨류 ????-->
                             <input type="hidden" id="mId" name="mId" value="bb123">
                             <!-- 나중에 세션정보 가져와서 집어넣기!  -->
                           <%--   <input type="hidden" id="mId" name="mId" value="${session.mId }"> --%>
                            
                            
                            <hr>
                             <div class="form-group">
                                <span>상품이름:</span><input type="text" style="border:none;" class="col-lg-11"
                                id="sTitle" name="sTitle" value="${update.sTitle }">
                            </div>
                             
                             
                             <hr>
                             	<div class="col-lg-3 col-sm-12 mb-3 mb-sm-0">
                             	상품 카테고리
                             	</div>
                                 <div class="col-lg-12">
                                    <div class="form-group col-lg-9 col-sm-12 mb-3 mb-sm-0">
                                    <select class="form-control" id="sCategory" name="sCategory" required>
                                      <option value="clothing">의류/하네스</option>
								      <option value="food">간식/사료</option>
								      <option value="etc">그 외 용품</option>
								      <option value="free">나눔</option>
                                    </select>
                                     </div>
                          	    </div>
                             
                             <hr>
                                 <div class="form-group row">
	                                 <div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
	                                     <span><i class="fas fa-calendar-day"></i></span><input type="date" style="border:none;" class="col-lg-10"
	                                     id="sPurchasedDate" name="sPurchasedDate" value="${update.sPurchasedDate }" readonly>
	                                 </div>
	                                 <div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
	                                     <span><i class="far fa-calendar-check"></i></span><input type="text" style="border:none;" class="col-lg-10"
	                                     id="sUseDays" name="sUseDays" value="${update.sUseDays }" readonly>
	                                 </div>
                                   
                                 </div>
                                 
                                
                                 <hr>
	                               <div class="form-group row">
	                                  <div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
	                                     <span><i class="fas fa-dollar-sign"></i></span><input type="text" style="border:none;" class="col-lg-10"
	                                     id="sPrice" name="sPrice" value="${update.sPrice }" readonly>
	                                 </div>
	                                 
	                                 <div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
	                                    <span><i class="fas fa-hand-holding-usd"></i></span> <input type="text" style="border:none;" class="col-lg-10"
	                                     id="sNetPrice" name="sNetPrice" value="${update.sNetPrice }" readonly>
	                                 </div>
	                              </div>
	                         
                                     
                                <hr>
                                 <div class="form-group">
                                     <span><i class="fas fa-question"></i></span><input type="text" style="border:none;" class="col-lg-11"
                                     id="sReason" name="sReason" value="${update.sReason }">
                                 </div>
                            
                                <hr>
                                                              
                                 <div class="form-group">
                                     <textarea class="form-control" rows="13" id="sCondition"
                                         name="sCondition" placeholder="${update.sCondition }" required></textarea>
                                 </div>


						<br>
						   <div class="pb-3 mx-auto"  style="align-items: center;">
					
								<!-- To do style again -->
								<button class="btn btn-md mr-5"  type="submit" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);"><i class="far fa-check-circle"></i> 내용수정</button>
								<button class="btn btn-md mr-5"  type="reset" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);"><i class="fas fa-eraser"></i> 내용삭제</button>
								<a class="btn btn-danger btn-md" href="home.do" data-toggle="modal"
									data-target="#cancelWriteModal"><i class="fas fa-undo-alt"></i> 메인으로</a>
							
							</div>
                       
                             
                             </form>
                             <!-- form end -->
                              <hr>
             
                         </div>
                     </div>
                 </div>
             </div>
         </div>

     </div>


<!-- Bootstrap core JavaScript-->
 <script src="vendor/jquery/jquery.min.js"></script>
 <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

 <!-- Core plugin JavaScript-->
 <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

 <!-- Custom scripts for all pages-->
 <script src="js/sb-admin-2.min.js"></script>


 </body>

 </html>