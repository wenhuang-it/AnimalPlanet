<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<!DOCTYPE html>
		<html>

		<head>

			<meta charset="UTF-8">
			<title>商品列表</title>

		</head>

		<body>
			<jsp:include page="../../layout/backStageSideBar_NavBar.jsp"></jsp:include>


			<!-- 秀出所有member -->
			<!-- 模糊搜尋會員 -->
			<!-- 停權/復權 -->


			<!-- -----------------------------------------------  搜尋框  ----------------------------------------------- -->


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
				<div class="pb-2 mb-3 border-bottom">
					<div
						class="control-group d-flex align-items-center flex-no-wrap justify-content-start align-middle">
						<label for="" class="form-label text-nowrap fs-4 align-middle">會員類別??????????:
						</label> <input type="text" class="form-input form-control form-control-lg">
						<label for="" class="form-label text-nowrap fs-4 align-middle">商品庫存數量???????:
						</label> <input type="text" class="form-input form-control form-control-lg">
					</div>
					<div class="control-group d-flex align-items-center flex-no-wrap">
						<label for="" class="form-label text-nowrap fs-4 align-middle">會員名稱:
						</label> <input type="text" name="n" class="form-input form-control form-control-lg"
							id="productSearchBar"> <input type="button" class="btn btn-dark btn-lg" value="搜尋"
							id="productSearchBtn">
					</div>
				</div>

				<!-- -----------------------------------------------  Member List  ----------------------------------------------- -->
				<div class="table-responsive">
					<table class="table table-bordered table-sm table-hover " id="table">
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
						<tbody id="tbody" class="">
						</tbody>
					</table>

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
					let editor;
					ClassicEditor
						.create(document.getElementById('editor'))
						// , {
						// 	plugins: [Image],
						// 	toolbar: ['imageUpload', '|', 'imageStyle:alignLeft', 'imageStyle:full', 'imageStyle:alignRight'],
						// 	image: {
						// 		toolbar: ['imageTextAlternative', '|', 'imageStyle:alignLeft', 'imageStyle:full', 'imageStyle:alignRight', 'imageResize'],
						// 		styles: [
						// 			'full',
						// 			'alignLeft',
						// 			'alignRight'
						// 		],
						// 		// 配置圖片上傳服務端接口
						// 		upload: {
						// 			// 圖片上傳接口的URL
						// 			url: '/mall/product/postProduct',
						// 			// 指定圖片上傳方法
						// 			method: 'POST',
						// 			// 指定圖片上傳的欄位名
						// 			field: 'image',
						// 			// 指定圖片上傳成功時服務端返回的圖片URL欄位名
						// 			urlEnabled: true,
						// 			// 指定是否支援跨域上傳圖片
						// 			withCredentials: false,
						// 			// 指定上傳圖片時附帶的其他參數
						// 			headers: {
						// 				'X-CSRF-TOKEN': 'csrf_token_value'
						// 			}
						// 		}
						// 	}
						// })
						.then(newEditor => {
							editor = newEditor;
							editor.model.document.on('change:data', () => {
								const data = editor.getData();
								console.log(data);
								document.getElementById('editor').value = data;
							});
						})
						.catch(error => {
							console.error(error);
						});
	
				</script>
				<script>
					//圖片預覽
					//圖片預覽-新增
					$(document).ready(function () {
						$('#photoFileInput').change(function () {
							$("#frames").html('');
							for (var i = 0; i < $(this)[0].files.length; i++) {
								$("#frames").append('<img src="' + window.URL.createObjectURL(this.files[i]) + '" width="100px" height="100px"/>');
							}
						});
					});
					//圖片預覽-編輯
					$(document).ready(function () {
						$('#photoFileInputEdit').change(function () {
							$("#framesEdit").empty();
							for (var i = 0; i < $(this)[0].files.length; i++) {
								$("#framesEdit").append('<img src="' + window.URL.createObjectURL(this.files[i]) + '" width="100px" height="100px"/>');
							}
						});
					});
					////新增商品的商品種類--step1 抓出所有種類
					function getAllProductType() {
						axios.get('http://localhost:8080/AnimalPlanet/mall/backStage/api/addProduct')
							.then(res => {
								console.log(res.data)
								productTypeMaker(res.data)
							})
							.catch(err => {
								console.error(err);
							})
					}
					//// 新增商品的商品種類 丟進新增MODAL
					function productTypeMaker(data) {
						ptString = "";
						for (let item of data) {
							ptString += '<div class="form-check" style="margin-left: 12px;">'
							ptString += '<input class="productType form-check-input" type="checkbox"'
							ptString += 'value="' + item.productTypeId + '" name="productType" id="' + item.productTypeId + '">'
							ptString += '<label class="form-check-label" for="' + item.productTypeId + '">'
							ptString += item.productTypeName + ' </label ></div >'
						}
						productType.innerHTML = ptString
					}
	
					// ajax show all  --ok
					const dataHome = document.getElementById("tbody");
					getProductList(1)
					let pList;
					////進站渲染列表+分頁
					function getProductList(pageNumber) {
						axios.get('http://localhost:8080/AnimalPlanet/mall/backStage/showProductList', { params: { p: pageNumber } })
							.then(res => {
								pList = res.data
								pDTO = pList.pDTO
								console.log(res)
								// console.log(res.data.pageNumber)
								// console.log(res.data.totalPages)
								render(res.data.pDTO, res.data.totalPages, res.data.pageNumber);
								const productBtn = document.getElementsByClassName('product-btn')
								for (i = 0; i < productBtn.length; i++) {
									productBtn[i].addEventListener('click', function (e) {
										let productId = this.getAttribute('data-id');
										getProductPhoto(productId);
									})
								}
							})
							.catch(err => {
								console.error(err);
							})
					}
					////看照片 step1
					function getProductPhoto(productId) {
						axios.get('http://localhost:8080/AnimalPlanet/mall/product/product-get-pic?productId=' + productId)
							.then(res => {
								// console.log(res.data)
								htmlMaker(res.data, productId)
							})
							.catch(err => {
								console.error(err);
							})
					}
					////看照片 step2
					function htmlMaker(data, productId) {
						let output = document.getElementById("output-result_" + productId + "")
						let htmlStringPics = "";
						for (i = 0; i < data.length; i++) {
							htmlStringPics += "<img class='pics' src='http://localhost:8080/AnimalPlanet/mall/product/productPics?productPicsId=" + data[i] + "' width=150px>"
						}
						output.innerHTML = htmlStringPics;
					}
	
					// const dataHome = document.getElementById("dataHome");
	
					/////編輯商品modal 渲染 帶值
					const hiddenCardProductId = document.getElementById("productId");
					const hiddenCardProductName = document.getElementById("productNameEdit");
					const hiddenCardProductType = document.getElementById("productType");
					const hiddenCardProductFormat = document.getElementById("productFormatEdit");
					const hiddenCardProductPriceOrigin = document.getElementById("productPriceOriginEdit");
					const hiddenCardProductPriceSales = document.getElementById("productPriceSalesEdit");
					const hiddenCardProductSalesActiveStatus = document.getElementById("flexSwitchCheckDefaultForSAS");
					const hiddenCardProductStorageUnits = document.getElementById("productStorageUnitsEdit");
					const hiddenCardProductLaunchedDate = document.getElementById("productLaunchedDateEdit");
					const hiddenCardProductDiscontinuedDate = document.getElementById("productDiscontinuedDateEdit");
					const hiddenCardProductLaunchSituation = document.getElementById("flexSwitchCheckDefaultForLS");
					const hiddenCardProductDetail = document.getElementById("editorEdit");
					const hiddenCardProductPics = document.getElementById("photoFileInputEdit");
					const updateBtn = document.getElementById("ajaxEditBtn");
					getAllProductTypes();
					dataHome.addEventListener('click', function (e) {
						if (e.target.classList.contains('editAjaxBtn')) {
							let index = +e.target.getAttribute("index");
							let product = pDTO[index];
							// console.log(product)
							if (product.productSalesActiveStatus == false) {
								hiddenCardProductSalesActiveStatus.checked = false
							} else {
								hiddenCardProductSalesActiveStatus.checked = true
							}
	
							if (product.productLaunchSituation == false) {
								hiddenCardProductLaunchSituation.checked = false
							} else {
								hiddenCardProductLaunchSituation.checked = true
							}
							hiddenCardProductId.value = product.productId
							hiddenCardProductName.value = product.productName
							hiddenCardProductType.value = product.productType
							hiddenCardProductFormat.value = product.productFormat
							hiddenCardProductPriceOrigin.value = product.productPriceOrigin
							hiddenCardProductPriceSales.value = product.productPriceSales
							hiddenCardProductStorageUnits.value = product.productStorageUnits
							hiddenCardProductLaunchedDate.value = product.productLaunchedDate
							hiddenCardProductDiscontinuedDate.value = product.productDiscontinuedDate
							hiddenCardProductDetail.value = product.productDetail
							setTimeout(getAllDTO, 100);
							getAllDTO();
							function getAllDTO() {
								const eachInput = document.getElementsByClassName('productTypeInputinEdit')
								//每次先清空checkbox
								for (let eI of eachInput) {
									eI.checked = false
								}
								axios.get('http://localhost:8080/AnimalPlanet/mall/backStage/showProductList')
									.then(res => {
										for (let eachDTO of res.data.pDTO) {
											if (eachDTO.productId == product.productId) {
												for (let eachDTOpt of eachDTO.productType) {
													for (let c of eachInput) {
														if (c.value == eachDTOpt.productTypeName) {
															c.checked = true
														}
													}
												}
											}
										}
									})
									.catch(err => {
										console.error(err);
									})
							}
	
							// 照片!!
							let productId = product.productId
							getProductPhotoE(productId)
							$(document).ready(function () {
								deletePicE(productId)
							})
							function deletePicE(productId) {
								let delPicBtn = document.getElementsByClassName('forPic')
	
								for (i = 0; i < delPicBtn.length; i++) {
									delPicBtn[i].addEventListener('click', function (e) {
										let productPicsId = this.getAttribute('data-picid');
										deletePicAjaxE(productPicsId, productId)
									})
								}
	
							}
							function deletePicAjaxE(productPicsId, productid) {
								axios({
									url: 'http://localhost:8080/AnimalPlanet/mall/product/edit/delete',
									method: 'DELETE',
									headers: {
										"Content-Type": "application/x-www-form-urlencoded"
									},
									responseType: 'text',
									params: {
										productId: productid,
										productPicsId: productPicsId
									}
								}).then(res => {
									console.log(res.data)
								}).catch(err => {
									getProductPhotoE(productId);
								})
							}
							function getProductPhotoE(productId) {
								axios.get('http://localhost:8080/AnimalPlanet/mall/product/product-get-pic?productId=' + productId)
									.then(res => {
										htmlMakerE(res.data, productId)
									})
									.catch(err => {
										console.error(err);
									})
							}
							function htmlMakerE(data) {
								let output = document.getElementById('XD')
								let htmlString = "";
								for (i = 0; i < data.length; i++) {
									htmlString += "<div class='ppics'><img class='pics img-thumbnail' src='http://localhost:8080/AnimalPlanet/mall/product/productPics?productPicsId=" + data[i] + "' width=150px><i class='forPic fa-solid fa-circle-xmark' id='forPic' data-picId='" + data[i] + "'></i></div>"
								}
								output.innerHTML = htmlString;
								let productid = productId
								let delPicBtn = document.getElementsByClassName('forPic')
								for (i = 0; i < delPicBtn.length; i++) {
									delPicBtn[i].addEventListener('click', function (e) {
										let productPicsId = this.getAttribute('data-picid');
										deletePicAjaxE(productPicsId, productid)  //執行刪除AJAX
									})
								}
							}
						}
					})
	
					//EDIT
					updateBtn.addEventListener('click', function (e) {
						e.preventDefault();
						const formData = new FormData();
						formData.append("productId", hiddenCardProductId.value)
						formData.append("productName", hiddenCardProductName.value)
						formData.append("productFormat", hiddenCardProductFormat.value)
						formData.append("productPriceOrigin", hiddenCardProductPriceOrigin.value)
						formData.append("productPriceSales", hiddenCardProductPriceSales.value)
						if (hiddenCardProductSalesActiveStatus.checked) {
							formData.append("productSalesActiveStatus", hiddenCardProductSalesActiveStatus.value)
						}
						formData.append("productStorageUnits", hiddenCardProductStorageUnits.value)
						formData.append("productLaunchedDate", hiddenCardProductLaunchedDate.value)
						formData.append("productDiscontinuedDate", hiddenCardProductDiscontinuedDate.value)
						formData.append("productDetail", hiddenCardProductDetail.value)
						if (hiddenCardProductLaunchSituation.checked) {
							formData.append("productLaunchSituation", hiddenCardProductLaunchSituation.value)
						}
						const files = hiddenCardProductPics.files
						console.log(files.length)
						if (files) {
							for (let i = 0; i < files.length; i++) {
								formData.append('file', files[i]);
							}
						}
	
						const typeInputs = document.getElementsByClassName('productTypeInputinEdit')
						for (let t = 0; t < typeInputs.length; t++) {
							if (typeInputs[t].checked == true) {
								formData.append('ppt', typeInputs[t].id)
							}
						}
	
						updatePdt(formData);
	
						function updatePdt(formData) {
							axios({
								url: 'http://localhost:8080/AnimalPlanet/mall/product/editPics',
								method: 'post',
								data: formData,
								headers: { "Content-Type": "multipart/form-data" }
							})
								.then(res => {
									console.log(res.data)
									console.log('上傳成功')
									getProductList();   ///編輯完成 頁碼
									$("#framesEdit").empty();
									hiddenCardProductPics.value = '';
								})
								.catch(err => {
									console.log(err)
								})
						}
					});
	
					// 前端渲染方法  --ok
					// render(res.data.pDTO, res.data.totalPages, res.data.pageNumber);
					function render(data, totalPages, pageNumber) {
						let output = ""
						let i = 0;
						for (let item of data) {
							// 設置null & undefined 為空白值
							if (!item.productName) {
								item.productName = '';
							}
							if (!item.productFormat) {
								item.productFormat = '';
							}
							if (!item.productPriceOrigin) {
								item.productPriceOrigin = '';
							}
							if (!item.productPriceSales) {
								item.productPriceSales = '';
							}
							if (!item.productStorageUnits) {
								item.productStorageUnits = '';
							}
							if (!item.productLaunchedDate) {
								item.productLaunchedDate = '';
							}
							if (!item.productDiscontinuedDate) {
								item.productDiscontinuedDate = '';
							}
							if (!item.productType) {
								item.productType = '';
							}
	
							//商品清單渲染
							output += "<tr>"
							output += '<td class="align-middle "><input type="checkbox" data-productid="' + item.productId + '" id="checkMul" style="width: 20px;height: 20px;" name="checkbox"></td>'  //多選框
							output += '<td class="align-middle">' + item.productId + '</td>' //商品ID
							output += '<td class="align-middle">' + item.productName + '</td>' //name
							let productTypeNames = '';
							let productTypeIds = '';
							for (let j = 0; j < item.productType.length; j++) {
								productTypeNames += item.productType[j].productTypeName;
								productTypeIds += item.productType[j].productTypeId;
								if (j < item.productType.length - 1) {
									productTypeNames += '<br>';
									productTypeIds += '<br>';
								}
							}
							output += '<td class="align-middle">' + productTypeNames + '</td>' //type
							output += '<td class="align-middle">' + item.productFormat + '</td>' //format
							output += '<td class="align-middle "><button class="product-btn btn btn-warning" data-id="' + item.productId + '" data-bs-toggle="modal" data-bs-target="#hello_' + item.productId + '">看照片</button></td>' //picsBtn
							output += '<td class="align-middle">' + item.productPriceOrigin + '</td>' //originprice
							output += '<td class="align-middle">' + item.productPriceSales + '</td>' //originsales
							output += '<td class="align-middle">' + item.productSalesActiveStatus + '</td>'
							output += '<td class="align-middle">' + item.productStorageUnits + '</td>'
							output += '<td class="align-middle">' + item.productLaunchedDate + '</td>'
							output += '<td class="align-middle">' + item.productDiscontinuedDate + '</td>'
							output += '<td class="align-middle">' + item.productLaunchSituation + '</td>'
							output += '<td class="align-middle d-flex justify-content-between"><button class="btn btn-warning">檢視</button><button class="editAjaxBtn btn btn-info" id="editAjaxBtn" data-bs-toggle="modal" data-bs-target="#productEditCard" index="' + i + '" data-productid="' + item.productId + '">編輯</button><button class="deleteBtn btn btn-danger" data-productid="' + item.productId + '"onclick="deleteAlert()">刪除</button></td>'
	
							output += "</tr>"
							i++
							// Modal for Pictures 
							output += '<div class="modal fade" id="hello_' + item.productId + '" tabindex = "-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >'
							output += '<div class="modal-dialog modal-xl"><div class="modal-content"><div class="modal-header">'
							output += '<h5 class="modal-title" id="modalProductName">' + item.productName + '</h5>'
							output += '<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>'
							output += '</div><div class="modal-body">	<div id="output-result_' + item.productId + '"></div></div><div class="modal-footer">	<button type="button" class="btn btn-secondary"		data-bs-dismiss="modal">Close</button></div></div></div></div>'
							getProductPhoto(item.productId)
						}
						dataHome.innerHTML = output;
						//console.log(data)
	
						pagesMaker(totalPages, pageNumber)
	
						function pagesMaker(totalPages, pageNumber) {
							//console.log(totalPages)
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
									getProductList(pageNumber);
								})
							}
						}
	
						//bind DELETE
						const deleteBtn = document.getElementsByClassName('deleteBtn');
						for (i = 0; i < deleteBtn.length; i++) {
							deleteBtn[i].addEventListener('click', function (e) {
								let productId = this.getAttribute('data-productid');
								deleteAlert(productId)
							})
						}
	
						////BUGGGGGGGGGG///////
						const delBtnMul = document.getElementById('deleteBtnMul')  //刪除按鈕
						const checkBoxMul = document.getElementsByName('checkbox')	// 多選框
						delBtnMul.addEventListener('click', function (e) {
							for (let i = 0; i < checkBoxMul.length; i++) {
								if (checkBoxMul[i].checked) {
									let productId = checkBoxMul[i].getAttribute('data-productid');
									deleteAxios(productId)
									checkBoxMul[i].checked = false
								}
							}
						})
	
						const selectAll = document.getElementById('checkAll')
						selectAll.addEventListener('change', function (e) {
							if (selectAll.checked) {
								for (let i = 0; i < checkBoxMul.length; i++) {
									checkBoxMul[i].checked = true;
								}
							} else {
								for (let i = 0; i < checkBoxMul.length; i++) {
									checkBoxMul[i].checked = false;
								}
							}
						})
	
	
						// ----Delete----
						function deleteAxios(productId) {
							axios({
								url: 'http://localhost:8080/AnimalPlanet/mall/product/' + productId + '',
								method: 'DELETE',
								headers: {
									"Content-Type": "application/x-www-form-urlencoded"
								},
								responseType: 'text',
								params: {
									productId: productId
								}
							}).then(res => {
								console.log(res.data)
							}).catch(err => {
								console.log(err)
								getProductList();
							})
						}
	
						// SweetAlert2
						function deleteAlert(productId) {
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
									deleteAxios(productId);
								}
							})
						}
	
					}
					//bind SEARCH
					const productSearchBar = document.getElementById('productSearchBar');
					const productSearchBtn = document.getElementById('productSearchBtn');
					productSearchBtn.addEventListener('click', function (e) {
						let productName = productSearchBar.value
						searchProductLike(productName);
					})
					$("#productSearchBar").keyup(function (event) {
						if (event.which === 13) {
							$("#productSearchBtn").click();
						}
					});
					// ----Search----/////////////////////////////////////////////////////////////////////////////
					const productName = productSearchBar.value
					function searchProductLike(productName, pageNumber) {
						axios.get('http://localhost:8080/AnimalPlanet/mall/product/namelike', { params: { n: productName, p: pageNumber } })
							.then(res => {
								// console.log(res.data)
								let pDTO = res.data.pDTO
								let pageNumber = res.data.pageNumber
								let totalPages = res.data.totalPages
								renderForSearch(pDTO, pageNumber, totalPages)
							})
							.catch(err => {
								console.error(err);
							})
					}
					function renderForSearch(data, pageNumber, totalPages) {
						let output = ""
						let i = 0;
						for (let item of data) {
							// 設置null & undefined 為空白值
							if (!item.productName) {
								item.productName = '';
							}
							if (!item.productFormat) {
								item.productFormat = '';
							}
							if (!item.productPriceOrigin) {
								item.productPriceOrigin = '';
							}
							if (!item.productPriceSales) {
								item.productPriceSales = '';
							}
							if (!item.productStorageUnits) {
								item.productStorageUnits = '';
							}
							if (!item.productLaunchedDate) {
								item.productLaunchedDate = '';
							}
							if (!item.productDiscontinuedDate) {
								item.productDiscontinuedDate = '';
							}
							if (!item.productType) {
								item.productType = '';
							}
	
							//商品清單渲染
							output += "<tr>"
							output += '<td class="align-middle "><input type="checkbox" data-productid="' + item.productId + '" id="checkMul" style="width: 20px;height: 20px;" name="checkbox"></td>'  //多選框
							output += '<td class="align-middle">' + item.productId + '</td>' //商品ID
							output += '<td class="align-middle">' + item.productName + '</td>' //name
							let productTypeNames = '';
							let productTypeIds = '';
							for (let j = 0; j < item.productType.length; j++) {
								productTypeNames += item.productType[j].productTypeName;
								productTypeIds += item.productType[j].productTypeId;
								if (j < item.productType.length - 1) {
									productTypeNames += '<br>';
									productTypeIds += '<br>';
								}
							}
							output += '<td class="align-middle">' + productTypeNames + '</td>' //type
							output += '<td class="align-middle">' + item.productFormat + '</td>' //format
							output += '<td class="align-middle "><button class="product-btn btn btn-warning" data-id="' + item.productId + '" data-bs-toggle="modal" data-bs-target="#hello_' + item.productId + '">看照片</button></td>' //picsBtn
							output += '<td class="align-middle">' + item.productPriceOrigin + '</td>' //originprice
							output += '<td class="align-middle">' + item.productPriceSales + '</td>' //originsales
							output += '<td class="align-middle">' + item.productSalesActiveStatus + '</td>'
							output += '<td class="align-middle">' + item.productStorageUnits + '</td>'
							output += '<td class="align-middle">' + item.productLaunchedDate + '</td>'
							output += '<td class="align-middle">' + item.productDiscontinuedDate + '</td>'
							output += '<td class="align-middle">' + item.productLaunchSituation + '</td>'
							output += '<td class="align-middle d-flex justify-content-between"><button class="btn btn-warning">檢視</button><button class="editAjaxBtn btn btn-info" id="editAjaxBtn" data-bs-toggle="modal" data-bs-target="#productEditCard" index="' + i + '" data-productid="' + item.productId + '">編輯</button><button class="deleteBtn btn btn-danger" data-productid="' + item.productId + '"onclick="deleteAlert()">刪除</button></td>'
	
							output += "</tr>"
							i++
							// Modal for Pictures 
							output += '<div class="modal fade" id="hello_' + item.productId + '" tabindex = "-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >'
							output += '<div class="modal-dialog modal-xl"><div class="modal-content"><div class="modal-header">'
							output += '<h5 class="modal-title" id="modalProductName">' + item.productName + '</h5>'
							output += '<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>'
							output += '</div><div class="modal-body">	<div id="output-result_' + item.productId + '"></div></div><div class="modal-footer">	<button type="button" class="btn btn-secondary"		data-bs-dismiss="modal">Close</button></div></div></div></div>'
							getProductPhoto(item.productId)
						}
						dataHome.innerHTML = output;
	
						pagesMakerS(pageNumber, totalPages)
						function pagesMakerS(pageNumber, totalPages) {
							//console.log(totalPages)
							let str = '';
							for (let i = 1; i <= totalPages; i++) {
								str += '<button id="pageBtns" class="pageBtn btn btn-warning" style="margin: 6px" data-page=' + i + '>' + i + '</button>'
							}
							const pages = document.getElementById('pages')
							pages.innerHTML = str;
							let buttonsArray = document.getElementsByClassName('pageBtn');
							for (i = 0; i < buttonsArray.length; i++) {
								buttonsArray[i].addEventListener('click', function (e) {
									// console.log(productName)
									// console.log(pageNumber)
									let pageNumber = this.getAttribute('data-page');
									let productName = productSearchBar.value
									searchProductLike(productName, pageNumber);
								})
							}
						}
	
						//bind DELETE
						const deleteBtn = document.getElementsByClassName('deleteBtn');
						for (i = 0; i < deleteBtn.length; i++) {
							deleteBtn[i].addEventListener('click', function (e) {
								let productId = this.getAttribute('data-productid');
								deleteAlert(productId)
							})
						}
	
	
	
						////BUGGGGGGGGGG///////
						const delBtnMul = document.getElementById('deleteBtnMul')  //刪除按鈕
						const checkBoxMul = document.getElementsByName('checkbox')	// 多選框
						delBtnMul.addEventListener('click', function (e) {
							for (let i = 0; i < checkBoxMul.length; i++) {
								if (checkBoxMul[i].checked) {
									let productId = checkBoxMul[i].getAttribute('data-productid');
									deleteAxios(productId)
									checkBoxMul[i].checked = false
								}
							}
						})
	
						const selectAll = document.getElementById('checkAll')
						selectAll.addEventListener('change', function (e) {
							if (selectAll.checked) {
								for (let i = 0; i < checkBoxMul.length; i++) {
									checkBoxMul[i].checked = true;
								}
							} else {
								for (let i = 0; i < checkBoxMul.length; i++) {
									checkBoxMul[i].checked = false;
								}
							}
						})
	
	
						// ----Delete----
						function deleteAxios(productId) {
							axios({
								url: 'http://localhost:8080/AnimalPlanet/mall/product/' + productId + '',
								method: 'DELETE',
								headers: {
									"Content-Type": "application/x-www-form-urlencoded"
								},
								responseType: 'text',
								params: {
									productId: productId
								}
							}).then(res => {
								//console.log(res.data)
							}).catch(err => {
								//console.log(err)
								let productName = document.getElementById('productSearchBar').value
								searchProductLike(productName, pageNumber);
							})
						}
	
						// SweetAlert2
						function deleteAlert(productId) {
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
									deleteAxios(productId);
								}
							})
						}
	
					}
	
					function getAllProductTypes() {   //find all productType
						axios.get('http://localhost:8080/AnimalPlanet/mall/backStage/api/addProduct')
							.then(res => {
								productTypeMakers(res.data)
							})
							.catch(err => {
								console.error(err);
							})
					}
					function productTypeMakers(data) {
						const productTypeInEdit = document.getElementsByClassName('productTypeInEdit')
						for (c = 0; c < productTypeInEdit.length; c++) {
							ptString = "";
							for (let ptm of data) {
								ptString += '<div class="form-check" style="margin-left: 12px;">'
								ptString += '<input class="productTypeInputinEdit form-check-input" type="checkbox" '
								ptString += 'value="' + ptm.productTypeName + '" name="ppt" id="' + ptm.productTypeId + '">'
								ptString += '<label class="form-check-label" for="' + ptm.productTypeId + '">'
								ptString += ptm.productTypeName + ' </label></div>'
								productTypeInEdit[c].innerHTML = ptString
							}
						}
					}
					//////新增商品--OK
					// add product in modal button by ajax 
					const theAddProductBtn = document.getElementById('theAddProductBtn')
					theAddProductBtn.addEventListener('click', function (e) {
						e.preventDefault();
						const PostProductAjaxForm = document.getElementById('PostProductAjaxForm')
						let formData = new FormData(PostProductAjaxForm);
						PostProductAjax(formData)
					})
	
					function PostProductAjax(formData) {
						axios({
							url: 'http://localhost:8080/AnimalPlanet/mall/product/postProduct',
							method: 'POST',
							data: formData,
							headers: { "Content-Type": "multipart/form-data" }
						}).then(res => {
							//console.log(res.data)
							let productName = document.getElementById('productSearchBar').value
							getProductList(1);
							// reset Form input and Pics frames
							PostProductAjaxForm.reset();
							document.getElementById('frames').innerHTML = "";
						})
							.catch(err => {
								console.log(err)
							})
					}
					// add product in productList by ajax --ok
					const addPBtn = document.getElementById('addProductBtn')
					const productType = document.getElementById('productType')
					addPBtn.addEventListener('click', function (e) {
						getAllProductType();
					})
	
	
				</script>


		</body>

		</html>