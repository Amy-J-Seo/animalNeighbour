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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<script>

   //사진 추가 폼 나오게 만들자! 안되네 뀨....
   function morePic(){
      let div = $('<div>');
      $('<div>').append('<input>').attr('type',file);
      $('#show').append(div);
   }
</script>
 <body  id="top-page">

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
                             <form class="user" id="frm" name="frm" action="salesInsert.do" method="post" enctype="multipart/form-data">
                                 <div class="form-group">
                                     <input type="text" class="form-control form-control-user" id="stitle" name="stitle"
                                         placeholder="상품명 입력">
                                 </div>
                                 
                                     <div class="form-group row">
                                         <div class="col-lg-12 col-sm-6 mb-3 mb-sm-0">
                                           <div class="form-group">
			                                    <label for="sel1">상품 카테고리:</label>
				                                    <select class="form-control" id="scategory" name="scategory">
				                                      <option value="clothing">의류/하네스</option>
				                                      <option value="food">간식/사료</option>
				                                      <option value="etc">그 외 용품</option>
				                                      <option value="free">나눔</option>
				                                    </select>
                                         		</div>
                              				</div>
                                         <div class="col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                             <input type="date" class="form-control form-control-user"
                                                 id="spurchasedate" name="spurchasedate">
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
                                
                                 <!-- 썸네일용 사진은 sales테이블에 -->
                                 <div class="form-group">
                                    <i class="fas fa-image"></i>  썸네일용 사진 업로드: <input type="file" name="thumbNailFile" multiple="multiple" class="btn"/>
                                 </div>
                                 <!-- 상세사진은 image 테이블에 -->
                                 <div class="form-group">
                                    <i class="fas fa-camera"></i>  상세 사진 업로드: <input type="file" name="uploadFile1" multiple="multiple" class="btn"/>
                                 </div>
                                    
                                    <!--사진 더 넣기 버튼 ㅜ.ㅜ어떻게 만들면 좋을까아? 
                                       <div>
                                       <button id="morePic" onclick="morePic()">사진 추가하기<i class="far fa-plus-square"></i></button>
                                       <div id="show"></div>
                                       </div>
                                    -->

                        <br>
                  
                         <div class="pb-3 mx-auto"  style="align-items: center;">
                  
                           <!-- To do style again -->
                           <button class="btn btn-md mr-5"  type="submit" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
                           <i class="far fa-check-circle"></i> 글 등 록</button>
                           <button class="btn btn-md mr-5"  type="reset" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);">
                           <i class="fas fa-eraser"></i> 내용삭제</button>
                           <a class="btn btn-danger btn-md" href="home.do" data-toggle="modal"
                              data-target="#cancelWriteModal"><i class="fas fa-undo-alt"></i> 메인으로</a>
                        
                        </div>
                        
                             
                             </form>
                             <!-- form end -->
                             <!-- 얜 아마 필요 없을걸? -->
                             <form style="display: none;" action="imageUploadServlet" id="imageUpload" name="imageUpload" method="post" enctype="multipart/form-data">
                                <input type="file" id="thumbNailFile" name="thumbNailFile">
                                <input type="file" id="uploadFile1" name="uploadFile1">
                             </form>
                              <hr>
             
                         </div>
                     </div>
                 </div>
             </div>
         </div>

     </div>
     
     <script type="text/javascript">
      // 1. submit button의 type을 button
      // 2. submit button onclick=func 을 해준다
      // 3. #imageUpload #uploadFile1와 #imageUpload #thumbNailFile의 value를 
     </script>


<!-- Bootstrap core JavaScript-->
 <script src="vendor/jquery/jquery.min.js"></script>
 <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

 <!-- Core plugin JavaScript-->
 <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

 <!-- Custom scripts for all pages-->
 <script src="js/sb-admin-2.min.js"></script>


 </body>

 </html>