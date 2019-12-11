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
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon"/>
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

        .fixnav {
            position: fixed;
            top: 0px;
            left: 0px;
        }

        .nav2 {
            display: block;
            background-color: white;
            height: 60px;
            margin-top: 0px;
        }
    </style>
</head>
<body>
<div class="top">
    <%@include file="../../jsp/header.jsp" %>
    <div class="nav2">
        <div style="margin-top: 20px">
            <h2>${article.title}标题</h2>
        </div>
    </div>
    <div style="width: 100%">
        <div style="width: 900px;margin-left: 310px;">
            <div style="margin-top: 40px">
                <div style="left: 0px">
                    <div class="title" style="font-size: 10px;">
                        <div style="background-color: #1296db;height: 20px;width: 40px;padding:1px 2px; ">
                            <span style="color: white">原创</span>
                        </div>
                        <h2> ${article.title}标题</h2>
                    </div>
                    <div style="width: 40px;height:20px;background-color:#E8E8E8">
                        <p class="tag">标签</p>
                    </div>
                </div>
                <div style="margin-left: 782px;margin-top: -15px;">
                    <small>
                        <span>浏览</span>
                        <i>|</i>
                        <span>分类：开发语言</span>
                    </small>
                </div>
            </div>
            <fieldset class="layui-elem-field layui-field-title " style="margin-top: 10px;"></fieldset>
            <div id="layout" style="margin-left: -60px;">
                <div id="test-editormd-view">
                    <textarea id="articleContent" style="display:none;">${article.articleContent}提问内容</textarea>
                </div>
            </div>

            <fieldset class="layui-elem-field layui-field-title " style="margin-top: 30px"></fieldset>

            <label class="layui-form-label" style="margin-left: -30px">回答:</label><br><br>
            <div class="layui-input-block" style="margin-left: 1px">
            <textarea name="articleDigest" placeholder="开始编辑..."
                      style="text-decoration-top: 300px;" oninput="if(value.length>3)value=value.slice(0,150)"
                      class="layui-textarea" lay-verify="required"></textarea>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 158px;">
                    <button type="submit" style="margin-left: 650px;background-color: #1296db;" class="layui-btn"
                            lay-submit="sub"
                            lay-filter="demo2">
                        提交答复
                    </button>
                </div>
            </div>
            <fieldset class="layui-elem-field layui-field-title " style="margin-top: 30px;margin-bottom: 30px;"></fieldset>
            <div style="float: left; margin-bottom: 50px;">
                <sapn> 回答数：${article.commentCount}</sapn>
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
        document.title = "${article.title}标题"
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
                taskList: true,
                tex: true,  // 默认不解析
                flowChart: true,  // 默认不解析
                sequenceDiagram: true  // 默认不解析
            });
        });
    </script>
</body>
</html>
