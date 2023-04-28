<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<html>

		<head>
			<title>登入</title>
			<style>
				/* *{
            margin: 0;
            padding: 0;
        }

        html{
            background: beige;
        }

        #title{
            font-family: initial;
            color: #0D47A1;
            font-size: 20px;
            display: inline-block;
        }*/
				#container {
					text-align: center;
					justify-content: center;
				}

				* / #fail {
					color: red;
					font-size: 30px;
				}
			</style>
		</head>

		<body>
			<!-- navbar -->
			<jsp:include page="../../layout/navbar.jsp"></jsp:include>
			<!-- navbar -->


			<div id="container">
				<h2>修改會員資料</h2>

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


				<button id="submit" class="submit">送出</button>

				<button id="delete" class="" style="color: red">刪除帳號</button>



				<%-- <div id="fail" style="display:none">登入失敗
			</div>--%>
			</div>

			<!-- footer -->
			<jsp:include page="../../layout/footer.jsp"></jsp:include>
			<!-- footer -->


			<script src="https://code.jquery.com/jquery-3.6.3.js"
				integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

			<script>
				$(function () {


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
							}
						})
					
				})


				// ------------------------------------------- 按下"送出" -------------------------------------------
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
				
			    // ------------------------------------------- 登出 ------------------------------------
				function logout(){
					 window.location.href = '${contextRoot}/logout'; 			
				}


									}
								});

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