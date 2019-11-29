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
            width:100%;
            left: 0;
            top: 0;/*离顶部的距离为0*/
        }

        .header {
            background-color: #FFFFFF;
            top: 0px;
            height: 60px;
            width: 100%;
            border: 1px #989898;
            box-shadow: 1px 1px 5px 3px #D4D4D4;
            position: fixed;
        }
        /* 头部logo样式 */
        .header .header-logo{
            display: inline;
            padding-top: 5px;
            float: left;
        }

        /* 头部导航 */
        .header .header-nav .nav {
            color: #000000;
            text-decoration: none;
            font-size: 20px;
            float: left;
            margin: 26px 30px;
            padding: 1px;

        }

        .header .nav:hover {
            color: #914EF3;
        }

        /*点击事件样式*/
        .header .active {
            color: #914EF3 !important;
            text-decoration: none;
            font-size: 20px;
            float: left;
            margin: 26px 30px;
            padding: 1px;
        }

        /* 头部搜索 */
        .header .header-search {
            float: left;
            display: inline;
            margin-left: 400px;
            margin-top: 18px;
        }

        /* 头部搜索框样式 */
        .header .header-search .text {
            height: 40px;
            background-color: #FAFAFA;
            border: 1px #FAFAFA;
            border-radius: 3px; /* 边框圆角 */
            text-indent: 1em; /* 首行缩进 */
            font-size: 16px;
            font-weight: bold; /* 粗体 */
            color: #989898;
        }

        /* 头部搜索按钮样式 */
        .header .header-search .submit {
            background-color: #914FF1;
            border: none;
            color: #FFFFFF;
            height: 40px;
            width: 70px;
            border-radius: 3px;
            font-size: 16px;
        }

        .header .eheader-login {
            display: inline;
            float: left;
            margin-top: 18px;
            padding: 10px 50px;
        }

        /* 头部注册登录样式 */
        .header .header-login a {
            text-decoration: none;
            color: #000000;
            font-size: 20px;
        }

        .header .header-login a:hover {
            color: #914EF3;
        }

        /*导航栏变异部分*/
        .nav2 {
            font-size: 20px;
            top: 0px;
            height: 60px;
            width: 100%;
            background-color: white;
        }

        .fixnav {
            position: fixed;
            top: 0px;
            left: 0px;
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
    <div class="header">
        <!-- logo -->
         <div class="header-logo">
             <a href="javascript:;"title="专业的IT技术社区">
                 <img src="/img/logo.png"/>
             </a>
         </div>
        <!-- 导航 -->
        <div class="header-nav" style="margin-left: 300px;margin-top: -10px">
            <a href="javascript:;" name="nav" class="nav">首页</a>
            <a href="javascript:;" name="nav" class="nav">项目</a>
            <a href="javascript:;" name="nav" class="nav">社区</a>
        </div>
        <!-- 搜索 -->
        <div class="header-search">
            <form action="">
                <input class="text" type="text" placeholder="请输入关键词"/>
                <input class="submit" type="submit" value="我要提问"/>
            </form>
        </div>

        <%--未登录显示注册登录--%>
        <c:if test="">
            <!-- 注册登录 -->
            <div class="header-login">
                <a href="javascript:;">注册</a>
                <a style="color: #000000;">/</a>
                <a href="javascript:;">登录</a>
            </div>
        </c:if>
        <%--已登录显示登录信息--%>
        <c:if test="">
            <div>
                <ul class="layui-nav" style="margin: 0 330px 0 1150px">
                    <li class="layui-nav-item" lay-unselect="">
                        <a href="javascript:;">
                            <img src="//t.cn/RCzsdCq" class="layui-nav-img">
                            我
                        </a>
                        <dl class="layui-nav-child">
                            <a href="javascript:;">个人中心</a>
                            <a href="javascript:;">退了</a>
                        </dl>
                    </li>
                </ul>
            </div>
        </c:if>
    </div>
    <div class="nav2">
        <div>
            <h2>${article.title}</h2>
        </div>
    </div>
    <div>
        <div style="margin-top: 70px;margin-left:200px;width: 850px">
            <div style="margin-top: 50px">
                <div style="left: 0px">
                    <div  class="title" style="font-size: 10px;">
                        <div style="background-color: #1296db;height: 20px;width: 40px;padding:1px 2px; ">
                            <span style="color: white">原创</span>
                        </div>
                       <h2> ${article.title}</h2>
                    </div>
                    <div style="width: 40px;height:20px;background-color:#E8E8E8">
                        <p class="tag">标签</p>
                    </div>
                </div>
                <div style="margin-left: 720px;margin-top: -15px;">
                    <small>
                        <span><%=application.getAttribute("counter") %>浏览</span>
                        <i>|</i>
                        <span>分类：开发语言</span>
                    </small>
                </div>
            </div>
            <fieldset class="layui-elem-field layui-field-title " style="margin-top: 10px;"></fieldset>
            <div id="layout" style="margin-left: -60px;">
                <div id="test-editormd-view">
                    <textarea id="articleContent" style="display:none;">${article.articleContent}</textarea>
                </div>
            </div>

            <fieldset class="layui-elem-field layui-field-title " style="margin-top: 30px"></fieldset>

            <label class="layui-form-label" style="margin-left: -30px">评论</label><br><br>
            <div class="layui-input-block" style="margin-left: 1px">
            <textarea name="articleDigest" placeholder="开始编辑..."
                      style="text-decoration-top: 300px;" oninput="if(value.length>3)value=value.slice(0,150)"
                      class="layui-textarea" lay-verify="required"></textarea>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" style="margin-left: 640px;background-color: #1296db;" class="layui-btn"
                            lay-submit="sub"
                            lay-filter="demo2">
                        提交评论
                    </button>
                </div>
            </div>

            <div style="margin-left: 300px;">
                评论数：${article.commentCount}
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
    document.title = "${article.title}双十一狂欢节"
    $(function () {
        $(".nav2").hide();
        $(window).scroll(function () {
            if ($(document).scrollTop() > 50) {
                $(".nav2").addClass("fixnav").slideDown();
            }else {
                $(".nav2").hide();
            }
        })

    })
</script>
<%--鼠标移入移出头像事件--%>
<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<%--头部导航点击事件--%>
<script type="text/javascript">
    $(function () {
        $("a[name='nav']").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
        });
    });
</script>
<script type="text/javascript">
    $(function() {
        var testEditormdView;
        testEditormdView = editormd.markdownToHTML("test-editormd-view", {
            htmlDecode : "style,script,iframe",  // you can filter tags decode
            emoji : true,
            taskList : true,
            tex : true,  // 默认不解析
            flowChart : true,  // 默认不解析
            sequenceDiagram : true  // 默认不解析
        });
    });
</script>
</body>
</html>
