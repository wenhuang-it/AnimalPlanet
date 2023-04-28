<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Index</title>

			<link rel="stylesheet" href="${contextRoot}/css/backStage.css">
			<!-- ↓ bootstrap ↓ -->
			<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
			<!-- ↑ bootstrap ↑ -->
			<style>
				.bd-placeholder-img {
					font-size: 1.125rem;
					text-anchor: middle;
					-webkit-user-select: none;
					-moz-user-select: none;
					user-select: none;
				}

				@media (min-width : 768px) {
					.bd-placeholder-img-lg {
						font-size: 3.5rem;
					}
				}

				.nav-item {
					font-size: 20px;
				}

				.nav-item:hover {
					background-color: #fff;
					border: 2px solid rgb(187, 187, 187);
					border-radius: 16px;
					box-shadow: -2px -2px 3px 0px rgba(0, 0, 0, 0.25) inset;
				}
			</style>

		</head>



		<body>
			<header class="navbar navbar-dark sticky-top flex-md-nowrap p-0 shadow " style="background-color: #696969;">
				<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="${contextRoot}/backStage/"
					style="background-color: #696969;">Animal Planet
					網站後台管理系統</a>
				<button class="navbar-toggler position-absolute d-md-none collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu"
					aria-expanded="false" aria-label="Toggle navigation" style="background-color: #696969;">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="d-flex flex-nowrap" style="margin-left: 700px;">

					<i>
						<span class="form-control-sm d-flex flex-nowrap" style="margin-right: 15px;">使用者 :
							${empLoginName}</span>
					</i>
					<i>
						<span class="form-control-sm d-flex flex-nowrap">分店 : ${empLoginstoreId}</span>
					</i>
					<input type="hidden" value="${empLoginstoreId}" id="loginId">
					<input type="hidden" value="${empLoginPermission}" id="loginPermission">

				</div>



				<div class="navbar-nav">
					<div class="nav-item1 text-nowrap">
						<a class="nav-link px-3" href="${contextRoot}/employee/logout" style="font-size: 24px
						;">Sign
							out</a>
					</div>
				</div>
			</header>

			<div class="container-fluid">
				<div class="row" id='all'>
					<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse"
						style="background-color: rgb(255, 248, 239);">
						<div class="position-sticky pt-3">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link active" aria-current="page"
										href="http://localhost:8080/AnimalPlanet/backStage/"> <span
											data-feather="home"></span>
										Dashboard
									</a></li>
								<li class="nav-item forstoremanager"><a class="nav-link"
										href="${contextRoot}/index/managePics"> <span data-feather="file"></span> 網站封面管理
									</a></li>

								<li class="nav-item forstoremanager"><a class="nav-link" data-bs-toggle="collapse"
										href="#collapseShoppingMall" role="button" aria-expanded="false"
										aria-controls="collapseExample" id="test"> <span
											data-feather="shopping-cart"></span> 商城管理系統
									</a></li>



								<div class="collapse forstoremanager" id="collapseShoppingMall">
									<li class="nav-item"><a class="nav-link"
											href="${contextRoot}/mall/backStage/productTypeList"><span
												data-feather="shopping-cart" style="margin-left: 30px"></span>
											商品分類</a></li>
									<li class="nav-item"><a class="nav-link"
											href="${contextRoot}/mall/backStage/productList"><span
												data-feather="shopping-cart" style="margin-left: 30px"></span>
											商品列表</a></li>
									<li class="nav-item"><a class="nav-link"
											href="${contextRoot}/mall/backStage/Orders"><span
												data-feather="shopping-cart" style="margin-left: 30px"></span>
											訂單列表</a></li>
								</div>




								<!-- 分店管理系統
						<li class="nav-item"><a class="nav-link"
							data-bs-toggle="collapse" href="#hotelSystem"
							role="button" aria-expanded="false"
							aria-controls="collapseExample" id="test"> <span
								data-feather="shopping-cart"></span> 分店管理系統
						</a></li>

						<div class="collapse" id="hotelSystem">
							<li class="nav-item"><a class="nav-link" href="#"><span
									data-feather="shopping-cart" style="margin-left: 30px"></span>
									旅館</a></li>
						</div> -->


								<!-- 訂單管理系統 -->
								<li class="nav-item forstoremanager"><a class="nav-link" data-bs-toggle="collapse"
										href="#orderSystem" role="button" aria-expanded="false"
										aria-controls="collapseExample" id="test">
										<span data-feather="shopping-cart"></span> 訂單管理系統
									</a></li>

								<div class="collapse forstoremanager" id="orderSystem">
									<li class="nav-item"><a class="nav-link" href="${contextRoot}/hotel/backstage">
											<!-- <span href="${contextRoot}/hotel/backstage/orderSystem"> -->
											<span data-feather="shopping-cart" style="margin-left: 30px"></span>
											住宿訂單管理
										</a></li>

								</div>

								<!-- 員工管理系統 -->
								<li class="nav-item "><a class="nav-link" data-bs-toggle="collapse"
										href="#employeeSystem" role="button" aria-expanded="false"
										aria-controls="collapseExample" id="">
										<span data-feather="shopping-cart"></span> 員工管理系統
									</a></li>

								<div class="collapse " id="employeeSystem">
									<li class="nav-item2 foremployee" style="font-size: 20px;"><a class="nav-link"
											href=><span data-feather="" style="margin-left: 30px;"></span> 員工</a>
										<ul class="nav-item2 ">
											<li class="nav-item "><a class="nav-link "
													href="${contextRoot}/leavepermission/find/findallforempTopage"><span
														data-feather="" style="margin-left: 20px"></span>員工請假查詢</a></li>
											<li class="nav-item "><a class="nav-link"
													href="${contextRoot}/shift/find/findallbyempid"><span
														data-feather="" style="margin-left: 20px"></span>員工排班查詢</a></li>
											<li class="nav-item "><a class="nav-link"
													href="${contextRoot}/clock/toclockpage"><span data-feather=""
														style="margin-left: 20px"></span>員工打卡</a></li>
											<li class="nav-item "><a class="nav-link"
													href="${contextRoot}/clock/toshowpage"><span data-feather=""
														style="margin-left: 20px"></span>員工出勤查詢</a></li>
										</ul>
									</li>
									<li class="nav-item2 forstoremanager" style="font-size: 20px;"><a class="nav-link"
											href="${contextRoot}/employee/backage"><span data-feather="shopping-cart"
												style="margin-left: 30px; "></span>
											店長</a>
										<ul class="nav-item2 ">
											<li class="nav-item "><a class="nav-link "
													href="${contextRoot}/shift/testgogo"><span data-feather=""
														style="margin-left: 20px"></span>店長排班系統</a></li>
											<li class="nav-item "><a class="nav-link"
													href="${contextRoot}/leavepermission/find/findalltopage"><span
														data-feather="" style="margin-left: 20px"></span>店長核假系統</a></li>
											<!-- <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse"
										href="#AdoptionSystem" role="button" aria-expanded="false"
										aria-controls="collapseExample" id="test"> <span
											data-feather="shopping-cart"></span> 領養管理系統
									</a></li> -->

										</ul>
									</li>
									<li class="nav-item forHR"><a class="nav-link"
											href="${contextRoot}/employee/backage"><span data-feather="shopping-cart"
												style="margin-left: 30px"></span>
											人資</a>
										<ul class="nav-item2 ">
											<li><a class="nav-link " href="${contextRoot}/employee/all"><span
														data-feather="" style="margin-left: 20px"></span>查詢員工(HR)</a>
											</li>
											<li><a class="nav-link" href="${contextRoot}/employee/add"><span
														data-feather="" style="margin-left: 20px"></span>新增員工</a></li>

										</ul>
									</li>

								</div>


								<!-- 領養系統 -->

								<li class="nav-item"><a class="nav-link" data-bs-toggle="collapse"
										href="#AdoptionSystem" role="button" aria-expanded="false"
										aria-controls="collapseExample" id="test">
										<span data-feather="shopping-cart"></span> 領養管理系統
									</a></li>

								<div class="collapse" id="AdoptionSystem">
									<li class="nav-item"><a class="nav-link"
											href="${contextRoot}/Adoption/AddPage"><span href="${contextRoot}/#"><span
													data-feather="" style="margin-left: 30px"></span> 新增收容所寵物</a></li>
									<li class="nav-item"><a class="nav-link" href="${contextRoot}/Adoption"><span
												href="${contextRoot}/#"><span data-feather=""
													style="margin-left: 30px"></span> 待領養寵物列表</a></li>
									<li class="nav-item"><a class="nav-link" href="${contextRoot}/AdoptionAcc"><span
												data-feather="shopping-cart" style="margin-left: 30px"></span>
											已被領養寵物追蹤表</a></li>
									<li class="nav-item"><a class="nav-link"
											href="${contextRoot}/ReserveAdoptionList"><span data-feather="shopping-cart"
												style="margin-left: 30px"></span>
											收容所現場接觸/領養後追蹤訪談 預約表</a></li>
								</div>




								<li class="nav-item"><a class="nav-link" href="${contextRoot}/reply/replyIndexPage1">
										<span data-feather="message-circle"></span> 後臺對話系統

										<!-- <li class="nav-item forstoremanager"><a class="nav-link"
							href="${contextRoot}/reply/replyIndexPage1"> <span
								data-feather="message-circle"></span> 對話後台Ajax -->

								<li class="nav-item forstoremanager"><a class="nav-link" data-bs-toggle="collapse"
										href="#collapsefourm" role="button" aria-expanded="false"
										aria-controls="collapseExample" id="test">
										<span data-feather="shopping-cart"></span> 論壇管理系統
									</a></li>

								<div class="collapse " id="collapsefourm">
									<li class="nav-item"><a class="nav-link"
											href="${contextRoot}/forum/backstage/forumCategory"><span
												data-feather="shopping-cart" style="margin-left: 30px"></span>
											論壇分類管理 </a></li>
									<li class="nav-item"><a class="nav-link"
											href="${contextRoot}/forum/backstage/articlecategory"><span
												data-feather="shopping-cart" style="margin-left: 30px"></span>
											文章類別管理 </a></li>
									<li class="nav-item"><a class="nav-link"
											href="${contextRoot}/forum/backstage/articles"><span
												data-feather="shopping-cart" style="margin-left: 30px"></span>
											文章管理 </a></li>
									<li class="nav-item"><a class="nav-link"
											href="${contextRoot}/forum/backstage/articlestate"><span
												data-feather="shopping-cart" style="margin-left: 30px"></span>
											文章狀態管理 </a></li>

								</div> <!-- 會員管理系統 -->
								<li class="nav-item "><a class="nav-link" data-bs-toggle="collapse"
										href="#collapse-member" role="button" aria-expanded="false"
										aria-controls="collapseExample" id="test">
										<span data-feather="shopping-cart"></span> 會員管理系統
									</a></li>

								<div class="collapse" id="collapse-member">
									<li class="nav-item"><a class="nav-link"
											href="${contextRoot}/member/memberSysPage2"><span
												data-feather="shopping-cart" style="margin-left: 30px"></span>
											會員管理</a></li>

								</div> <!-- <h6
								class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
								<span>Saved reports</span> <a class="link-secondary" href="#"
									aria-label="Add a new report"> <span data-feather="plus-circle"></span>
								</a>
							</h6>
							<ul class="nav flex-column mb-2">
								<li class="nav-item"><a class="nav-link" href="#"> <span
											data-feather="file-text"></span> Current month
									</a></li>
								<li class="nav-item"><a class="nav-link" href="#"> <span
											data-feather="file-text"></span> Last quarter
									</a></li>
								<li class="nav-item"><a class="nav-link" href="#"> <span
											data-feather="file-text"></span> Social engagement
									</a></li>
								<li class="nav-item"><a class="nav-link" href="#"> <span
											data-feather="file-text"></span> Year-end sale
									</a></li>
							</ul> -->
						</div>
				</div>

				</nav>
			</div>

			</div>

			<script>
				//清平測試 按照權限顯示功能
				//按照員工權限來確定其顯示的功能

				var loginPermission = document.getElementById('loginPermission').value;//獲取登入者的權限(0:一般員工 1:店長 2:人資 3:管理者)
				var forstoremanager = document.querySelectorAll("[class$=forstoremanager]") //選取所有classname以 forstoremanager結尾的元素
				var forHR = document.querySelectorAll("[class$=forHR]"); //選取所有classname以 forHR結尾的元素

				var forstoremanagerArray = Array.prototype.slice.call(forstoremanager);//把NODELIST 轉為陣列
				var forHRArray = Array.prototype.slice.call(forHR);

				//情形1: 當登入者權限為0時,只顯示員工界面
				if (loginPermission == 0) {

					forstoremanagerArray.forEach(function (e) {
						console.log("test each:" + e)
						// e.style.visibility ="hidden";
						e.style.display = "none";
					})

					forHRArray[0].style.display = "none";
					// forEmployee.style.visibility ="hidden";
				}
				//情形2: 當登入者權限為1時除了HR功能,其他全顯示   這個視情況再更改
				if (loginPermission == 1) {
					forHRArray.forEach(function (e) {
						e.style.display = "none";
					})
				}
				//情形3: 當登入者權限為2時顯示員工及HR功能,其他全隱藏
				if (loginPermission == 2) {
					forstoremanagerArray.forEach(function (e) {
						e.style.display = "none";
					})
				}
			</script>


			<script src="${contextRoot}/js/backStage.js"></script>
			<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
			<script src="${contextRoot}/js/jquery-3.6.2.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.2.6/axios.min.js"
				integrity="sha512-RUkwGPgBmjCwqXpCRzpPPmGl0LSFp9v5wXtmG41+OS8vnmXybQX5qiG5adrIhtO03irWCXl+z0Jrst6qeaLDtQ=="
				crossorigin="anonymous" referrerpolicy="no-referrer"></script>
			<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
				integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
				crossorigin="anonymous"></script>
			<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
				integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
				crossorigin="anonymous"></script>

		</html>