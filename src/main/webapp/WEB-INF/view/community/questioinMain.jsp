<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>社区</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/layui/layui.all.js"></script>
    <style type="text/css">
        body{
            overflow-x:hidden;
            overflow-y:hidden;
        }
        .all-body{
            text-align:center;
            border: none 0;
        }
        .all-body-center{
            width: autopx;
            height: auto;
            margin:0 auto;
            border: none 0;
        }
        .all-body-center .body-top{
            width: 1000px;
            height: 115px;
        }
        .all-body-center .body-left{
            float: left;
            width: 930px;
            height: 1500px;
            border: none 0;
        }


        /*中间有竖线导航栏样式*/
        .tab{
            border: none;
            width: 220px;
            position: relative;
            left: -2px;
            bottom: -31px;
        }
        .tab a{
            color:  #989898;
            font-size: 16px;
            padding: 0 10px;
            line-height: 1px;
            text-align: left;
            text-decoration:none;
        }
        .tab a:hover{
            color: #1296db;
        }
        .tab a:first-child{
            border-left: none;
        }
        span{
            color: #D0D0D0;
        }
        /*选项卡内容框样式*/
        iframe{
            width: 100%;
            height: 98%;
            vertical-align: middle;
            border: none 0;
        }
        .wz_remenwenzhang{
            position: absolute;
            width: 200px;
            margin-left: 68vw;
            margin-top: 0vw;
        }
        .wz_remen{
            background-color: rgba(192,192,192,0.1);
            float: left;
            width: 20vw;
            color: black;
            font-size: 1.4vw;
            font-weight:bold;
            height: 4vw;
            line-height: 4vw;
            border-bottom: 0.1vw solid blue;
            margin-left: 4vw;
            margin-top: 1vw;
        }
        .wz_remen_wz{
            margin-left: 1vw;
            float: left;
            width: 8vw;
        }
        .wz_remen_wz span{
            color: black;
        }
        .anniu{
            float: left;
            font-size: 1vw;
            margin-top: -3.3vw;
            margin-left: 16vw;
        }
        .yueanniu{
            -webkit-border-top-left-radius: 5px;
            -webkit-border-bottom-left-radius: 5px;
            margin-top: 0.3vw;
            margin-left: -0.8vw;
            border: 1px solid white;
            line-height: 2vw;
            text-align: center;
            width: 2vw;
            height: 2vw;
            color: white;
            background-color: blue;
        }
        .zonganniu{
            -webkit-border-top-right-radius: 5px;
            -webkit-border-bottom-right-radius: 5px;
            margin-top: -2.2vw;
            margin-left: 1.1vw;
            border: 1px solid white;
            line-height: 2vw;
            text-align: center;
            width: 2vw;
            height: 2vw;
            color: black;
            background-color: white;
        }
        .wz_remen_zt1{
            background-color: rgba(192,192,192,0.1);
            width: 20vw;
            margin-left: 4vw;
            position: absolute;
            margin-top: 5vw;
        }
        .wz_remen_zt1 ul li{
            width: 20vw;
            height: 5vw;
            padding:0.5vw 0 0 1vw;
        }
        .wz_remen_zt1 ul li:nth-child(1){
            margin-top: 0.5vw;
        }

        .wz_remen_zt2{
            display: none;
            background-color: rgba(192,192,192,0.1);
            width: 20vw;
            margin-left: 4vw;
            position: absolute;
            margin-top: 5vw;
        }
        .wz_remen_zt2 ul li{
            width: 20vw;
            height: 5vw;
            padding:0.5vw 0 0 1vw;
        }
        .wz_remen_zt2 ul li:nth-child(1){
            margin-top: 0.5vw;
        }


        .wz_remen_img img{
            width: 100%;
            height: 100%
        }
        .wz_remen_bt{
            float: left;
            width: 18vw;
            height: 4vw;
            line-height: 3vw;
            font-size: 1.1vw;
            margin-left: 1vw;
            overflow: hidden;
        }
        .bt{
            float: left;
            margin-top: -0.5vw;
            height: 0vw;
            font-size: 1.2vw;
        }
        .wz_bt_bq{
            float: right;
            margin-top: 2vw;
            font-size: 0.5vw;
        }
        .wz_bt_bq span{
            color: black;
            margin-right: 0.6vw;
        }
    </style>
