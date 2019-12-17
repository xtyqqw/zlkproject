<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提问页面</title>
    <link rel="stylesheet" href="../layui/css/layui.css" type="text/css">
    <script src="../js/jquery-1.12.4.js"></script>
    <script src="../layui/layui.js"></script>
    <script src="../js/jquery.timeago.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        .context-div{
            overflow-x:hidden;
            position: absolute;
            margin: auto 0;
            width: 100%;
            height: 78%;
            z-index: -999;
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
        .img {
            width: 100%;
            height: 100%;
            object-fit:cover;
            border-radius: 5px;
            border: none 0;
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
            left: 20px;
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
            left: 42px;
            top: 44px;
            display: inline;
        }
        .createTime{
            font-size: 16px;
            color: #989898;
            font-family: Arial;
            position: relative;
            left: 69px;
            top: 35px;
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
<div class="context-div" style="float: left"></div>
<div id="demo1" style="float: right;margin: 1047px 2px auto"></div>
<script>
    $(function () {
        loadData();
        getPage();
        $(".timeago").timeago();
    });
    var page = 1; //设置首页页码
    var limit = 5;  //设置一页显示的条数
    var total;    //总条数
    function loadData() {
        $.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/question/questionAll",
            async: false,
            dataType: 'json',
            data: {
                "page": page,
                "limit": limit
            },
            success: function (ret) {
                total = ret.count;  //设置总条数
                var question = ret.questionAllList;
                var html = '';
                for (var i = 0; i < question.length; i++) {
                    html += '<div class="all" >';
                    html += '<div class="title"><a href="/question/findQuestion?questionId='+question[i].questionId+'" target="_blank">' + question[i].questionTitle + '</a></div>';
                    if (question[i].solve === 0) {
                        html += '<div class="createArticleType">待解决</div>';
                    }
                    if (question[i].solve === 1) {
                        html += '<div class="createArticleType">已解决</div>';
                    }
                    if (question[i].solve === 2) {
                        html += '<div class="createArticleType">未解决</div>';
                    }
                    if (question[i].questionSetTop === 0) {
                        html += '<div class="articleSetTop" id="articleSetTop"><p id="p">置顶</p></div>';
                    }
                    if (question[i].questionSetTop === 1) {
                        html += '<div class="articleSetTop" id="articleSetTop" style="display:none;"><p id="p">' + question[i].questionSetTop + '</p></div>';
                    }
                    html += '<div class="figures" id="figures">' + '<img class="img" src="/img/0.jpg"/>' + '</div>';
                    html += '<div class="articleDigest" style="width: 660px">' + question[i].questionContent + '</div>';
                    html += '<div>';
                    html += '<div class="userRealname"><a href="/question/findQuestion?questionId='+question[i].questionId+'" target="_blank">' + '游客可见' + '</a></div>';
                    html += '<div class="little"></div>';
                    html += '<div class="createTime"><span class="timeago" title="' + question[i].createTime + '"></span></div>';
                    html += '</div>';
                    html += '<svg t="1574820328378" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="713" width="22" height="20"><path d="M512 608a96 96 0 1 1 0-192 96 96 0 0 1 0 192m0-256c-88.224 0-160 71.776-160 160s71.776 160 160 160 160-71.776 160-160-71.776-160-160-160" fill="#989898" p-id="714"></path><path d="M512 800c-212.064 0-384-256-384-288s171.936-288 384-288 384 256 384 288-171.936 288-384 288m0-640C265.248 160 64 443.008 64 512c0 68.992 201.248 352 448 352s448-283.008 448-352c0-68.992-201.248-352-448-352" fill="#989898" p-id="715"></path></svg>';
                    html += '<div class="browseCount"><a href="/question/findQuestion?questionId='+question[i].questionId+'" target="_blank">' + question[i].browseCount + '浏览' + '</a></div>';
                    html += '<svg t="1574820647675" class="icon1" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="832" width="22" height="20"><path d="M896 128H128a32 32 0 0 0-32 32v576a32 32 0 0 0 32 32h288v-64H160V192h704v512h-256c-8.832 0-16.832 3.584-22.656 9.376l-159.968 160 45.248 45.248L621.248 768H896a32 32 0 0 0 32-32V160a32 32 0 0 0-32-32" fill="#989898" p-id="833"></path><path d="M560 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 560 448M240 448a48 48 0 1 0 95.968 0.032A48 48 0 0 0 240 448M784 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 784 448" fill="#989898" p-id="834"></path></svg>';
                    html += '<div class="commentCount"><a href="/question/findQuestion?questionId='+question[i].questionId+'" target="_blank">' + question[i].responseCount + '回答' + '</a></div>';
                    html += '</div>';
                }
                $(".context-div").empty().append(html);
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
                layout: ['prev', 'page', 'next', 'count'],
                jump: function(obj, first){
                    page=obj.curr;
                    limit=obj.limit;
                    console.log(obj);
                    if(!first){
                        loadData()
                    }
                }
            });
        });
    }
</script>
</body>
</html>