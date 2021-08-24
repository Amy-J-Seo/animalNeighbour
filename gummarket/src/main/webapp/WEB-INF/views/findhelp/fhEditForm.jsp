<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
 <html lang="en">
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="">
   <meta name="author" content="">

   <title>도움 찾기 글 등록</title>

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
                             <form class="user" id="frm" name="frm" action="fhItemUpdate.doBB" method="post">
                             <input type="hidden" id="fhNo" name="fhNo" value="${itemToUpdate.fhNo}">
                            
                           <input type="hidden" id="mId" name="mId" value="${session.mId }">
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
                                      <option value="lost">미아찾아요!</option>
                                    </select>
                                     </div>
                          	    </div>
                             
                             <hr>
                                 <div class="form-group">
                                     <span><i class="fas fa-pencil-alt pr-2"></i></span><input type="text" style="border:none;" class="col-lg-11"
                                     id="fhTitle" name="fhTitle" value="${itemToUpdate.fhTitle }" required >
                                 </div>
                                 
                                
                                 <hr>
                                     <div class="form-group row">
                                  		<div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                     <span><i class="fas fa-paw"></i></span><input type="text" style="border:none;" class="col-lg-10"
                                     id="fhAnimal" name="fhAnimal" value="${itemToUpdate.fhAnimal }" readonly>
                                 </div>
                                 
                                 <div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                    <span><i class="fas fa-weight"></i></span> <input type="text" style="border:none;" class="col-lg-10"
                                     id="fhSize" name="fhSize" value="${itemToUpdate.fhSize }" readonly>
                                 </div>
                              </div>
                                     <hr>
                                     <div class="form-group row">
                                  		<div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                    <span><i class="fas fa-baby-carriage"></i></span> <input type="text" style="border:none;" class="col-lg-10"
                                     id="fhAge" name="fhAge" value="${itemToUpdate.fhAge }" readonly>
                                 </div>
                                 
                                 <div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                <span><i class="fas fa-hand-holding-heart"></i></span> <input type="text" style="border:none;" class="col-lg-10"
                                     id="fhNeed" name="fhNeed" placeholder="${itemToUpdate.fhNeed }">
                                 </div>
                              </div>
                                <hr>
                                   <div class="form-group">
                                     <span><i class="far fa-address-card"></i></span><input type="text" style="border:none;" class="col-lg-11"
                                     id="fhCharacter" name="fhCharacter" placeholder="${itemToUpdate.fhCharacter }">
                                 </div>
                            
                                <hr>
                                                              
                                 <div class="form-group">
                                     <textarea class="form-control" rows="13" id="fhHow"
                                         name="fhHow" placeholder="${itemToUpdate.fhHow }" required></textarea>
                                 </div>

                  <br>
                  
                  <div class="pb-3 mx-auto"  style="align-items: center;">
				
				<!-- To do style again -->
				<button class="btn btn-md mr-5"  type="submit" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);"><i class="far fa-check-circle"></i> 내용수정</button>
				<button class="btn btn-md mr-5"  type="reset" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);"><i class="fas fa-eraser"></i> 내용삭제</button>
				<a class="btn btn-danger btn-md" href="#" data-toggle="modal"
					data-target="#cancelWriteModal"><i class="fas fa-undo-alt"></i> 메인으로</a>
				
				</div>
                       
                             </form>
                             <!-- form end -->
           
             
                         </div>
                     </div>
                 </div>
                 <!--  end of row div -->
             </div>
         </div>

     </div>

 <!-- return to main Modal-->
    <div class="modal fade" id="cancelWriteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="cancelWriteModal">Do you want to go back to main?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">다른 글들을 살펴보세요!</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal"> 취 소 </button>
                    <a class="btn btn-primary" href="findHelpMain.doBB">메인으로</a>
                </div>
            </div>
        </div>
    </div>
<!-- End of return to main Modal-->


<!-- Bootstrap core JavaScript-->
 <script src="vendor/jquery/jquery.min.js"></script>
 <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

 <!-- Core plugin JavaScript-->
 <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

 <!-- Custom scripts for all pages-->
 <script src="js/sb-admin-2.min.js"></script>


 </body>

 </html>