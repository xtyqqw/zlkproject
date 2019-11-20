<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/11/19
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>关于我们-框架</title>
    <style type="text/css">
        body{margin: 0;}
        #about-nav{
            width: 130px;
            height: 500px;
            background-color: #8C24DD;
            border: 1px #8C24DD;
            border-radius: 5px;
            margin: 20px;
            align-content: space-around;
            display: flex;
        }
        #about-nav ul{
            margin: 0;
            padding: 0;
        }
        #about-nav ul li{
            list-style: none;
            display: flex;
            flex-flow: row wrap;
            align-content:space-around;
        }
        #about-nav ul a:hover{
            background-color: #FFFFFF;
            color: #8C24DD;
        }
        #about-nav ul a{
            color: #FFFFFF;
            border: 1px #8C24DD;
            border-radius: 5px;
            padding: 5px 15px;
            margin: 20px 12px;
            display: flex;
            flex-flow: row wrap;
            align-content:space-around;
            text-decoration: none;
        }
        #about-nav li span{
            padding: 5px;
        }
    </style>
</head>
<body>
    <!-- 头部 -->
    <jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
    <!-- 侧边导航 -->
    <div id="about-nav">
        <ul>
            <a href="<%=request.getContextPath()%>/aboutus/aboutzlk">
                <li>
                    <span>关于我们</span>
                </li>
            </a>
            <a href="javascript:;">
                <li>
                    <span>团队介绍</span>
                </li>
            </a>
            <a href="javascript:;">
                <li>
                    <span>合作企业</span>
                </li>
            </a>
            <a href="javascript:;">
                <li>
                    <span>讲师合作</span>
                </li>
            </a>
            <a href="javascript:;">
                <li>
                    <span>帮助中心</span>
                </li>
            </a>
            <a href="javascript:;">
                <li>
                    <span>友情链接</span>
                </li>
            </a>
            <a href="javascript:;">
                <li>
                    <span>联系我们</span>
                </li>
            </a>
            <a href="javascript:;">
                <li>
                    <span>意见反馈</span>
                </li>
            </a>
        </ul>
    </div>
    <%--侧栏--%>
    <jsp:include page="/WEB-INF/jsp/sidebar.jsp"></jsp:include>
</body>
</html>
