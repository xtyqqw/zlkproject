<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>最新</title>
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css"/>
    <script src="../js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/jquery.timeago.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        .context-div{
            overflow-x:hidden;
            position: absolute;
            margin: auto 0;
            width: 100%;
            height: 100%;
        }
        /*高宽分别对应横竖滚动条的尺寸*/
        .context-div ::-webkit-scrollbar{
            width: 5px;
            height: 1px;
        }
        /*滚动条里面小方块*/
        .context-div ::-webkit-scrollbar-thumb {
            border-radius: 10px;
            box-shadow   : inset 0 0 5px rgba(0, 0, 0, 0.2);
            background   : #535353;
        }
        /*滚动条里面轨道*/
        .context-div ::-webkit-scrollbar-track {
            box-shadow   : inset 0 0 5px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            background   : #ededed;
        }
        .all{
            width: 100%;
            height: 178px;
            background-color: #FFFFFF;
            border-bottom: 1px solid #F0F0F0;
            position: relative;
        }
        .title{
            position: relative;
            left: 23px;
            top: -9px;
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
            top: -3px;
            float: left;
            width: 35px;
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
            top: -3px;
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
            margin-left: 20px;
            margin-top: -52px;
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
            /*width: 170px;
            height: 95px;*/
            /*object-fit:cover;*/
            /*border-radius: 5px;*/
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
        .userImg{
            border: 1px crimson solid;
            width: 20px;
            height: 20px;
            border-radius: 50px;
            position: absolute;
            margin-left: 23px;
            margin-top: 35px;
        }
        .userRealname{
            position: relative;
            float: left;
            left: 66px;
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
            left: 79px;
            top: 44px;
            display: inline;
        }
        #createTime{
            font-size: 16px;
            color: #989898;
            font-family: Arial;
            position: relative;
            left: 92px;
            top: 36px;
            float: left;
            display: inline;
        }
        a:hover{
            color: #1296db;
            text-decoration:none;
        }
    </style>
</head>
<body>
<div class="context-div" id="context-div"></div>
<!--没插图就隐藏-->
<%--<script>
    $(function () {
        var img = $("#figures").find("img");
        if(img.length<=0){
            $("#figures").hide()
        }
    })
</script>--%>
<!--瀑布流-->
<script>
    layui.use('flow', function(){
        var flow = layui.flow;
        var $ =layui.jquery;
        flow.load({
            elem: '#context-div' //流加载容器
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
                                    '<div class="title"><a href="#">'+article.title+'</a></div>';
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
                                    '<div class="userRealname"><a href="#">'+article.user.userRealname+'</a></div>'+
                                    '<div class="little"></div>'+
                                    '<div class="createTime" id="createTime"><span class="timeago" title="'+article.createTime+'"></span></div>'+
                                    '</div>'+
                                    '<div class="userImg">'+article.user.userImg+'</div>'+
                                    '<svg t="1574820328378" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="713" width="22" height="20"><path d="M512 608a96 96 0 1 1 0-192 96 96 0 0 1 0 192m0-256c-88.224 0-160 71.776-160 160s71.776 160 160 160 160-71.776 160-160-71.776-160-160-160" fill="#989898" p-id="714"></path><path d="M512 800c-212.064 0-384-256-384-288s171.936-288 384-288 384 256 384 288-171.936 288-384 288m0-640C265.248 160 64 443.008 64 512c0 68.992 201.248 352 448 352s448-283.008 448-352c0-68.992-201.248-352-448-352" fill="#989898" p-id="715"></path></svg>'+
                                    '<div class="browseCount"><a href="#">'+article.browseCount+'阅读'+'</a></div>'+
                                    '<svg t="1574820647675" class="icon1" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="832" width="22" height="20"><path d="M896 128H128a32 32 0 0 0-32 32v576a32 32 0 0 0 32 32h288v-64H160V192h704v512h-256c-8.832 0-16.832 3.584-22.656 9.376l-159.968 160 45.248 45.248L621.248 768H896a32 32 0 0 0 32-32V160a32 32 0 0 0-32-32" fill="#989898" p-id="833"></path><path d="M560 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 560 448M240 448a48 48 0 1 0 95.968 0.032A48 48 0 0 0 240 448M784 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 784 448" fill="#989898" p-id="834"></path></svg>'+
                                    '<div class="commentCount"><a href="#">'+article.commentCount+'评论'+'</a></div>'+
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
</body>
</html>