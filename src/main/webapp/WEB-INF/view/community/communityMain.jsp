<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>社区</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/layui/layui.all.js"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        body{
            overflow-x:hidden;
        }
        .all-body{
            text-align:center;
            border: none 0;
        }
        .all-body-center{
            width: 1340px;
            height: 1480px;
            margin:0 auto;
            border: none 0;
        }
        .all-body-center .body-top{
            width: 1308px;
            height: 114px;
        }
        .all-body-center .body-left{
            float: left;
            width: 930px;
            height: 1350px;
            border: none 0;
        }
        /*发表按钮样式*/
        .add a {
            /*background-color: #9933FF;*/
            font-family: "Arial";
            color: #F8F8F8;
            font-size: 18px;
            /*border: solid #1296db 1px;*/
            text-decoration: none;
            display: block;
            text-align: center;
        }
        .add{
            position: relative;
            top: 10px;
            left: 73%;
            width: 320px;
            height: 42px;
            -moz-box-shadow:2px 2px 5px #D8D8D8;
            -webkit-box-shadow:2px 2px 5px #D8D8D8;
            box-shadow:2px 2px 5px #D8D8D8;
            background-color: #914ff1;
            text-align:center;
            height:45px;
            line-height:45px;
            overflow:hidden;
            vertical-align:middle;
            border-radius: 5px;
        }
        /*横线样式*/
        .crossing{
            width: 69%;
            height: 1px;
            border-top: solid #D0D0D0 1px;
            position: relative;
            bottom: -15px;
            left: 12px;
            z-index: -1;
        }
        /*中间有竖线导航栏样式*/
        .tab{
            border: none;
            width: 282px;
            position: relative;
            left: 1px;
            bottom: -34px;
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
        ::-webkit-scrollbar{
            display: none;
        }
        .wz_remenwenzhang{
            position: absolute;
            margin-left: 76vw;
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
            border-bottom: 0.1vw solid #914ff1;
            margin-left: -3vw;
            margin-top: -1vw;
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
            -webkit-border-top-left-radius: 0.4vw;
            -webkit-border-bottom-left-radius: 0.4vw;
            margin-left: -0.8vw;
            border: 1px solid white;
            line-height: 2vw;
            text-align: center;
            width: 2vw;
            height: 2vw;
            color: white;
            background-color: #914ff1;
        }
        .zonganniu{
            -webkit-border-top-right-radius: 0.4vw;
            -webkit-border-bottom-right-radius: 0.4vw;
            margin-top: -2.2vw;
            margin-left: 1.2vw;
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
            margin-left: -3vw;
            position: absolute;
            margin-top: 3vw;
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
            margin-left: -3vw;
            position: absolute;
            margin-top: 3vw;
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
        <%-----------------------------------文章标签卡 css start---------------------------------------%>
        .show {
            width: 69%;
            height: 30px;
            padding-top: 6px;
            margin-top: 10px;
            border-radius: 5px;
            margin-left: 12px;
            background-color: whitesmoke;
        }
        .show li {
            float: left;
            padding-left: 12px;
            display: inline-block;
            line-height: 15px;
            word-break: break-all;
            word-wrap: break-word;
        }
        .show a{
            float: left;
            padding: 5px;
            display: inline;
            line-height: 15px;
            word-break: break-all;
            word-wrap: break-word;
            background-color: #e7e7e7;
            color: black;
            font-size: 15px;
            border-radius: 4px;
            border: none;
            transition-duration: 0.4s;
        }
        .hide a:hover{
            background-color: #AFEEEE;
            color: #0a61ff;
        }
        .hide {
            padding-top: 6px;
            margin-top: 10px;
            margin-left: 12px;
            display: none;
            width: 69%;
            height: 60px;
            background-color: whitesmoke;
            border-radius: 5px;
            box-shadow: 0 1px 2px 0 rgba(0,0,0,0.2), 0 0 7px 0 rgba(0,0,0,0.19);
        }
        .hide li{
            float: left;
            padding-left: 12px;
        }
        .hide a{
            float: left;
            padding: 5px;
            display: inline;
            line-height: 15px;
            word-break: break-all;
            word-wrap: break-word;
            background-color: #e7e7e7;
            color: black;
            font-size: 15px;
            border-radius: 4px;
            border: none;
            transition-duration: 0.4s;
        }
        <%-----------------------------------文章标签卡 css end---------------------------------------%>
    </style>
</head>
<body>
<div class="all-body">
    <%@include file="../../jsp/header.jsp"%>
    <%@include file="../../jsp/sidebar.jsp"%>
    <div class="all-body-center">
        <div class="body-top">
            <div style="height: 0px; margin-bottom: -10px;">
                <div class="show">
                    <c:forEach items="${tagList}" var="tag" begin="0" end="10">
                        <div>
                            <ul>
                                <li><a href="javascript:void(0)" type="button" class="">${tag.tagName}</a></li>
                            </ul>
                        </div>
                    </c:forEach>
                </div>
                <div class="hide">
                    <c:forEach items="${tagList}" var="tag">
                        <div>
                            <ul>
                                <li><a href="<%=request.getContextPath() %>/" type="button" target="pageTarget" onclick="dj(this);">${tag.tagName}</a></li>
                            </ul>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="add">
                <a role="button" href="<%= request.getContextPath()%>/community/article-guide">我要发文</a>
            </div>
            <div class="crossing"></div>
            <div class="tab">
                <a href="<%=request.getContextPath()%>/articles/toArticleAll" target="pageTarget">最新</a>
                <span>|</span>
                <a href="<%= request.getContextPath()%>/articles/toArticleHot" target="pageTarget">热门</a>
                <span>|</span>
                <a href="<%= request.getContextPath()%>/articles/toArticleMy" target="pageTarget">我的文章</a>
                <span>|</span>
                <a href="<%= request.getContextPath()%>" target="">问答</a>
            </div>
        </div>
        <div class="body-left">
            <div class="body-context">
                <iframe name="pageTarget" frameborder="1" src="/articles/toArticleAll"> </iframe>
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
    <%@include file="../../jsp/footer.jsp"%>
</div>

<script type="text/javascript">
    $(document).on('mouseenter','.bt',function(){
        $(this).css('color','#914ff1');
    })
    $(document).on('mouseleave','.bt',function(){
        $(this).css('color','black');
    })
    $(document).on('mouseenter','.wz_bt_bq>span',function(){
        $(this).css('color','#914ff1');
    })
    $(document).on('mouseleave','.wz_bt_bq>span',function(){
        $(this).css('color','black');
    })

    $(document).on('mouseenter','.yueanniu',function(){
        $(this).css('box-shadow','#D8D8D8 0 0 0.4vw');
        $(this).css('border','1px solid #914ff1');
    })
    $(document).on('mouseleave','.yueanniu',function(){
        $(this).css('box-shadow','none');
        $(this).css('border','1px solid white');
    })

    $(document).on('mouseenter','.zonganniu',function(){
        $(this).css('box-shadow','#D8D8D8 0 0 0.4vw');
        $(this).css('border','1px solid #914ff1');
    })
    $(document).on('mouseleave','.zonganniu',function(){
        $(this).css('box-shadow','none');
        $(this).css('border','1px solid white');
    })

    $(document).on('click','.yueanniu',function(){
        $('.yueanniu').css('background-color','#914ff1');
        $('.yueanniu').css('color','white');
        $('.zonganniu').css('background-color','white');
        $('.zonganniu').css('color','black');
    })
    $(document).on('click','.zonganniu',function(){
        $('.yueanniu').css('background-color','white');
        $('.yueanniu').css('color','black');
        $('.zonganniu').css('background-color','#914ff1');
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
    <%-----------------------------------文章标签卡 js start---------------------------------------%>
    $(document).on('mouseenter','.show',function () {
        $('.hide').css('display','block');
        $(this).css('display','none');
    });
    $(document).on('mouseleave','.hide',function () {
        $('.show').css('display','block');
        $(this).css('display','none');
    });
    $(function() {
        $(".hide li").click(function() {
            if($(this).nextAll().is('#a')) {
                $(".hide").append($(this));
            }
            else {
                $(".hide").prepend($(this));
            }
        });
    });
    <%-----------------------------------文章标签卡 js end---------------------------------------%>
</script>
</body>
</html>