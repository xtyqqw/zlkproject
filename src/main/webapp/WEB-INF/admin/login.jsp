<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: l
  Date: 2019/11/20
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="<%=request.getContextPath()%>/css/base.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
</head>
<body>
<script type="text/javascript">
    window.onload = function () {
        if (window.parent.window != window) {
            window.top.location = "<%=request.getContextPath()%>/loginController/toLogin";
        }
    }
</script>
<div class="login">
    <form action="<%=request.getContextPath()%>/loginController/login" method="post" id="form">
        <div class="logo"></div>
        <div class="login_form">
            <div class="user">
                <input class="text_value" value="" placeholder="请输入用户名" required name="adminName" type="text" id="username">
                <input class="text_value" value="" placeholder="请输入密码" required name="adminPassword" type="password" id="password">
            </div>
            <button class="button" id="submit" type="submit">登录</button>
        </div>

        <div id="tip"></div>
    </form>
</div>
<input type="hidden" value="${error}" id="msg">
<script>
    layui.use(['layer'], function () {
        <c:if test="${flag}">
        $(function () {
            layer.alert($("#msg").val());
        })
        </c:if>
    })
</script>
</body>
</html>