<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<!DOCTYPE html>
		<html>

		<head>
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.1/dist/sweetalert2.all.min.js"></script>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.1/dist/sweetalert2.min.css">

			<meta charset="UTF-8">
			<title>會員列表</title>

		</head>

		<body>
			<jsp:include page="../../layout/backStageSideBar_NavBar.jsp"></jsp:include>


			<!-- 秀出所有member OK!!!!-->
			<!-- 模糊搜尋會員 -->
			<!-- 停權/復權 -->




			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 ">
					<h1 class="h2">會員列表</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group me-2">
							<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
						</div>

						<button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
							<span data-feather="calendar"></span> This week
						</button>
					</div>
				</div>

				<!-- -----------------------------------------------  搜尋框  ----------------------------------------------- -->
				<div class="pb-2 mb-3 border-bottom">
					<!-- <div
						class="control-group d-flex align-items-center flex-no-wrap justify-content-start align-middle">
						<label for="" class="form-label text-nowrap fs-4 align-middle">會員類別:
						</label> <input type="text" class="form-input form-control form-control-lg">
						<label for="" class="form-label text-nowrap fs-4 align-middle">會員??:
						</label> <input type="text" class="form-input form-control form-control-lg">
					</div> -->
					<div class="control-group d-flex align-items-center flex-no-wrap">
						<label for="" class="form-label text-nowrap fs-4 align-middle">會員名稱:
						</label> <input type="text" name="n" class="form-input form-control form-control-lg"
							id="productTypeSearchBar"> <input type="button" class="btn btn-dark btn-lg" value="搜尋"
							id="productTypeSearchBtn">
					</div>
				</div>


				<!-- <div>
					<button class="my-customer-data-btn btn btn-primary">查看會員資料</button>
				</div> -->

				<!-- --------------------------------------------  Member List  ----------------------------------------------- -->
				<div class="table-responsive">
					<table class="table table-bordered table-sm table-hover" id="table">
						<thead>
							<tr class="table-light">
								<th scope="col" class="d-flex align-items-center">多選<input type="checkbox"
										class="btn btn-danger" data-id="${product.productId}" id="checkAll"
										style="width: 17px; height: 17px;">
								</th>
								<th scope="col">會員ID</th>
								<th scope="col">會員帳號</th>
								<th scope="col">會員密碼</th>
								<th scope="col">會員等級</th>
								<th scope="col">會員狀態</th>

							</tr>
						</thead>
						<tbody id="tbody" class="output">
						</tbody>
					</table>
				</div>

				<div id="pages">

				</div>


























			</main>





			<script src="https://code.jquery.com/jquery-3.6.3.js"
				integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>



			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
				integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
				crossorigin="anonymous"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
				integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
				crossorigin="anonymous"></script>





			<script>
				// const reqUrl = 'http://localhost:8080/AnimalPlanet/getAllMembersApi';
				// const output = document.querySelector('.output');
				// const myBtn = document.querySelector('.my-customer-data-btn');

				// // $('.my-customer-data-btn').click(function(e){
				// // 	$.ajax({
				// // 		url: reqUrl,
				// // 		method: 'GET',
				// // 		success: function(response){
				// // 			console.log(response)
				// // 			htmlMaker(response)
				// // 		},
				// // 		error: function(err){
				// // 			console.log(err)
				// // 		}
				// // 	})	
				// // })

				// function htmlMaker(data) {
				// 	output.innerHTML = '<h5>回應的DATA</h5>';
				// 	data.forEach((element, index) => {
				// 		const div = document.createElement('div')
				// 		div.innerHTML += "<div> Account: " + element.account + "</div>"
				// 		div.innerHTML += "<div> password: " + element.password + "</div>"
				// 		div.innerHTML += "<div> Role: " + element.role + "</div>"
				// 		div.innerHTML += "<div> Status: " + element.status + "</div>"
				// 		output.append(div)
				// 	});
				// }


				// //////////////////////////// WEB API FETCH VERSION AJAX ////////////////////////////
				// myBtn.addEventListener('click', (e) => {
				// 	getData(reqUrl)
				// })

				// // function getData() {
				// // 	fetch(reqUrl).then(response => {
				// // 		return response.json()  //解析json物件?
				// // 	})
				// // 		.then((json) => {
				// // 			console.log(json)
				// // 			htmlMaker(json)
				// // 		})
				// // }

				// // AXIOS
				// function getData() {
				// 	axios.post(reqUrl)
				// 		.then(res => {
				// 			console.log(res) // x String

				// 			htmlMaker(res.data)

				// 		})
				// 		.catch(err => {
				// 			console.log(err)
				// 		})
				// }



				// =====================================================================================================
				const dataHome = document.getElementById("tbody");
				getProductTypeList(1)

				function getProductTypeList(pageNumber) {
					axios.get('http://localhost:8080/AnimalPlanet/getAllMembersApi2', { params: { p: pageNumber } })
						.then(res => {
							console.log('抓到資料~!')
							console.log(res)
							console.log(res.data.content)
							console.log(res.data.pageable.pageNumber)
							console.log(res.data.totalPages)
							render(res.data.content, res.data.totalPages, res.data.pageable.pageNumber); // 渲染畫面
							pList = res.data.content
						})
						.catch(err => {
							console.error(err);
						})
				}

				// ---- 渲染
				function render(data, totalPages, pageNumber) {
					let output = ""
					let i = 0;
					let item;

					console.log('渲染~~~~')
					console.log(data)
					for (let item of data) {
						output += "<tr>"
						// output += '<td class="align-middle "><input type="checkbox" data-productTypeId="' + item.productTypeId + '" id="checkMul" style="width: 20px;height: 20px;" name="checkbox"></td>' 
						output += '<td class="align-middle "><input type="checkbox" data-uId="' + item.uId + '" id="checkMul" style="width: 20px; height: 20px; "name="checkbox"></td>'  //多選框
						output += '<td class="align-middle">' + item.uId + '</td>'
						output += '<td class="align-middle">' + item.account + '</td>'
						output += '<td class="align-middle">' + item.password + '</td>'
						output += '<td class="align-middle">' + item.role + '</td>'


						// ----- 會員帳號狀態
						// output += '<td class="align-middle">' + item.status + '</td>'
						output += '<td class="align-middle"'
						if (item.status === 0) {
							output += 'style="color:green;font-weight:bold">啟用中'
						} else if (item.status === 2) {
							output += 'style="color:red;font-weight:bold">停權中'
						} else if (item.status === 1) {
							output += 'style="color:blue;font-weight:bold">驗證中'
						} output += '</td>'


						// ------ RADIO 停權復權
						output += '<td class="align-middle d-flex justify-content-between"><div class="form-check">'
						output += '<input class="form-check-input" type="radio" id="' + item.uId + '" name="memberStatus ' + item.uId + '" value="0"'
						if (item.status === 0) {
							output += ' checked'
						}
						output += '>啟用</div>'


						output += '<td class="align-middle d-flex justify-content-between"><div class="form-check">'
						output += '<input class="form-check-input" type="radio" id="' + item.uId + '" name="memberStatus ' + item.uId + '" value="2"'
						if (item.status === 2) {
							output += ' checked'
						}
						output += '>停用</div>'



						// output += '<td class="align-middle d-flex justify-content-between"><button class="btn btn-warning">檢視</button><button class="editAjaxBtn btn btn-info" id="editAjaxBtn" data-bs-toggle="modal" data-bs-target="#productTypeEditCard" index="' + i + '" data-productTypeId="' + item.productTypeId + '">編輯</button><button class="PTdeleteBtn btn btn-danger" data-producttypeid="' + item.productTypeId + '"onclick="deleteAlert()">刪除</button></td>'
						// output += '<td class="align-middle d-flex justify-content-between"><button class="btn btn-warning">檢視</button>' // 檢視btn
						// output += '<button class="editAjaxBtn btn btn-info" id="editAjaxBtn" data-bs-toggle="modal" data-bs-target="#productTypeEditCard" index="' + i + '" data-uId="' + item.uId + '">編輯</button>' // 編輯btn
						output += '<button class="PTdeleteBtn btn btn-danger" data-uId="' + item.uId + '"onclick="deleteAlert()">刪除</button></td>' // 刪除btn
						output += '</tr>'
						i++
					}
					dataHome.innerHTML = output;

					pagesMaker(totalPages, pageNumber)
					function pagesMaker(totalPages, pageNumber) {
						console.log(totalPages)
						let str = '';
						for (let i = 1; i <= totalPages; i++) {
							str += '<button id="pageBtns" class="pageBtn btn btn-warning" style="margin: 6px" data-page=' + i + '>' + i + '</button>'
						}
						const pages = document.getElementById('pages')
						pages.innerHTML = str;
						let buttonsArray = document.getElementsByClassName('pageBtn');
						for (i = 0; i < buttonsArray.length; i++) {
							buttonsArray[i].addEventListener('click', function (e) {
								let pageNumber = this.getAttribute('data-page');
								getProductTypeList(pageNumber);
							})
						}
					}

					// ----Delete----
					const deleteBtn = document.getElementsByClassName('PTdeleteBtn');
					// console.log(deleteBtn.length)
					for (i = 0; i < deleteBtn.length; i++) {
						deleteBtn[i].addEventListener('click', function (e) {
							let memberId = this.getAttribute('data-uId');
							console.log(memberId)
							deleteAlert(memberId)
						})
					}




					function deleteAxios(memberId) {
						axios({
							url: 'http://localhost:8080/AnimalPlanet/member/backStage/api/' + memberId,

							method: 'DELETE',
							headers: {
								"Content-Type": "application/x-www-form-urlencoded"
							},
							responseType: 'text',
							params: {
								'uId': memberId
							}
						}).then(res => {
							console.log(res.data)
							getProductTypeList(1)

						}).catch(err => {
							console.log(err)
						})
					}


					// SweetAlert2
					function deleteAlert(memberId) {
						Swal.fire({
							title: '確定刪除?',
							text: "您將無法恢復刪除的資料!",
							icon: 'warning',
							showCancelButton: true,
							confirmButtonColor: '#3085d6',
							cancelButtonColor: '#d33',
							confirmButtonText: '刪除',
							cancelButtonText: '取消'
						}).then((result) => {
							if (result.isConfirmed) {
								Swal.fire(
									'已刪除!',
									'您的資料已經刪除.',
									'success'
								)
								deleteAxios(memberId);
							}
						})
					}

					//-------------------------------------------radio 監聽 

					// 取得所有的 radio button
					const radios = $('input[type="radio"]');

					// 監聽所有的 radio button
					radios.on('change', (event) => {
						// 取得被選擇的 radio button 的 value 值
						const status = parseInt(event.target.value)
						let memberId =""
						memberId= parseInt(event.target.id)

						console.log(status)
						console.log(typeof status)
						console.log(memberId)
						console.log(typeof memberId)

						// 傳送資料到後端
						$.ajax({
							url: '/AnimalPlanet/inactivateMemberApi/',
							type: 'GET',
							dataType: 'json',
							data: {
								'uId': memberId,
								'status': status
							},
							contentType: 'application/json; charset=UTF-8',
							success: function (res) {
								console.log(res)
								console.log('成功')
								window.location.reload()
							},
							error: function () {
								alert('失敗~~~~~~~')
							}
						});
					});


				}



				// -------------------------------------------------- 搜尋 -------------------------------------------------------------------------
				const productTypeSearchBar = document.getElementById('productTypeSearchBar');
				const productTypeSearchBtn = document.getElementById('productTypeSearchBtn');
				productTypeSearchBtn.addEventListener('click', function (e) {
					let productTypeName = productTypeSearchBar.value
					searchProductTypeLike(productTypeName);
				})
				$("#productTypeSearchBar").keyup(function (event) {
					if (event.which === 13) {
						$("#productTypeSearchBtn").click();
					}
				});

				function searchProductTypeLike(productTypeName, pageNumber) {
					axios.get('http://localhost:8080/AnimalPlanet/member/namelike', { params: { n: productTypeName, p: pageNumber } })
						.then(res => {
							console.log(res.data)  //回傳的是陣列
							let data = res.data.content
							let pageNumber = res.data.pageable.pageNumber
							let totalPages = res.data.totalPages
							// htmlMakerForSearch(data, pageNumber, totalPages)
							render(data, totalPages, pageNumber)
							// console.log(res)
							// console.log(res.data.content)
							// console.log(res.data.pageable.pageNumber)
							// console.log(res.data.totalPages)
							// render(res.data.content, res.data.totalPages, res.data.pageable.pageNumber);
						})
						.catch(err => {
							console.error(err);
						})
				}

				// function htmlMakerForSearch(data, pageNumber, totalPages) {
				// 	console.log(data)
				// 	console.log(pageNumber)
				// 	console.log(totalPages)
				// 	let tbody = document.getElementById('tbody')
				// 	let htmlString = "";
				// 	let i = 0;
				// 	for (let item of data) {
				// 		htmlString += "<tr>"
				// 		htmlString += '<td class="align-middle "><input type="checkbox" data-productTypeId="' + item.uId + '" id="checkMul" style="width: 20px;height: 20px;" name="checkbox"></td>'  //多選框
				// 		htmlString += '<td class="align-middle">' + item.uId + '</td>'
				// 		htmlString += '<td class="align-middle">' + item.account + '</td>'
				// 		htmlString += '<td class="align-middle">' + item.password + '</td>'
				// 		htmlString += '<td class="align-middle">' + item.role + '</td>'
				// 		htmlString += '<td class="align-middle">' + item.status + '</td>'
				// 		// htmlString += '<td class="align-middle d-flex justify-content-between"><button class="btn btn-warning">檢視</button>'
				// 		// htmlString += '<button class="editAjaxBtn btn btn-info" id="editAjaxBtn" data-bs-toggle="modal" data-bs-target="#productTypeEditCard" index="' + i + '" data-uId="' + item.uId + '">編輯</button>'
				// 		htmlString += '<button class="PTdeleteBtn btn btn-danger" data-uId="' + item.uId + '"onclick="deleteAlert()">刪除</button></td>'
				// 		htmlString += "</tr>"
				// 	}
				// 	dataHome.innerHTML = htmlString;

				// 	pagesMakerS(pageNumber, totalPages)
				// 	function pagesMakerS(pageNumber, totalPages) {
				// 		// console.log(totalPages)
				// 		let str = '';
				// 		for (let i = 1; i <= totalPages; i++) {
				// 			str += '<button id="pageBtns" class="pageBtn btn btn-warning" style="margin: 6px" data-page=' + i + '>' + i + '</button>'
				// 		}
				// 		const pages = document.getElementById('pages')
				// 		pages.innerHTML = str;
				// 		let buttonsArray = document.getElementsByClassName('pageBtn');
				// 		for (i = 0; i < buttonsArray.length; i++) {
				// 			buttonsArray[i].addEventListener('click', function (e) {
				// 				let pageNumber = this.getAttribute('data-page');
				// 				searchProductTypeLike(pageNumber);
				// 			})
				// 		}
				// 	}


				// 	const deleteBtn = document.getElementsByClassName('PTdeleteBtn');
				// 	// console.log(deleteBtn.length)
				// 	for (i = 0; i < deleteBtn.length; i++) {
				// 		deleteBtn[i].addEventListener('click', function (e) {
				// 			let memberId = this.getAttribute('data-uId');
				// 			// console.log(memberId)
				// 			deleteAlert(memberId)
				// 		})
				// 	}
				// 	function deleteAxios(memberId) {
				// 		axios({
				// 			url: 'http://localhost:8080/AnimalPlanet/member/backStage/api/' + memberId + '',
				// 			method: 'DELETE',
				// 			headers: {
				// 				"Content-Type": "application/x-www-form-urlencoded"
				// 			},
				// 			responseType: 'text',
				// 			params: {
				// 				// productTypeId: producttypeid
				// 				'uId': memberId
				// 			}
				// 		}).then(res => {
				// 			// console.log(res.data)
				// 			getProductTypeList(1)
				// 			productTypeSearchBar.value = "";
				// 		}).catch(err => {
				// 			// console.log(err)
				// 			// getProductTypeList(1)
				// 		})
				// 	}
				// 	// SweetAlert2
				// 	function deleteAlert(memberId) {
				// 		Swal.fire({
				// 			title: '確定刪除?',
				// 			text: "您將無法恢復刪除的資料!",
				// 			icon: 'warning',
				// 			showCancelButton: true,
				// 			confirmButtonColor: '#3085d6',
				// 			cancelButtonColor: '#d33',
				// 			confirmButtonText: '刪除',
				// 			cancelButtonText: '取消'
				// 		}).then((result) => {
				// 			if (result.isConfirmed) {
				// 				Swal.fire(
				// 					'已刪除!',
				// 					'您的資料已經刪除.',
				// 					'success'
				// 				)
				// 				deleteAxios(memberId);
				// 			}
				// 		})
				// 	}



				// }
















			</script>





		</body>

		</html>