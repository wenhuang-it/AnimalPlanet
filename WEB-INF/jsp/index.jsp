<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>AnimalPlanet</title>



			<link rel="stylesheet" href="${contextRoot}/css/index.css">
			<style>
				.outterDiv {
					height: 600px;
				}

				#chatbox {
					position: fixed;
					bottom: 20px;
					right: 20px;
					width: 400px;
					/* 改為更寬的寬度 */
					height: 500px;
					/* 改為更高的高度 */
					background-color: #fff;
					border: 1px solid #ccc;
					border-radius: 5px;
					overflow: hidden;
				}

				#chatlogs {
					height: 100%;
					/* 修改高度以符合新的對話框高度 */
					overflow-y: scroll;
					padding-bottom: 110px;
				}



				/* 調整滾輪高度 */
				::-webkit-scrollbar {
					width: 10px;
				}

				/* 滾輪樣式 */
				::-webkit-scrollbar-thumb {
					background-color: #ccc;
					border-radius: 10px;
				}

				/* 滾輪軌道樣式 */
				::-webkit-scrollbar-track {
					background-color: #fff;
					border-radius: 10px;
				}


				#chat-form {
					position: absolute;
					/* 設置為絕對定位 */
					bottom: 0;
					/* 將 bottom 設置為 0，固定在底部 */
					width: 100%;
					padding: 10px;
					background-color: #f0f0f0;
					box-sizing: border-box;
				}

				#chat-form .chat-form-buttons {
					display: flex;
					margin-bottom: 10px;
				}


				#chat-form input[type="text"] {
					width: 80%;
					padding: 5px;
					margin-right: 5px;
					border: 1px solid #ccc;
				}

				#chat-form button[type="button"]:hover {
					background-color: #3e8e41;
				}

				#chat-form .chat-form-buttons button {
					border-radius: 5px;
					margin-right: 3px;
					padding: 5px 10px;
					background-color: #4CAF50;
					color: #fff;
					border: none;
					cursor: pointer;
				}

				#chat-input {
					flex: 1;
					padding: 5px;
					border: 1px solid #ccc;
					border-radius: 5px;
					margin-right: 10px;

				}


				#send-btn {
					background-color: #4CAF50;
					color: #fff;
					border: none;
					border-radius: 5px;
					padding: 5px 10px;
					cursor: pointer;
				}

				#chat-header {
					display: flex;
					align-items: center;
					justify-content: space-between;
					padding: 10px;
					background-color: #eee;
				}

				#chat-header h3 {
					margin: 0;
					font-size: 20px;
				}


				#close-btn {
					font-size: 20px;
					color: black;
					background-color: transparent;
					border: none;
					padding: 0;
					margin: 0;
					cursor: pointer;
				}

				#close-btn::before {
					content: "\00D7";
				}

				#chatbox-toggle-btn {
					background-color: #0073FF;
					color: #fff;
					border-radius: 5px;
					border: none;
					padding: 10px 20px;
					font-size: 16px;
					cursor: pointer;
					transition: background-color 0.3s ease;
					font-family: '微軟正黑體', serif;
					font-weight: 700;
					letter-spacing: 1px;
				}

				#chatbox-toggle-btn:hover {
					background-color: #0077A3;
				}
			</style>
		</head>

		<body>
			<!-- navbar -->
			<jsp:include page="layout/navbar.jsp"></jsp:include>
			<!-- navbar -->

			<!-- 輪播圖 -->
			<div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
						aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
						aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
						aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="3000">
						<a
							href="http://localhost:8080/AnimalPlanet/mall/shoppingMallIndex?n=%E8%87%AA%E7%84%B6%E4%B8%BB%E7%BE%A9"><img
								src="http://localhost:8080/AnimalPlanet/index/id?id=12"
								class="coverimg d-block w-100 img-fluid"></a>
					</div>
					<div class="carousel-item" data-bs-interval="3000">
						<a href="http://localhost:8080/AnimalPlanet/mall/shoppingMallIndex?n=%E6%B8%B4%E6%9C%9B"><img
								src="http://localhost:8080/AnimalPlanet/index/id?id=14"
								class="coverimg d-block w-100 img-fluid"></a>
					</div>
					<div class="carousel-item" data-bs-interval="3000">
						<a href="http://localhost:8080/AnimalPlanet/mall/shoppingMallIndex?n=%E6%B8%B4%E6%9C%9B"><img
								src="http://localhost:8080/AnimalPlanet/index/id?id=13"
								class="coverimg d-block w-100 img-fluid"></a>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>

			<input id="role" type="hidden" />

			<div class="container">

				<div class="row">

					<div class="cc col" id="cc1"><a href="${contextRoot}/mall/shoppingMallIndex"><img
								src="http://localhost:8080/AnimalPlanet/index/id?id=15" class="menuPic"></a></div>
					<div class="cc col" id="cc2"><a href="${contextRoot}/forum/ForumCategoryIndex"><img
								src="http://localhost:8080/AnimalPlanet/index/id?id=2" class="menuPic"></a></div>
					<div class="cc col" id="cc3"><a href="${contextRoot}/hotel/home"><img
								src="http://localhost:8080/AnimalPlanet/index/id?id=4" class="menuPic"></a></div>
					<div class="cc col" id="cc4"><a href="${contextRoot}/AdoptionHome"><img
								src="http://localhost:8080/AnimalPlanet/index/id?id=1" class="menuPic"></a></div>
				</div>

				<div class="row row2">
					<div class="col-8 d-flex justify-content-center">
						<img src="http://localhost:8080/AnimalPlanet/index/id?id=6" class="instead" width="90%"
							height="90%">
					</div>
					<div class="ado col-4">
						<img src="http://localhost:8080/AnimalPlanet/index/id?id=5" class="housePicOuter" width="100%">
						<a href="http://localhost:8080/AnimalPlanet/AdoptionHome/View?id=8"><img
								src="/AnimalPlanet/Adoptionphoto/id?adoptionPhotoId=14" class="housePicInter"
								width="100%"></a>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col d-flex justify-content-center">
						<img src="http://localhost:8080/AnimalPlanet/index/id?id=3" class="hot" width="60%">
					</div>
				</div>
				<div class="row pRow">
					<div class="col product1">
						<a href="http://localhost:8080/AnimalPlanet/mall/product/productIndividual?p=9"><img
								src="http://localhost:8080/AnimalPlanet/index/id?id=8" class="pdt" width="100%" id="p1"
								alt="【養貓變養兔】主子的兔年裝飾"></a>
					</div>
					<div class="col product2">
						<a href="http://localhost:8080/AnimalPlanet/mall/product/productIndividual?p=10"><img
								src="http://localhost:8080/AnimalPlanet/index/id?id=9" class="pdt" width="100%" id="p2"
								alt="【乾杯疊疊貓】 疊疊貓杯家族"></a>
					</div>
					<div class="col product3">
						<a href="http://localhost:8080/AnimalPlanet/mall/product/productIndividual?p=11"><img
								src="http://localhost:8080/AnimalPlanet/index/id?id=10" class="pdt" width="100%" id="p3"
								alt="【拍拍這隻小喵喵】萌貓拍拍燈"></a>
					</div>
					<div class="col product4">
						<img src="http://localhost:8080/AnimalPlanet/index/id?id=11" class="pdt" width="100%" id="p4"
							alt="法國皇家-愛犬處方LP18W犬泌尿道配方濕糧 100g">
					</div>
				</div>
				<div class="connectCCC d-flex flex-column">
					<button class="connectCCBTN" id="chatbox-toggle-btn"><img
							src="http://localhost:8080/AnimalPlanet/index/id?id=17" width="72px" alt="聯繫客服"></button>
				</div>
				<div id="chatbox" style="display: none">
					<div id="chat-header">
						<h3>客服對話框</h3>
						<button type="button" id="close-btn"></button>
					</div>
					<div id="chatlogs"></div>
					<div id="chat-form">
						<!-- <div class="chat-form-buttons">
					<button type="button" id="add-image-btn">圖片</button>
					<button type="button" id="rate-btn">評分</button>
				</div> -->
						<input type="text" id="chat-input" placeholder="輸入訊息...">
						<button type="button" id="send-btn">發送</button>
					</div>
				</div>
			</div>

			<input id="role" type="hidden" />

			<!-- footer -->
			<jsp:include page="layout/footer.jsp"></jsp:include>
			<!-- footer -->



			<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
				crossorigin="anonymous"></script>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
				crossorigin="anonymous">

			<script src="https://code.jquery.com/jquery-3.6.3.min.js"
				integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script> -->

			<script src="https://code.jquery.com/jquery-3.6.3.js"
				integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
			<script src="${contextRoot}/js/index.js"></script>


			<script>
				const chatLogs = document.getElementById('chatlogs');
				const chatInput = document.getElementById('chat-input');
				const sendBtn = document.getElementById('send-btn');
				const chatbox = document.getElementById('chatbox');
				const closeBtn = document.getElementById('close-btn');

				let socket;

				function initWebSocket() {
					socket = new WebSocket("ws://localhost:8080/AnimalPlanet/chatbox");
					console.log(socket);
					// 連接成功時的回調函數
					socket.onopen = function () {
						console.log("WebSocket 連接成功！");
						//connect(); // 连接成功时初始化 stompClient 对象

						socket.send(JSON.stringify({
							"sender": cu_acct,
							"content": "已登錄",

						}));

					};

					// 收到訊息時的回調函數
					socket.onmessage = function (event) {
						let message = event.data;
						let data = JSON.parse(message);
						// console.log(data)
						let haveShow = false;
						//是自己的訊息
						if (data.sender == cu_acct) {
							haveShow = true;
						}
						if ($("#role").val() == 2 && data.senderRole == 1) {
							haveShow = true;
						}
						if ($("#role").val() == 1 && data.senderRole == 2) {
							haveShow = true;
						}
						if (haveShow) {
							let showtext = data.sender + "說:" + data.content;
							let d = new Date(Date.now())
							//再透過 Date.toTimeString() 取得時間字串
							datetext = d.getHours() + ":" + d.getMinutes();
							let main = document.createElement("div");

							let sub_message = document.createElement("div");
							//創建一個 span 元素，用於顯示訊息內容。
							let messageElement = document.createElement("span");
							//創建一個 span 元素，用於顯示訊息時間
							let timeElement = document.createElement("span");
							//如果 content.sender 不等於 cu_acct，則設定文字對齊方式為左對齊，否則為右對齊。
							main.style.cssText +=
								'width:auto; padding:5px 3px;margin:3px 0px;' + (data
									.sender != cu_acct ? "text-align: left;" : "text-align: right;");

							sub_message.style.cssText +=
								'width:auto;display:inline;' + (data.sender !=
									cu_acct ? "background-color:rgba(150,196,255,0.2);" :
									"background-color:rgba(150,196,255,1);") +
								'border-radius:0.2em;boder:1px solid #eee;padding:5px 3px;margin:3px 0px;';
							timeElement.style.cssText +=
								'color:grey;font-size:10px;margin-right:5px;';
							main.append(sub_message);
							sub_message.appendChild(timeElement);
							sub_message.appendChild(messageElement);
							messageElement.textContent = showtext; // 使用 textContent 設定訊息
							timeElement.textContent = datetext;
							chatLogs.appendChild(main);
							scrollToBottom();

							//  console.log(messageElement);
						}

					};

					// 連接關閉時的回調函數
					socket.onclose = function (event) {
						console.log("WebSocket 連接關閉！錯誤碼：" + event.code);
					};

					// 連接出錯時的回調函數
					socket.onerror = function (event) {
						console.log("WebSocket 連接出錯！");
					};
				}


				function sendMessage() {
					const message = chatInput.value.trim();
					// alert(cu_acct);
					//console.log(JSON.stringify({"sender":cu_acct, "content":message}));
					if (message !== '') {
						socket.send(JSON.stringify({
							"sender": cu_acct,
							"content": message,

						}));
					}
					document.getElementById("chat-input").value = "";
				}

				// 點擊發送按鈕時發送訊息
				sendBtn.addEventListener('click', sendMessage);

				// 按下 Enter 鍵時發送訊息
				chatInput.addEventListener('keypress', function (e) {
					if (e.key === 'Enter') {
						sendMessage();
					}
				});

				closeBtn.addEventListener('click', function () {
					chatbox.style.display = 'none';
					socket.send(JSON.stringify({
						"sender": cu_acct,
						"content": "已離開",
					}));
					socket.close();
				});



				function scrollToBottom() {
					chatlogs.scrollTop = chatlogs.scrollHeight;
				}

				const chatboxToggleBtn = document.getElementById('chatbox-toggle-btn');


				chatboxToggleBtn.addEventListener('click', function () {

					const chatbox = document.getElementById('chatbox');
					if (chatbox.style.display === 'none') {
						chatbox.style.display = 'block';
						scrollToBottom();
						if (!socket || socket.readyState !== WebSocket.OPEN) {
							initWebSocket();
						}
					} else {
						chatbox.style.display = 'none';
						if (socket && socket.readyState === WebSocket.OPEN) {
							socket.close();
						}
					}


				});


				$.ajax({
					url: "${contextRoot}/getcustomerrole", // 請求的URL
					method: "GET", // 請求的方法
					// 請求時需要傳送的數據
					success: function (response) {
						// 請求成功時的回調函數
						let id = response; // 取得回傳的INT值
						// 把值設定到ID中
						$("#role").val(id);

						if (id != 2) {
							chatboxToggleBtn.style.display = "none";

						}

					},
					error: function (xhr, textStatus, errorThrown) {
						// 請求失敗時的回調函數
						console.log(errorThrown);
					}
				});




				var cu_acct = "";
				//顯示對話紀錄
				$(function () {

					$.ajax({
						url: '${contextRoot}/getcustomermember',
						method: 'GET',

						success: function (res) {
							cu_acct = res;
							$.ajax({
								url: '${contextRoot}/dialogue/findacou',
								method: 'POST',
								data: {
									"account": cu_acct
								},
								success: function (res) {
									console.log(res);
									//依序處理回傳資料陣列 res 的每個元素
									for (let i = 0; i < res.length; i++) {
										//取得 res 中每個元素的 dialogueTime 欄位，透過 Date.parse() 方法解析為時間格式
										let d = new Date(Date.parse(res[i].dialogueTime));
										//再透過 Date.toTimeString() 取得時間字串
										datetext = d.toTimeString();
										//透過字串分割與取字串的方式將時間字串轉換為格式為 HH:mm 的時間格式。
										datetext = datetext.split(' ')[0].substring(0, 5);
										//console.log(datetext);
										//取得 res 中每個元素的 dialogueContent 欄位，使用 JSON.parse() 方法將其轉換為 JavaScript 物件格式。
										let content = JSON.parse(res[i].dialogueContent);




										let main = document.createElement("div");


										let sub_message = document.createElement("div");

										//創建一個 span 元素，用於顯示訊息內容。
										let messageElement = document.createElement("span");
										//如果 content.sender 不等於 cu_acct，則設定文字對齊方式為左對齊，否則為右對齊。
										main.style.cssText +=
											'width:auto; padding:5px 3px;margin:3px 0px;' + (content
												.sender != cu_acct ? "text-align: left;" :
												"text-align: right;");

										sub_message.style.cssText +=
											'width:auto;display:inline;' + (content.sender !=
												cu_acct ? "background-color:rgba(150,196,255,0.2);" :
												"background-color:rgba(150,196,255,1);") +
											'border-radius:0.2em;boder:1px solid #eee;padding:5px 3px;margin:3px 0px;';
										//創建一個 span 元素，用於顯示訊息時間
										let timeElement = document.createElement("span");

										timeElement.style.cssText +=
											'color:grey;font-size:10px;margin-right:5px;';
										main.append(sub_message);
										sub_message.appendChild(timeElement);
										sub_message.appendChild(messageElement);
										messageElement.textContent = content.sender + "說:" + content
											.content; // 使用 textContent 設定訊息
										timeElement.textContent = datetext;
										chatLogs.appendChild(main);
										//console.log(typeof(Date.parse(res[i].dialogueTime)));
										// console.log(JSON.parse(res[i].dialogueContent));

									}

								},
								error: function (err) {
									console.log(err)
								},
							});
						},
						error: function (err) {
							console.log(err)
						},
					});


					let id = "";
					console.log("已登入id :" + id);
					console.log("document.cookie: " + document.cookie);

					if (id !== "") {
						$('#info-navi').show();
						$('#login-navi').html(
							`<a class="nav-link" href="" id="logoutBtn">登出</a>`);
						// 沒id
					} else {
						$('#info-navi').hide();
						$('#login-navi')
							.html(
								`<a class="nav-link" href="${contextRoot}/login">會員登入</a>`);
					}

					$(document)
						.on(
							"click",
							"#logoutBtn",
							function () {
								$('#info-navi').hide();
								$('#login-navi')
									.html(
										`<a class="nav-link" href="${contextRoot}/member/loginPage">Login</a>`);
								clearAllCookie();
								window.location.reload();
							});
				})
			</script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
				integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
				crossorigin="anonymous">
				</script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
				integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
				crossorigin="anonymous">
				</script>


		</body>

		</html>