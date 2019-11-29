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

    <style type="text/css">
        .outer{
            background-image:url(<%=request.getContextPath()%>/img/admin/login_bg.jpg);
        }

        .top {
            width: 100%;
            height: 100px;
            background-image:url(<%=request.getContextPath()%>/img/admin/admin_logo.png);
            background-repeat:no-repeat;
            background-position: 30px center;
        }

        .top span {
            position: relative;
            margin-top: 25px;
            right: 40px;
            float: right;
        }

        .main {
            width: 85%;
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
            color: black;
            position: relative;
            margin-top: 25px;
            right: -178px;
            float: right;
        }

        #logout:hover {
            color: white;
        }

        .left {

            width: 100%;
            height: 100%;
            background-image:url(<%=request.getContextPath()%>/img/admin/dao_hang_lan.jpg);
        }

        /* 设置滚动条的样式 */
        ::-webkit-scrollbar {
            width:12px;
            background-color: aqua;
        }

        /* 滚动槽 */
        ::-webkit-scrollbar-track {
            border-radius:10px;
        }

        /* 滚动条滑块 */
        ::-webkit-scrollbar-thumb {
            border-radius:10px;
            background:black;
        }

        ::-webkit-scrollbar {
            width: 6px;
            background-color: #181c32;
        }

        ::-webkit-scrollbar-thumb {
            background-color: #5a76cd;
        }

        #tree {
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
            height: 500px;
        }

        .leftOuter{
            overflow: auto;
            width: 14.9%;
            height: 500px;
            background-image:url(<%=request.getContextPath()%>/img/admin/dao_hang_lan.jpg);
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

<%--<script type="text/javascript">
    $(function () {
        $.ajax({
            type: "post",
            url: "/function/findFunction",
            dataType: "json",
            success: function (data) {
                console.info(data);
                layui.tree.render({
                    elem: '#tree',// 传入元素选择器
                    nodes: data,
		     	    spread:true,
                    click: function (node) {// 点击tree菜单项的时候
                        var element = layui.element;
                        var exist = $("li[lay-id='" + node.id + "']").length;//判断是不是用重复的选项卡
                        if (exist > 0) {
                            element.tabChange('tabs', node.id);// 切换到已有的选项卡
                        } else {
                            if (node.attributes.menuURL != null && node.attributes.menuURL != "") {// 判断是否需要新增选项卡
                                element.tabAdd(
                                    'tabs',
                                    {
                                        title: node.name,
                                        content: '<iframe   scrolling="yes" frameborder="0" src=" '
                                            + node.attributes.menuURL
                                            + ' " width="100%" height="100%"></iframe>'// 支持传入html
                                        ,
                                        // width="99%" height="99%"
                                        id: node.id
                                    });
                                element.tabChange('tabs', node.id);
                            }
                        }

                    }

                });

            }

        });
    })
</script>--%>

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
