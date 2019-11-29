<%--
  Created by IntelliJ IDEA.
  User: 上官螃蟹
  Date: 2019/11/18
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>问答首页</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/layui/layui.all.js"></script>
    <style type="text/css">
        body{
            overflow-x:hidden;
        }
        .all-body{
            text-align:center;
            border: none 0;
        }
        .add{
            position: relative;
            top: 20px;
            margin-left: 500px;
            width: 100px;
            height: 38px;
            border-radius: 5%;
            -moz-box-shadow:2px 2px 5px #D8D8D8;
            -webkit-box-shadow:2px 2px 5px #D8D8D8;
            box-shadow:2px 2px 5px #D8D8D8;
            background-color: #1E90FF;
            color: white;
            text-align:center;
        }
    </style>

</head>
<body>
<div class="all-body">
    <%@include file="../../jsp/header.jsp"%>
    <%@include file="../../jsp/sidebar.jsp"%>

    <div class="add">
        <div style="margin-top: 2px;text-align: center;color: red">
            <a role="button" href="<%= request.getContextPath()%>/question/hint">我要提问</a>
        </div>
    </div>
</div>
</body>
</html>
