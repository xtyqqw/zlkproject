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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/typo.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/animate.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/prism/prism.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/tocbot/tocbot.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/article.css">
    <link rel="shortcut icon" href="https://gper.club/server-img/avatars/000/00/35/user_origin_3553.jpg"
          type="image/x-icon"/>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/articleShow.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/wangEditor.js"></script>
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
            border: 1px solid #ccc;
            width: 100%;
            height: auto;
        }
        .test-editormd-view {
            width: 90%;
            margin: 0 auto;
        }
    </style>

</head>
<body>
<%@include file="../../jsp/header.jsp" %>
<%@include file="../../jsp/sidebar.jsp" %>
<div class="layui-row" style="margin-top:30px;width: 1000px;margin-left: 230px;border: 1px solid #ccc;height: 50px">
    <div class="title">
        <i class="label" style="float: left;">未解决</i>&nbsp;&nbsp;&nbsp;
        <h3>${question.questionTitle}标题</h3>
        <div class="tt">
            <a class="label">标签</a>
            <span style="margin-right: 26px;">
                            <i class="layui-icon layui-icon-radio"></i>
                            <b>0</b>浏览
                        </span>
            <sapn class="time">
                <i class="layui-icon layui-icon-log">2019.12.09</i>
            </sapn>
        </div>
    </div>
    <!--中间内容-->
    <div class="question">
        <div id="test-editormd-view">
            <textarea id="articleContent" style="display:none;">${question.questionContent}</textarea>
        </div>
        　　联播+党的十八大以来，法治成为以习近平同志为核心的党中央治国理政的基本方式，全面依法治国纳入“四个全面”战略布局，法治建设宏伟蓝图徐徐展开。

        　　习近平总书记在一系列重要讲话中，常用俗文俚语揭示全面依法治国的要义，平实中蕴含着大智慧，更有一种透彻、直指人心的力量。央视网《联播+》特梳理，与读者一起学习。
    </div>
</div>

<script src="<%=request.getContextPath() %>/community/prism/prism.js"></script>
<script src="<%=request.getContextPath() %>/community/tocbot/tocbot.min.js"></script>
<script src="<%=request.getContextPath() %>/community/waypoints/jquery.waypoints.min.js"></script>
<script type="text/javascript">
    $(function () {
        var testEditormdView;
        testEditormdView = editormd.markdownToHTML("test-editormd-view", {
            htmlDecode: "style,script,iframe",  // you can filter tags decode
            emoji: true,
            taskList: true,
            tex: true,  // 默认不解析
            flowChart: true,  // 默认不解析
            sequenceDiagram: true  // 默认不解析
        });
    });
</script>

</body>
</html>
