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
    <title>学习网站后台管理系统</title>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css">
    <script src="<%=request.getContextPath() %>/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.ztree.excheck.js"></script>

    <style type="text/css">
        .outer{
            background-color: #4E5465;
            /*background-image:url(<%=request.getContextPath()%>/img/admin/login_bg.jpg);*/
        }

        .top {
            width: 100%;
            height: 13%;
            background-image:url(<%=request.getContextPath()%>/img/admin/admin_logo.png);
            background-repeat:no-repeat;
            background-position: 30px center;
        }

        .top span {
            position: relative;
            margin-top: 15px;
            right: 40px;
            float: right;
            color: white;
        }

        .main {
            width: 86%;
            margin: 0;
            padding: 0;
        }

        .main iframe {
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
        }

        #logout{
            color: white;
            position: absolute;
            margin-top: 15px;
            right: 40px;
            float: right;
        }

        #logout:hover {
            color: black;
        }

        .left {
            overflow-y: scroll;
            scrollbar-color: transparent transparent;
            scrollbar-track-color: transparent;
            -ms-scrollbar-track-color: transparent;
            width: 100%;
            height: 100%;
            background-color: #393D49;
        }

        /* 设置滚动条的样式 */
        ::-webkit-scrollbar {
            width:6px;
            background-color: aqua;
        }

        /* 滚动槽 */
        ::-webkit-scrollbar-track {
            border-radius:10px;
        }

        /* 滚动条滑块 */
        ::-webkit-scrollbar-thumb {
            border-radius:10px;
            background:#393D49;
        }

        ::-webkit-scrollbar {
            width: 6px;
            background-color: #393D49;
        }

        ::-webkit-scrollbar-thumb {
            background-color: #5a76cd;
        }

        .bottom {
            width: 100%;
            height: 86.9%;
        }

        .bottom div {
            float: left;
            height: 100%;
        }

        .leftOuter{
            width: 13.9%;
            height: 100%;
        }
    </style>
</head>
<body>
<div class="outer">
    <div class="top">
        <span>尊敬的用户${loginName}您好，欢迎您的登陆</span><br><br>
        <a href="<%=basePath%>/logout" id="logout">退出登录</a>
    </div>
</div>
<div class="bottom">
    <div class="leftOuter">
        <div class="left">
            <ul id="tree" class="ztree"></ul>
        </div>
    </div>
    <div class="main">
        <iframe src="<%=request.getContextPath()%>/loginController/toMain" id="maintarget" name="maintarget" frameborder="0"></iframe>
    </div>
</div>

<script type="text/javascript">
    var setting = {
        async: {
            enable: true,
            url: "<%=request.getContextPath()%>/function/findFunction",
            dataType: JSON
        },
        view: {
            showIcon: false,
            showLine: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pid",
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
