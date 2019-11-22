<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/11/22
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css">
    <script src="<%=request.getContextPath() %>/layui/layui.js"></script>
    <style>
        .main {
            position: relative;
            margin: auto;
        }
        .all {
            position: absolute;
            z-index: 0;
        }
        .show {
            width: 500px;
            height: 40px;
            padding: 10px;
            background-color: #8D8D8D;
        }
        .hide {
            margin-left: 40px;
            margin-top: 20px;
        }
        .show:hover {
            z-index: 1;
        }
        a {

        }
    </style>
</head>
<body>
    <div class="main">
        <div class="show all">
            <a href="<%=request.getContextPath() %>/" type="button" class="layui-btn layui-btn-sm">全部1</a>
            <c:forEach items="${data}" var="tag" begin="0" end="10">
                <div>
                    <ul>
                        <li><c:out value="${tag}"><a href="<%=request.getContextPath() %>/" type="button" class="layui-btn layui-btn-sm"></a></c:out></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
        <div class="hide all">
            <a href="<%=request.getContextPath() %>/" type="button" class="layui-btn layui-btn-sm">全部2</a>
            <c:forEach items="${data}" var="tag">
                <div>
                    <ul>
                        <li><c:out value="${tag}"><a href="<%=request.getContextPath() %>/" type="button" class="layui-btn layui-btn-sm"></a></c:out></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
    </div>
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script type="text/javascript">

    </script>
</body>
</html>
