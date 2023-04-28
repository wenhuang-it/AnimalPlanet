<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<html>

		<head>
			<title>會員資料</title>
			<style>
				#container {
					text-align: center;
					justify-content: center;
				}

				* / #fail {
					color: red;
					font-size: 30px;
				}

				.downArrow {
					display: inline-block;
					vertical-align: text-top;
					margin-left: 12px;
				}
			</style>
			<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
		</head>

		<body>
			<!-- navbar -->
			<jsp:include page="../../layout/navbar.jsp"></jsp:include>
			<!-- navbar -->


			<div id="container">
				<!-- <div class="row row-cols-1 row-cols-md-3 g-4">
					<div class="col">
						<div class="card h-100">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting text below as a natural
									lead-in to additional content. This content is a little bit longer.</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">Last updated 3 mins ago</small>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card h-100">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This card has supporting text below as a natural lead-in to
									additional content.</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">Last updated 3 mins ago</small>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card h-100">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting text below as a natural
									lead-in to additional content. This card has even longer content than the first to
									show that equal height action.</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">Last updated 3 mins ago</small>
							</div>
						</div>
					</div>
				</div> -->





				<h2>會員資料</h2>



				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
					class="bi bi-person-circle" viewBox="0 0 16 16">
					<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
					<path fill-rule="evenodd"
						d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
				</svg>

				<span class="badge rounded-pill bg-warning text-dark">一般會員</span>

				<p>
					<label>帳號: <input id="account-id" class=""></label>
				</p>
				<p>
					<label>密碼: <input id="password" class=""></label>
				</p>
				<p>
					<label>Mail: <input id="email" class=""></label>
				</p>
				<p style="display: none">
					<label>ID: <input id="id" class=""></label>
				</p>
				<p style="display: none">
					<label>CREATE DATE: <input id="create-date" class=""></label>
				</p>





				<button id="submit" class="btn btn-primary">儲存修改</button>

				<button id="delete" class="btn btn-danger">刪除帳號</button>


				<!-- <button id="add-pet" class="btn btn-success">新增寵物</button> -->



				<div id="add-pet">
					<input id="name-input" type="text" placeholder="memberPet名稱">
					<input id="type-input" type="text" placeholder="memberPet種類">
					<button id="add-button">添加memberPet</button>
				</div>


				<div id="pets" class="output"></div>



				<div class="orders-container d-flex flex-column justify-content-center align-items-center mt-5"
					id="orders-container"></div>


			</div>

			<!-- footer -->
			<jsp:include page="../../layout/footer.jsp"></jsp:include>
			<!-- footer -->


			<script src="https://code.jquery.com/jquery-3.6.3.js"
				integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

			<script>
				const datahome = document.getElementById("pets");
				const datahome2 = document.getElementById("span2");


				$(function () {
					getInfo();

					// 					let id = ""
					// 					console.log('document.cookie: ' + document.cookie); // id=3
					// 					getCookie();

					// 					// 取得COOKIE
					// 					function getCookie() {
					// 						let idStr = "" + document.cookie;
					// 						let idArr = idStr.split("=");  //["id","3"]
					// 						id = idArr[1];
					// 						console.log('id: ' + id);
					// 					}

					// ---------------------------  取得會員資料 + 取得會員寵物 OK  ---------------------------
					function getInfo() {

						$.ajax({
							// url: "/AnimalPlanet/getMemberByIdApi/" + id,
							url: "/AnimalPlanet/getMemberByIdApi/",
							type: "GET",
							contentType: 'application/json; charset=UTF-8',
							success: function (res) {
								console.log(res);

								// 取得會員資料
								$('#account-id').val(res.account);
								$('#password').val(res.password);
								$('#email').val(res.eMail);
								$('#id').val(res.uId);
								$('#create-date').val(res.createDate);

								// 取得會員寵物
								console.log(res.memberPet);
								memberPetHtmlMaker(res.memberPet);

							}
						})

					}

					function memberPetHtmlMaker(data) {
						console.log(data)
						// let span = document.getElementById('span')
						let htmlString = "";
						// let i = 0;
						for (let item of data) {
							// for (let i = 0; i < data.length; i++) {
							// htmlString += "<tr>"
							// htmlString += '<td class="align-middle "><input type="checkbox" data-productTypeId="' + item.uId + '" id="checkMul" style="width: 20px;height: 20px;" name="checkbox"></td>'  //多選框
							// htmlString += '<td class="">' + item.petName + '</td>'
							htmlString += '<fieldset> 寵物'
							htmlString += '寵物名稱：' + '<input id="pet1" class="" value="' + item.petName + '">'
							console.log(item.petName)
							htmlString += '寵物類型：' + '<input id="pet1" class="" value="' + item.type + '">'
							console.log(item.type)
							// htmlString += '<td class="align-middle">' + item.password + '</td>'
							// htmlString += '<td class="align-middle">' + item.role + '</td>'
							// htmlString += '<td class="align-middle">' + item.status + '</td>'
							// htmlString += '<td class="align-middle d-flex justify-content-between"><button class="btn btn-warning">檢視</button>'
							// htmlString += '<button class="editAjaxBtn btn btn-info" id="editAjaxBtn" data-bs-toggle="modal" data-bs-target="#productTypeEditCard" index="' + i + '" data-uId="' + item.uId + '">編輯</button>'
							htmlString += '<button class="PTdeleteBtn btn btn-danger" data-uId="' + item.pId + '"onclick="deleteAlert()">刪除</button></td>'
							// htmlString += "</tr>"

						}
						datahome.innerHTML = htmlString
					}

				})


				// ------------------------------------------- 按下"儲存修改" ------------------------------------------
				$("#submit").on("click", function () {
					console.log("subBtnActive");
					let account_id = $("#account-id").val();
					let password = $("#password").val();
					let email = $("#email").val();
					let id = $("#id").val();
					let create_time = $("#create-time").val();

					console.log(account_id);
					console.log(password);
					console.log(email);

					let url = "/AnimalPlanet/updateMemberInfoByAccountIdApi";
					let data = {
						'account': account_id,
						'password': password,
						'eMail': email,
						'uId': id,
						'createDate': create_time
					}

					let dataStr = JSON.stringify(data);

					console.log(url);
					console.log(dataStr);

					$.ajax({
						url: url,
						type: "POST",
						data: dataStr,
						dataType: 'json',
						contentType: 'application/json; charset=UTF-8',
						success: function (res) {
							console.log(res); //1or0
							// if res===0 ->fail(alert("shi by")) else -->success(alert())
							if (res === 0) {
								alert("更新失敗! 請重新操作")
							} else {
								alert("更新成功!")
							}

						}
					});

				})


				// // ------------------------------------------- 清除COOKIE ------------------------------------
				// function clearAllCookie() {
				// 	var keys = document.cookie.match(/[^ =;]+(?=\=)/g);
				// 	if (keys) {
				// 		for (var i = keys.length; i--;)
				// 			document.cookie = keys[i] + '=0;expires='
				// 				+ new Date(0).toUTCString()
				// 	}
				// }

				// ------------------------------------------- 登出 ----------------------------------------------
				function logout() {
					window.location.href = '${contextRoot}/logout';
				}

				// ------------------------------------------- 刪除帳號 ------------------------------------------
				$("#delete")
					.on(
						"click",
						function () {
							console.log("deleteBtnActive");
							let account_id = $("#account-id").val();
							let password = $("#password").val();
							let email = $("#email").val();
							let id = $("#id").val();
							let create_time = $("#create-date").val();

							let url = "/AnimalPlanet/deleteByAccountIdApi";
							let data = {
								'account': account_id,
								'password': password,
								'eMail': email,
								'uId': id,
								'createDate': create_time
							}
							let dataStr = JSON.stringify(data);

							console.log(url);
							console.log(dataStr);

							$
								.ajax({
									url: url,
									type: 'POST',
									data: dataStr,
									dataType: 'json',
									contentType: 'application/json; charset=UTF-8',
									success: function (res) {
										console.log(res); // 1or0
										// if res===0 ->fail(alert("shi by")) else -->success(alert())
										if (res === 0) {
											alert("更新失敗! 請重新操作")
										} else {
											alert("你已刪除帳號! 即將導轉回首頁...")
											logout();
											window.location.href = "http://localhost:8080/AnimalPlanet/";

										}
									}
								});

						})


				// ------------------------------------------- 新增寵物 ------------------------------------------
				$("#add-pet").on("click", function () {
					// alert("hi")
					addMemberPetHtmlMaker()
				})

				function addMemberPetHtmlMaker() {
					// console.log(data)
					let span = document.getElementById('span')
					let htmlString = "";
					// let i = 0;
					// for (let item of data) {
					// for (let i = 0; i < data.length; i++) {
					// htmlString += "<tr>"
					// htmlString += '<td class="align-middle "><input type="checkbox" data-productTypeId="' + item.uId + '" id="checkMul" style="width: 20px;height: 20px;" name="checkbox"></td>'  //多選框
					// htmlString += '<td class="">' + item.petName + '</td>'
					// htmlString += '<fieldset> 寵物'
					htmlString += '寵物名稱：' + '<input id="pet1" class="">'
					// console.log(item.petName)
					htmlString += '寵物類型：' + '<input id="pet1" class="" value="">'
					// console.log(item.type)
					// htmlString += '<td class="align-middle">' + item.password + '</td>'
					// htmlString += '<td class="align-middle">' + item.role + '</td>'
					// htmlString += '<td class="align-middle">' + item.status + '</td>'
					// htmlString += '<td class="align-middle d-flex justify-content-between"><button class="btn btn-warning">檢視</button>'
					// htmlString += '<button class="editAjaxBtn btn btn-info" id="editAjaxBtn" data-bs-toggle="modal" data-bs-target="#productTypeEditCard" index="' + i + '" data-uId="' + item.uId + '">編輯</button>'
					// htmlString += '<button class="PTdeleteBtn btn btn-danger" data-uId=""onclick="deleteAlert()">刪除</button></td>'
					// htmlString += "</tr>"

					// }
					datahome2.innerHTML = htmlString
				}









				// ----- 按下"送出新增寵物"

				$("#add-button").click(function () {
					let nameInput = $("#name-input");
					let typeInput = $("#type-input");
					let memberId = $("#id").val();

					let name = nameInput.val();
					let type = typeInput.val();

					let newMemberPet = {
						'petName': name,
						'type': type
					}

					$.ajax({
						url: '/AnimalPlanet/addMemberPetApi/' + memberId,
						type: 'POST',
						contentType: 'application/json',
						data: JSON.stringify(newMemberPet),
						success: function (data) {
							nameInput.val("");
							typeInput.val("");
							window.location.reload()
						},
						error: function (jqXHR, textStatus, errorThrown) {
							console.error(textStatus + ": " + errorThrown);
						}
					});
				});

				//  get Orders ////
				axios({
					url: 'http://localhost:8080/AnimalPlanet/mall/api/getOrderDTO',
					method: 'GET'
				})
					.then((res) => {
						console.log(res);
						// 取得訂單資訊
						const orders = res.data;
						const ordersContainer = document.getElementById('orders-container');
						// console.log(orders)
						// 渲染每筆訂單
						string = '';
						orders.forEach((order) => {
							if (order.orderStatus === 1) {
								order.orderStatus = `未付款`;
							} else if (order.orderStatus === 2) {
								order.orderStatus = `已付款`;
							} else if (order.orderStatus === 3) {
								order.orderStatus = `已出貨`;
							} else if (order.orderStatus === 4) {
								order.orderStatus = `已完成`;
							} {
								order.orderStatus.innerText = `訂單狀態：` + order.orderStatus + ``;
							}

							if (order.shipType === 1) {
								order.shipType = `宅配(常溫)`;
							} else {
								order.shipType.innerText = `配送方式：` + order.shipType + ``;
							}
							string += `<div class="mb-3 w-75" style="border: 4px solid #8fadc5;border-radius: 24px; background-color: #f7faff">`
							string += `<button class="btn w-100" type="button" data-bs-toggle="collapse" data-bs-target="#order-` + order.orderId + `">`
							string += `<div class="toggleT fs-3 fw-bold" style="color: #80a5c2">訂單編號：` + order.orderId + `<i class="downArrow fa-solid fa-sort-down"></i></div>`
							string += `<div class="collapse" id="order-` + order.orderId + `">`
							string += `<div class="order container py-3" >`
							string += `<div class="row justify-content-around text-start align-items-center" >`
							string += `<div class="order-id col-3 ">訂單編號：` + order.orderId + `</div>`;
							string += `<div class="order-status col-3" >訂單狀態：<span style="color: red;"><b>` + order.orderStatus + `</b></span></div>`
							string += `<div class="buy-time col-3">購買時間：` + order.buyTime + `</div>`
							string += `<div class="ship-type col-3">配送方式： ` + order.shipType + `</div>`
							string += `</div></div>`
							string += `<div class="receiver-info container py-3">`
							string += `<div class="row justify-content-around text-start align-items-center">`
							string += `<div class="col-3">收件人姓名：` + order.receiverName + `</div>`
							string += `<div class="col-3">收件人地址：` + order.receiverAddress + `</div>`
							string += `<div class="col-3">收件人電話：` + order.receiverTel + `</div>`
							string += `<div class="col-3">收件人信箱：` + order.receiverEmail + `</div>`
							string += `</div></div>`
							string += '<table class="product-list table table-bordered container">';
							string += '<thead><tr class="table-primary">';
							string += '<th>商品名稱</th>';
							string += '<th>原價</th>';
							string += '<th>售價</th>';
							string += '</tr></thead><tbody>';
							for (let i = 0; i < order.productName.length; i++) {
								var ntdProductPriceOrigin = '$' + Math.floor(order.productPriceOrigin[i]).toLocaleString('zh-TW');
								var ntdProductPriceSales = '$' + Math.floor(order.productPriceSales[i]).toLocaleString('zh-TW');
								string += '<tr>';
								string += '<td>' + order.productName[i] + '</td>';
								string += '<td>' + ntdProductPriceOrigin + '</td>';
								string += '<td>' + ntdProductPriceSales + '</td>';
								string += '</tr>';
							}
							string += '<tr>';
							string += '<td></td>';
							string += '<td class="text-end">運費：</td>';
							var ntdf = '$' + Math.floor(100).toLocaleString('zh-TW');
							string += '<td>' + ntdf + '</td>';
							string += '</tr>';
							string += '<tr>';
							string += '<td></td>';
							string += '<td class="text-end">總金額：</td>';
							var ntdTA = '$' + Math.floor(order.totalAmounts).toLocaleString('zh-TW');
							string += '<td class="table-success" style="color: red"><b>' + ntdTA + '</b></td>';
							string += '</tr>';
							string += '</tbody></table>';
							string += `</div></div></button>`
						});
						ordersContainer.innerHTML = string;
					})
					.catch((err) => {
						console.log(err)
					})

			</script>

			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
				integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
				crossorigin="anonymous"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
				integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
				crossorigin="anonymous"></script>



		</body>

		</html>