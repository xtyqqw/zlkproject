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
            width: 70%;
            margin-top: -518px;
            margin-left: 300px;
            float: left;
            height: 100%;
            vertical-align:middle;
        }
    </style>
</head>
<body>
<!-- 头部 -->
<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
<!-- 侧边导航 -->
<div id="about-nav">
    <ul>
        <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=7"
           name="dian" class="nodian" id="aboutzlk">
            <li>
                <span>关于我们</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=1"
           name="dian" class="nodian" id="team">
            <li>
                <span>团队介绍</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=2"
           name="dian" class="nodian" id="coo">
            <li>
                <span>合作企业</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=3"
           name="dian" class="nodian" id="teacher">
            <li>
                <span>讲师合作</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=4"
           name="dian" class="nodian" id="help">
            <li>
                <span>帮助中心</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=5"
           name="dian" class="nodian" id="friend">
            <li>
                <span>友情链接</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=6"
           name="dian" class="nodian" id="us">
            <li>
                <span>联系我们</span>
            </li>
        </a>
        <a href="<%=request.getContextPath()%>/aboutus/aboutus?typeNum=8"
           name="dian" class="nodian" id="opinion">
            <li>
                <span>意见反馈</span>
            </li>
        </a>
    </ul>
</div>

<!-- 主体内容 -->
<div>
    <iframe src="<%=request.getContextPath()%>/aboutus/aboutzlk" id="aboutus-iframe"
        name="aboutus-main" frameborder="0" scrolling="no"></iframe>
</div>

<script type="text/javascript">
    /*iframe自适应高度*/
    /*$("#aboutus-iframe").load(function () {
        $("#aboutus-iframe").height(0);
        var height = document.getElementById("aboutus-iframe").contentWindow.document.body.scrollHeight;
        $("#aboutus-iframe").height(height);
    });*/
    /*侧边导航点击事件*/
    $(function(){
        $("a[name='dian']").click(function(){
            $(this).siblings().css("background-color","#8C24DD");
            $(this).siblings().css("color","#fff");
            $(this).css("background-color","#fff");
            $(this).css("color","#8C24DD");
        });
    });
    var localObj = window.location;
    var contextPath = localObj.pathname.split("/")[1];
    var basePath = localObj.protocol+"//"+localObj.host+"/";
    var typeNum = ${typeNum};
    $(function () {
        /*团队介绍*/
        if (typeNum === 1){
            $("#aboutus-iframe").attr("src",basePath+"aboutus/teamIntroduce");
            $("#aboutus-iframe").css("height","900");
            $("#team").css("background-color","#fff");
            $("#team").css("color","#8C24DD");
            document.title = '团队介绍';
        }
        /*合作企业*/
        if (typeNum === 2){
            $("#aboutus-iframe").attr("src",basePath+"coop/toCoo");
            $("#aboutus-iframe").css("height","660");
            $("#coo").css("background-color","#fff");
            $("#coo").css("color","#8C24DD");
            document.title = '合作企业';
        }
        /*合作企业*/
        if (typeNum === 3){
            $("#aboutus-iframe").attr("src",basePath+"lecturer/lecturers");
            $("#aboutus-iframe").css("height","1724");
            $("#teacher").css("background-color","#fff");
            $("#teacher").css("color","#8C24DD");
            document.title = '合作企业';
        }
        /*帮助中心*/
        if (typeNum === 4){
            $("#aboutus-iframe").attr("src",basePath+"coop/help");
            $("#aboutus-iframe").css("height","660");
            $("#help").css("background-color","#fff");
            $("#help").css("color","#8C24DD");
            document.title = '帮助中心';
        }
        /*友情链接*/
        if (typeNum === 5){
            $("#aboutus-iframe").attr("src",basePath+"coop/tofriends");
            $("#aboutus-iframe").css("height","660");
            $("#friend").css("background-color","#fff");
            $("#friend").css("color","#8C24DD");
            document.title = '友情链接';
        }
        /*联系我们*/
        if (typeNum === 6){
            $("#aboutus-iframe").attr("src",basePath+"contactus/findContactus");
            $("#aboutus-iframe").css("height","708");
            $("#us").css("background-color","#fff");
            $("#us").css("color","#8C24DD");
            document.title = '联系我们';
        }
        /*关于我们*/
        if (typeNum === 7){
            $("#aboutus-iframe").attr("src",basePath+"aboutus/aboutzlk");
            $("#aboutus-iframe").css("height","660");
            $("#aboutzlk").css("background-color","#fff");
            $("#aboutzlk").css("color","#8C24DD");
            document.title = '关于我们';
        }
        /*意见反馈*/
        if (typeNum === 8){
            $("#aboutus-iframe").attr("src",basePath+"opinion/toOpinion");
            $("#aboutus-iframe").css("height","485");
            $("#opinion").css("background-color","#fff");
            $("#opinion").css("color","#8C24DD");
            document.title = '意见反馈';
        }
    })
</script>
<jsp:include page="/WEB-INF/jsp/sidebar.jsp"></jsp:include>
<div style="clear: both"></div>
<%--尾部--%>
<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>
