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
<div>
    <a href="#top" style="margin-left: 93vw;z-index: 100;">
        <svg t="1576140135922" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6257" width="64" height="64"><path d="M555.880483 37.797839a634.568341 634.568341 0 0 1 115.956771 180.038143 558.138589 558.138589 0 0 1 48.640813 249.612206 17.963128 17.963128 0 0 0 7.303243 16.071202c16.74253 13.833439 33.220598 28.073744 49.983471 41.907183a126.575969 126.575969 0 0 1 47.684679 124.094088c-8.564526 53.502861-20.07883 106.598856-31.023522 159.694851a41.744437 41.744437 0 0 1-69.167197 24.615384c-29.701208-25.02225-58.99555-50.6548-88.005086-76.287349-14.545455-12.816275-14.240305-13.426573-29.233312-1.830896a149.787667 149.787667 0 0 1-132.577241 30.311507 161.444374 161.444374 0 0 1-66.848061-34.990464 9.256198 9.256198 0 0 0-14.850604 0.610298 5099.86014 5099.86014 0 0 1-90.283534 80.762874 42.578512 42.578512 0 0 1-70.143675-24.818818c-5.675779-23.801653-10.456453-47.806739-15.684679-71.608391-5.635092-25.632549-11.371901-51.265099-16.966306-77.101081a128.671329 128.671329 0 0 1 33.627463-123.076923 716.083916 716.083916 0 0 1 62.57597-52.892562 12.673872 12.673872 0 0 0 5.777495-11.595677 562.898919 562.898919 0 0 1 55.903369-270.565798 658.308964 658.308964 0 0 1 83.529562-134.876033 279.028608 279.028608 0 0 1 56.96122-56.147489c12.043229-8.34075 12.979021-8.544183 24.411952 0a212.26192 212.26192 0 0 1 32.366179 28.073745z m36.617928 216.656071a113.434202 113.434202 0 0 0-159.226955-3.254927 117.177368 117.177368 0 0 0-2.034329 167.832168 114.919263 114.919263 0 0 0 159.69485 0.610298 117.86904 117.86904 0 0 0 1.485061-165.187539z m-195.153211 569.612206a21.787667 21.787667 0 0 1 28.480611-3.865226 192.467896 192.467896 0 0 0 171.55499 0 22.377622 22.377622 0 0 1 34.258106 21.360458c0.142403 30.108074 0 60.216147 0 90.324221a21.726637 21.726637 0 0 1-12.409409 22.174189 21.380801 21.380801 0 0 1-25.632549-4.475524c-4.801017-4.272092-9.276542-9.154482-13.975843-13.630006-8.625556-8.34075-8.767959-8.34075-13.955499 2.034329-11.066751 22.377622-22.092816 44.958678-33.159568 67.3363a24.411952 24.411952 0 0 1-14.993007 14.240305 21.909727 21.909727 0 0 1-26.62937-13.019707c-11.514304-22.987921-22.662428-45.975842-34.03433-68.963764-4.923077-9.968214-5.228226-9.968214-13.304513-2.034329-4.88239 4.88239-9.622378 9.764781-14.647171 14.443738a22.377622 22.377622 0 0 1-37.858869-16.681501q-0.12206-46.993007 0-93.986013a19.122695 19.122695 0 0 1 6.306421-15.25747z m0 0" p-id="6258" fill="#8a8a8a"></path></svg>
    </a>
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
