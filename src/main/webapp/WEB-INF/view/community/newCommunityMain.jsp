<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>社区</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/layui/layui.all.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.timeago.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        body{
            height: auto;
        }
        .all-body{
            text-align:center;
            border: none 0;
        }
        .all-body-center{
            width: 1340px;
            height: 2300px;
            margin:0 auto;
            border: none 0;
        }
        .all-body-center .body-top{
            width: 1308px;
            height: 102px;
        }
        .all-body-center .body-left{
            float: left;
            width: 930px;
            height: 1350px;
            border: none 0;
        }
        .all-body-center .body-right{

        }
        /*发表按钮样式*/
        .add a {
            font-family: "Arial";
            color: #F8F8F8;
            font-size: 18px;
            text-decoration: none;
            display: block;
            text-align: center;
        }
        .btn1{
            position: relative;
            top: -92px;
            left: -35px;
            width: 145px;
            height: 42px;
            -moz-box-shadow:2px 2px 5px #D8D8D8;
            -webkit-box-shadow:2px 2px 5px #D8D8D8;
            box-shadow:2px 2px 5px #D8D8D8;
            background-color: #914ff1;
            text-align:center;
            line-height:45px;
            overflow:hidden;
            vertical-align:middle;
            border-radius: 3px;
            float: right;
        }
        .btn2{
            position: relative;
            top: -92px;
            left: -58px;
            width: 145px;
            height: 42px;
            -moz-box-shadow:2px 2px 5px #D8D8D8;
            -webkit-box-shadow:2px 2px 5px #D8D8D8;
            box-shadow:2px 2px 5px #D8D8D8;
            background-color: #914ff1;
            text-align:center;
            line-height:45px;
            overflow:hidden;
            vertical-align:middle;
            border-radius: 3px;
            float: right;
        }
        /*横线样式*/
        .crossing{
            width: 69%;
            height: 1px;
            border-top: solid #D0D0D0 1px;
            position: relative;
            bottom: -79px;
            left: 12px;
            z-index: -1;
        }
        /*选项卡内容框样式*/
        .body-left{
            height: 100%;
            margin-left: 12px;
            margin-top: -32px;
        }
        .tab{
            width: 900px;
            z-index: 999;
            border: #FFFFFF 1px solid;
        }
        .tab_ul{
            list-style: none;
        }
        .show_ul{
            list-style: none;
            margin-top: 60px;
        }
        .tab_ul .tab_li1{
            color: #8c24dd;
            border-bottom: 2px solid #8c24dd;
        }
        .tab_ul .tab_li1,.tab_li2,.tab_li3,.tab_li4{
            float: left;
            padding: 10px;
            width: 80px;
            text-align: center;
            letter-spacing: 3px;
            color: #656565;
            font-size: 14px;
        }
        .tab_ul li:hover{
            color: #8c24dd !important;
            border-bottom: 2px solid #8c24dd !important;
            cursor: pointer;
        }
        .on{
            color: #8c24dd;
            border-bottom: 2px solid #8c24dd;
        }
        /*热门文章样式*/
        ::-webkit-scrollbar{
            display: none;
        }
        .wz_remenwenzhang{
            position: absolute;
            margin-left: 76vw;
            margin-top: -8vw;
        }
        .wz_remen{
            background-color: #e7e7e7;
            float: left;
            width: 20vw;
            color: black;
            font-size: 1.4vw;
            font-weight:bold;
            height: 4vw;
            line-height: 4vw;
            border-bottom: 0.1vw solid #914ff1;
            margin-left: -14vw;
            margin-top: 8vw;
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
            background-color: #e7e7e7;
            width: 20vw;
            margin-left: -14vw;
            position: absolute;
            margin-top: 12.09vw;
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
            background-color: #e7e7e7;
            width: 20vw;
            margin-left: -14vw;
            position: absolute;
            margin-top: 12.09vw;
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
            margin-left: 0vw;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
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
        /*文章标签卡样式*/
        .show {
            width: 69%;
            height: 56px;
            padding-top: 6px;
            margin-top: 10px;
            border-radius: 5px;
            margin-left: 12px;
            padding-bottom: 4px;
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
        .show a:hover{
            background-color: #AFEEEE;
            color: #0a61ff;
        }
        /*流加载样式*/
        .all{
            width: 100%;
            height: 182px;
            background-color: #FFFFFF;
            border-bottom: 1px solid #F0F0F0;
            position: relative;
        }
        .title{
            position: relative;
            left: 10px;
            top: 1px;
            float: left;
        }
        .title a{
            font-size: 22px;
            font-family: Arial;
            font-weight: bold;
            color: #383838;
            text-decoration:none;
        }
        .createArticleType{
            position: relative;
            left: 33px;
            top: 6px;
            float: left;
            width: 50px;
            height: 20px;
            background-color: #1296db;
            border-radius: 8%;
            font-size: 15px;
            font-family: Arial;
            color: #FFFFFF;
            text-decoration:none;
            text-align: center;
        }
        .articleSetTop{
            position: relative;
            left: 44px;
            top: 6px;
            float: left;
            width: 35px;
            height: 20px;
            background-color: #FF0000;
            border-radius: 8%;
            text-align: center;
        }
        .articleSetTop #p{
            font-size: 15px;
            font-family: Arial;
            color: #FFFFFF;
            text-decoration:none;
            margin:0;
            padding:0;
            display: inline-block;
            vertical-align: middle;
            text-align: left;
        }
        .kuang{
            width: 98%;
            position: relative;
            top: 1px;
        }
        .articleDigest{
            margin-left: 0;
            margin-top: -40px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            /*border: #914ff1 2px solid;*/
            font-size: 17px;
            font-family: Arial;
            color:  #707070;
            text-decoration:none;

        }
        .figures{
            margin-left: 716px;
            margin-top: 30px;
            width: 170px;
            height: 95px;
            border-radius: 5px;
            border: none 0;
        }
        img {
            width: 170px;
            height: 95px;
            object-fit:cover;
            border-radius: 5px;
        }
        .icon{
            position: absolute;
            left: 702px;
            bottom: 26px;
        }
        .browseCount{
            position: absolute;
            left: 727px;
            bottom: 27px;
        }
        .browseCount a{
            font-size: 16px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        .icon1{
            position: absolute;
            left: 811px;
            bottom: 26px;
        }
        .commentCount{
            position: absolute;
            left: 837px;
            bottom: 27px;

        }
        .commentCount a{
            font-size: 16px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        .userRealname{
            position: relative;
            float: left;
            left: 9px;
            top: 35px;
            display: inline;
        }
        .userRealname a{
            font-size: 16px;
            color: #989898;
            font-family: Arial;
            text-decoration:none;
        }
        .little{
            width: 3px;
            height: 3px;
            background-color: #989898;
            border-radius: 50px;
            position: relative;
            float: left;
            left: 37px;
            top: 44px;
            display: inline;
        }
        .createTime{
            font-size: 16px;
            color: #989898;
            font-family: Arial;
            position: relative;
            left: 69px;
            top: 34px;
            float: left;
            display: inline;
        }
        .all a:hover{
            color: #1296db;
            text-decoration:none;
        }
        iframe{
            border: #ffffff 1px solid;
            margin-left: 13px;
            margin-top: -1304px;
            width: 900px;
            height: 1400px;
            float: left;
            display: none;
        }
    </style>
</head>
<body>
<div class="all-body">
    <%@include file="../../jsp/header.jsp"%>
    <%--<%@include file="../../jsp/sidebar.jsp"%>--%>
    <div class="all-body-center">
        <div class="body-top">
            <div style="height: 0px; margin-bottom: -10px;">
                <div class="show">
                    <c:forEach items="${tagList}" var="tag">
                        <div>
                            <ul>
                                <li>
                                    <a href="<%=request.getContextPath() %>/community/tags?tagId=${tag.tagId}" type="button" target="pageTags">${tag.tagName}</a>
                                </li>
                            </ul>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="crossing"></div>
        </div>
        <div class="body-left">
            <div class="tab">
                <ul class="tab_ul">
                    <li class="tab_li1">最新</li>
                    <li class="tab_li2">热门</li>
                    <li class="tab_li3">我的文章</li>
                    <li class="tab_li4">问答</li>
                </ul>
                <ul class="show_ul">
                    <li class="show_li1"></li>
                    <li class="show_li2"></li>
                    <li class="show_li3"></li>
                    <li class="show_li4"></li>
                </ul>
            </div>
        </div>
        <div>
            <iframe class="iframe" name="pageTags" frameborder="1" ></iframe>
        </div>
        <div class="body-right">
            <div class="add">
                <a class="btn1" role="button" href="<%= request.getContextPath()%>/community/article-guide">我要发文</a>
                <a class="btn2" role="button" href="<%= request.getContextPath()%>/question/questionGuide">我要提问</a>
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
                                <a href="<%=request.getContextPath() %>/community/article-show?articleId=${article.articleId}">
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
                                <a href="<%=request.getContextPath() %>/community/article-show?articleId=${article.articleId}">
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
    <div style="clear:both;bottom: 0">
        <%@include file="../../jsp/footer.jsp"%>
    </div>
</div>
<!--热门文章 文章标签点击事件-->
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
    <!--文章标签-->
    $(function() {
        $(".show li").click(function() {
            if($(this).nextAll().is('')) {
                $(".show").append($(this));
            }
            else {
                $(".show").prepend($(this));
            }
        });
    });
</script>
<!--点击选项卡(最新 热门 我的文章 回答)事件-->
<script>
    $(".show_li2,.show_li3,.show_li4").hide();
    $(document).ready(function () {
        $(".tab_li1").click(function(){
            $(this).addClass("on").siblings().removeClass("on");
            $(".tab_li1").css("color","#8c24dd");
            $(".tab_li1").css("border-bottom","2px solid #8c24dd");
            $(".show_li1").show();
            $(".show_li2,.show_li3,.show_li4").hide();
        });
        $(".tab_li2").click(function () {
            $(this).addClass("on").siblings().removeClass("on");
            $(".tab_li1").css("color","#656565");
            $(".tab_li1").css("border-bottom","none");
            $(".show_li2").show();
            $(".show_li1,.show_li3,.show_li4").hide();
        });
        $(".tab_li3").click(function () {
            $(this).addClass("on").siblings().removeClass("on");
            $(".tab_li1").css("color","#656565");
            $(".tab_li1").css("border-bottom","none");
            $(".show_li3").show();
            $(".show_li1,.show_li2,.show_li4").hide();
        });
        $(".tab_li4").click(function () {
            $(this).addClass("on").siblings().removeClass("on");
            $(".tab_li1").css("color","#656565");
            $(".tab_li1").css("border-bottom","none");
            $(".show_li4").show();
            $(".show_li1,.show_li2,.show_li3").hide();
        });
    });
</script>
<!--最新流加载-->
<script>
    layui.use('flow', function(){
        var flow = layui.flow;
        var $ =layui.jquery;
        flow.load({
            elem: '.show_li1' //流加载容器
            ,isAuto: false
            ,end: "<p>没有更多了</p>"
            ,done: function(page, next){ //加载下一页
                //模拟插入
                setTimeout(function(){
                    var lis = [];
                    var limit = "5";
                    $.ajax({
                        url:"/articles/findByCreateTime?page="+page+"&limit="+limit,
                        type: 'post',
                        dataType: "json",
                        success: function (result) {
                            layui.each(result.articleList, function (i, article) {
                                var html = '';
                                html += '<div class="all" >' +
                                    '<div class="title"><a href="">'+article.title+'</a></div>';
                                if (article.createArticleType == 0){
                                    html += '<div class="createArticleType">原创</div>';
                                } else if (article.createArticleType == 1){
                                    html += '<div class="createArticleType">转载</div>';
                                }else if (article.createArticleType == 2){
                                    html += '<div class="createArticleType">翻译</div>';
                                }
                                if (article.articleSetTop == 0) {
                                    html += '<div class="articleSetTop" id="articleSetTop"><p id="p">置顶</p></div>';
                                } else {
                                    html += '<div class="articleSetTop" id="articleSetTop" style="display:none;"><p id="p">'+article.articleSetTop+'</p></div>';
                                }
                                html += '<div class="kuang">'+
                                    '<div class="figures" id="figures">'+'<img src="'+article.figures+'"/>'+'</div>'+
                                    '<div class="articleDigest" style="width: 660px">'+article.articleDigest+'</div>'+
                                    '</div>'+
                                    '<div>'+
                                    '<div class="userRealname"><a href="../articles/toTest" target="pageTarget">'+article.user.userRealname+'</a></div>'+
                                    '<div class="little"></div>'+
                                    '<div class="createTime"><span class="timeago" title="'+article.createTime+'"></span></div>'+
                                    '</div>'+
                                    '<svg t="1574820328378" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="713" width="22" height="20"><path d="M512 608a96 96 0 1 1 0-192 96 96 0 0 1 0 192m0-256c-88.224 0-160 71.776-160 160s71.776 160 160 160 160-71.776 160-160-71.776-160-160-160" fill="#989898" p-id="714"></path><path d="M512 800c-212.064 0-384-256-384-288s171.936-288 384-288 384 256 384 288-171.936 288-384 288m0-640C265.248 160 64 443.008 64 512c0 68.992 201.248 352 448 352s448-283.008 448-352c0-68.992-201.248-352-448-352" fill="#989898" p-id="715"></path></svg>'+
                                    '<div class="browseCount"><a href="../articles/toTest" target="pageTarget">'+article.browseCount+'阅读'+'</a></div>'+
                                    '<svg t="1574820647675" class="icon1" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="832" width="22" height="20"><path d="M896 128H128a32 32 0 0 0-32 32v576a32 32 0 0 0 32 32h288v-64H160V192h704v512h-256c-8.832 0-16.832 3.584-22.656 9.376l-159.968 160 45.248 45.248L621.248 768H896a32 32 0 0 0 32-32V160a32 32 0 0 0-32-32" fill="#989898" p-id="833"></path><path d="M560 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 560 448M240 448a48 48 0 1 0 95.968 0.032A48 48 0 0 0 240 448M784 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 784 448" fill="#989898" p-id="834"></path></svg>'+
                                    '<div class="commentCount"><a href="../articles/toTest" target="pageTarget">'+article.commentCount+'评论'+'</a></div>'+
                                    '</div>';
                                lis.push(html);
                            });
                            next(lis.join(''), page < 3);
                            $(".timeago").timeago();
                        }
                    });
                }, 500);
            }
        });
    });
</script>
<!--热门流加载-->
<script>
    layui.use('flow', function(){
        var flow = layui.flow;
        var $ =layui.jquery;
        flow.load({
            elem: '.show_li2' //流加载容器
            ,isAuto: false
            ,end: "<p>没有更多了</p>"
            ,done: function(page, next){ //加载下一页
                //模拟插入
                setTimeout(function(){
                    var lis = [];
                    var limit = "5";
                    $.ajax({
                        url:"/articles/findByBrowseCount?page="+page+"&limit="+limit,
                        type: 'post',
                        dataType: "json",
                        success: function (result) {
                            layui.each(result.articleList, function (i, article) {
                                var html = '';
                                html += '<div class="all" >' +
                                    '<div class="title"><a href="../articles/toTest">'+article.title+'</a></div>';
                                if (article.createArticleType == 0){
                                    html += '<div class="createArticleType">原创</div>';
                                } else if (article.createArticleType == 1){
                                    html += '<div class="createArticleType">转载</div>';
                                }else if (article.createArticleType == 2){
                                    html += '<div class="createArticleType">翻译</div>';
                                }
                                if (article.articleSetTop == 0) {
                                    html += '<div class="articleSetTop" id="articleSetTop"><p id="p">置顶</p></div>';
                                } else {
                                    html += '<div class="articleSetTop" id="articleSetTop" style="display:none;"><p id="p">'+article.articleSetTop+'</p></div>';
                                }
                                html += '<div class="kuang">'+
                                    '<div class="figures" id="figures">'+'<img src="'+article.figures+'">'+'</div>'+
                                    '<div class="articleDigest" id="articleDigest" style="width: 660px">'+article.articleDigest+'</div>'+
                                    '</div>'+
                                    '<div>'+
                                    '<div class="userRealname"><a href="../articles/toTest">'+article.user.userRealname+'</a></div>'+
                                    '<div class="little"></div>'+
                                    '<div class="createTime" id="createTime"><span class="timeago" title="'+article.createTime+'"></span></div>'+
                                    '</div>'+
                                    '<svg t="1574820328378" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="713" width="22" height="20"><path d="M512 608a96 96 0 1 1 0-192 96 96 0 0 1 0 192m0-256c-88.224 0-160 71.776-160 160s71.776 160 160 160 160-71.776 160-160-71.776-160-160-160" fill="#989898" p-id="714"></path><path d="M512 800c-212.064 0-384-256-384-288s171.936-288 384-288 384 256 384 288-171.936 288-384 288m0-640C265.248 160 64 443.008 64 512c0 68.992 201.248 352 448 352s448-283.008 448-352c0-68.992-201.248-352-448-352" fill="#989898" p-id="715"></path></svg>'+
                                    '<div class="browseCount"><a href="../articles/toTest">'+article.browseCount+'阅读'+'</a></div>'+
                                    '<svg t="1574820647675" class="icon1" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="832" width="22" height="20"><path d="M896 128H128a32 32 0 0 0-32 32v576a32 32 0 0 0 32 32h288v-64H160V192h704v512h-256c-8.832 0-16.832 3.584-22.656 9.376l-159.968 160 45.248 45.248L621.248 768H896a32 32 0 0 0 32-32V160a32 32 0 0 0-32-32" fill="#989898" p-id="833"></path><path d="M560 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 560 448M240 448a48 48 0 1 0 95.968 0.032A48 48 0 0 0 240 448M784 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 784 448" fill="#989898" p-id="834"></path></svg>'+
                                    '<div class="commentCount"><a href="../articles/toTest">'+article.commentCount+'评论'+'</a></div>'+
                                    '</div>';
                                lis.push(html);
                            });
                            next(lis.join(''), page < 3);
                            $(".timeago").timeago();
                        }
                    });
                }, 500);
            }
        });
    });
</script>
<!--我的文章流加载-->
<script>
    layui.use('flow', function(){
        var flow = layui.flow;
        var $ =layui.jquery;
        flow.load({
            elem: '.show_li3' //流加载容器
            ,isAuto: false
            ,end: "<p>没有更多了</p>"
            ,done: function(page, next){ //加载下一页
                //模拟插入
                setTimeout(function(){
                    var lis = [];
                    var limit = "5";
                    var userId = "adfd95a4b3634b58b0cf3b8c67b18a26";
                    $.ajax({
                        url:"/articles/findByUserId?page="+page+"&limit="+limit+"&userId="+userId,
                        type: 'post',
                        dataType: "json",
                        success: function (result) {
                            layui.each(result.articleList, function (i, article) {
                                var html = '';
                                html += '<div class="all" >' +
                                    '<div class="title"><a href="../articles/toTest">'+article.title+'</a></div>';
                                if (article.createArticleType == 0){
                                    html += '<div class="createArticleType">原创</div>';
                                } else if (article.createArticleType == 1){
                                    html += '<div class="createArticleType">转载</div>';
                                }else if (article.createArticleType == 2){
                                    html += '<div class="createArticleType">翻译</div>';
                                }
                                if (article.articleSetTop == 0) {
                                    html += '<div class="articleSetTop" id="articleSetTop"><p id="p">置顶</p></div>';
                                } else {
                                    html += '<div class="articleSetTop" id="articleSetTop" style="display:none;"><p id="p">'+article.articleSetTop+'</p></div>';
                                }
                                html += '<div class="kuang">'+
                                    '<div class="figures" id="figures">'+'<img src="'+article.figures+'">'+'</div>'+
                                    '<div class="articleDigest" id="articleDigest" style="width: 660px">'+article.articleDigest+'</div>'+
                                    '</div>'+
                                    '<div>'+
                                    '<div class="userRealname"><a href="../articles/toTest">'+article.user.userRealname+'</a></div>'+
                                    '<div class="little"></div>'+
                                    '<div class="createTime" id="createTime"><span class="timeago" title="'+article.createTime+'"></span></div>'+
                                    '</div>'+
                                    '<svg t="1574820328378" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="713" width="22" height="20"><path d="M512 608a96 96 0 1 1 0-192 96 96 0 0 1 0 192m0-256c-88.224 0-160 71.776-160 160s71.776 160 160 160 160-71.776 160-160-71.776-160-160-160" fill="#989898" p-id="714"></path><path d="M512 800c-212.064 0-384-256-384-288s171.936-288 384-288 384 256 384 288-171.936 288-384 288m0-640C265.248 160 64 443.008 64 512c0 68.992 201.248 352 448 352s448-283.008 448-352c0-68.992-201.248-352-448-352" fill="#989898" p-id="715"></path></svg>'+
                                    '<div class="browseCount"><a href="../articles/toTest">'+article.browseCount+'阅读'+'</a></div>'+
                                    '<svg t="1574820647675" class="icon1" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="832" width="22" height="20"><path d="M896 128H128a32 32 0 0 0-32 32v576a32 32 0 0 0 32 32h288v-64H160V192h704v512h-256c-8.832 0-16.832 3.584-22.656 9.376l-159.968 160 45.248 45.248L621.248 768H896a32 32 0 0 0 32-32V160a32 32 0 0 0-32-32" fill="#989898" p-id="833"></path><path d="M560 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 560 448M240 448a48 48 0 1 0 95.968 0.032A48 48 0 0 0 240 448M784 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 784 448" fill="#989898" p-id="834"></path></svg>'+
                                    '<div class="commentCount"><a href="../articles/toTest">'+article.commentCount+'评论'+'</a></div>'+
                                    '</div>';
                                lis.push(html);
                            });
                            next(lis.join(''), page < 3);
                            $(".timeago").timeago();
                        }
                    });
                }, 500);
            }
        });
    });
</script>
<!--回答流加载-->
<script>
    layui.use('flow', function(){
        var flow = layui.flow;
        var $ =layui.jquery;
        flow.load({
            elem: '.show_li4' //流加载容器
            ,isAuto: false
            ,end: "<p>没有更多了</p>"
            ,done: function(page, next){ //加载下一页
                //模拟插入
                setTimeout(function(){
                    var lis = [];
                    var limit = "5";
                    $.ajax({
                        url:"/question/questionAll?page="+page+"&limit="+limit,
                        type: 'post',
                        dataType: "json",
                        success: function (result) {
                            layui.each(result.questionAllList, function (i, question) {
                                var html = '';
                                html += '<div class="all" >' +
                                    '<div class="title"><a href="../questionUser/findQuestion?questionId=${all.questionId}">'+question.questionTitle+'</a></div>';
                                if (question.solve == 0){
                                    html += '<div class="">待解决</div>';
                                } else if (question.solve == 1){
                                    html += '<div class="createArticleType">未解决</div>';
                                }else if (question.solve == 2){
                                    html += '<div class="createArticleType">待解决</div>';
                                }
                                if (question.questionSetTop == 0) {
                                    html += '<div class="SetTop" id="questionSetTop"><p id="p">置顶</p></div>';
                                } else {
                                    html += '<div class="SetTop" id="questionSetTop" style="display:none;"><p id="p">'+question.questionSetTop+'</p></div>';
                                }
                                html += '<div class="kuang">'+
                                    '<div class="figures" id="figures">'+'<img src="">'+'</div>'+
                                    '<div class="Content" id="Content" style="width: 660px">'+question.questionTitle+'</div>'+
                                    '</div>'+
                                    '<div>'+
                                    '<div class="userRealname"><a href="#">'+question.userRealname+'</a></div>'+
                                    '<div class="little"></div>'+
                                    '<div class="createTime" id="createTime"><span class="timeago" title="'+question.createTime+'"></span></div>'+
                                    '</div>'+
                                    '<div class="userImg">'+question.userImg+'</div>'+
                                    '<svg t="1574820328378" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="713" width="22" height="20"><path d="M512 608a96 96 0 1 1 0-192 96 96 0 0 1 0 192m0-256c-88.224 0-160 71.776-160 160s71.776 160 160 160 160-71.776 160-160-71.776-160-160-160" fill="#989898" p-id="714"></path><path d="M512 800c-212.064 0-384-256-384-288s171.936-288 384-288 384 256 384 288-171.936 288-384 288m0-640C265.248 160 64 443.008 64 512c0 68.992 201.248 352 448 352s448-283.008 448-352c0-68.992-201.248-352-448-352" fill="#989898" p-id="715"></path></svg>'+
                                    '<div class="browseCount"><a href="#">'+question.browseCount+'浏览'+'</a></div>'+
                                    '<svg t="1574820647675" class="icon1" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="832" width="22" height="20"><path d="M896 128H128a32 32 0 0 0-32 32v576a32 32 0 0 0 32 32h288v-64H160V192h704v512h-256c-8.832 0-16.832 3.584-22.656 9.376l-159.968 160 45.248 45.248L621.248 768H896a32 32 0 0 0 32-32V160a32 32 0 0 0-32-32" fill="#989898" p-id="833"></path><path d="M560 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 560 448M240 448a48 48 0 1 0 95.968 0.032A48 48 0 0 0 240 448M784 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 784 448" fill="#989898" p-id="834"></path></svg>'+
                                    '<div class="commentCount"><a href="#">'+question.responseCount+'评论'+'</a></div>'+
                                    '</div>';
                                lis.push(html);
                            });
                            next(lis.join(''), page < 3);
                            $(".timeago").timeago();
                        }
                    });
                }, 500);
            }
        });
    });
</script>
<!--iframe点击事件-->
<script type="text/javascript">
    $(document).ready(function(){
        $("").click(function(){
            $(".body-left").css("display","none")
            $("iframe").css("display","block");
        });
        $("").click(function(){
            $(".body-left").css("display","none")
            $("iframe").css("display","block");
        });
    });
</script>
</body>
</html>