<%--
  Created by IntelliJ IDEA.
  User: 上官螃蟹
  Date: 2019/11/18
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
</head>
<body>
<div>
    <input type="hidden" value="${error}" id="msg">

</div>
<script>
    layui.use(['layer'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        <c:if test="${flag}">
        $(function () {
            layer.alert($("#msg").val());
        })
        </c:if>
    })
</script>
</body>
</html>
