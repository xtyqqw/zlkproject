<%--
  Created by IntelliJ IDEA.
  User: kaiguan
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
    <title>${question.questionTitle}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/typo.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/animate.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/prism/prism.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/tocbot/tocbot.css"/>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1517658_our4ohnho6.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all" />
    <style type="text/css">
        /*底部样式*/
        body {
            margin: 0;
        }

        #footer {
            background-color: #333C4D;
            height: 130px;
            width: 100%;
            margin-top: 50px;
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

        .response {
            height: 10vw;
            width: 100%;
            margin-bottom: 1vw;
            border: 1px solid #009688 !important;
        }

        .ruser {
            float: left;
            height: 100%;
            width: 6vw;
            /*border-right: 1px solid #009688 !important;*/
        }

        .base {
            width: 85%;
            float: right;
            height: 100%;
        }

        .createTime {
            float: right;
            margin-right: 4vw;
            margin-top: 4vw;
        }

        .accept {
            margin-top: 4vw;
            float: left;
        }

        .replyCount {
            float: left;
            margin-top: 4vw;
            margin-left: 2vw;
        }

        .userImg {
            height: 4vw;
            margin-top: 2vw;
            margin-left: 1vw;
            width: 4vw;
        }

        .userName {
            text-align: center;
            margin-top: 2vw;

        }
    </style>
</head>
<body>
<%--导航栏--%>
<%@include file="../../jsp/header.jsp" %>
<!--中间内容-->
<div id="waypoint" class="m-container-small m-padded-tb-big animated fadeIn">
    <div class="ui container">
        <%--顶部--%>
        <div class="ui top attached segment">
            <div class="ui horizontal link list">
                <div class="item">
                    <img src="${question.user.userImg}" alt="" class="ui avatar image">
                    <div class="content"><a href="javascript:void(0)" class="header"
                                            style="box-shadow: none;height: auto;">${question.user.userRealname}</a>
                    </div>
                </div>
                <div class="item">
                    <i class="calendar icon"></i> <span><fmt:formatDate value="${question.updateTime}" type="both"
                                                                        dateStyle="long" timeStyle="short"/></span>
                </div>
                <div class="item">
                    <i class="eye icon"></i> <span>${question.browseCount}</span>
                </div>
            </div>
        </div>
        <div class="ui attached padded segment">
            <!--内容-->
            <div class="ui right aligned basic segment field">
                <div class="ui violet basic label">${question.typeName}</div>
                <c:if test="${question.solve == 0}">
                    <div class="ui orange basic label">待解决</div>
                </c:if>
                <c:if test="${question.solve == 1}">
                    <div class="ui orange basic label">已解决</div>
                </c:if>
            </div>
            <h2 class="ui center aligned header" style="box-shadow: none;">
                ${question.questionTitle}
            </h2>
            <br>
            <!--中间主要内容部分-->
            <div id="content" class="typo typo-selection js-toc-content m-padded-lr-responsive m-padded-tb-large">
                <pre>${question.questionContent}</pre>
            </div>
            <!--标签-->
            <div class="m-padded-lr-responsive" style="margin-bottom: 55px;margin-top: -20px;">
                <c:forEach items="${question.tags}" var="tag">
                    <div class="column" style="margin-right: 15px;float: left;">
                        <div class="ui basic teal left pointing label">${tag.tagName}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="ui bottom attached segment">
            <div id="comment-container" class="ui teal segment">
                <div class="ui threaded comments" style="max-width: 100%;">
                    <h3 class="ui dividing  header" style="box-shadow: none;height: 3vw;">留言</h3>
                    <!--留言区域列表-->
                    <span>${msg}</span>
                    <form action="<%=request.getContextPath() %>/response/addResponse" method="post"  id="publish" class="ui form">
                        <textarea id="div_artCmt_text" type="text" class="text" placeholder="请输入评论信息..."
                                  name="responseContent" required style="height: 10vw;margin-top: 1vw;"></textarea>
                        <div id="art-cmt-btnBox" class="fields" style="float: right;">
                            <div class="field m-margin-bottom-small m-mobile-wide" style="margin-top: 1vw;">
                                <button id="publish-btn" type="submit" onclick="publish()"
                                        class="ui button m-mobile-wide violet"><i
                                        class="edit icon"></i>发布
                                </button>
                            </div>
                        </div>
                        <div id="SCS_allBox" style="margin-top: 6vw;margin-bottom: 3vw;">
                            <div id="res_conten"></div>
                        </div>
                    </form>
                </div>
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
            <a href="/aboutus/aboutus">关于我们</a>
        </li>
        <li>
            <a href="/aboutus/aboutus">加入我们</a>
        </li>
        <li>
            <a href="/aboutus/aboutus">联系我们</a>
        </li>
        <li>
            <a href="/aboutus/aboutus">讲师合作</a>
        </li>
        <li>
            <a href="/aboutus/aboutus">帮助中心</a>
        </li>
        <li>
            <a href="/aboutus/aboutus">友情链接</a>
        </li>
        <li>
            <a href="/aboutus/aboutus">合作企业</a>
        </li>
    </ul>
    <p>
        copyright&nbsp;&nbsp;&nbsp;&nbsp;2017&nbsp;&nbsp;&nbsp;&nbsp;北京智量酷教育科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;京ICP备09076312号
    </p>
