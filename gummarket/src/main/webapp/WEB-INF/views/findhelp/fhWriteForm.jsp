<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
 <html lang="en">
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="">
   <meta name="author" content="">

   <title>도움 찾기 등록 양식</title>

</head>

 <body>

     <div class="container">
	<div class="continer my-auto pb-3">
			<p class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">도움 찾아요!</p>
	</div>
         <div class="card o-hidden border-0 shadow-lg my-5">
             <div class="card-body p-0">
                
                 <!-- Nested Row within Card Body -->
                 <div class="row">
                     
                     <div class="col-lg-12">
                         <div class="p-5" align="center">
                             <div class="continer my-auto pb-3" align="center">
                                 <p class="h3 mb-0 mt-5 ml-5 text-gray-700" style="font-weight: 900;"><i class="far fa-handshake"></i> 도와줘요 멍냥이웃!</p>
                             </div>
                             <p></p>
                             <br>
                             <!-- form start -->
                             <form class="user" id="frm" name="frm" action="findHelpInsert.doBB" method="post">
                             
                             <input type="hidden" id="mId" name="mId" value="bb123">
                             <!-- 나중에 세션정보 가져와서 집어넣기!  -->
                           <%--   <input type="hidden" id="mId" name="mId" value="${session.mId }"> --%>
                             <hr>
                             
                             	<div class="col-lg-3 col-sm-12 mb-3 mb-sm-0">
                             	어떤 도움을 찾으시나요?
                             	</div>
                                 <div class="col-lg-12">
                                    <div class="form-group col-lg-9 col-sm-12 mb-3 mb-sm-0">
                                    <select class="form-control" id="fhCategory" name="fhCategory" required>
                                      <option value="">도움 카테고리 선택</option>
                                      <option value="walk">산책/놀이</option>
                                      <option value="dayCare">데이케어</option>
                                      <option value="longCare">장기케어</option>
                                    </select>
                                     </div>
                          	    </div>
                             
                             <hr>
                                 <div class="form-group">
                                     <span><i class="fas fa-pencil-alt pr-2"></i></span><input type="text" style="border:none;" class="col-lg-11"
                                     id="fhTitle" name="fhTitle" placeholder="제목을 입력해 주세요" required>
                                 </div>
                                 
                                
                                 <hr>
                                     <div class="form-group row">
                                  		<div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                     <span><i class="fas fa-paw"></i></span><input type="text" style="border:none;" class="col-lg-10"
                                     id="fhAnimal" name="fhAnimal" placeholder="정보: 강아지/고양이/토끼/등...">
                                 </div>
                                 
                                 <div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                    <span><i class="fas fa-weight"></i></span> <input type="text" style="border:none;" class="col-lg-10"
                                     id="fhSize" name="fhSize" placeholder="체급: 대형/중형/소형/마이크로...">
                                 </div>
                              </div>
                                     <hr>
                                     <div class="form-group row">
                                  		<div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                    <span><i class="fas fa-baby-carriage"></i></span> <input type="text" style="border:none;" class="col-lg-10"
                                     id="fhAge" name="fhAge" placeholder="나이는 몇 살인가요? 개월 수로 입력해 주세요.">
                                 </div>
                                 
                                 <div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                <span><i class="fas fa-hand-holding-heart"></i></span> <input type="text" style="border:none;" class="col-lg-10"
                                     id="fhNeed" name="fhNeed" placeholder="구체적으로 어떤 도움인가요? 예) 산책 30-60분">
                                 </div>
                              </div>
                                <hr>
                                   <div class="form-group">
                                     <span><i class="far fa-address-card"></i></span><input type="text" style="border:none;" class="col-lg-11"
                                     id="fhCharacter" name="fhCharacter" placeholder="반려동물의 성격, 특이점을 알려주세요.">
                                 </div>
                            
                                <hr>
                                                        
                                 <div class="form-group">
                                     <textarea class="form-control" rows="13" id="fhHow"
                                         name="fhHow" placeholder="조금 더 상세하게 알려 주세요~!" required></textarea>
                                 </div>
                                 <hr>
                                  <!-- 썸네일용 사진은 sales테이블에 -->
                                 <div class="form-group">
                                    <i class="fas fa-image"></i>  썸네일용 사진 업로드: <input type="file" name="thumbNailFile" multiple="multiple" class="btn"/>
                                 </div>
                                 <!-- 상세사진은 image 테이블에 -->
                                 <div class="form-group">
                                    <i class="fas fa-camera"></i>  상세 사진 업로드: <input type="file" name="uploadFile1" multiple="multiple" class="btn"/>
                                 </div>
                              
					<hr>
                  <br>
                  
                <div class="pb-3 mx-auto"  style="align-items: center;">
				
					<!-- To do style again -->
					<button class="btn btn-md mr-5"  type="submit" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);"><i class="far fa-check-circle"></i> 글 등 록</button>
					<button class="btn btn-md mr-5"  type="reset" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);"><i class="fas fa-eraser"></i> 내용삭제</button>
					<a class="btn btn-danger btn-md" href="#" data-toggle="modal"
						data-target="#cancelWriteModal"><i class="fas fa-undo-alt"></i> 메인으로</a>
				
				</div>
                       
                             </form>
                             <!-- form end -->
           
            				<!-- img upload form -->
                             <form style="display: none;" action="imageUploadServlet" id="imageUpload" name="imageUpload" method="post" enctype="multipart/form-data">
                                <input type="file" id="thumbNailFile" name="thumbNailFile">
                                <input type="file" id="uploadFile1" name="uploadFile1">
                             </form>
             				<!--end of img upload form -->
                         </div>
                     </div>
                 </div>
                 <!--  end of row div -->
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