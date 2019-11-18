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
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
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

        .left {
            width: 14%;
        }

        #leftul {
            width: 100%;
        }

        .bottom {
            width: 100%;
            height: 500px;
        }

        .bottom div {
            float: left;
            height: 505px;
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
    </style>
</head>
<body>
<div class="top">
    <p>新闻管理平台</p>
    <span>计算机科学与技术学院</span><br><br>
    <span>尊敬的用户${loginName}您好，欢迎您的登陆</span><br><br>
    <a href="<%=basePath%>/user/logout" id="logout">退出登录</a>
</div>
<div class="bottom">
    <div class="left">
        <ul id="leftul" class="layui-nav layui-nav-tree" lay-shrink="all" lay-filter="test">
            <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">新闻管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="<%=request.getContextPath()%>/news/toNews" target="maintarget">查看新闻</a></dd>
                    <dd><a href="<%=request.getContextPath()%>/news/toNewsManager" target="maintarget">编辑新闻</a>
                    </dd>
                    <%--<dd><a href="<%=request.getContextPath()%>/product/toProductManager" target="maintarget">产品管理</a>
                    </dd>
                    <dd><a href="">作业管理</a></dd>
                    <dd><a href="">生产计划管理</a></dd>
                    <dd><a href="">生成派工管理</a></dd>--%>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">设备管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="">设备台账</a></dd>
                    <dd><a href="">设备种类</a></dd>
                    <dd><a href="">设备例检</a></dd>
                    <dd><a href="">设备故障</a></dd>
                    <dd><a href="">设备维修</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">工艺监控</a>
                <dl class="layui-nav-child">
                    <dd><a href="">工艺管理</a></dd>
                    <dd><a href="">工艺要求</a></dd>
                    <dd><a href="">公益计划</a></dd>
                    <dd><a href="">工序管理</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">物料监控</a>
                <dl class="layui-nav-child">
                    <dd><a href="">物料信息</a></dd>
                    <dd><a href="">物料收入</a></dd>
                    <dd><a href="">物料消耗</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">质量监控</a>
                <dl class="layui-nav-child">
                    <dd><a href="">不合格品管理</a></dd>
                    <dd><a href="">成品计量质检</a></dd>
                    <dd><a href="">成品计数质检</a></dd>
                    <dd><a href="">工序计量质检</a></dd>
                    <dd><a href="">工序计数质检</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">人员监控</a>
                <dl class="layui-nav-child">
                    <dd><a href="">部门管理</a></dd>
                    <dd><a href="">员工管理</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">系统管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="<%=request.getContextPath()%>/user/toUserManager" target="maintarget">用户管理</a></dd>
                    <dd><a href="<%=request.getContextPath()%>/role/toRoleManager" target="maintarget">角色管理</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <script>
        layui.use('element', function () {
            var element = layui.element;
        });
    </script>
    <div class="main">
        <iframe src="<%=request.getContextPath()%>/loginController/toMain" name="maintarget" frameborder="0"></iframe>
    </div>
</div>
</body>
</html>
