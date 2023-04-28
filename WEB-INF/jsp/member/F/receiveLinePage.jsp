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

                */ #fail {
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
                <h2>Receive LINE Code Page</h2>
                <!-- <p>
                    <label>Code: <input id="code" class=""></label>
                </p>
                <p>
                    <label>State: <input id="state" class=""></label>
                </p> -->

                <hr>

                <!-- <p>
                    <label>ID-Token: <input id="idToken" class=""></label>
                </p> -->
                <p>
                    <label>Name: <input id="name" class=""></label>
                </p>
                <p>
                    <label>Email: <input id="email" class=""></label>
                </p>




                <!-- footer -->
                <jsp:include page="../../layout/footer.jsp"></jsp:include>
                <!-- footer -->


                <script src="https://code.jquery.com/jquery-3.6.3.js"
                    integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>


                <!-- ------------------------- 解碼 base64 UTF-8 --------------------------  -->
                <script src="https://cdn.jsdelivr.net/npm/js-base64@3.7.5/base64.min.js"></script>


                <script>


                    //------------ 取Code --> 取ID-Token --> 解碼 --> 取name, email  -----------------------


                    //------------------------------- 先取CODE -------------------------------

                    //先取得網址字串，假設此頁網址為「index.aspx?id=U001&name=GQSM」
                    var url = location.href;

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
                        var code = ary3[1];
                    }

                    console.log('code: ' + code)





                    // ----------------------  取ID-Token ------------------------------------
                    let ID_Token = "";


                    let data = {
                        'grant_type': 'authorization_code',
                        'code': code,
                        'redirect_uri': 'http://localhost:8080/AnimalPlanet/member/receiveLinePage',
                        'client_id': '1657926140',
                        'client_secret': '4c0f068a31860ca2291498d67b0fab7c'
                    }

                    // let dataStr = JSON.stringify(data);
                    $.ajax({
                        url: "https://api.line.me/oauth2/v2.1/token",
                        type: "POST",
                        data: data,
                        // dataType: 'json',
                        contentType: 'application/x-www-form-urlencoded',
                        async: false,
                        success: function (res) {
                            console.log(res);
                            console.log(res.id_token);

                            ID_Token = res.id_token;
                            console.log(ID_Token);


                            $('#idToken').val(ID_Token);


                            if (res === 0) {
                                alert("取Token失敗! 請重新操作")
                            } else {
                                alert("取Token成功!")
                            }

                        }
                    });

                    // console.log('ID_TOken: ' + ID_Token);


                    // ---------------------------------------------- 解析id_token -------------------------------

                    let testToken = ID_Token


                    // ---------------------- ASCII ---------------------

                    // var json = window.atob(testToken.split(".")[1]);

                    // // var json = window.decodeURIComponent(window.atob(testToken.split(".")[1]))

                    // console.log(JSON.parse(json));
                    // console.log(JSON.parse(json).email);
                    // console.log(window.decodeURIComponent(JSON.parse(json).name));



                    // console.log(window.btoa(window.encodeURIComponent('嘻嘻哈哈哈哈啦啦啦啦')))
                    // console.log(window.decodeURIComponent(window.atob('JUU1JTk4JUJCJUU1JTk4JUJCJUU1JTkzJTg4JUU1JTkzJTg4JUU1JTkzJTg4JUU1JTkzJTg4JUU1JTk1JUE2JUU1JTk1JUE2JUU1JTk1JUE2JUU1JTk1JUE2')))

                    // // ---------------------- UTF8 ---------------------

                    // let base64UTF8DecodedString = Base64.decode(testToken);
                    let base64UTF8DecodedString = JSON.parse(Base64.decode(testToken.split(".")[1]))
                    console.log(base64UTF8DecodedString);

                    console.log(base64UTF8DecodedString.name);
                    console.log(base64UTF8DecodedString.email);

                    $('#name').val(base64UTF8DecodedString.name);
                    $('#email').val(base64UTF8DecodedString.email);


                    // ---------------------------------- 傳到後端 => 存進DB + 開通  -------------------------------

                    let data2 =
                    {
                        'account': base64UTF8DecodedString.name,
                        // 'password': password,
                        'eMail': base64UTF8DecodedString.email,
                    }

                    let dataStr2 = JSON.stringify(data2);
                    console.log(dataStr2);

                    $.ajax({
                        url: "/AnimalPlanet/lineRegisterApi",
                        type: "POST",
                        data: dataStr2, //物件字串(json)
                        dataType: 'json',
                        contentType: 'application/json; charset=UTF-8',
                        success: function (res) {
                            console.log(res);
                            alert("帳號已新增! 即將導轉回首頁，請登入後使用網頁服務")
                            window.location.href = "${contextRoot}/";
                        },
                        error: function () {
                            alert("系統錯誤，請聯絡系統管理員");
                        }
                    });
























                </script>

                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
                    integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
                    crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
                    integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
                    crossorigin="anonymous"></script>



        </body>

        </html>