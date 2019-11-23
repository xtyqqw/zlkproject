<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/11/18
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>尾部</title>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <style type="text/css">
        body{margin: 0;}
        #footer{
            background-color: #333C4D;
            height: 130px;
            width: 100%;
            margin-top: 50px;
            margin-bottom: 0;
            position: absolute;
        }
        #footer ul{
            padding-top: 30px;
            width: 800px;
            height: 30px;
            margin: 0 auto;
            border-bottom: 1px solid #999999;
        }
        #footer ul li{
            float: left;
            list-style: none;
            padding-left: 30px;
        }
        #footer ul li a{
            color: #989898;
            text-decoration: none;
            float: left;
            padding-left: 20px;
        }
        #footer ul li a:hover{
            color: #F2F2F2;
        }
        #footer hr{
            width: 800px;
            color: #989898;
        }
        #footer p{
            color: #989898;
            text-align: center;
            padding-top: 10px;
        }
    </style>
</head>
<body>
<div id="footer">
    <ul>
        <li>
            <a href="<%=request.getContextPath()%>/aboutus/aboutzlk">关于我们</a>
        </li>
        <li>
            <a href="javascript:;">加入我们</a>
        </li>
        <li>
            <a href="javascript:;">联系我们</a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/lecturer/lecturers">讲师合作</a>
        </li>
        <li>
            <a href="javascript:;">帮助中心</a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/aboutus/blogroll">友情链接</a>
        </li>
        <li>
            <a href="javascript:;">合作企业</a>
        </li>
    </ul>
    <p>
        copyright&nbsp;&nbsp;&nbsp;&nbsp;2017&nbsp;&nbsp;&nbsp;&nbsp;北京智量酷教育科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;京ICP备09076312号
    </p>
</div>
</body>
</html>
