<%--
  Created by IntelliJ IDEA.
  User: l
  Date: 2019/9/11
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登陆页面</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            if (window.parent.window != window) {
                window.top.location = "<%=request.getContextPath()%>/loginController/toLogin";
            }
        }
        $(function () {
            $("#imgCode").click(function () {
                var time = new Date().getTime();
                $("#imgCode").attr("src", "<%=request.getContextPath()%>/checkCodeServlet?time" + time)
            });
        });
    </script>
    <style type="text/css">
        body {
            background-color: #D9D9D9;
        }

        .top {
            margin: 0px auto;
            height: 120px;
            background-color: #01AAED;
        }

        .top p {
            text-align: center;
            position: relative;
            font-size: 30px;
            top: 40px;
        }

        .login {
            text-align: center;
            height: 300px;
            width: 300px;
            margin-left: 40%;
            margin-top: 30px;
            background-color: #C9C5C5;
        }

        /*.login span{
            position: relative;
            top: 1px;
        }*/
        .input {
            margin-top: 20px;
            width: 170px;
            height: 30px;
        }

        .check {
            width: 90px;
        }

        #imgCode {
            position: relative;
            height: 30px;
            width: 80px;
        }

        .submit {
            margin-top: 20px;
            background-color: #007DDB;
            height: 35px;
            width: 60px;
        }

        #error {
            color: red;
        }
    </style>
</head>
<body>
<div class="top">
    <p>管理系统</p>
</div>
<div class="login">
    <i class="layui-icon layui-icon-user loginImg"/><span>    登陆</span><br>
    <form action="<%=request.getContextPath()%>/loginController/login" method="post">
        <i class="layui-icon layui-icon-rate-solid loginImg"></i>
        <input type="text" name="adminName" placeholder="请输入用户名" required class="input"><br>
        <i class="layui-icon layui-icon-password loginImg"></i>
        <input type="password" name="adminPassword" placeholder="请输入密码" required class="input"><br>
        <i class="layui-icon layui-icon-vercode loginImg"></i>
        <input type="text" name="code" placeholder="请输入验证码" required class="input check">
        <img id="imgCode" src="<%=request.getContextPath()%>/checkCodeServlet"><br>
        <input type="submit" value="登  陆" class="submit">
    </form>
    <span id="error">${error}</span>
</div>
</body>
</html>
