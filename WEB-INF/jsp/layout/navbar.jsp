<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

			<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&display=swap"
					rel="stylesheet">
				<!-- ↓ bootstrap ↓ -->
				<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
				<!-- ↑ bootstrap ↑ -->
				<link href="${contextRoot}/css/index.css" rel="stylesheet">
			</head>

			<body>

				<sec:authorize access="authenticated" var="authenticated" />
				<header class="p-3 border-bottom" style="background-color: white">
					<div class="navbarIndex container ">
						<div class="d-flex align-items-center justify-content-center justify-content-lg-start">

							<a href="${contextRoot}/" class="align-items-center mb-2 mb-lg-0 logo_text" id="logo">
								<!-- 待更新網站LOGO by database --> <img src="https://i.imgur.com/CTNLla1.png" height="40px"
									alt=""> AnimalPlanet
							</a>
							<div class="col d-flex flex-wrap align-items-center justify-content-end">
								<a class="navbarButton" href="${contextRoot}/mall/shoppingMallIndex"><button
										type="button" class="btn " id="navbarButton">寵物商城</button></a>
								<a class="navbarButton" href="${contextRoot}/forum/ForumCategoryIndex"><button
										type="button" class="btn " id="navbarButton">寵物論壇</button></a>
								<a class="navbarButton" href="${contextRoot}/hotel/home"><button type="button"
										class="btn " id="navbarButton">寵物住宿</button></a>
								<a class="navbarButton" href="${contextRoot}/AdoptionHome"><button type="button"
										class="btn " id="navbarButton">愛心領養</button></a>


								<c:choose>
									<c:when test="${authenticated}">
										<a class="navbarButton" href="${contextRoot}/member/memberInfoPage"><button
												type="button" class=" btn " id="meminfo-navi">
												會員資料
											</button></a>
										<a class="navbarButton" href="${contextRoot}/logout"><button type="button"
												class=" btn " id="logout-navi" style="white-space:nowrap;width:auto">
												<sec:authentication property="principal.username" />
												會員登出
											</button></a>
									</c:when>
									<c:otherwise>
										<a class="navbarButton" href="${contextRoot}/login"><button type="button"
												class="btn " id="login-navi">會員登入</button></a>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
					</div>
				</header>
			</body>

			</html>