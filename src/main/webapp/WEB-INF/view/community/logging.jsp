<%--
  Created by IntelliJ IDEA.
  User: gby
  Date: 2019/12/17
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<% if (session.getAttribute("user") == null) {%>
<h1 style="margin-left: 300px;margin-top: 200px;margin-bottom: 20px">您还没有登录！</h1>
<p style="margin-left: 300px">
    请点击
    <button style="color: #007bff">
        <a href="<%=request.getContextPath()%>/question/test" target="_blank" style="color: red">
            按钮
        </a>
    </button>
    前往登录页面
</p>
<%
        response.setHeader("refresh", "3;URL=");
        return;
    }
%>
<body>

</body>
</html>
