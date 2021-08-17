<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
	function getNotice(n) {
		frm.bNo.value = n;
		frm.submit();
	}
</script>

</head>
<body>
 <!-- Begin Page Content -->
		        <div class="container-fluid">
		            <!-- Page Heading -->
		            <h1 class="h3 mb-2 text-gray-800">공지사항</h1>
		          
		            <!--table with all recipe-->
		            <div class="card shadow mb-4">
		                <div class="card-header py-3">
		                    <h6 class="m-0 font-weight-bold text-primary">전 체 공 지 사 항</h6>
		                </div>
		                <div class="card-body">
		                    <div class="table-responsive">
		                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		                            <thead>
		                                <tr>
		                                    <th>No.</th>
		                                    <th>Title</th>
		                                    <th>Date</th>
		                                    <th>views</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            <c:forEach var="notice" items="${list }">
		                                <tr onmouseover="this.style.background='#ebebeb'; this.style.cursor='pointer'" onmouseout="this.style.background='white'" onclick="getNotice(${notice.bNo})">
		                                    <td>${notice.bNo }</td>
		                                    <td>${notice.bTitle }</td>
		                                    <td>${notice.bDate }</td>
		                                    <td>${notice.bHit }</td>
		                                </tr>
		                            </c:forEach>
		                            </tbody>
				                        </table>
				                        <form id="frm" name="frm" action="searchNoticeItem.doBB" method="post">
								<input type="hidden" id="bNo" name="bNo">
							</form>
						 </div>
				       </div>
		                
		                <!-- return to menu btn...  and to the list btn -->
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