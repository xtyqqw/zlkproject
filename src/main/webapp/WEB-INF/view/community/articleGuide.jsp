<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/11/25
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发文须知</title>
    <link href="https://cdn.bootcss.com/semantic-ui/2.2.4/semantic.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .main {
            width: auto;
            height: 700px;
            /*border: #8D8D8D 2px solid;*/
        }
        header {
            margin-left: 510px;
            margin-top: 40px;
            margin-bottom: 40px;
        }
        header svg {
            float: left;
        }
        header h2 {
            color: #1296db;
            padding-left: 20px;
            font-weight: bold;
        }
        h4 {
            color: #2e383c;
            font-weight: bold;
        }
        ul {
            list-style-type: circle;
            padding-bottom: 30px;
        }
        li {
            color: #8D8D8D;
        }
        .rule {
            color: #E00000;
        }
        .content {
            margin-left: 300px;
        }
        .main a {
            background-color: #1296db;
            margin-left: 550px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%--<%@include file="../../jsp/header.jsp"%>--%>
    <div class="main">
        <header>
            <%--从阿里矢量图标库获取--%>
            <svg t="1574647601107" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3562" width="40" height="40"><path d="M544 572.736V640h-64v-128h32c52.928 0 96-43.072 96-96 0-52.96-43.072-96-96-96l-0.288 0.032a96.064 96.064 0 0 0-95.712 96h-64a160.128 160.128 0 0 1 159.712-160H512c88.224 0 160 71.744 160 160a160.224 160.224 0 0 1-128 156.704M511.712 800a48 48 0 1 1 0-96 48 48 0 0 1 0 96M512 64C264.576 64 64 264.544 64 512c0 247.424 200.576 448 448 448s448-200.576 448-448c0-247.456-200.576-448-448-448" fill="#1296db" p-id="3563"></path></svg>
            <h2>&nbsp;快速了解如何发文</h2>
        </header>
        <div class="content">
            <h4>写前须知</h4>
            <ul>
                <li>这不止是你的个人文章，也是给大家阅读的文章，请认真撰写，和我们一起讨论分享</li>
            </ul>
            <h4>好文章应该具备这些条件</h4>
            <ul>
                <li>原创性高，专业性强，让人看后能为之受用</li>
                <li>规范有层次的对字段进行排版</li>
                <li>与大家分享相关的开发技巧、职业心得、业内新闻等有意义内容</li>
            </ul>
            <h4>热心和大家交流</h4>
            <ul>
                <li>相信团队的力量，和大家交流碰撞出有趣的点子或技巧</li>
            </ul>
            <h4 class="rule">违规说明</h4>
            <ul>
                <li>频繁发布无意义内容，随意灌水</li>
                <li>发布违法、低俗等不良内容或广告</li>
                <li>恶意谩骂攻击他人</li>
            </ul>
        </div>
        <%--javascript:void(0)--%>
        <a href="<%=request.getContextPath() %>/community/article-edit" role="button" class="btn btn-info col-md-2">知道了，开始撰写</a>
    </div>
    <%--<div class="ui success message">
        <c:if test="${not empty message}">
            <i class="close icon"></i>
            <div class="header">提示：</div>
            <p>${message}</p>
        </c:if>
    </div>--%>

    <script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>

    <script>
        //消息提示关闭初始化
        /*$('.message .close')
            .on('click', function () {
                $(this)
                    .closest('.message')
                    .transition('fade');
            });*/
    </script>
    <%--<%@include file="../../jsp/footer.jsp"%>--%>
</body>
</html>
