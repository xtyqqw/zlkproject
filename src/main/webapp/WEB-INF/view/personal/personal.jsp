<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>个人中心</title>
    <script src="/js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <style type="text/css">
        body{background-color: #FFFFFF;margin: 0;}
        #personal{
            height: 550px;
        }
        #personal .personal-nav{
            width: 130px;
            height: 500px;
            background-color: #8C24DD;
            border: 1px #8C24DD;
            border-radius: 5px;
            margin: 0 20px 20px 80px;
            align-content: space-around;
            display: flex;
            float: left;
        }
        #personal .personal-nav ul{
            margin: 0;
        }
        #personal .personal-nav ul li{
            list-style: none;
            display: flex;
            flex-flow: row wrap;
            align-content:space-around;
        }
        #personal .personal-nav ul a:hover{
            background-color: #FFFFFF;
            color: #8C24DD;
        }
        #personal .personal-nav i:hover{
            color: #8C24DD;
        }
        #personal .personal-nav ul a{
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
        #personal .personal-nav ul .active{
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
        #personal .personal-nav li span{
            padding: 5px 2px;
        }
        /* 个性签名 */
        #personal .signature{
            background-color: #FAFAFA;
            width: 1050px;
            height: 130px;
            border: 1px #FAFAFA;
            border-radius: 3px;
            margin: 33px 0 0 320px;
        }
        /* 头像 */
        #personal .signature .headimg{
            float: left;
            margin: 23px 20px 23px 30px;
        }
        #personal .signature .headerimg{
            width: 80px;height: 80px;
            border-radius: 50%;
        }
        /* 昵称 */
        #personal .signature .petname{
            margin-left: 100px;
            padding-top: 20px;
            font-size: 18px;
            width: 300px;
        }
        /* 签名 */
        #personal .signature .sdf{
            margin-left: 100px;
            font-size: 12px;
            width: 500px;
            padding-top: 30px;
        }
        #personal-iframe{
            width: 1050px;
            margin-top: -400px;
            margin-left: 320px;
            float: left;
            height: 100%;
        }
        .logon{
            margin: 20px auto auto 400px;
            font-size: 25px;
            color: #999;
        }
    </style>
</head>
<body>
<!-- 头部 -->
<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
<div id="personal">
    <!-- 侧边导航 -->
    <div class="personal-nav">
        <ul>
            <%--学习看板--%>
            <a href="<%=request.getContextPath()%>/personal/person?typeNum=1"
               name="dian" class="nodian" id="look">
                <li>
                    <i class="layui-icon layui-icon-chart-screen" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>学习看板</span>
                </li>
            </a>
            <%--学习记录--%>
            <a href="<%=request.getContextPath()%>/personal/person?typeNum=2"
               name="dian" id="courses">
                <li>
                    <i class="layui-icon layui-icon-form" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>学习记录</span>
                </li>
            </a>
            <%--个人笔记--%>
            <a href="<%=request.getContextPath()%>/personal/person?typeNum=3"
               name="dian" id="mynote">
                <li>
                    <i class="layui-icon layui-icon-edit" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>个人笔记</span>
                </li>
            </a>
            <%--我的问答--%>
            <a href="<%=request.getContextPath()%>/personal/person?typeNum=4"
               name="dian" id="myfaq">
                <li>
                    <i class="layui-icon layui-icon-survey" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>我的问答</span>
                </li>
            </a>
            <%--我的文章--%>
            <a href="<%=request.getContextPath()%>/personal/person?typeNum=5"
               name="dian" id="myart">
                <li>
                    <i class="layui-icon layui-icon-list" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>我的文章</span>
                </li>
            </a>
            <%--我的关注--%>
            <a href="<%=request.getContextPath()%>/personal/person?typeNum=6"
               name="dian" id="myfollower">
                <li>
                    <i class="layui-icon layui-icon-rate" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>我的关注</span>
                </li>
            </a>
            <%--个人信息--%>
            <a href="<%=request.getContextPath()%>/personal/person?typeNum=7"
               name="dian" id="personalmsg">
                <li>
                    <i class="layui-icon layui-icon-dialogue" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>个人信息</span>
                </li>
            </a>
            <%--愿望清单--%>
            <a href="javascript:;" name="dian">
                <li>
                    <i class="layui-icon layui-icon-release" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>愿望清单</span>
                </li>
            </a>
        </ul>
    </div>
    <c:if test="${user.userId==null}">
        <p class="logon">先登录才能刚看到个人中心哦~</p>
    </c:if>
    <c:if test="${user.userId!=null}">
            <!-- 个性签名 -->
            <div class="signature">
                <!-- 头像 -->
                <div class="headimg">
                    <c:if test="${user.userImg==null}">
                        <img src="/img/headimg.png" class="headerimg">
                    </c:if>
                    <c:if test="${user.userImg!=null}">
                        <img src="${user.userImg}" class="headerimg">
                    </c:if>
                </div>
                <!-- 昵称 -->
                <div class="petname">
                    <p>${user.userRealname}</p>
                </div>
                <!-- 签名 -->
                <div class="sdf">
                    <p>失败并不可怕，可怕的是你不渴望成功！可怕的是你不渴望成功！</p>
                </div>
            </div>
        </div>

        <!-- 主体内容 -->
        <iframe src="<%=request.getContextPath()%>/duration/select" height="341px"
                id="personal-iframe" name="personal-main" scrolling="no" frameborder="0"></iframe>

        <a href="#top" style="position: fixed;top: 550px;right: 30px;z-index: 100;">
            <i class="layui-icon layui-icon-top" style="font-size: 45px;margin-left: 5px;"></i>
        </a>
    </c:if>

