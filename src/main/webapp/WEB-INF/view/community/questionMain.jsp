<%--
  Created by IntelliJ IDEA.
  User: 上官螃蟹
  Date: 2019/11/18
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>问答首页</title>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <link rel="shortcut icon" href="/img/zlk.png" type="image/x-icon"/>
    <style type="text/css">
        body {
            overflow-x: hidden;
            overflow-y: hidden;
            height: auto;
        }

        /*发表按钮样式*/
        .quiz a {
            font-family: "Arial";
            color: #F8F8F8;
            font-size: 18px;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .quiz {
            position: relative;
            top: -120px;
            left: 924px;
            width: 100px;
            height: 40px;
            -moz-box-shadow: 2px 2px 5px #D8D8D8;
            -webkit-box-shadow: 2px 2px 5px #D8D8D8;
            box-shadow: 2px 2px 5px #D8D8D8;
            background-color: #1296db;
            text-align: center;
            line-height: 45px;
            overflow: hidden;
            vertical-align: middle;
            border-radius: 6%;
        }

        .user {
            background-color: #F2F2F2;
            height: 250px;
            width: 250px;
            float: right;
            margin-top: -100px;
        }

        .hint {
            float: left;
            margin-top: 10px;
            margin-left: 10px;
        }

        .userData {
            margin-top: 50px;
            margin-left: 10px;

        }

        .userLogo {
            display: inline-block;
            margin: 5px auto;
            width: 50px;
            height: 50px;
            -webkit-border-radius: 100px;
            border: 2px solid #fff;
            box-shadow: 0 0 4px #ccc;
            overflow: hidden;

        }

        .img {
            width: 100%;
            min-height: 100%;
        }

        .userName {
            margin-top: -60px;
            margin-left: 80px;

        }

        .vip {
            margin-top: -70px;
            float: right;
            margin-right: 45px;
        }


    </style>
</head>
<body>

<div style="margin-left: -40px">
    <input type="hidden" value="${error}" id="msg">
    <div class="tar">
        <a href="<%=request.getContextPath()%>/questionUser/questionSkip" style="color: black;" id="sss"
           onmouseover="over()" onmouseout="out()" name="aaa" target="pageTarget">全部问答</a>
        <span>&nbsp;|&nbsp;</span>
        <a href="<%=request.getContextPath()%>/questionUser/questionSkip" style="color: black;" id="ssss"
           onmouseover="over1()" onmouseout="out1()" name="bbb" target="pageTarget">我的问题</a>
    </div>
    <div class="frame">
        <iframe class="if" name="pageTarget"    frameborder="1">
            <div>
                <c:forEach items="${allQuestion}" var="all" begin="0" end="10">
                    <ul>
                        <li style="margin: 50px 0;">
                            <a href="<%=request.getContextPath() %>/questionUser/myQuestion" type="button"
                               style="text-decoration: none;">
                                    ${all.questionTitle}
                            </a><br>
                            <i>${all.questionContent}</i>
                        </li>
                    </ul>
                </c:forEach>
            </div>
            <div class="quiz">
                <a role="button" href="<%=request.getContextPath()%>/question/questionGuide" target="_blank">我要提问</a>
            </div>
            <div class="user">
                <div class="hint">
                    <i>提问者</i>
                </div>
                <div class="userData">
                    <div class="userLogo">
                        <a href="<%=request.getContextPath() %>/questionUser/skipUser" target="_blank">
                            <img class="img" src="userImg"></a>
                    </div>
                </div>
                <div class="userName">
                    <a href="<%=request.getContextPath() %>/questionUser/skipUser" target="_blank"
                       style="text-decoration: none; color: black; " id="or" onmouseover="over()" onmouseout="out()">
                        <i id="size" name="userRealname"></i>
                    </a>
                    <p name="acreateTime">发布</p>
                </div>
                <div class="vip">
                    <img src="/img/V.png"></svg>
                </div>
            </div>
        </iframe>
        <iframe class="if" name="bbb" frameborder="1">

            111
        </iframe>
    </div>
</div>
<script>
    layui.use(['layer'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        <c:if test="${flag}">
        $(function () {
            layer.alert($("#msg").val());
        })
        </c:if>
    })
</script>
<script type="text/javascript">
    var oBox = document.getElementById('size');
    var demoHtml = oBox.innerHTML.slice(0, 5) + '...';
    oBox.innerHTML = demoHtml;
</script>
<script type="text/javascript">
    function out() {
        var x = document.getElementById("or").style.color = "black";
    }

    function over() {
        var x = document.getElementById("or").style.color = "blue";
    }

</script>
<script type="text/javascript">
    function handlePublishTimeDesc(createTime) {
        // 拿到当前时间戳和发布时的时间戳，然后得出时间戳差
        var curTime = new Date();
        var postTime = new Date(createTime);
        var timeDiff = curTime.getTime() - postTime.getTime();

        // 单位换算
        var min = 60 * 1000;
        var hour = min * 60;
        var day = hour * 24;
        var week = day * 7;

        // 计算发布时间距离当前时间的周、天、时、分
        var exceedWeek = Math.floor(timeDiff / week);
        var exceedDay = Math.floor(timeDiff / day);
        var exceedHour = Math.floor(timeDiff / hour);
        var exceedMin = Math.floor(timeDiff / min);

        // 最后判断时间差到底是属于哪个区间，然后return
        if (exceedWeek > 0) {
            return createTime;
        } else {
            if (exceedDay < 7 && exceedDay > 0) {
                return exceedDay + '天前';
            } else {
                if (exceedHour < 24 && exceedHour > 0) {
                    return exceedHour + '小時前';
                } else {
                    return exceedMin + '分鐘前';
                }
            }
        }
    };

</script>
</body>
</html>
