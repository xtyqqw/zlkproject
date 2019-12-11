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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/article.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/layui.js">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css"/>
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon"/>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
        <i class="label" style="float: left;" data-value="${question.solve}"></i>&nbsp;&nbsp;&nbsp;
        <h2 data-value="${question.questionTitle}"></h2>
        <div class="tt">
            <span class="label" data-value="${question.tagName}"></span>
            <span style="margin-right: 26px;">
                            <i class="layui-icon layui-icon-radio"></i>
                            <b data-value="${question.browseCount}"></b>浏览
                        </span>
            <sapn class="time">
                <i class="layui-icon layui-icon-log" data-value="${question.createTime}"></i>
            </sapn>
        </div>
    </div>
    <!--中间内容-->
    <div class="question">
        <div id="test-editormd-view">
            <textarea id="articleContent" style="display:none;" data-value="${article.articleContent}"></textarea>
        </div>
    </div>
</div>


<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/editormd.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/marked.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/prettify.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/raphael.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/underscore.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/sequence-diagram.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/flowchart.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/jquery.flowchart.min.js"></script>

<script src="<%=request.getContextPath() %>/editormd/editormd.js"></script>
<script type="text/javascript">
    document.title = "${question.questionTitle}"
    $(function () {
        $(".nav2").hide();
        $(window).scroll(function () {
            if ($(document).scrollTop() > 50) {
                $(".nav2").addClass("fixnav").slideDown();
            } else {
                $(".nav2").hide();
            }
        })

    })
</script>

</body>
</html>
