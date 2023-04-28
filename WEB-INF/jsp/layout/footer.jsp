<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<!-- ↓ bootstrap ↓ -->
			<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
			<!-- ↑ bootstrap ↑ -->
			<link href="${contextRoot}/css/index.css" rel="stylesheet">
			<script src="https://kit.fontawesome.com/98c417a321.js" crossorigin="anonymous"></script>
		</head>

		<body>

			<!-- footer start -->
			<div class="footerBox ">
				<div class="container footer">
					<footer class="py-4">
						<div class="row">
							<div class="col">
								<!-- 						<a href="#" class="align-items-center mb-2 mb-lg-0" id="logo"> -->
								<!-- 							待更新網站LOGO by database <img -->
								<!-- 							src="https://i.imgur.com/CTNLla1.png" border="0" height="40px" -->
								<!-- 							alt="" style="margin-bottom: 12px"> -->
								<!-- 						</a> -->
								<h5>聯絡資訊</h5>
								<ul class="nav flex-column">
									<li class="nav-item mb-2"><i class="fa-solid fa-location-dot"></i> 地址：
										台北市大安區復興南路一段390號2樓</li>
									<li class="nav-item mb-2"><i class="fa-solid fa-envelope"></i>
										Email： animalPlanet@gmail.com</li>
									<li class="nav-item mb-2"><i class="fa-solid fa-phone"></i>
										電話： (02) 6631-6588</li>
									<li class="nav-item mb-2"><i class="fa-solid fa-building"></i>
										AnimalPlanet　版權所有，非經授權，不許轉載本站內容</li>
								</ul>
							</div>
							<div class="col">
								<h5>Section</h5>
								<ul class="nav flex-column">
									<li class="nav-item mb-2"><a href="${contextRoot}/" class="nav-link p-0"
											style=" margin-left: 18px">Home</a></li>
									<li class="nav-item mb-2"><a href="${contextRoot}/mall/shoppingMallIndex" class="nav-link p-0"
											style=" margin-left: 18px">寵物商品</a></li>
									<li class="nav-item mb-2"><a href="${contextRoot}/forum/ForumCategoryIndex" class="nav-link p-0"
											style=" margin-left: 18px">寵物論壇</a></li>
									<li class="nav-item mb-2"><a href="${contextRoot}/hotel/home" class="nav-link p-0"
											style=" margin-left: 18px">寵物住宿</a></li>
									<li class="nav-item mb-2"><a href="${contextRoot}/AdoptionHome" class="nav-link p-0"
											style=" margin-left: 18px">愛心領養</a></li>
								</ul>
							</div>

							<div class="col-4">
								<h5>地址地圖</h5>
								<ul class="nav flex-column">
									<iframe
										src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.008398643797!2d121.54109801536097!3d25.03378904445312!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abd379ae2e41%3A0x7613daa7e361cec3!2z6JmfIDIg5qiTLCBOby4gMzkw5b6p6IiI5Y2X6Lev5LiA5q615aSn5a6J5Y2A5Y-w5YyX5biCMTA2!5e0!3m2!1szh-TW!2stw!4v1675385910213!5m2!1szh-TW!2stw"
										width="400" height="240" style="border: 0;" allowfullscreen="" loading="lazy"
										referrerpolicy="no-referrer-when-downgrade"></iframe>
								</ul>
							</div>
						</div>

						<div class="d-flex justify-content-between border-top" style="padding-top: 12px">
							<p style="margin: 0;color: #444;font-weight: 600;">&copy; 2023 Company, Inc. All rights
								reserved.</p>
						</div>
						<!-- 					<ul class="list-unstyled d-flex"> -->
						<!-- 						<li class="ms-3"><a class="link-light" -->
						<!-- 							href="/adoptions/index/backdesk/b_index.jsp"><i -->
						<!-- 								class="fa-brands fa-twitter"></i></a></li> -->
						<!-- 						<li class="ms-3"><a class="link-light" href="#"><i -->
						<!-- 								class="fa-brands fa-facebook"></i></a></li> -->
						<!-- 						<li class="ms-3"><a class="link-light" href="#"><i -->
						<!-- 								class="fa-brands fa-instagram"></i></a></li> -->
						<!-- 					</ul> -->
						<!-- 				</div> -->
					</footer>
				</div>
			</div>
			<!-- footer end -->
			<!-- ↓ jquery  & bootstrap ↓ -->
			<script src="${contextRoot}/js/jquery-3.6.2.js"></script>
			<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
			<!-- ↑ jquery  & bootstrap ↑ -->
		</body>

		</html>