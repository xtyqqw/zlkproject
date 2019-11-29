<%--
  Created by IntelliJ IDEA.
  User: gby
  Date: 2019/11/26
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Zlk提问知道</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <script src="/layui/layui.js"></script>
    <style>
        .top {
            height: auto;
            width: 100%;
            left: 0;
            top: 0; /*离顶部的距离为0*/
        }
        .nav {
            top: 0px;
            left: 0px;
            height: 65px;
            background-color: #FCFCFC;
            width: 100%;
            border-bottom: 1px solid #F5F5F5;
            position: fixed;
        }
        /* 头部logo样式 */
        .logo{
            display: inline;
            margin-left: 200px;
            float: left;
        }
        .nav1{
            display: inline;
        }
        /* 头部导航 */
        .nav2{
            color: #000000;
            text-decoration: none;
            font-size: 20px;
            float: left;
            margin: 18px 30px;
            padding: 1px;
        }
        /* 头部搜索 */
        .search{
            float: left;
            display: inline;
            margin-left: 100px;
            margin-top: 15px;
        }
        /* 头部搜索框样式 */
        .search .text{
            height: 40px;
            background-color: #FAFAFA;
            border: 1px #FAFAFA;
            border-radius: 3px;/* 边框圆角 */
            text-indent: 1em;/* 首行缩进 */
            font-size: 16px;
            font-weight: bold;/* 粗体 */
            color: #989898;
        }
        /* 头部搜索按钮样式 */
        .submit{
            background-color: #1E90FF;
            border: none;
            color: #FFFFFF;
            height: 40px;
            width: 70px;
            border-radius: 3px;
            font-size: 16px;
        }
        .main {
            width: 1000px;
            height: 826px;
            margin-left: 400px;
            margin-top: 120px;

        }

        .header {
            margin-left: 210px;
            margin-top: 40px;
            margin-bottom: 40px;
        }

        .header svg {
            float: left;
        }

        .header h2 {
            color: #1E90FF;
            font-weight: bold;
        }

        h4 {
            color: #595959;
            font-size: 18px;
            font-weight: bold;
        }

        ul {
            list-style-type: circle;
            padding-bottom: 30px;
            margin-top: 10px;
        }

        li {
            font-size: 15px;
            margin-top: 5px;
            margin-left: 15px;
            color: #8D8D8D;
            list-style-type: circle ;
        }

        .rule {
            color: #E00000;
        }
        .main a {
            background-color: #1E90FF;
            margin-left: 240px;
            margin-top: 20px;
        }

    </style>
</head>
<body>
<div class="top">
    <%--    <%@include file="../../jsp/header.jsp"%>--%>
      <%--  <%@include file="../../jsp/sidebar.jsp"%>--%>
    <div class="nav">
        <!-- logo -->
        <div class="logo">
            <img src="/img/logo.png" />
        </div>
        <!-- 导航 -->
        <div class="nav1">
            <a href="javascript:;" name="nav2" class="nav2">首页</a>
            <a href="javascript:;" name="nav2" class="nav2">项目</a>
            <a href="javascript:;" name="nav2" class="nav2">社区</a>
        </div>
        <!-- 搜索 -->
        <div class="search">
            <form action="">
                <input class="text" type="text" placeholder="请输入关键词" />
                <input class="submit" type="submit" value="搜索" />
            </form>
        </div>
    </div>
    <div class="main">
        <div class="header">
            <div>
                <svg t="1574647601107" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3562" width="40" height="40">
                    <path d="M544 572.736V640h-64v-128h32c52.928 0 96-43.072 96-96 0-52.96-43.072-96-96-96l-0.288 0.032a96.064 96.064 0 0 0-95.712 96h-64a160.128 160.128 0 0 1 159.712-160H512c88.224 0 160 71.744 160 160a160.224 160.224 0 0 1-128 156.704M511.712 800a48 48 0 1 1 0-96 48 48 0 0 1 0 96M512 64C264.576 64 64 264.544 64 512c0 247.424 200.576 448 448 448s448-200.576 448-448c0-247.456-200.576-448-448-448" fill="#1296db" p-id="3563"></path>
                </svg>
            </div>
            <h2>&nbsp;快速了解Zlk提问</h2>
        </div>
        <div style="margin-top: 50px;">
            <h4>提问之前进行搜索</h4>
            <ul>
                <li>在你选择提问之前可在Zlk或其他搜索引擎里将你的问题进行搜索，如没可解决的答案即可提问求助</li>
            </ul>
            <h4>问题越清晰，答案越准确</h4>
            <ul>
                <li>选择准确的问题类型和标签的标记提高问题曝光率</li>
                <li>标题简明扼要，表明你遇到了一个什么问题</li>
                <li>详细描述你的问题细节，可通过链接、图片或代码完善问题细节</li>
            </ul>
            <h4>保持你的求知欲</h4>
            <ul>
                <li>或许最后你没有得到一个完美的答案，但经过深思熟虑的问题能够让你得到其它方面的收获</li>
            </ul>
            <h4 class="rule">违规说明</h4>
            <ul>
                <li>没有尝试找寻答案之前而频繁发布问题</li>
                <li>发布违法、低俗等不良内容或广告</li>
                <li>恶意谩骂攻击他人</li>
            </ul>
        </div>
            <a href="<%=request.getContextPath() %>/question/edit" role="button" class="btn btn-info col-md-3">知道了，开始提问</a>
    </div>
    <%--<%@include file="../../jsp/footer.jsp"%>--%>
</div>
<%--鼠标移入移出头像事件--%>
<script>
    layui.use('element', function(){
        var element = layui.element;
        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<%--头部导航点击事件--%>
<script type="text/javascript">
    $(function(){
        $("a[name='nav2']").click(function(){
            $(this).addClass("active").siblings().removeClass("active");
        });
    });
</script>
</body>
</html>
