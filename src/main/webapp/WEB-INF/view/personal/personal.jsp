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
    <title>个人中心-框架</title>
    <script src="/js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <style type="text/css">
        body{background-color: #FFFFFF;margin: 0;}
        #personal-nav{
            width: 130px;
            height: 500px;
            background-color: #8C24DD;
            border: 1px #8C24DD;
            border-radius: 5px;
            margin: 20px 20px 20px 80px;
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
        /* 点击后的样式 */
        #personal-nav ul .active{
            background-color: #FFFFFF;
            color: #8C24DD;
            border: 1px #8C24DD;
            border-radius: 5px;
            padding: 5px 10px;
            margin: 20px 12px;
            display: flex;
            flex-flow: row wrap;
            align-content:space-around;
            text-decoration: none;
        }
        #personal-nav li span{
            padding: 5px 2px;
        }
    </style>
</head>
<body>
    <!-- 侧边导航点击事件 -->
    <script type="text/javascript">
        $(function(){
            $("a[name='dian']").click(function(){
                $(this).addClass("active").siblings().removeClass("active");
            });
        })
    </script>
    <!-- 头部 -->
    <jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
    <!-- 侧边导航 -->
    <div id="personal-nav">
        <ul>
            <%--学习看板--%>
            <a name="dian" class="nodian" target="personal-main"
               href="<%=request.getContextPath()%>/personal/learnlook">
                <li>
                    <i class="layui-icon layui-icon-chart-screen"
                       style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>学习看板</span>
                </li>
            </a>
            <%--学习记录--%>
            <a name="dian" class="nodian" target="personal-main" href="javascript:;">
                <li>
                    <i class="layui-icon layui-icon-form"
                       style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>学习记录</span>
                </li>
            </a>
            <%--个人笔记--%>
            <a name="dian" class="nodian" target="personal-main" href="javascript:;">
                <li>
                    <i class="layui-icon layui-icon-edit"
                       style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>个人笔记</span>
                </li>
            </a>
            <%--我的问答--%>
            <a name="dian" class="nodian" target="personal-main" href="javascript:;">
                <li>
                    <i class="layui-icon layui-icon-survey"
                       style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>我的问答</span>
                </li>
            </a>
            <%--我的文章--%>
            <a name="dian" class="nodian" target="personal-main" href="javascript:;">
                <li>
                    <i class="layui-icon layui-icon-list"
                       style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>我的文章</span>
                </li>
            </a>
            <%--我的关注--%>
            <a name="dian" class="nodian" target="personal-main" href="javascript:;">
                <li>
                    <i class="layui-icon layui-icon-rate"
                       style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>我的关注</span>
                </li>
            </a>
            <%--个人信息--%>
            <a name="dian" class="nodian" target="personal-main" href="javascript:;">
                <li>
                    <i class="layui-icon layui-icon-dialogue"
                       style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>个人信息</span>
                </li>
            </a>
            <%--愿望清单--%>
            <a name="dian" class="nodian" target="personal-main" href="javascript:;">
                <li>
                    <i class="layui-icon layui-icon-release"
                       style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>愿望清单</span>
                </li>
            </a>
        </ul>
    </div>
    <!-- 主体内容 -->
    <iframe name="personal-main" style="border: 1px #FFFFFF;width: 1050px;margin-top: -518px;
            margin-left: 300px;float: left;height: 100%;"></iframe>
    <%--侧栏--%>
    <jsp:include page="/WEB-INF/jsp/sidebar.jsp"></jsp:include>
    <%--尾部--%>
    <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>