</div>
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/jquery.scrollto@2.1.2/jquery.scrollTo.min.js"></script>

<script src="<%=request.getContextPath() %>/layui/layui.all.js"></script>
<script src="<%=request.getContextPath() %>/js/wangEditor.js"></script>
<script src="<%=request.getContextPath() %>/community/prism/prism.js"></script>
<script src="<%=request.getContextPath() %>/community/tocbot/tocbot.min.js"></script>
<script src="<%=request.getContextPath() %>/community/waypoints/jquery.waypoints.min.js"></script>
<script type="text/javascript">

    /*表单验证开启*/
    function publish() {
        $('.ui.form').form({
            inline: true,
            on: 'blur',
            fields: {
                responseContent: {
                    identifier: 'responseContent',
                    rules: [{
                        type: 'empty',
                        prompt: '内容不能为空'
                    }, {
                        type: 'maxLength[150]',
                        prompt: '请注意问题摘要最大长度不能超过150'
                    }]
                },
            },
        });
    }
</script>
<%--瀑布流--%>
<script>
    layui.use('flow', function () {
        var flow = layui.flow;
        flow.load({
            elem: '#res_conten' //流加载容器
            , isAuto: false
            , done: function (page, next) { //加载下一页//模拟插入
                setTimeout(function () {
                    var lis = [];
                    var limit = 5;
                    var data = {"page": page, "limit": limit};
                    console.log(data);
                    $.ajax({
                        type: "POST",
                        url: "/response/responseAll",
                        dataType: "json",
                        data: data,
                        success: function (result) {
                            layui.each(result.responseAllList, function (i, response) {
                                lis.push(
                                    '<div class="response" >' +
                                    '<div class="ruser">' +
                                  /*  '<img class="userImg" src="' + response.user.userImg + '" >' +
                                    '<p class="userName">' + response.user.userRealname + '</p>' +*/
                                    '</div>' +
                                    '<div class="base">' +
                                    '<p class="responseContent" style="margin-top: 3vw;">' + response.responseContent + '</p>' +
                                    '<p class="createTime">' + response.createTime + '</p>' +
                                  /*  '<p class="accept">' + response.zanCount + '</p>' +
                                    '<p class="replyCount">' + response.caiCount + '</p>' +
                                    '<p class="replyCount">' + response.accept + '</p>' +*/
                                    '</div>' +
                                    '</div>'
                                );
                            })
                            next(lis.join(''), page < 6); //假设总页数为 6
                        }
                    });
                }, 500);
            }
        });
    });
</script>
</body>
</html>
