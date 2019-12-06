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
    <script src="/js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <style type="text/css">
        body{margin: 0;}
        #about-nav{
            width: 130px;
            height: 500px;
            background-color: #8C24DD;
            border: 1px #8C24DD;
            border-radius: 5px;
            margin: 20px 20px 20px 80px;
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
        #about-nav ul .nodian{
            color: #FFFFFF;
            border: 1px #8C24DD;
            border-radius: 5px;
            padding: 5px 15px;
            margin: 20px 16px;
            display: flex;
            flex-flow: row wrap;
            align-content:space-around;
            text-decoration: none;
        }
        /* 点击后的样式 */
        #about-nav ul .active{
            background-color: #FFFFFF;
            color: #8C24DD;
            border: 1px #8C24DD;
            border-radius: 5px;
            padding: 5px 15px;
            margin: 20px 16px;
            display: flex;
            flex-flow: row wrap;
            align-content:space-around;
            text-decoration: none;
        }
        #about-nav li span{
            padding: 5px;
        }
        #aboutus-iframe{
            width: 1050px;
            margin-top: -518px;
            margin-left: 300px;
            float: left;
            height: 100%;
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
<div id="about-nav">
    <ul>
        <a href="<%=request.getContextPath()%>/aboutus/findAboutus"
           name="dian" class="nodian" target="aboutus-main">
            <li>
                <span>关于我们</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/aboutus/teamIntroduce" name="dian" class="nodian" target="aboutus-main">
            <li>
                <span>团队介绍</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/coop/toCoo" name="dian" class="nodian" target="aboutus-main">
            <li>
                <span>合作企业</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/lecturer/lecturers" name="dian" class="nodian" target="aboutus-main">
            <li>
                <span>讲师合作</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/coop/help" name="dian" class="nodian" target="aboutus-main">
            <li>
                <span>帮助中心</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/coop/tofriends"
           name="dian" class="nodian" target="aboutus-main">
            <li>
                <span>友情链接</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/contactus/findContactus" name="dian" class="nodian" target="aboutus-main">
            <li>
                <span>联系我们</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/opinion/addOpinion" name="dian" class="nodian" target="aboutus-main">
            <li>
                <span>意见反馈</span>
            </li>
        </a>
    </ul>
</div>

<!-- 主体内容 -->
<iframe id="aboutus-iframe" name="aboutus-main"  frameborder="0" scrolling="no"></iframe>
<%--iframe自适应高度--%>
<script type="text/javascript">
    $(window.parent.document).find("#aboutus-iframe").load(function(){
        var main = $(window.parent.document).find("#aboutus-iframe");
        var thisheight = $(document).height()+30;
        main.height(thisheight);
    });
</script>
<%--侧栏--%>
<jsp:include page="/WEB-INF/jsp/sidebar.jsp"></jsp:include>
<div style="clear: both"></div>
<%--尾部--%>
<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>
