<%--
  Created by IntelliJ IDEA.
  User: gby
  Date: 2019/12/2
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>文章详情</title>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <script src="<%=request.getContextPath()%>/layui/css/layui.css"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css"/>
    <link rel="shortcut icon" href="https://gper.club/server-img/avatars/000/00/35/user_origin_3553.jpg"
          type="image/x-icon"/>
    <link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.4.5/css/bootstrapValidator.min.css"
          rel="stylesheet">
    <link href="https://cdn.bootcss.com/semantic-ui/2.2.4/semantic.min.css" rel="stylesheet">
    <style type="text/css">
        .label {
            display: inline-block;
            padding: 0 4px;
            height: 18px;
            line-height: 18px;
            background: #6294b5;
            font-size: 12px;
            cursor: pointer;
            color: #fff;
            border-radius: 2px;
        }

        .tt {
            float: left;
        }

        .time {
            margin-right: 26px;
        }

        .question {
            text-align: center;
            float: left;
            width: 100%;
            height: auto;
        }

    </style>

</head>
<body>
<%@include file="../../jsp/header.jsp" %>
<%@include file="../../jsp/sidebar.jsp" %>
<div class="layui-row" style="margin-top:30px;width: 1000px;margin-left: 230px;height: 63px">
    <div class="title">
        <i class="label" style="float: left;">${question.solve}</i>&nbsp;&nbsp;&nbsp;
        <h2>${question.questionTitle}</h2>
        <div class="tt">
            <span class="label">${question.tagName}</span>
            <span style="margin-right: 26px;">
                            <i class="layui-icon layui-icon-radio"></i>
                            <b>${question.browseCount}</b>浏览
                        </span>
            <sapn class="time">
                <i class="layui-icon layui-icon-log">${question.createTime}</i>
            </sapn>
        </div>
    </div>
    <!--中间内容-->
    <div class="question">
        <span>${question.questionContent}</span>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/editormd.min.js"></script>


</body>
</html>
