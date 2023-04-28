<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

				<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>Find All Photo Page</title>
				</head>

				<body>
					<jsp:include page="backStageSideBar_NavBar.jsp"></jsp:include>

					<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
						<div class="container">
							<h1>網站封面專用圖片</h1>

							<table class="table table-striped">
								<thead>
									<tr>
										<th>Id</th>
										<th>Photo</th>
									</tr>
								</thead>
								<tbody id="dataHome">
									<tr>
										<th>ID</th>
										<th>PICS</th>
									</tr>
								</tbody>
								<button id="newPic" class="btn btn-primary" data-bs-toggle='modal'
									data-bs-target='#IndexNewPics'>新增圖片</button>
							</table>

							<!-- 隱藏視窗 新增 -->
							<div class="modal fade" id="IndexNewPics" tabindex="-1">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">新增圖片</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal"
												aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="" id="PostAjaxForm" enctype="multipart/form-data"
												method="POST">
												<input type="hidden" name="indexPicsId" />

												<label>商品圖片上傳</label> <input type="file" id="photoFileInput"
													name="indexPics" multiple /><br />
												<div id="frames"></div>
												<div class="upload_result"></div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal" id="closeBtn">Close</button>
													<input id="theAddProductBtn" type="submit" value="新增完成"
														data-bs-dismiss="modal" class="btn btn-primary text-light">
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>

						</div>
					</main>

					<script>
						getAll()
						function getAll() {
							axios.get('http://localhost:8080/AnimalPlanet/index/getAllPics')
								.then(res => {
									// console.log(res)
									const dataHome = document.getElementById('dataHome')
									let outputStr = '';
									// console.log(res.data.length)
									for (let k = 0; k < res.data.length; k++) {
										let id = res.data[k].indexPicsId
										// console.log(id)
										outputStr += `<tr><th>` + id + `</th>`
										outputStr += `<th><img src='http://localhost:8080/AnimalPlanet/index/id?id=` + id + `' width="200px"><button data-delid="` + id + `" class="delBtn btn btn-danger" style="margin-left: 24px" name="indexPicsId">刪除</button></th></tr>`
									}
									dataHome.innerHTML = outputStr;
								})
								.then(() => {
									const delBtn = document.getElementsByClassName('delBtn')
									for (let i = 0; i < delBtn.length; i++) {
										delBtn[i].addEventListener('click', function (e) {
											let id = this.getAttribute('data-delid');
											console.log(id)
											deleteAjax(id)
										})
									}
								})
								.catch(err => {
									console.error(err);
								})
						}

						function deleteAjax(id) {
							axios.post('http://localhost:8080/AnimalPlanet/index/deleteIndexPics?id=' + id)
								.then(res => {
								})
								.catch(err => {
									console.log('刪除成功')
									getAll()
								})
						}


						const newPic = document.getElementById('newPic')
						newPic.addEventListener('click', function () {
							var photoFileInput = document.getElementById('photoFileInput')
							photoFileInput.value = '';
							$("#frames").html('');
						})

						const theAddProductBtn = document.getElementById('theAddProductBtn')
						theAddProductBtn.addEventListener('click', function (e) {
							e.preventDefault();
							const PostAjaxForm = document.getElementById('PostAjaxForm')
							const formData = new FormData(PostAjaxForm);
							addPic(formData)
						})

						function addPic(formData) {
							axios({
								url: 'http://localhost:8080/AnimalPlanet/index/postIndexPics',
								method: 'POST',
								data: formData,
								headers: { "Content-Type": "multipart/form-data" }
							})
								.then(res => {
									console.log('新增圖片成功')
									getAll()
								})
								.catch(err => {
									console.error(err);
								})
						}

						//圖片預覽-新增
						$(document).ready(function () {
							$('#photoFileInput').change(function () {
								$("#frames").html('');
								for (var i = 0; i < $(this)[0].files.length; i++) {
									$("#frames").append('<img src="' + window.URL.createObjectURL(this.files[i]) + '" width="100px" height="100px"/>');
								}
							});
						});
					</script>
				</body>

				</html>