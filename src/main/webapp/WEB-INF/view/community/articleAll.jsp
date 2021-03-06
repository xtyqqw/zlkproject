<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>热门</title>
    <link rel="stylesheet" href="../layui/css/layui.css" type="text/css">
    <script src="../js/jquery-1.12.4.js"></script>
    <script src="../layui/layui.js"></script>
    <script src="../js/jquery.timeago.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        .context-div{
            width: 100%;
            height: auto;
            padding-bottom: 1px;
            overflow-x: hidden;
        }
        .all{
            width: 100%;
            height: 185px;
            background-color: #FFFFFF;
            border-bottom: 1px solid #F0F0F0;
        }
        .title{
            margin-left: 13px;
            margin-top: 7px;
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
            margin-left: 22px;
            margin-top: 11px;
            float: left;
            width: 55px;
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
            margin-left: 13px;
            margin-top: 11px;
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
        .articleDigest{
            margin-left: 14px;
            margin-top: -33px;
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
            margin-left: 807px;
            margin-top: 23px;
            width: 170px;
            height: 95px;
            border-radius: 5px;
            border: none 0;
        }
        .img {
            width: 95%;
            height: 100%;
            object-fit:cover;
            border-radius: 5px;
            border: none 0;
        }
        .icon{
            float: right;
            margin-right: 246px;
            margin-top: 38px;
        }
        .browseCount{
            float: right;
            margin-right: -85px;
            margin-top: 37px;
        }
        .browseCount a{
            font-size: 16px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        .icon1{
            float: right;
            margin-right: -124px;
            margin-top: 39px;
        }
        .commentCount{
            float: right;
            margin-right: -177px;
            margin-top: 37px;
        }
        .commentCount a{
            font-size: 16px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        .userRealname{
            float: left;
            margin-left: 14px;
            margin-top: 35px;
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
            float: left;
            margin-left: 25px;
            margin-top: 44px;
            display: inline;
        }
        .updateTime{
            font-size: 16px;
            color: #989898;
            font-family: Arial;
            margin-left: 34px;
            margin-top: 35px;
            float: left;
            display: inline;
        }
        .all a:hover{
            color: #914ff1;
            text-decoration:none;
        }
    </style>
</head>
<body>
    <div class="context-div"></div>
    <div id="demo1" style="float: right;clear: both"></div>
<script>
    $(function () {
        loadData();
        getPage();
    });
    var page = 1; //设置首页页码
    var limit = 5;  //设置一页显示的条数
    var total;    //总条数
    function loadData() {
        $.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/articles/findByCreateTime",
            async: false,
            dataType: 'json',
            data: {
                "page": page,
                "limit": limit
            },
            success: function (ret) {
                total = ret.count;  //设置总条数
                var article = ret.articleList;
                var html = '';
                for (var i = 0; i < article.length; i++) {
                    html += '<div class="all" >';
                    html += '<div class="title"><a href="/community/article-show?articleId='+article[i].articleId+'" target="_blank">' + article[i].title + '</a></div>';
                    if (article[i].createArticleType === 0) {
                        html += '<div class="createArticleType">原创</div>';
                    }
                    if (article[i].createArticleType === 1) {
                        html += '<div class="createArticleType">转载</div>';
                    }
                    if (article[i].createArticleType === 2) {
                        html += '<div class="createArticleType">翻译</div>';
                    }
                    if (article[i].articleSetTop === 0) {
                        html += '<div class="articleSetTop" id="articleSetTop"><p id="p">置顶</p></div>';
                    }
                    if (article[i].articleSetTop === 1) {
                        html += '<div class="articleSetTop" id="articleSetTop" style="display:none;"><p id="p">' + article.articleSetTop + '</p></div>';
                    }
                    html += '<div class="figures" id="figures">' + '<img class="img" src="' + article[i].figures + '"/>' + '</div>';
                    html += '<div class="articleDigest" style="width: 660px">' + article[i].articleDigest + '</div>';
                    html += '<div class="userRealname"><a href="/community/article-show?articleId='+article[i].articleId+'" target="_blank">' + article[i].user.userRealname + '</a></div>';
                    html += '<div class="little"></div>';
                    html += '<div class="updateTime"><span class="timeago" title="' + article[i].updateTime + '"></span></div>';
                    html += '<svg t="1574820328378" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="713" width="22" height="20"><path d="M512 608a96 96 0 1 1 0-192 96 96 0 0 1 0 192m0-256c-88.224 0-160 71.776-160 160s71.776 160 160 160 160-71.776 160-160-71.776-160-160-160" fill="#989898" p-id="714"></path><path d="M512 800c-212.064 0-384-256-384-288s171.936-288 384-288 384 256 384 288-171.936 288-384 288m0-640C265.248 160 64 443.008 64 512c0 68.992 201.248 352 448 352s448-283.008 448-352c0-68.992-201.248-352-448-352" fill="#989898" p-id="715"></path></svg>';
                    html += '<div class="browseCount"><a href="/community/article-show?articleId='+article[i].articleId+'" target="_blank">' + article[i].browseCount + '阅读' + '</a></div>';
                    html += '<svg t="1574820647675" class="icon1" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="832" width="22" height="20"><path d="M896 128H128a32 32 0 0 0-32 32v576a32 32 0 0 0 32 32h288v-64H160V192h704v512h-256c-8.832 0-16.832 3.584-22.656 9.376l-159.968 160 45.248 45.248L621.248 768H896a32 32 0 0 0 32-32V160a32 32 0 0 0-32-32" fill="#989898" p-id="833"></path><path d="M560 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 560 448M240 448a48 48 0 1 0 95.968 0.032A48 48 0 0 0 240 448M784 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 784 448" fill="#989898" p-id="834"></path></svg>';
                    html += '<div class="commentCount"><a href="/community/article-show?articleId='+article[i].articleId+'" target="_blank">' + article[i].commentCount + '评论' + '</a></div>';
                    html += '</div>';
                }
                $(".context-div").empty().append(html);
                $(".timeago").timeago();
            }
        });
    }
    function getPage(){
        layui.use('laypage', function(){
            var laypage = layui.laypage;
            laypage.render({
                elem: 'demo1',
                count: total,
                limit:limit,
                layout: ['prev', 'next', 'count'],
                jump: function(obj, first){
                    page=obj.curr;
                    limit=obj.limit;
                    if(!first){
                        loadData()
                    }
                }
            });
        });
    }
    <%--<%
    //页面每隔30秒自动刷新一遍
    response.setHeader("refresh" , "30" );
    %>--%>
</script>
</body>
</html>