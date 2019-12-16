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
    <%@include file="../../jsp/sidebar.jsp" %>
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
                <div style="width: 50px;height:20px;background-color:white;border:1px solid #ccc;border-radius: 8%;">
                    <p class="tag">${question.tagName}</p>
                </div>
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
        <fieldset class="layui-elem-field layui-field-title " style="margin-top: 30px"></fieldset>
        <%--回答--%>
        <div style="height: 25px;">
            <span style="float: left;font-size: 18px;">回复：</span>
        </div>
        <div class="layui-form-item">
            <form action="<%=request.getContextPath() %>/response/save" method="post" class="form" id="publish">
                <textarea id="demo" style="display: none;" maxlength="200" placeholder="开始编辑。。。"
                          name="responseContent"></textarea>
                <div class="layui-input-block">
                    <button type="submit" style="float:right;background-color: #914FF1;" class="layui-btn"
                            lay-submit="sub" onclick="publish()" lay-filter="demo2">提交回复
                    </button>
                </div>
            </form>
        </div>
        <fieldset class="layui-elem-field layui-field-title " style="margin-top: 30px"></fieldset>
        <%--答复详情--%>
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="layui-this">全部</li>
                <li>最新</li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;">
                <div class="layui-tab-item layui-show">
                    <li class="show_li1"></li>
                </div>
                <div class="layui-tab-item">
                    <li class="show_li2"></li>
                </div>
            </div>
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
<script>
    layui.use('layedit', function () {
        var layedit = layui.layedit;
        layedit.set({
            uploadImage: {
                url: '/response/responseImg' //接口url
                , type: 'post' //默认post
            }
        });
        layedit.build('demo'); //建立编辑器
    });

</script>
<script type="text/javascript">
    /*表单验证开启*/
    function publish() {
        $('.form').form({
            inline: true,
            on: 'blur',
            fields: {
                responseContent: {
                    identifier: 'responseContent',
                    rules: [{
                        type: 'empty',
                        prompt: '内容不能为空呦'
                    }, {
                        type: 'maxLength[50]',
                        prompt: '请注意内容最大长度不能超过200'
                    }]
                }
            },
            onSuccess: function () {
                alert("提交成功");
            },
        });
    }
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
<script>
    layui.use('flow', function () {
        var flow = layui.flow;
        var $ = layui.jquery;
        flow.load({
            elem: '.show_li1' //流加载容器
            , isAuto: false
            , done: function (page, next) { //加载下一页
                //模拟插入
                setTimeout(function () {
                    var lis = [];
                    var limit = 4;
                    $.ajax({
                        url: "/response/responseAll?page=" + page + "&limit=" + limit,
                        type: 'post',
                        dataType: "json",
                        success: function (result) {
                            layui.each(result.responseAllList, function (i, response) {
                                var html = '';
                                html += '<div class="border">' +
                                    '<div class="user" id="user">' + /*'<img class="img" src="'+response.figures+'">' + '<div class="name"> '+ response.userName +'</div>' +*/'</div>' +
                                    '<div class="right" id="right">' +
                                    '<div class="count"><span>' + response.responseContent + '</span></div>' +
                                    '<div>' + '<div class="zan">' + response.zanCount + '赞' + '</div>' + ' <div class="cai">' + response.caiCount + '踩' + '</div>' + '</div>' +
                                    '<div class="time">' + response.createTime + '</div>' + '</div>' +
                                    '</div>';
                                lis.push(html);
                            });
                            next(lis.join(''), page < 2);
                            $(".timeago").timeago();
                        }
                    });
                }, 500);
            }
        });
    });

</script>
<script>
    layui.use('flow', function () {
        var flow = layui.flow;
        var $ = layui.jquery;
        flow.load({
            elem: '.show_li2' //流加载容器
            , isAuto: false
            , done: function (page, next) { //加载下一页
                //模拟插入
                setTimeout(function () {
                    var lis = [];
                    var limit = 4;
                    $.ajax({
                        url: "/response/responseNew?page=" + page + "&limit=" + limit,
                        type: 'post',
                        dataType: "json",
                        success: function (result) {
                            layui.each(result.responseNewList, function (i, response) {
                                var html = '';
                                html += '<div class="border">' +
                                    '<div class="user" id="user">' + /*'<img class="img" src="'+response.figures+'">' + '<div class="name"> '+ response.userName +'</div>' +*/'</div>' +
                                    '<div class="right" id="right">' +
                                    '<div class="count"><span>' + response.responseContent + '</span></div>' +
                                    '<div>' + '<div class="zan">' + response.zanCount + '赞' + '</div>' + ' <div class="cai">' + response.caiCount + '踩' + '</div>' + '</div>' +
                                    '<div class="time">' + response.createTime + '</div>' + '</div>' +
                                    '</div>';
                                lis.push(html);
                            });
                            next(lis.join(''), page < 2);
                            $(".timeago").timeago();
                        }
                    });
                }, 500);
            }
        });
    });
</script>
</body>
</html>
