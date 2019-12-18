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
    <link rel="shortcut icon" href="https://gper.club/server-img/avatars/000/00/35/user_origin_3553.jpg"
          type="image/x-icon"/>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            overflow-x: hidden;
        }

        .all-body {
            border: none 0;
        }

        .all-body-center {
            float: left;
            width: 900px;
            margin-left: 310px;
            border: 0px;
            margin-top: 50px;
        }

        h2 {
            color: #1E90FF;
            font-weight: bold;
        }

        .center {
            margin-top: 40px;
            float: left;
            margin-left: 420px;
        }

        .center h4 {
            color: #595959;
            font-size: 18px;
            font-weight: bold;
        }

        .center ul {
            list-style-type: circle;
            padding-bottom: 30px;
            margin-top: 10px;
        }

        .center li {
            font-size: 15px;
            margin-top: 5px;
            margin-left: 15px;
            color: #8D8D8D;
            list-style-type: circle;
        }

        .main a {
            background-color: #1E90FF;
            margin-left: 240px;
            margin-top: 20px;
        }

        .down {
            margin-top: 540px;
            height: 35px;
            padding-bottom: 100px;
        }
    </style>
</head>
<body>
<div class="all-body">
    <%@include file="../../jsp/header.jsp" %>
    <div class="all-body-center">
        <svg t="1574647601107" class="icon" viewBox="0 0 1024 1024" version="1.1"
             xmlns="http://www.w3.org/2000/svg" p-id="3562" style="float: left;margin-left: 300px;" width="40"
             height="40">
            <path d="M544 572.736V640h-64v-128h32c52.928 0 96-43.072 96-96 0-52.96-43.072-96-96-96l-0.288 0.032a96.064 96.064 0 0 0-95.712 96h-64a160.128 160.128 0 0 1 159.712-160H512c88.224 0 160 71.744 160 160a160.224 160.224 0 0 1-128 156.704M511.712 800a48 48 0 1 1 0-96 48 48 0 0 1 0 96M512 64C264.576 64 64 264.544 64 512c0 247.424 200.576 448 448 448s448-200.576 448-448c0-247.456-200.576-448-448-448"
                  fill="#1296db" p-id="3563"></path>
        </svg>
        <h2 style="float: left;font-weight:bold">&nbsp;快速了解Zlk提问</h2>
    </div>

    <div class="center">
        <div style="float: left">

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
            <h4 style="color: #E00000;">违规说明</h4>
            <ul>
                <li>没有尝试找寻答案之前而频繁发布问题</li>
                <li>发布违法、低俗等不良内容或广告</li>
                <li>恶意谩骂攻击他人</li>
            </ul>
        </div>
    </div>
    <br>
    <div class="down">
        <div style="margin-left: 600px">
            <a href="<%=request.getContextPath() %>/question/editQuestion" role="button"
               class="btn btn-info col-md-4" >知道了，开始提问</a>
        </div>
    </div>
</div>
</body>
</html>
