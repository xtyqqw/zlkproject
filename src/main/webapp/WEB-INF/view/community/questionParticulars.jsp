<%--
  Created by IntelliJ IDEA.
  User: gby
  Date: 2019/12/11
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>问答详情</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/article.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/layui.js">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css"/>
    <link rel="shortcut icon" href="https://gper.club/server-img/avatars/000/00/35/user_origin_3553.jpg"
          type="image/x-icon"/>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
        .editormd-html-preview {
            width: 90%;
            margin: 0 auto;
        }
    </style>
    <style type="text/css">
        .top {
            height: auto;
            width: 100%;
            left: 0;
            top: 0; /*离顶部的距离为0*/
        }

        /*导航栏变异部分*/
        .nav2 {
            font-size: 20px;
            top: 0px;
            height: 60px;
            width: 100%;
            background-color: white;
        }

        .nav3 {
            float: left;
            margin-left: 252px;
            margin-top: 15px;
        }

        .fixnav {
            position: fixed;
            top: 0px;
            left: 0px;
        }

        .div1 {
            width: 1000px;
            margin-left: 250px;
        }

        .div2 {
            margin-top: -24px;
            float: left;
            margin-left: 55px;
        }

        .span {
            float: right;
            margin-top: 10px;
        }

        .border {
            height: 150px;
            border: 1px solid #ccc;
            width: 990px;
            margin-top: 10px;
        }

        .user {
            border: 1px solid #ccc;
            height: 149px;
            width: 100px;
        }

        .right {
            width: 888px;
            height: 149px;
            float: right;
            margin-top: -150px;
        }

        .count {
            margin: 20px;
            height: 100px;
        }

        .img {
            height: 60px;
            width: 60px;
            border: 1px #ccc solid;
            border-radius: 50%;
            margin-left: 18px;
            margin-top: 10px;
        }

        .border {
            height: 150px;
            border: 1px solid #ccc;
            width: 990px;
            margin-top: 10px;
        }

        .user {
            border: 1px solid #ccc;
            height: 149px;
            width: 100px;
        }

        .right {
            width: 888px;
            height: 149px;
            float: right;
            margin-top: -150px;
        }

        .count {
            margin: 20px;
            height: 100px;
        }

        .img {
            height: 60px;
            width: 60px;
            border: 1px #ccc solid;
            border-radius: 50%;
            margin-left: 18px;
            margin-top: 30px;
        }

        .name {
            margin-top: 20px;
        }

        .zan {
            width: 30px;
            height: 30px;
            margin-left: 30px;
            margin-top: -20px;
        }

        .cai {
            height: 30px;
            width: 30px;
            margin-left: 100px;
            margin-top: -30px;
        }

        .time {
            margin-top: -30px;
            float: right;
            margin-right: 20px;
        }


    </style>
</head>

<body>
<div class="top">
    <%@include file="../../jsp/header.jsp" %>
    <%--  <%@include file="../../jsp/sidebar.jsp" %>--%>
    <div class="nav2">
        <div class="nav3">
            <h2>${question.questionTitle}</h2>
        </div>
    </div>
    <div class="div1">
        <%--文章标题及特征--%>
        <div style="margin-top: 50px;height: 80px;width: auto;">
            <div class="title" style="font-size: 10px;float: left">
                <div style="background-color: #1296db;height: 20px;width: 50px;padding:1px 2px;border-radius: 5%; ">
                    <%--    <i style="color: white">${question.solve}</i>--%>
                    <c:if test="${question.solve == 0}">
                        <div class="ui orange basic label" style="font-size: 12px;">待解决</div>
                    </c:if>
                    <c:if test="${question.solve == 1}">
                        <div class="ui orange basic label" style="font-size: 12px">已解决</div>
                    </c:if>
                    <c:if test="${question.solve == 2}">
                        <div class="ui orange basic label" style="font-size: 12px">未解决</div>
                    </c:if>
                </div>
                <div class="div2">
                    <h2> ${question.questionTitle}</h2>
                </div>
            </div>
            <br><br>
            <div style="float: left; margin-top: 10px;">
                <c:forEach items="${question.tagName}" var="tag">
                    <div style="width: 50px;height:20px;background-color:white;border:1px solid #ccc;border-radius: 8%;float: left;margin: 2px">
                        <p class="tag">${tag}</p>
                    </div>
                </c:forEach>

            </div>
            <div class="span">
                <small>
                    <span>浏览：${question.browseCount}</span>
                    <i>|</i>
                    <span>分类：${question.typeName}</span>
                </small>
            </div>
        </div>
        <%--问题--%>
        <fieldset class="layui-elem-field layui-field-title " style="margin-top: 10px;"></fieldset>
        <div id="layout" style="margin-left: -60px;height: auto">
            <div id="test-editormd-view">
                <textarea id="articleContent" style="display:none;">${question.questionContent}</textarea>
            </div>
        </div>
        <div style="float: right;margin-top: 10px;margin-bottom: 10px;">
            <p>发布时间：${question.createTime}</p>
        </div>
    </div>
</div>
<%--<%@include file="../../jsp/footer.jsp"%>--%>
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
<script type="text/javascript">
    $(function () {
        var testEditormdView;
        testEditormdView = editormd.markdownToHTML("test-editormd-view", {
            htmlDecode: "style,script,iframe",  // you can filter tags decode
            emoji: true,
            markdown: "",
            taskList: true,
            tex: true,  // 默认不解析
            flowChart: true,  // 默认不解析
            sequenceDiagram: true  // 默认不解析
        });
    });
</script>
</body>
</html>
