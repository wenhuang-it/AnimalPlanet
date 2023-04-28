<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<html>

		<head>
			<title>登入</title>
			<style>

				#container {
					text-align: center;
					justify-content: center;
				}

			</style>
		</head>

		<body>
			<!-- navbar -->
			<jsp:include page="../../layout/navbar.jsp"></jsp:include>
			<!-- navbar -->


			<div id="container">
				<h2></h2>

			</div>

			<!-- footer -->
			<jsp:include page="../../layout/footer.jsp"></jsp:include>
			<!-- footer -->


			<script src="https://code.jquery.com/jquery-3.6.3.js"
				integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

			<script>

				//先取得網址字串，假設此頁網址為「index.aspx?id=U001&name=GQSM」
				var url = location.href;
				console.log(url);

				//再來用去尋找網址列中是否有資料傳遞(QueryString)
				if (url.indexOf('?') != -1) {
					//之後去分割字串把分割後的字串放進陣列中
					var ary1 = url.split('?');
					//此時ary1裡的內容為：
					//ary1[0] = 'index.aspx'，ary2[1] = 'id=U001&name=GQSM'

					//下一步把後方傳遞的每組資料各自分割
					var ary2 = ary1[1].split('&');
					//此時ary2裡的內容為：
					//ary2[0] = 'id=U001'，ary2[1] = 'name=GQSM'

					//最後如果我們要找id的資料就直接取ary[0]下手，name的話就是ary[1]
					var ary3 = ary2[0].split('=');
					//此時ary3裡的內容為：
					//ary3[0] = 'id'，ary3[1] = 'U001'

					//取得id值
					var id = ary3[1];
					
				}

				console.log('id: ' + id);




					$.ajax({
						url: '/AnimalPlanet/member/emailAuthApi/' + id,
						type: 'POST',
						contentType: 'application/json; charset=UTF-8',
						success: function (res) {
							console.log(res);
							console.log("成功!!");
							alert("您EMAIL已驗證，您已啟用帳號！登入後則可使用會員服務")
							window.location.href="${contextRoot}/login";

						}
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