<%--iframe自适应高度--%>
<script type="text/javascript">
    /*$("#personal-iframe").load(function () {
        $("#personal-iframe").height(0);
        var height = document.getElementById("personal-iframe").contentWindow.document.body.scrollHeight;
        $("#personal-iframe").height(height);
    });*/
    /*$(window.parent.document).find("#personal-iframe").load(function(){
        var main = $(window.parent.document).find("#personal-iframe");
        main.height(800);
        var thisheight = $(document).height();
        main.height(thisheight);
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
        $("#personal-iframe").css("height","341");
        /*学习看板*/
        if (typeNum === 1){
            $("#personal-iframe").attr("src",basePath+"duration/select");
            $("#personal-iframe").css("height","341");
            $("#look").css("background-color","#fff");
            $("#look").css("color","#8C24DD");
            document.title = '个人中心-学习看板';
        }
        /*学习记录*/
        if (typeNum === 2){
            $("#personal-iframe").attr("src",basePath+"courses/gocourses");
            $("#personal-iframe").css("height","1087");
            $("#courses").css("background-color","#fff");
            $("#courses").css("color","#8C24DD");
            document.title = '个人中心-学习记录';
        }
        /*个人笔记*/
        if (typeNum === 3){
            $("#personal-iframe").attr("src",basePath+"myNote/toMyNote");
            $("#personal-iframe").css("height","800");
            $("#mynote").css("background-color","#fff");
            $("#mynote").css("color","#8C24DD");
            document.title = '个人中心-个人笔记';
        }
        /*我的问答*/
        if (typeNum === 4){
            $("#personal-iframe").attr("src",basePath+"myfaqq/faqtest");
            $("#personal-iframe").css("height","898");
            $("#myfaq").css("background-color","#fff");
            $("#myfaq").css("color","#8C24DD");
            document.title = '个人中心-我的问答';
        }
        /*我的文章*/
        if (typeNum === 5){
            $("#personal-iframe").attr("src",basePath+"articles/toarticles");
            $("#personal-iframe").css("height","1030");
            $("#myart").css("background-color","#fff");
            $("#myart").css("color","#8C24DD");
            document.title = '个人中心-我的文章';
        }
        /*我的关注*/
        if (typeNum === 6){
            $("#personal-iframe").attr("src",basePath+"follow/follower");
            $("#personal-iframe").css("height","1109");
            $("#myfollower").css("background-color","#fff");
            $("#myfollower").css("color","#8C24DD");
            document.title = '个人中心-我的关注';
        }
        /*个人信息*/
        if (typeNum === 7){
            $("#personal-iframe").attr("src",basePath+"personal/findUser");
            $("#personal-iframe").css("height","915");
            $("#personalmsg").css("background-color","#fff");
            $("#personalmsg").css("color","#8C24DD");
            document.title = '个人中心-个人信息';
        }
        /*if (typeNum === 8){
            $("#personal-iframe").attr("src",basePath+"opinion/toOpinion");
            $("#personal-iframe").css("height","485");
            $("#opinion").css("background-color","#fff");
            $("#opinion").css("color","#8C24DD");
        }*/
    })
</script>
<%--侧栏--%>
<jsp:include page="/WEB-INF/jsp/sidebar.jsp"></jsp:include>
<div style="clear: both"></div>
<%--尾部--%>
<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>
