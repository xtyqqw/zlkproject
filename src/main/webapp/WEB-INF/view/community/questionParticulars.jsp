<%--
  Created by IntelliJ IDEA.
  User: gby
  Date: 2019/12/11
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            width: 900px;
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
            color: #838B8B;
        }

        #footer {
            background-color: #333C4D;
            height: 130px;
            width: 100%;
            margin-top: 500px;
            margin-bottom: 0;
            position: absolute;
        }

        #footer ul {
            padding-top: 30px;
            width: 800px;
            height: 60px;
            margin: 0 auto;
            border-bottom: 1px solid #999999;
        }

        #footer ul li {
            float: left;
            list-style: none;
            padding-left: 30px;
        }

        #footer ul li a {
            color: #989898;
            text-decoration: none;
            float: left;
            padding-left: 20px;
        }

        #footer ul li a:hover {
            color: #F2F2F2;
        }

        #footer hr {
            width: 800px;
            color: #989898;
        }

        #footer p {
            color: #989898;
            text-align: center;
            padding-top: 10px;
        }

        .user {
            float: right;
            height: 100px;
            width: 200px;
            margin-top: 40px;
            margin-right: 120px;
            background-color: #F7F7F7;
        }
        .userTop{
            margin: 10px;
            font-weight:bold;
            float: left;
        }
        .img{
            width: 40px;
            float: left;
            margin-left: 10px;
        }
        .log{
            height: 50px;
            width: 200px;
            margin-top: 50px;
        }
        .name{
            float: left;
            margin-left: 5px;
            margin-right: 10px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
            font-size: 17px;
            font-family: Arial;
            color:  #707070;
            text-decoration:none;
        }

    </style>
</head>

<body>
<div class="top">
    <%@include file="../../jsp/header.jsp" %>
    <div class="nav2">
        <div class="nav3">
            <h2>${question.questionTitle}</h2>
        </div>
    </div>
    <div class="user">
        <span class="userTop">
            提问者
        </span>
        <div class="log">
            <div class="img">
                <img style="width: 40px; height: 40px; border-radius: 50%;" src="${question.user.userImg}">
            </div>
            <span class="name">${question.user.userRealname}</span>
            <img style="height: 12px;width: 12px;float: left;margin-top: 4px;" data-v-fedffd30=""
                 src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABHNCSVQICAgIfAhkiAAAASdJREFUOI2Nkb1KA1EQhb+5Gy2jBGwSCcZY+goG7F1i5RsIAbGwE+0UYicpxJcQ/AGxV/AFjASbkESiIsZqmyibHQuNu4Rk955u5sz57oErg7uiMkFOqSmju+5FoS7CMoDCQ2pSeJxeLgsu/IYBBG0Yp9QUs9I0SWFVjMJxZOWJ872dGBzq7WphU2Ap3AS7Wfe1ZwX4vMmkA6UattHb3HrnFMAK0P9K74tI5m/0TYrK0EsEvF/nFxXZCV/nIOu2n6wBvu/URJgCUKjnZltHUT8W0D3PrwHuf3VHN2QV3xqAmFo46GG0uhVARIoAqjxmZ9rVcTdWvyBmUBmtbg9QTnLl5/tJdjxA+Zg23l7cSSxADVtz5Z6XCBBBgUbU8AdBf77cOottCPwAPANaMlmoeCAAAAAASUVORK5CYII="
                 alt="user-vip" class="user-meta__vip"><br>
           <span style="float: left;margin-left: 5px;"><fmt:formatDate value="${question.createTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss" dateStyle="medium"/></span>
        </div>
    </div>
    <div class="div1">
        <%--文章标题及特征--%>
        <div style="margin-top: 50px;height: 80px;width: auto;">
            <div class="title" style="font-size: 10px;float: left">
                <div style="background-color: #1E9FFF;height: 20px;width: 50px;padding:1px 2px;border-radius: 8%; ">
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
                    &nbsp;<i>|</i>&nbsp;
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
    </div>
</div>
<div>
    <a href="#top" style="position: fixed;top: 550px;right: 30px;z-index: 100;">
        <i class="layui-icon layui-icon-top" style="font-size: 45px;margin-left: 5px;"></i>
    </a>
</div>
<div id="footer">
    <ul>
        <li>
            <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=7">关于我们</a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=1">团队介绍</a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=2">合作企业</a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=3">讲师合作</a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=4">帮助中心</a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=5">友情链接</a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=6">联系我们</a>
        </li>
    </ul>
    <p>
        copyright&nbsp;&nbsp;&nbsp;&nbsp;2017&nbsp;&nbsp;&nbsp;&nbsp;北京智量酷教育科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;京ICP备09076312号
    </p>
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