</head>
<body>
<div class="all-body">

    <div class="all-body-center">
        <div class="body-top">

            <div class="tab">
              <%--  <a href="<%=request.getContextPath()%>/article/findByCreateTime" target="pageTarget">最新</a>
                <span>|</span>
                <a href="<%= request.getContextPath()%>/article/findByBrowseCount" target="pageTarget">热门</a>
                <span>|</span>--%>
                <a href="<%= request.getContextPath()%>/article/findByUserId" target="pageTarget">我的提问</a>
            </div>
        </div>
        <div class="body-left">
            <div class="body-context">
                <iframe name="pageTarget" frameborder="1" src="/article/toArticleAll"> </iframe>
            </div>
        </div>
        <div class="wz_remenwenzhang">
            <div class="wz_remen">
                <div class="wz_remen_wz">
                    <span>热门文章</span>
                </div>
                <div class="anniu">
                    <div class="yueanniu">月</div><div class="zonganniu">总</div>
                </div>
            </div>
            <div class="wz_remen_zt1">
                <ul>
                    <c:forEach items="${alist}" var="article">
                        <li>
                            <a href="/community/article-show">
                                    <%--<div class="wz_remen_img">
                                        <img src="<c:out value="${article.userImg}"></c:out>" >
                                    </div>--%>
                                <div class="wz_remen_bt">
                                    <div class="bt"><c:out value="${article.title}"></c:out></div>
                                    <div class="wz_bt_bq">
                                        <span><i class="layui-icon">&#xe705;</i>&nbsp;&nbsp;阅读<c:out value="${article.browseCount}"></c:out></span>
                                        <span><i class="layui-icon">&#xe611;</i>&nbsp;&nbsp;评论<c:out value="${article.commentCount}"></c:out></span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="wz_remen_zt2">
                <ul>
                    <c:forEach items="${blist}" var="article">
                        <li>
                            <a href="/community/article-show">
                                    <%--<div class="wz_remen_img">
                                        <img src="<c:out value="${article.userImg}"></c:out>" >
                                    </div>--%>
                                <div class="wz_remen_bt">
                                    <div class="bt"><c:out value="${article.title}"></c:out></div>
                                    <div class="wz_bt_bq">
                                        <span><i class="layui-icon">&#xe705;</i>&nbsp;&nbsp;阅读<c:out value="${article.browseCount}"></c:out></span>
                                        <span><i class="layui-icon">&#xe611;</i>&nbsp;&nbsp;评论<c:out value="${article.commentCount}"></c:out></span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
    $(document).on('mouseenter','.bt',function(){
        $(this).css('color','blue');
    })
    $(document).on('mouseleave','.bt',function(){
        $(this).css('color','black');
    })
    $(document).on('mouseenter','.wz_bt_bq>span',function(){
        $(this).css('color','blue');
    })
    $(document).on('mouseleave','.wz_bt_bq>span',function(){
        $(this).css('color','black');
    })

    $(document).on('mouseenter','.yueanniu',function(){
        $(this).css('box-shadow','#D8D8D8 0 0 0.4vw');
        $(this).css('border','1px solid blue');
    })
    $(document).on('mouseleave','.yueanniu',function(){
        $(this).css('box-shadow','none');
        $(this).css('border','1px solid white');
    })

    $(document).on('mouseenter','.zonganniu',function(){
        $(this).css('box-shadow','#D8D8D8 0 0 0.4vw');
        $(this).css('border','1px solid blue');
    })
    $(document).on('mouseleave','.zonganniu',function(){
        $(this).css('box-shadow','none');
        $(this).css('border','1px solid white');
    })

    $(document).on('click','.yueanniu',function(){
        $('.yueanniu').css('background-color','blue');
        $('.yueanniu').css('color','white');
        $('.zonganniu').css('background-color','white');
        $('.zonganniu').css('color','black');
    })
    $(document).on('click','.zonganniu',function(){
        $('.yueanniu').css('background-color','white');
        $('.yueanniu').css('color','black');
        $('.zonganniu').css('background-color','blue');
        $('.zonganniu').css('color','white');
    })
    $(document).on('click','.yueanniu',function(){
        $('.wz_remen_zt1').css('display','block');
        $('.wz_remen_zt2').css('display','none');
    })
    $(document).on('click','.zonganniu',function(){
        $('.wz_remen_zt2').css('display','block');
        $('.wz_remen_zt1').css('display','none');
    })
</script>
</body>
</html>