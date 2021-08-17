<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

</script>

</head>
<body>
<section>
	<div id="content-wrapper" class="d-flex flex-column">

		<div class="continer my-auto">
		<!-- Main Content -->
		<div id="content" class ="mt-4 mb-4" style="margin: 0 auto; width:250px;">
		
			<!-- 메인화면 Search 폼-->
			<form class="d-none d-sm-inline-block form-inline navbar-search" style="display: block">
				<div class="input-group">
					<input type="text" class="form-control bg-light border-0 small"
						placeholder="Search for..." aria-label="Search"
						aria-describedby="basic-addon2">
					<div class="input-group-append">
					<!-- 서치버튼 색 바꾸고 싶으면 바꾸어도 됩니다. -->
						<button class="btn btn-primary" type="button">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		</div>
	</div>


    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<!-- 추천메뉴레시피 카드로 보여주기!! -->	
			<!-- 아직 추천메뉴 보여주는거 아님.일단 전체 디비목록 출력. -->
			<!-- 여기는 수정 해 주셔야 합니다~ -->
			<%-- <c:forEach var="recipe" items="${recipes}"> --%>
	            <div class="col mb-5">
	                <div class="card h-100">
	                    <!-- recommend badge-->
	                    <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Recommend
	                    </div>
	                    <!-- recipe image-->
	                    <img class="card-img-top" src="img/${recipe.rpImg }" alt="" />
	                    <!-- recipe details-->
	                    <div class="card-body p-4">
	                        <div class="text-center">
	                            <!-- recipe name-->
	                            <h5 class="fw-bolder">${recipe.rpTitle}</h5>
	                            <!-- recipe reviews-->
	                            <div class="d-flex justify-content-center small text-warning mb-2">
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                            </div>
	                            <!-- recipe diet-->
	                            ${recipe.rpDiet }
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><button type="button" class="btn btn-outline-dark mt-auto" onclick="getRecipe(${recipe.rpId})">Read more</button></div>
	                    </div>
	                    <form id="getRp" name="getRp" action="recipeSelect.do" method="post">
	                    	<input type="hidden" id="rpid" name="rpid">
	                    </form>
	                </div>
	            </div>
	            <!-- sample -->
	            <div class="col mb-5">
	                <div class="card h-100">
	                    <!-- recommend badge-->
	                    <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Recommend
	                    </div>
	                    <!-- recipe image-->
	                    <img class="card-img-top" src="img/${recipe.rpImg }" alt="" />
	                    <!-- recipe details-->
	                    <div class="card-body p-4">
	                        <div class="text-center">
	                            <!-- recipe name-->
	                            <h5 class="fw-bolder">${recipe.rpTitle}</h5>
	                            <!-- recipe reviews-->
	                            <div class="d-flex justify-content-center small text-warning mb-2">
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                            </div>
	                            <!-- recipe diet-->
	                            ${recipe.rpDiet }
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><button type="button" class="btn btn-outline-dark mt-auto" onclick="getRecipe(${recipe.rpId})">Read more</button></div>
	                    </div>
	                    <form id="getRp" name="getRp" action="recipeSelect.do" method="post">
	                    	<input type="hidden" id="rpid" name="rpid">
	                    </form>
	                </div>
	            </div>
	            
	            
	            <div class="col mb-5">
	                <div class="card h-100">
	                    <!-- recommend badge-->
	                    <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Recommend
	                    </div>
	                    <!-- recipe image-->
	                    <img class="card-img-top" src="img/${recipe.rpImg }" alt="" />
	                    <!-- recipe details-->
	                    <div class="card-body p-4">
	                        <div class="text-center">
	                            <!-- recipe name-->
	                            <h5 class="fw-bolder">${recipe.rpTitle}</h5>
	                            <!-- recipe reviews-->
	                            <div class="d-flex justify-content-center small text-warning mb-2">
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                            </div>
	                            <!-- recipe diet-->
	                            ${recipe.rpDiet }
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><button type="button" class="btn btn-outline-dark mt-auto" onclick="getRecipe(${recipe.rpId})">Read more</button></div>
	                    </div>
	                    <form id="getRp" name="getRp" action="recipeSelect.do" method="post">
	                    	<input type="hidden" id="rpid" name="rpid">
	                    </form>
	                </div>
	            </div>
	            <!-- end of sample -->
	            
	               <!-- sample -->
	            <div class="col mb-5">
	                <div class="card h-100">
	                    <!-- recommend badge-->
	                    <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Recommend
	                    </div>
	                    <!-- recipe image-->
	                    <img class="card-img-top" src="img/${recipe.rpImg }" alt="" />
	                    <!-- recipe details-->
	                    <div class="card-body p-4">
	                        <div class="text-center">
	                            <!-- recipe name-->
	                            <h5 class="fw-bolder">${recipe.rpTitle}</h5>
	                            <!-- recipe reviews-->
	                            <div class="d-flex justify-content-center small text-warning mb-2">
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                            </div>
	                            <!-- recipe diet-->
	                            ${recipe.rpDiet }
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><button type="button" class="btn btn-outline-dark mt-auto" onclick="getRecipe(${recipe.rpId})">Read more</button></div>
	                    </div>
	                    <form id="getRp" name="getRp" action="recipeSelect.do" method="post">
	                    	<input type="hidden" id="rpid" name="rpid">
	                    </form>
	                </div>
	            </div>
	            
	            
	            <div class="col mb-5">
	                <div class="card h-100">
	                    <!-- recommend badge-->
	                    <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Recommend
	                    </div>
	                    <!-- recipe image-->
	                    <img class="card-img-top" src="img/${recipe.rpImg }" alt="" />
	                    <!-- recipe details-->
	                    <div class="card-body p-4">
	                        <div class="text-center">
	                            <!-- recipe name-->
	                            <h5 class="fw-bolder">${recipe.rpTitle}</h5>
	                            <!-- recipe reviews-->
	                            <div class="d-flex justify-content-center small text-warning mb-2">
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                            </div>
	                            <!-- recipe diet-->
	                            ${recipe.rpDiet }
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><button type="button" class="btn btn-outline-dark mt-auto" onclick="getRecipe(${recipe.rpId})">Read more</button></div>
	                    </div>
	                    <form id="getRp" name="getRp" action="recipeSelect.do" method="post">
	                    	<input type="hidden" id="rpid" name="rpid">
	                    </form>
	                </div>
	            </div>
	            <!-- end of sample -->
	            
	               <!-- sample -->
	            <div class="col mb-5">
	                <div class="card h-100">
	                    <!-- recommend badge-->
	                    <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Recommend
	                    </div>
	                    <!-- recipe image-->
	                    <img class="card-img-top" src="img/${recipe.rpImg }" alt="" />
	                    <!-- recipe details-->
	                    <div class="card-body p-4">
	                        <div class="text-center">
	                            <!-- recipe name-->
	                            <h5 class="fw-bolder">${recipe.rpTitle}</h5>
	                            <!-- recipe reviews-->
	                            <div class="d-flex justify-content-center small text-warning mb-2">
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                            </div>
	                            <!-- recipe diet-->
	                            ${recipe.rpDiet }
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><button type="button" class="btn btn-outline-dark mt-auto" onclick="getRecipe(${recipe.rpId})">Read more</button></div>
	                    </div>
	                    <form id="getRp" name="getRp" action="recipeSelect.do" method="post">
	                    	<input type="hidden" id="rpid" name="rpid">
	                    </form>
	                </div>
	            </div>
	            
	            
	            <div class="col mb-5">
	                <div class="card h-100">
	                    <!-- recommend badge-->
	                    <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Recommend
	                    </div>
	                    <!-- recipe image-->
	                    <img class="card-img-top" src="img/${recipe.rpImg }" alt="" />
	                    <!-- recipe details-->
	                    <div class="card-body p-4">
	                        <div class="text-center">
	                            <!-- recipe name-->
	                            <h5 class="fw-bolder">${recipe.rpTitle}</h5>
	                            <!-- recipe reviews-->
	                            <div class="d-flex justify-content-center small text-warning mb-2">
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                                <div class="bi-star-fill"></div>
	                            </div>
	                            <!-- recipe diet-->
	                            ${recipe.rpDiet }
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><button type="button" class="btn btn-outline-dark mt-auto" onclick="getRecipe(${recipe.rpId})">Read more</button></div>
	                    </div>
	                    <form id="getRp" name="getRp" action="recipeSelect.do" method="post">
	                    	<input type="hidden" id="rpid" name="rpid">
	                    </form>
	                </div>
	            </div>
	            <!-- end of sample -->
			<%-- </c:forEach> --%>
        </div>
    </div>
    
</section>

</body>
</html>

