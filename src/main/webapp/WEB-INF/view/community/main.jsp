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

        .add {
            position: relative;
            top: -30px;
            left: 1075px;
            width: 200px;
            height: 40px;
            box-shadow: 2px 2px 5px #D8D8D8;
            background-color: #1296db;
            text-align: center;
            line-height: 45px;
            overflow: hidden;
            vertical-align: middle;
        }

        /*横线样式*/
        .crossing {
            width: 1150px;
            height: 1px;
            border-top: solid #D0D0D0 1px;
            position: relative;
            bottom: -10px;
            left: 175px;
            margin-top: -20px;
        }

        .tar {
            width: 460px;
            margin-top: 10px;
            height: 30px;
            font-size: 20px;
        }

        .if {
            height: 600px;
            width: 100%;
            border: 0px;
        }

        .frame {
            width: 1150px;
            margin-left: 180px;
            height: 1200px;
            margin-top: 25px;
        }

    </style>
</head>
<body>
<div class="all-body">
    <%@include file="../../jsp/header.jsp" %>
    <%@include file="../../jsp/sidebar.jsp" %>
    <div>
        <div class="tar">
            <a href="<%=request.getContextPath()%>/question/communityMain" style="color: black;" id="sss"
               onmouseover="over()" onmouseout="out()" name="aaa" target="pageTarget">文章</a>
            <span>&nbsp;|&nbsp;</span>
            <a href="<%=request.getContextPath()%>/questionUser/questionSkip" style="color: black;" id="ssss"
               onmouseover="over1()" onmouseout="out1()" name="bbb" target="pageTarget">问答</a>
        </div>
        <div class="add">
            <a role="button" href="<%= request.getContextPath()%>/question/questionGuide">我要发文</a>
        </div>
        <div class="crossing"></div>
        <div class="frame">
            <iframe class="if" name="pageTarget" frameborder="1"></iframe>
            <iframe class="if" name="bbb" frameborder="1"></iframe>
        </div>
    </div>
    <%@include file="../../jsp/footer.jsp" %>
</div>

<script type="text/javascript">
    function out() {
        var x = document.getElementById("sss").style.color = "black";
    }

    function over() {
        var x = document.getElementById("sss").style.color = "blue";
    }

    function out1() {
        var x = document.getElementById("ssss").style.color = "black";
    }

    function over1() {
        var x = document.getElementById("ssss").style.color = "blue";
    }
</script>
</body>
</html>