<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
 <html lang="en">
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="">
   <meta name="author" content="">

   <title>상품 등록하기</title>

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
                                 <p class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">상품 등록하기</p>
                             </div>
                             <p></p>
                             <br>
                             <!-- form start -->
                             <form class="user" id="frm" name="frm" action="salesInsert.do" method="post">
                                 <div class="form-group">
                                     <input type="text" class="form-control form-control-user" id="stitle" name="stitle"
                                         placeholder="상품명 입력">
                                 </div>
                                 
                                     <div class="form-group row">
                                         <div class="col-lg-12 col-sm-6 mb-3 mb-sm-0">
                                           <div class="form-group">
										      <label for="sel1">상품 카테고리:</label>
										      <select class="form-control" id="sel1" name="sellist1">
										        <option>의류/하네스</option>
										        <option>간식/사료</option>
										        <option>그 외 용품</option>
										        <option>나눔</option>
										      </select>
                                         </div>
										</div>
                                         <div class="col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                             <input type="text" class="form-control form-control-user"
                                                 id="spurchasedate" name="spurchasedate" placeholder="언제 구매하셨나요?  YYYY/MM/DD">
                                         </div>
                                         <div class="col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                             <input type="text" class="form-control form-control-user"
                                                 id="susedays" name="susedays" placeholder="실사용일수는요? 숫자로 적어주세요">
                                         </div>
                                     </div>
                                     
                                      <div class="form-group row">
                                       <div class="col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                             <input type="text" class="form-control form-control-user"
                                                 id="sprice" name="sprice" placeholder="구매가격은 얼마였나요?">
                                         </div>
                                         <div class="col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                             <input type="text" class="form-control form-control-user"
                                                 id="snetprice" name="snetprice" placeholder="희망하는 판매 가격을 적어주세요">
                                         </div>
                              		</div>
                                 <div class="form-group">
                                     <input type="text" class="form-control form-control-user" id="sreason" name="sreason"
                                         placeholder="판매 이유에 대해 말해주세요!">
                                 </div>
                                
                                 <div class="form-group">
                                     <textarea class="form-control" rows="13" id="scondition"
                                         name="scondition" placeholder="제품 상태에 대해 상세히 기술해주세요!"></textarea>
                                 </div>
                                 
                               

                                 <button type="submit" class="btn btn-warning btn-user btn-block">
                                     상품 등록하기
                                 </button>
						<br>
						
						  <div class="row">
                                     <div class="col-lg-6 col-sm-12 mb-3 mb-sm-0 ">
                                     <button type="button" class="btn btn-danger btn-user btn-block" onclick="location.href='home.do'">메인으로~</button></div>
                                     <div class="col-lg-6 col-sm-12 mb-3 mb-sm-0 ">
                                         <input type="reset" class="btn btn-danger btn-user btn-block"
                                             value="취소">
                                     </div>
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