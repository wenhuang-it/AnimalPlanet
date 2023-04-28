<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>登入</title>
    <style>
    
        #container{
            text-align: center;
            justify-content: center;
        } */

        #fail{
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
    <h2>登入失敗</h2>


</div>

	<!-- footer -->
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
	<!-- footer -->


<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<script>
//     $(function () {

//         $("#submit").on("click", function () {
//             let id = $("#id").val();
//             let pw = $("#password").val();
//             console.log(id);
//             console.log(pw);

//             //let url = `/Midterm/loginApi?id=`+id +`&password=`+pw;
//             let url = "/AnimalPlanet/loginApi";

//             // JSON object  // 一定要有("key":value, ...) // x設定型別
//             let data =
//                 {
//                     'id': id,
//                     'password': pw
//                 }
//             let dataStr = JSON.stringify(data);
            
//             console.log(url);
//             console.log(dataStr);

            
//             $.ajax({
//                 url: url,
//                 type: "POST",
//                 data: dataStr,
//                 dataType: 'json',
//                 contentType: 'application/json; charset=UTF-8',
//                 success: function (res) {
//                     console.log(res);
//                     console.log(res.uId);
//                     if (res.uId === 0) {
//                         //login failed
//                         //
//                         console.log("登入失敗")
//                         document.cookie = 'id=' + res.uId;
//                         $("#fail").show();
//                         $("#id").val("");
//                         $("#password").val("");
//                         window.setInterval((() =>
//                             $("#fail").hide()
//                         ), 4000);
//                     }else{
//                         document.cookie = 'id=' + res.uId;
//                         console.log("登入成功")
//                         console.log(document.cookie);
//                         window.location.replace("http://localhost:8080/AnimalPlanet/member/memberInfoPage");
//                     }

//                 }
//             });

//         })

//     })


</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>



</body>
</html>
