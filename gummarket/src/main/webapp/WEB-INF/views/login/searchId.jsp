<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">

					<div class="col-lg-12">
						<div class="p-5" align="center">
							<div class="col-lg-4 col-sm-4 mb-3 mb-sm-0">
								<div class="continer my-auto pb-3">
									
									<p class="h3" align="left"
										style="color: rgb(255, 190, 83); font-weight: 900;">아이디 찾기</p>
										<p align="left">${message.mName} 회원님의 아이디입니다.</p>
								</div>
								<p class="h3" align="left"
										style="color: black; font-weight: 900;">${message.mId }</p>
								<br> <input
											type="button" value="로그인하러가기" onclick="location.href='loginForm.do'"
											class="btn btn-warning btn-user btn-block">
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
