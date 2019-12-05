<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>社区</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/layui/layui.all.js"></script>
    <style type="text/css">
        body {
            overflow-x: hidden;
        }

        .all-body {
            text-align: center;
            border: none 0;
        }

        .item {
            width: 100px;
            height: 30px;
            font-size: 20px;
        }
        /*发表按钮样式*/
        .add a {
            /*background-color: #9933FF;*/
            font-family: "Arial";
            color: #F8F8F8;
            font-size: 18px;
            /*border: solid #1296db 1px;*/
            text-decoration: none;
            display: block;
            text-align: center;
        }
        .add{
            position: relative;
            top: 10px;
            left: 1100px;
            width: 200px;
            height: 40px;
            -moz-box-shadow:2px 2px 5px #D8D8D8;
            -webkit-box-shadow:2px 2px 5px #D8D8D8;
            box-shadow:2px 2px 5px #D8D8D8;
            background-color: #1296db;
            text-align:center;
            line-height:45px;
            overflow:hidden;
            vertical-align:middle;
        }
        /*横线样式*/
        .crossing{
            width: 1300px;
            height: 1px;
            border-top: solid #D0D0D0 1px;
            position: relative;
            bottom: -15px;
            left: 200px;
        }

        .tar {
            width: 450px;
        }

        .if {
            height: 1000px;
            width: 100%;
            border: 0px;

        }

        .frame {
            width: 100%;
            margin-left: 250px;
            height: 1000px;

        }
    </style>
</head>
<body>
<div class="all-body">
    <%@include file="../../jsp/header.jsp" %>
    <%@include file="../../jsp/sidebar.jsp" %>
    <div class="item">
        <div class="tar">
            <a href="<%=request.getContextPath()%>/article/findByCreateTime" target="pageTarget">文章</a>
            <span>|</span>
            <a href="<%= request.getContextPath()%>/question/questionMain" target="pageTarget">问答</a>
        </div>
    </div>
    <div class="add">
        <a  href="<%= request.getContextPath()%>/question/main">我要提问</a>
    </div>
    <div class="crossing"></div>
    <div class="frame">
        <iframe class="if" name="pageTarget" frameborder="1" src="/question/question"></iframe>
    </div>
    <%@include file="../../jsp/footer.jsp" %>
</div>
</body>
</html>