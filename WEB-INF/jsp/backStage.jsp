<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>AnimalPlanet後台管理</title>


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
			</style>
		</head>

		<body>
			<jsp:include page="layout/backStageSideBar_NavBar.jsp"></jsp:include>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Dashboard</h1>
				</div>
				<div class="img-container d-flex justify-content-center">
					<img class="img-thumbnail" src="http://localhost:8080/AnimalPlanet/index/id?id=20" alt=""
						width="60%">
				</div>

			</main>


			<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
				integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
				crossorigin="anonymous"></script>
			<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
				integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
				crossorigin="anonymous"></script>
			<script src="${contextRoot}/js/backStage.js"></script>

		</body>

		</html>