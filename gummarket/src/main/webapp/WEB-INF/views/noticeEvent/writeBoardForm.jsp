<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
 <html lang="en">
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="">
   <meta name="author" content="">

   <title></title>

</head>

 <body id="top-page">

     <div class="container">
	<div class="continer my-auto pb-2">
			<p class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">이벤트/공지사항 등록</p>
	</div>
         <div class="card o-hidden border-0 shadow-lg my-5">
             <div class="card-body p-0">
                
                 <!-- Nested Row within Card Body -->
                 <div class="row">
                     
                     <div class="col-lg-12">
                         <div class="p-5" align="center">
                             <div class="continer my-auto pb-3" align="center">
                                 <p class="h3 mb-0 mt-5 ml-5 text-gray-700" style="font-weight: 800;"><i class="far fa-calendar-check"></i> 이벤트와 공지 <i class="far fa-calendar-check"></i></p>
                             </div>
                             <p></p>
                             <br>
                             session mid ${session.mId}
                             <!-- form start -->
                             <form class="user" id="frm" name="frm" action="boardInsert.doBB" method="post" enctype="multipart/form-data">
                             <input type="hidden" id="mId" name="mId" value="${session.mId}">
                             <hr>
                             	<div class="col-lg-3 col-sm-12 mb-3 mb-sm-0">
                             	어떤 글을 쓰시겠어요?
                             	</div>
                                 <div class="col-lg-12">
                                    <div class="form-group col-lg-9 col-sm-12 mb-3 mb-sm-0">
                                    <select class="form-control" id="bCategory" name="bCategory" required>
                                      <option value="notice">공지사항</option>
                                      <option value="event">이벤트</option>
                                    </select>
                                     </div>
                          	    </div>
                             
                             <hr>
                                 <div class="form-group">
                                     <span><i class="fas fa-pencil-alt pr-2"></i></span><input type="text" style="border:none;" class="col-lg-11"
                                     id="bTitle" name="bTitle" placeholder="제목을 입력해 주세요" required>
                                 </div>
                                
                                 <hr>
                                     <div class="form-group row">
                                  		<div class="form-group col-lg-6 col-sm-6 mb-3 mb-sm-0">
                                     <span><i class="fas fa-calendar-day"></i></span><input type="date" style="border:none;" class="col-lg-10"
                                     id="bDate" name="bDate">
                                 </div>
                               
                              </div>
                                    
                                <hr>
                                                        
                                 <div class="form-group">
                                     <textarea class="form-control" rows="13" id="bContents"
                                         name="bContents" placeholder="이벤트/공지사항 내용 입력" required></textarea>
                                 </div>
                                 <hr> 
                                 
                                 <div class="form-group">
                                    <i class="fas fa-image"></i> 사진 업로드: <input type="file" name="thumbNailFile" multiple="multiple" class="btn"/>
                                 </div>
                              
									<hr>
				                  <br>
				                  
				                <div class="pb-3 mx-auto"  style="align-items: center;">
								
									<!-- To do style again -->
									<button class="btn btn-md mr-5"  type="submit" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
									<i class="far fa-check-circle"></i> 글 등 록</button>
									<button class="btn btn-md mr-5"  type="reset" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);">
									<i class="fas fa-eraser"></i> 내용삭제</button>
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


   <!-- cancel write Modal-->
    <div class="modal fade" id="cancelWriteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">정말 글 작성을 취소 하시겠어요?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                <img src="img/dontGo.png" style="width: 400px; height:350px">
                
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" data-dismiss="modal">계속 글쓰기</button>
                    <a class="btn btn-secondary" href="findHelpMain.doBB">메인으로</a>
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