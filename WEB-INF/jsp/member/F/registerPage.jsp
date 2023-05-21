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

            <div id="alert" style="display:none" class="alert alert-primary" role="alert">
                <h4>太好了！只需要驗證您的E-Mail... </h4>
                <p>我們已將驗證連結傳送至您的Email信箱，驗證成功後即可開始使用會員專屬服務！</p>
            </div>



            <div id="container">
                <h2>會員註冊</h2>
                <p><label><input id="account-id" class="form-control" placeholder="帳號" autocomplete="off"></label></p>
                <p><label><input type="password" id="password" class="form-control" placeholder="密碼" autocomplete="off"></label></p>
                <p><label><input id="email" class="form-control" placeholder="E-Mail" autocomplete="off"></label></p>


                <button id="submit" class="btn btn-primary">送出</button>
                <br>
                <br>
                <br>
                <br>
                <br>
                <button id="formember" class="btn btn-outline-secondary">member</button>
                
            </div>




            <!-- footer -->
            <jsp:include page="../../layout/footer.jsp"></jsp:include>
            <!-- footer -->


            <script src="https://code.jquery.com/jquery-3.6.3.js"
                integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

            <script>
                // member賦值
                const formember = document.getElementById('formember')
                const aid = document.getElementById('account-id')
                const pas = document.getElementById('password')
                const ema = document.getElementById('email')


                formember.addEventListener('click', e => {
                    aid.value = 'member123';
                    pas.value = '123456';
                    ema.value = 'eeit57ap777@gmail.com';
                })

                /////////////////////////////////////////////////////////////////


                $(function () {

                    $("#submit").on("click", function () {
                        let account_id = $("#account-id").val();
                        let password = $("#password").val();
                        let email = $("#email").val();


                        console.log(account_id);
                        console.log(password);
                        console.log(email);




                        let data =
                        {
                            'account': account_id,
                            'password': password,
                            'eMail': email,
                        }

                        let dataStr = JSON.stringify(data);
                        console.log(dataStr);

                        $.ajax({
                            url: "/AnimalPlanet/registerApi",
                            type: "POST",
                            data: dataStr, //物件字串(json)
                            dataType: 'json',
                            contentType: 'application/json; charset=UTF-8',
                            success: function (res) {
                                console.log(res);
                                $("#alert").show()
                                setTimeout(function () { window.location.href = "${contextRoot}/"; }, 4500);
                            },
                            error: function () {
                                alert("系統錯誤，請聯絡系統管理員");
                            }
                        });

                    })

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
