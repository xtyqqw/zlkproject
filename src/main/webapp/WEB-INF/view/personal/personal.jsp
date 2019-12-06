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
<div id="personal">
    <!-- 侧边导航 -->
    <div class="personal-nav">
        <ul>
            <%--学习看板--%>
            <a href="<%=request.getContextPath()%>/duration/select"
               name="dian" class="nodian" target="personal-main">
                <li>
                    <i class="layui-icon layui-icon-chart-screen" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>学习看板</span>
                </li>
            </a>
            <%--学习记录--%>
            <a href="<%=request.getContextPath()%>/courses/tocourses"
               name="dian" target="personal-main">
                <li>
                    <i class="layui-icon layui-icon-form" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>学习记录</span>
                </li>
            </a>
            <%--个人笔记--%>
            <a href="<%=request.getContextPath()%>/myNote/toMyNote"
               name="dian" target="personal-main">
                <li>
                    <i class="layui-icon layui-icon-edit" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>个人笔记</span>
                </li>
            </a>
            <%--我的问答--%>
            <a href="<%=request.getContextPath()%>/myfaqq/faqtest"
               name="dian" target="personal-main">
                <li>
                    <i class="layui-icon layui-icon-survey" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>我的问答</span>
                </li>
            </a>
            <%--我的文章--%>
            <a href="<%=request.getContextPath()%>/articles/toarticles"
               name="dian" target="personal-main">
                <li>
                    <i class="layui-icon layui-icon-list" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>我的文章</span>
                </li>
            </a>
            <%--我的关注--%>
            <a href="<%=request.getContextPath()%>/follow/follower"
               name="dian" target="personal-main">
                <li>
                    <i class="layui-icon layui-icon-rate" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>我的关注</span>
                </li>
            </a>
            <%--个人信息--%>
            <a href="<%=request.getContextPath()%>/personal/findUser" name="dian"
               target="personal-main">
                <li>
                    <i class="layui-icon layui-icon-dialogue" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>个人信息</span>
                </li>
            </a>
            <%--愿望清单--%>
            <a href="javascript:;"
               name="dian" target="personal-main">
                <li>
                    <i class="layui-icon layui-icon-release" style="font-size: 25px;color: #D4D4D4;"></i>
                    <span>愿望清单</span>
                </li>
            </a>
        </ul>
    </div>
    <!-- 个性签名 -->
    <div class="signature">
        <!-- 头像 -->
        <div class="headimg">
            <img src="/img/headimg.jpg" class="headerimg">
        </div>
        <!-- 昵称 -->
        <div class="petname">
            <p>我是大牛</p>
        </div>
        <!-- 签名 -->
        <div class="sdf">
            <p>失败并不可怕，可怕的是你不渴望成功！可怕的是你不渴望成功！</p>
        </div>
    </div>
</div>

<!-- 主体内容 -->
<iframe id="personal-iframe" name="personal-main" scrolling="no" frameborder="0"></iframe>
<%--iframe自适应高度--%>
<script type="text/javascript">
    $(window.parent.document).find("#personal-iframe").load(function(){
        var main = $(window.parent.document).find("#personal-iframe");
        var thisheight = document.documentElement.clientHeight && $(document).height()+30;
        main.height(thisheight);
        /*var ifm= document.getElementById("personal-iframe");
        ifm.height=document.documentElement.clientHeight;*/
    });
</script>
<%--侧栏--%>
<jsp:include page="/WEB-INF/jsp/sidebar.jsp"></jsp:include>
<div style="clear: both"></div>
<%--尾部--%>
<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>
