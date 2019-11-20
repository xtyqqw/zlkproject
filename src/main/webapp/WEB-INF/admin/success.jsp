<%@ taglib prefix="shrio" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: l
  Date: 2019/9/16
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>$Title$</title>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css">
    <script src="<%=request.getContextPath() %>/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.ztree.core.js"></script>

    <style type="text/css">
        .top {
            width: 100%;
            background-color: #2D93CA;
            height: 100px;
        }

        .top span, .top a {
            position: relative;
            top: -20px;
            right: 40px;
            float: right;
        }

        .top p {
            position: relative;
            top: 35px;
            text-align: center;
            font-size: 22px;
        }

        .main {
            width: 85%;
        }

        .main iframe {
            height: 100%;
            width: 100%;
        }

        #logout:hover {
            color: white;
        }

        .left {
            width: 14.9%;
        }

        #tree {
            width: 100%;
            height: auto;
            padding-left: 40px;
            padding-top: 35px;
            font-size: 25px;
        }

        .bottom {
            width: 100%;
            height: 500px;
        }

        .bottom div {
            float: left;
            height: 505px;
        }

        #maintarget{
            border-left: black 1px solid;
        }
    </style>
</head>
<body>
<div class="top">
    <p>学习管理平台</p>
    <span>尊敬的用户${loginName}您好，欢迎您的登陆</span><br><br>
    <a href="<%=request.getContextPath()%>/loginController/toLogin" id="logout">退出登录</a>
</div>
<div class="bottom">
    <div class="left">
        <ul id="tree" class="ztree"></ul>
    </div>
    <div class="main">
        <iframe src="<%=request.getContextPath()%>/loginController/toMain" id="maintarget" name="maintarget" frameborder="0"></iframe>
    </div>
</div>

<script type="text/javascript">
    var setting = {
        async: {
            enable: true,
            url: "/function/findFunction",
            dataType: JSON
        },
        view: {
            showIcon: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "functionId",
                pIdKey: "parentId",
                rootPId: 0
            }
        },
        callback:{
            beforeClick: function(treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                if (treeNode.isParent) {
                    zTree.expandNode(treeNode);
                    return false;
                }
            }
        }
    };

    $(document).ready(function(){
        $.fn.zTree.init($("#tree"), setting);
    });
</script>

</body>
</html>
