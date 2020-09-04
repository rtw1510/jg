<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/28
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/page.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript">
       $(function () {
            $("#btn").click(function () {
                var username = $("#username").val()
                var password = $("#password").val()
                var tigmsg = $("#msg")
                if (username && password){
                    $.ajax({
                        data:{
                            username:username,
                            password:password
                        },
                        type:"post",
                        url:"user/login",
                        dataType:"json",
                        success:function (data) {
                            // var tigmsg = $("#msg")
                            // alert(data)
                            if (data.login){
                                tigmsg.html("")
                                window.location.href="user/index";
                            }else {
                                tigmsg.html("<font style='color: red'>用户名或密码错误！</font>")
                            }
                        }
                    })
                }else{
                    tigmsg.html("<font style='color: red'>请输入正确账号！</font>")
                }

            })
       })
    </script>
</head>
<body>
    <div id="all">
        <div id="form">
            <div id="form-login">
                用户名：<br>
                <input type="text" id="username" name="username"/><br>
                密&nbsp;&nbsp;&nbsp;码：<br>
                <input type="password" id="password" name="password"/><br>
                <span id="msg"></span>
            </div>
                <input type="button" id="btn"/>
        </div>
    </div>
</body>
</html>
