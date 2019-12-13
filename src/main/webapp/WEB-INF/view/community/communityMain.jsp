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
        .all-body{
            text-align:center;
            border: none 0;
        }
        .all-body-center{
            width: 1340px;
            height: 1455px;
            margin:0 auto;
            padding:0 auto;
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
        /*中间有竖线导航栏样式*/
        .tab{
            border: none;
            width: 282px;
            position: relative;
            left: 6px;
            bottom: 16px;
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
            color: #914ff1;
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
            height: 100%;
            display: inline;
            border: none 0;
        }
        /*热门文章样式*/
        ::-webkit-scrollbar{
            display: none;
        }
        .wz_remenwenzhang{
            position: absolute;
            margin-left: 84vw;
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
            margin-top: -2.14vw;
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
            margin-top: 12.07vw;
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
            margin-top: 12.07vw;
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
    </style>
</head>
<body>
<div class="all-body">
    <%@include file="../../jsp/header.jsp"%>
    <div class="all-body-center">
        <div class="body-top">
            <div style="height: 0px; margin-bottom: -10px;">
                <div class="show">
                    <c:forEach items="${tagList}" var="tag">
                        <div>
                            <ul>
                                <li>
                                    <a class="tags" href="<%=request.getContextPath() %>/community/tags?tagId=${tag.tagId}" type="button" target="pageTags">${tag.tagName}</a>
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
                <a href="<%=request.getContextPath()%>/articles/toArticleAll" target="pageTags">最新</a>
                <span>|</span>
                <a href="<%= request.getContextPath()%>/articles/toArticleHot" target="pageTags">热门</a>
                <span>|</span>
                <a href="<%= request.getContextPath()%>/articles/toArticleMy" target="pageTags">我的文章</a>
                <span>|</span>
                <a href="<%= request.getContextPath()%>/question/questionMain" target="pageTags">问答</a>
            </div>
            <iframe class="iframe" name="pageTags" frameborder="1" src="<%= request.getContextPath()%>/articles/toArticleAll"></iframe>
        </div>
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
                            <a href="<%=request.getContextPath() %>/community/article-show?articleId=${article.articleId}" target="_blank">
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
                            <a href="<%=request.getContextPath() %>/community/article-show?articleId=${article.articleId}" target="_blank">
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
    <div>
        <a href="#top" style="margin-left: 93vw;z-index: 100;">
            <svg t="1576140135922" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6257" width="64" height="64"><path d="M555.880483 37.797839a634.568341 634.568341 0 0 1 115.956771 180.038143 558.138589 558.138589 0 0 1 48.640813 249.612206 17.963128 17.963128 0 0 0 7.303243 16.071202c16.74253 13.833439 33.220598 28.073744 49.983471 41.907183a126.575969 126.575969 0 0 1 47.684679 124.094088c-8.564526 53.502861-20.07883 106.598856-31.023522 159.694851a41.744437 41.744437 0 0 1-69.167197 24.615384c-29.701208-25.02225-58.99555-50.6548-88.005086-76.287349-14.545455-12.816275-14.240305-13.426573-29.233312-1.830896a149.787667 149.787667 0 0 1-132.577241 30.311507 161.444374 161.444374 0 0 1-66.848061-34.990464 9.256198 9.256198 0 0 0-14.850604 0.610298 5099.86014 5099.86014 0 0 1-90.283534 80.762874 42.578512 42.578512 0 0 1-70.143675-24.818818c-5.675779-23.801653-10.456453-47.806739-15.684679-71.608391-5.635092-25.632549-11.371901-51.265099-16.966306-77.101081a128.671329 128.671329 0 0 1 33.627463-123.076923 716.083916 716.083916 0 0 1 62.57597-52.892562 12.673872 12.673872 0 0 0 5.777495-11.595677 562.898919 562.898919 0 0 1 55.903369-270.565798 658.308964 658.308964 0 0 1 83.529562-134.876033 279.028608 279.028608 0 0 1 56.96122-56.147489c12.043229-8.34075 12.979021-8.544183 24.411952 0a212.26192 212.26192 0 0 1 32.366179 28.073745z m36.617928 216.656071a113.434202 113.434202 0 0 0-159.226955-3.254927 117.177368 117.177368 0 0 0-2.034329 167.832168 114.919263 114.919263 0 0 0 159.69485 0.610298 117.86904 117.86904 0 0 0 1.485061-165.187539z m-195.153211 569.612206a21.787667 21.787667 0 0 1 28.480611-3.865226 192.467896 192.467896 0 0 0 171.55499 0 22.377622 22.377622 0 0 1 34.258106 21.360458c0.142403 30.108074 0 60.216147 0 90.324221a21.726637 21.726637 0 0 1-12.409409 22.174189 21.380801 21.380801 0 0 1-25.632549-4.475524c-4.801017-4.272092-9.276542-9.154482-13.975843-13.630006-8.625556-8.34075-8.767959-8.34075-13.955499 2.034329-11.066751 22.377622-22.092816 44.958678-33.159568 67.3363a24.411952 24.411952 0 0 1-14.993007 14.240305 21.909727 21.909727 0 0 1-26.62937-13.019707c-11.514304-22.987921-22.662428-45.975842-34.03433-68.963764-4.923077-9.968214-5.228226-9.968214-13.304513-2.034329-4.88239 4.88239-9.622378 9.764781-14.647171 14.443738a22.377622 22.377622 0 0 1-37.858869-16.681501q-0.12206-46.993007 0-93.986013a19.122695 19.122695 0 0 1 6.306421-15.25747z m0 0" p-id="6258" fill="#8a8a8a"></path></svg>
        </a>
    </div>
    <%@include file="../../jsp/footer.jsp"%>
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
    /*文章标签*/
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
</body>
</html>