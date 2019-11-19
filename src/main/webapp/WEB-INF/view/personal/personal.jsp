<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/11/19
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心-对内版</title>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <style type="text/css">
        body{background-color: #FFFFFF;margin: 0;}
        #personal-nav{
            width: 130px;
            height: 500px;
            background-color: #8C24DD;
            border: 1px #8C24DD;
            border-radius: 5px;
            margin: 20px;
            align-content: space-around;
            display: flex;
        }
        #personal-nav ul{
            margin: 0;
        }
        #personal-nav ul li{
            list-style: none;
            display: flex;
            flex-flow: row wrap;
            align-content:space-around;
        }
        #personal-nav ul a:hover{
            background-color: #FFFFFF;
            color: #8C24DD;
        }
        #personal-nav i:hover{
            color: #8C24DD;
        }
        #personal-nav ul a{
            color: #FFFFFF;
            border: 1px #8C24DD;
            border-radius: 5px;
            padding: 5px 10px;
            margin: 20px 12px;
            display: flex;
            flex-flow: row wrap;
            align-content:space-around;
        }
        #personal-nav li span{
            padding: 5px 2px;
        }
    </style>
</head>
<body>
    <!-- 头部 -->
    <jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
    <!-- 侧边导航 -->
    <div id="personal-nav">
        <ul>
            <%--学习看板--%>
            <a href="<%=request.getContextPath()%>/personal/learnlook" target="main">
                <li>
                    <i class="layui-icon layui-icon-chart-screen"
                       style="font-size: 25px;color: #FFFFFF;"></i>
                    <span>学习看板</span>
                </li>
            </a>
            <%--学习记录--%>
            <a href="javascript:;" target="main">
                <li>
                    <i class="layui-icon layui-icon-form"
                       style="font-size: 25px;color: #FFFFFF;"></i>
                    <span>学习记录</span>
                </li>
            </a>
            <%--个人笔记--%>
            <a href="javascript:;" target="main">
                <li>
                    <i class="layui-icon layui-icon-edit"
                       style="font-size: 25px;color: #FFFFFF;"></i>
                    <span>个人笔记</span>
                </li>
            </a>
            <%--我的问答--%>
            <a href="javascript:;" target="main">
                <li>
                    <i class="layui-icon layui-icon-survey"
                       style="font-size: 25px;color: #FFFFFF;"></i>
                    <span>我的问答</span>
                </li>
            </a>
            <%--我的文章--%>
            <a href="javascript:;" target="main">
                <li>
                    <i class="layui-icon layui-icon-list"
                       style="font-size: 25px;color: #FFFFFF;"></i>
                    <span>我的文章</span>
                </li>
            </a>
            <%--我的关注--%>
            <a href="javascript:;" target="main">
                <li>
                    <i class="layui-icon layui-icon-rate"
                       style="font-size: 25px;color: #FFFFFF;"></i>
                    <span>我的关注</span>
                </li>
            </a>
            <%--个人信息--%>
            <a href="javascript:;" target="main">
                <li>
                    <i class="layui-icon layui-icon-dialogue"
                       style="font-size: 25px;color: #FFFFFF;"></i>
                    <span>个人信息</span>
                </li>
            </a>
            <%--愿望清单--%>
            <a href="javascript:;" target="main">
                <li>
                    <i class="layui-icon layui-icon-release"
                       style="font-size: 25px;color: #FFFFFF;"></i>
                    <span>愿望清单</span>
                </li>
            </a>
        </ul>
    </div>
    <%--侧栏--%>
    <jsp:include page="/WEB-INF/jsp/sidebar.jsp"></jsp:include>
    <!-- 主体内容 -->
    <iframe name="main" style="border: 1px #ffffff;height: 100%;
            width: 1050px;margin-top: -518px;margin-left: 10px;"></iframe>
    <%--尾部--%>
    <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>
