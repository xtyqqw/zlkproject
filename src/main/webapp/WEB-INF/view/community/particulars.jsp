<%--
  Created by IntelliJ IDEA.
  User: gby
  Date: 2019/11/21
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>文章详情</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/article.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/layui.js">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css"/>
    <link rel="shortcut icon" href="https://gper.club/server-img/avatars/000/00/35/user_origin_3553.jpg" type="image/x-icon" />
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
            margin-left: 200px;
            margin-top: 15px;
        }

        .fixnav {
            position: fixed;
            top: 0px;
            left: 0px;
        }

        .div1 {
            margin-left: 175px;
            width: 920px;
        }

        .div2 {
            margin-top: -27px;
            float: left;
            margin-left: 50px;
        }

        .span {
            float: right;
            margin-top: 10px;
        }
    </style>
</head>
<%
    if (application.getAttribute("counter") == null) {
        String counter = "0";
        application.setAttribute("counter", counter);
    } else {
        int count = Integer.valueOf((String) application.getAttribute("counter")).intValue();
        count++;
        application.setAttribute("counter", count + "");
    }
%>
<body>
<div class="top">
    <%@include file="../../jsp/header.jsp" %>
    <%@include file="../../jsp/sidebar.jsp" %>
    <div class="nav2">
        <div class="nav3">
            <h2>${article.title}</h2>
        </div>
    </div>
    <div class="div1">
        <%--文章标题及特征--%>
        <div style="margin-top: 50px;height: 100px;width: auto;">
            <div class="title" style="font-size: 10px;float: left">
                <div style="background-color: #1296db;height: 20px;width: 40px;padding:1px 2px;border-radius: 5%; ">
                    <span style="color: white">${article.createArticleType}</span>
                </div>
                <div class="div2">
                    <h2> ${article.title}</h2>
                </div>
            </div><br><br>
            <div style="float: left; margin-top: 10px;">
                <div style="width: 40px;height:20px;background-color:#E8E8E8;border-radius: 5%;">
                    <p class="tag">${article.tagName}</p>
                </div>
            </div>
            <div class="span">
                <small>
                    <span><%=application.getAttribute("counter") %>${arcitle.browseCount}浏览</span>
                    <i>|</i>
                        <span>分类：${article.typeName}</span>
                </small>
            </div>
        </div>
        <%--文章--%>
        <fieldset class="layui-elem-field layui-field-title " style="margin-top: 10px;"></fieldset>
        <div id="layout" style="margin-left: -60px;height: auto">
            <div id="test-editormd-view">
                <textarea id="articleContent" style="display:none;">${article.articleContent}</textarea>
            </div>
        </div>
        <fieldset class="layui-elem-field layui-field-title " style="margin-top: 30px"></fieldset>
        <%--评论--%>
        <div>
            <label class="layui-form-label" style="margin-left: -30px">评论</label><br><br>
            <div class="layui-input-block" style="margin-left: 1px">
                    <textarea name="articleDigest" placeholder="开始编辑..."
                              style="text-decoration-top: 300px;" oninput="if(value.length>3)value=value.slice(0,150)"
                              class="layui-textarea" lay-verify="required"></textarea>
            </div>
        </div>
         <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" style="float:right;background-color: #1296db;" class="layui-btn"
                        lay-submit="sub" lay-filter="demo2">提交评论
                </button>
            </div>
             <fieldset class="layui-elem-field layui-field-title " style="margin-top: 30px"></fieldset>
             <div style="float: left;">
                评论数：${article.commentCount}
            </div>
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
    document.title = "${article.title}"
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
<%--鼠标移入移出头像事件--%>
<%--<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>--%>
<%--头部导航点击事件--%>
<%--<script type="text/javascript">
    $(function () {
        $("a[name='nav']").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
        });
    });
</script>--%>
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
