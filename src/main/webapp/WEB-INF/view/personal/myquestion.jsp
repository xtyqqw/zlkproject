<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/12/3
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>我的问答</title>
    <script src="/js/jquery-1.12.4.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <style type="text/css">
        .main{font-family: "微软雅黑";margin: 0 auto;padding: 0;width: 100%;}
        .nav{
            margin: 0 auto;
            width: 1040px;
        }
        /*导航*/
        .nav_ul{
            list-style: none;
        }
        .main_ul{
            list-style: none;
            margin-top: 0;
        }
        .nav_ul .nav_li1{
            color: #8c24dd;
            border-bottom: 2px solid #8c24dd;
        }
        .nav_ul .nav_li1,.nav_li2,.nav_li3{
            float: left;
            padding: 10px;
            width: 80px;
            text-align: center;
            letter-spacing: 3px;
            color: #656565;
        }
        .nav_ul li:hover{
            color: #8c24dd !important;
            border-bottom: 2px solid #8c24dd !important;
            cursor: pointer;
        }
        .active{
            color: #8c24dd;
            border-bottom: 2px solid #8c24dd;
        }
        .nav .count{
            float: right;
            color: #656565;
            font-size: 14px;
            margin-right: 20px;
            margin-top: 10px;
        }
        /* 提问样式 */
        .question_waik{
            border: 1px solid #FAFAFA;
            background-color: #FAFAFA;
            margin: 40px 0 0 0;
            padding-bottom: 50px;
        }
        .question_waik:hover{
            background-color: #FFFFFF;
            box-shadow: 1px 1px 5px 1px #D4D4D4;
        }
        .head_lebel{
            margin: 20px;
        }
        .lebel_li{
            float: left;
            border: 1px solid #bec3d9;
            background-color: #bec3d9;
            border-radius: 50px;
            padding: 0 10px;
            margin: 0 10px;
            color: #FFFFFF;
        }
        .question_waik .title{
            font-size: 18px;
            margin-top: 20px;
            margin-left: 30px;
            font-weight: bold;
        }
        .question_waik .from{
            font-size: 14px;
            margin-top: 30px;
            margin-left: 30px;
        }
        .question_waik .question_num,.look_num,.question_share{
            margin-top: 10px;
            margin-left: 30px;
            color: #999999;
            float: left;
        }
        .question_waik .question_share:hover{
            color: #494949;
            cursor: pointer;
        }
        .question_waik .question_num{
            margin-left: 30px;
            margin-top: 10px;
        }
        .question_waik .question_date{
            margin-top: 10px;
            float: right;
            margin-right: 20px;
            color: #999999;
        }
        .reply_waik_adopted,.reply_waik{
            margin: 40px 0;
            border: 1px solid #FAFAFA;
            background-color: #FAFAFA;
            padding-bottom: 20px;
        }
        .reply_waik_adopted:hover{
            background-color: #FFFFFF;
            box-shadow: 1px 1px 5px 1px #D4D4D4;
        }
        .reply_date{
            margin-top: 20px;
            margin-right: 20px;
            float: right;
            color: #999999;
        }
        .reply_waik_adopted .adopted{
            border: 1px solid #ffcd04;
            background-color: #ffcd04;
            border-radius: 5px;
            color: #FFFFFF;
            padding: 1px 3px;
            margin-top: 45px;
            margin-left: 30px;
            float: left;
            font-size: 10px;
        }
        .reply_waik_adopted .reply_adopted_msg{
            margin: 45px 90px 30px 80px;
            font-size: 16px;
            color: #494949;
        }
        .reply_waik_adopted .reply_adopted_share{
            float: right;
            margin-right: 20px;
            color: #999999;
        }
        .reply_waik_adopted .reply_adopted_share:hover{
            color: #494949;
            cursor: pointer;
        }
        .reply_waik:hover{
            background-color: #FFFFFF;
            box-shadow: 1px 1px 5px 1px #D4D4D4;
        }
        .reply_waik .reply_msg{
            margin: 45px 90px 30px 30px;
            font-size: 16px;
            color: #494949;
        }
        .reply_waik .reply_dian{
            float: right;
            margin-right: 20px;
            font-size: 30px;
            color: #999999;
            margin-top: -15px;
            cursor: pointer;
        }
        .reply_waik .reply_share,.reply_edit,.reply_delete{
            float: right;
            margin-right: 20px;
            color: #999999;
        }
        .reply_waik .reply_share:hover{
            color: #494949;
            cursor: pointer;
        }
        .reply_waik .reply_edit:hover{
            color: #494949;
            cursor: pointer;
        }
        .reply_waik .reply_delete:hover{
            color: #494949;
            cursor: pointer;
        }
        .main_ul a{
            text-decoration: none;
        }
        /*提交答案弹窗*/
        .answer_succ1,.answer_succ2,.answer_succ3{
            width: 400px;
            height: 70px;
            border: 1px solid #fff;
            box-shadow: 1px 1px 5px 1px #D4D4D4;
            text-align: center;
            border-radius: 5px;
            position: fixed;
            top: 200px;
            left: 300px;
        }
        .answer_succ1{
            display: none;
        }
        .answer_succ2{
            display: none;
        }
        .answer_succ3{
            display: none;
        }
        .att_succ_ok,.att_succ_no,.att_succ_noo{
            float: left;
            margin-right: 10px;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            color: #ffffff;
            margin-top: 25px;
        }
        .att_succ_ok{
            border: 1px solid #5ab62f;
            background-color: #5ab62f;
            margin-left: 110px;
            font-size: 20px;
            line-height: 1;
        }
        .att_succ_no{
            border: 1px solid #d34748;
            background-color: #d34748;
            margin-left: 100px;
            line-height: 1.5;
        }
        .att_succ_noo{
            border: 1px solid #f5bb29;
            background-color: #f5bb29;
            margin-left: 90px;
            font-weight: bold;
            font-size: 16px;
        }
        .att_succ_zi1,.att_succ_zi2,.att_succ_zi3{
            font-size: 17px;
            float: left;
            margin-top: 25px;
        }
    </style>
</head>
<body>
<div class="main">
    <div class="nav">
        <ul class="nav_ul">
            <li class="nav_li1">全部</li>
            <li class="nav_li2">我的提问</li>
            <li class="nav_li3">我的问答</li>
        </ul>
        <ul class="main_ul">
            <%--全部--%>
            <li class="main_li_show">
                <p class="count">共${list.size()}条记录</p><br>
                <c:forEach items="${list}" var="all">
                    <%--我的提问--%>
                    <c:if test="${all.type==0}">
                        <div class="question_waik">
                            <ul class="head_lebel">
                                <c:forEach items="${all.tagList}" var="tag">
                                    <li class="lebel_li">${tag.tagName}</li>
                                </c:forEach>
                            </ul><br />
                            <p class="title">
                                <a href="javascript:;">${all.questionTitle}</a>
                            </p>
                            <p class="from">来自：${all.typeName}</p>
                            <p class="question_num">回答 ${all.responseCount}</p>
                            <p class="look_num">浏览 ${all.browseCount}</p>
                            <p class="question_share">分享</p>
                            <p class="question_date">${all.formatDate}</p>
                        </div>
                    </c:if>
                    <!-- 我的回答 已采纳 -->
                    <c:if test="${all.type==1&&all.accept==1}">
                        <div class="reply_waik_adopted">
                            <p class="reply_date">${all.formatDate}</p>
                            <p class="adopted">已采纳</p>
                            <p class="reply_adopted_msg">
                                <a href="javascript:;">${all.responseContent}</a>
                            </p>
                            <i class="layui-icon layui-icon-praise"
                               style="margin-left: 30px;color: #494949;"> ${all.zanCount}</i>
                            <i class="layui-icon layui-icon-tread"
                               style="margin-left: 20px;color: #494949;"> ${all.caiCount}</i>
                            <i class="layui-icon layui-icon-dialogue"
                               style="margin-left: 20px;color: #494949;"> ${all.replyCount}</i>
                            <p class="reply_adopted_share">分享</p>
                        </div>
                    </c:if>
                    <!-- 我的回答 未采纳 -->
                    <c:if test="${all.type==1&&all.accept==0}">
                        <div class="reply_waik">
                            <p class="reply_date">${all.formatDate}</p>
                            <p class="reply_msg">
                                <a href="javascript:;">${all.responseContent}</a>
                            </p>
                            <i class="layui-icon layui-icon-praise"
                               style="margin-left: 30px;color: #494949;"> ${all.zanCount}</i>
                            <i class="layui-icon layui-icon-tread"
                               style="margin-left: 20px;color: #494949;"> ${all.caiCount}</i>
                            <i class="layui-icon layui-icon-dialogue"
                               style="margin-left: 20px;color: #494949;"> ${all.replyCount}</i>
                            <p class="reply_dian">...</p>
                            <p class="reply_delete" onclick="delNote(${all.responseId})">删除</p>
                            <p class="reply_edit" onclick="editNote('${all.responseContent}',${all.responseId})">编辑</p>
                            <p class="reply_share">分享</p>
                        </div>
                    </c:if>
                </c:forEach>
            </li>
            <%--我的提问--%>
            <li class="main_li2">
                <p class="count">共${qList.size()}条笔记</p><br>
                <c:forEach items="${qList}" var="question">
                    <div class="question_waik">
                        <ul class="head_lebel">
                            <c:forEach items="${question.tagList}" var="tag1">
                                <li class="lebel_li">${tag1.tagName}</li>
                            </c:forEach>
                        </ul><br />
                        <p class="title">
                             <a href="javascript:;">${question.questionTitle}</a>
                        </p>
                        <p class="from">来自：${question.typeName}</p>
                        <p class="question_num">回答 ${question.responseCount}</p>
                        <p class="look_num">浏览 ${question.browseCount}</p>
                        <p class="question_share">分享</p>
                        <p class="question_date">${question.formatDate}</p>
                    </div>
                </c:forEach>
            </li>
            <%--我的回答--%>
            <li class="main_li3">
                <p class="count">共${rList.size()}条笔记</p><br>
                <c:forEach items="${rList}" var="response">
                    <!-- 我的回答 已采纳 -->
                    <c:if test="${response.accept==1}">
                        <div class="reply_waik_adopted">
                            <p class="reply_date">${response.formatDate}</p>
                            <p class="adopted">已采纳</p>
                            <p class="reply_adopted_msg">
                                 <a href="javascript:;">${response.responseContent}</a>
                            </p>
                            <i class="layui-icon layui-icon-praise"
                               style="margin-left: 30px;color: #494949;"> ${response.zanCount}</i>
                            <i class="layui-icon layui-icon-tread"
                               style="margin-left: 20px;color: #494949;"> ${response.caiCount}</i>
                            <i class="layui-icon layui-icon-dialogue"
                               style="margin-left: 20px;color: #494949;"> ${response.replyCount}</i>
                            <p class="reply_adopted_share">分享</p>
                        </div>
                    </c:if>
                    <!-- 我的回答 未采纳 -->
                    <c:if test="${response.accept==0}">
                        <div class="reply_waik">
                            <p class="reply_date">${response.formatDate}</p>
                            <p class="reply_msg">
                                 <a href="javascript:;">${response.responseContent}</a>
                            </p>
                            <i class="layui-icon layui-icon-praise"
                               style="margin-left: 30px;color: #494949;"> ${response.zanCount}</i>
                            <i class="layui-icon layui-icon-tread"
                               style="margin-left: 20px;color: #494949;"> ${response.caiCount}</i>
                            <i class="layui-icon layui-icon-dialogue"
                               style="margin-left: 20px;color: #494949;"> ${response.replyCount}</i>
                            <p class="reply_dian">...</p>
                            <p class="reply_delete" onclick="delNote(${response.responseId})">删除</p>
                            <p class="reply_edit"
                               onclick="editNote('${response.responseContent}',${response.responseId})">编辑</p>
                            <p class="reply_share">分享</p>
                        </div>
                    </c:if>
                </c:forEach>
            </li>
            <%--富文本编辑框--%>
            <div hidden="hidden" id="demo" style="padding: 25px">
                <form action="<%=request.getContextPath()%>/myfaqq/updateResponse" method="post">
                    <textarea id="content" name="responseContent" maxlength="120"
                              onkeydown="checknum()" onkeyup="checknum()"></textarea>
                    <input type="text" id="input_hid" hidden="hidden" name="responseId">
                    <input type="text" id="in" style="margin-top: 10px;color: #999;border: #fff;width: 200px">
                    <input type="submit" class="layui-btn" style="float: right;" value="提交">
                </form>
                <%--<div>
                    <textarea id="content" name="responseContent"></textarea>
                    <input type="text" id="input_hid" style="display: none"  name="responseId">
                    <input type="submit" class="layui-btn" style="float: right;"
                           onclick="submit()" value="提交">
                </div>
                <div class="answer_tan">
                    <div class="answer_succ1">
                        <p class="att_succ_ok">√</p>
                        <p class="att_succ_zi1">答案提交已成功！</p>
                    </div>
                    <div class="answer_succ2">
                        <p class="att_succ_no">X</p>
                        <p class="att_succ_zi2">提交失败，请重新操作！</p>
                    </div>
                    <div class="answer_succ3">
                        <p class="att_succ_noo">!</p>
                        <p class="att_succ_zi3">加载超时，请稍后再试！</p>
                    </div>
                </div>--%>
            </div>
        </ul>
        <%--<div id="demo7" style="float: right;margin: 50px 20px auto"></div>--%>
    </div>
</div>
<%--富文本文字长度 并没有什么用--%>
<script type="text/javascript">
    function checknum(){
        var textDom =  document.getElementById("content");
        var len = textDom.value.length;
        if(len > 120){
            textDom.value = textDom.value.substring(0,120);
            return;
        }
        document.getElementById("in").value="还可以输入"+ (120-len) +"/120个字";
    }
    checknum();
</script>
<%--全部 分页--%>
<%--<script>
    var page = 1;
    var limit = 5;
    var total;
    function showAll() {
        $.ajax({
            type: "post",
            url: "/myfaqq/faqtest1",
            async: false,
            dataType: 'json',
            data: {
                "page": page,
                "limit": limit,
            },
            success: function (all){
                total = all.countAll;
                var data1 = all.list;
                var html = '';
                for (var i = 0;i < data1.length;i++){
                    /*我的提问*/
                    if (data1.type==0){
                        html += '<div class="question_waik">';
                        html += '<ul class="head_lebel">';
                        for (var j = 0;j<data1.tagList;j++){
                            html += '<li class="lebel_li">'+ data1[i].tagName+'</li>';
                        }
                        html += '</ul><br />';
                        html += '<p class="title">';
                        html += '<a href="javascript:;">'+ data1[i].questionTitle+'</a>';
                        html += '</p>';
                        html += '<p class="from">来自：'+ data1[i].typeName+'</p>';
                        html += '<p class="question_num">回答 '+ data1[i].responseCount+'</p>';
                        html += '<p class="look_num">浏览 '+ data1[i].browseCount+'</p>';
                        html += '<p class="question_share">分享</p>';
                        html += '<p class="question_date">'+ data1[i].formatDate+'</p>';
                        html += '</div>';
                    }
                    /*我的回答 已采纳*/
                    if (data1.type == 1&&data1.accept ==1){
                        html += '<div class="reply_waik_adopted">';
                        html += '<p class="reply_date">'+ data1[i].formatDate+'</p>';
                        html += '<p class="adopted">已采纳</p>';
                        html += '<p class="reply_adopted_msg">';
                        html += '<a href="javascript:;">'+ data1[i].responseContent+'</a>';
                        html += '</p>';
                        html += '<i class="layui-icon layui-icon-praise"' +
                            'style="margin-left: 30px;color: #494949;">'+ data1[i].zanCount+'</i>';
                        html += '<i class="layui-icon layui-icon-tread"' +
                            'style="margin-left: 20px;color: #494949;">'+ data1[i].caiCount+'</i>';
                        html += '<i class="layui-icon layui-icon-dialogue"\n' +
                            'style="margin-left: 20px;color: #494949;">'+ data1[i].replyCount+'</i>';
                        html += '<p class="reply_adopted_share">分享</p>';
                        html += '</div>';
                    }
                    /*我的回答 未采纳*/
                    if (data1.type==1&&data1.accept==0){
                        html += '<div class="reply_waik">';
                        html += '<p class="reply_date">'+data1[i].formatDate+'</p>';
                        html += '<p class="reply_msg">';
                        html += '<a href="javascript:;">'+data1[i].responseContent+'</a>';
                        html += '</p>';
                        html += '<i class="layui-icon layui-icon-praise"' +
                            'style="margin-left: 30px;color: #494949;">'+ data1[i].zanCount+'</i>';
                        html += '<i class="layui-icon layui-icon-tread"' +
                            'style="margin-left: 20px;color: #494949;">'+ data1[i].caiCount+'</i>';
                        html += '<i class="layui-icon layui-icon-dialogue"' +
                            'style="margin-left: 20px;color: #494949;">'+ data1[i].replyCount+'</i>';
                        html += '<p class="reply_dian">...</p>';
                        html += '<p class="reply_delete" onclick="delNote('+ data1[i].responseId+')">删除</p>';
                        html += '<p class="reply_edit" onclick="editNote('+ data1[i].responseContent+','+ data1[i].responseId+')">编辑</p>';
                        html += '<p class="reply_share">分享</p>';
                        html += '</div>';
                    }
                }
                $(".main_li_show").empty().append(html);
            }
        })
    }
    function getPage(){
        layui.use('laypage', function() {
            var laypage = layui.laypage;
            laypage.render({
                elem: 'demo7'
                ,count: total //数据总数
                ,theme: '#914FF1'
                ,jump: function(obj,first){
                    page=obj.curr;
                    limit=obj.limit;
                    if(!first){
                        showAll();
                    }
                }
            });
        });
    }
    $(function () {
        showAll();
        getPage()
    })
</script>
&lt;%&ndash;我的提问 分页&ndash;%&gt;
<script>
    var page = 1;
    var limit = 5;
    var total;
    function showQuestion() {
        $.ajax({
            type: "post",
            url: "/myfaqq/faqtestq",
            async: false,
            dataType: 'json',
            data: {
                "page": page,
                "limit": limit,
            },
            success: function (question){
                total = question.countq;
                var ques = question.qList;
                var html = '';
                for (var i = 0;i < ques.length;i++){
                    html += '<div class="question_waik">';
                    html += '<ul class="head_lebel">';
                    for (var j = 0;j<ques.tagList;j++){
                        html += '<li class="lebel_li">'+ ques[i].tagName+'</li>';
                    }
                    html += '</ul><br />';
                    html += '<p class="title">';
                    html += '<a href="javascript:;">'+ ques[i].questionTitle+'</a>';
                    html += '</p>';
                    html += '<p class="from">来自：'+ ques[i].typeName+'</p>';
                    html += '<p class="question_num">回答 '+ ques[i].responseCount+'</p>';
                    html += '<p class="look_num">浏览 '+ ques[i].browseCount+'</p>';
                    html += '<p class="question_share">分享</p>';
                    html += '<p class="question_date">'+ ques[i].formatDate+'</p>';
                    html += '</div>';
                }
                $(".main_li2").empty().append(html);
            }
        })
    }
    function getPage(){
        layui.use('laypage', function() {
            var laypage = layui.laypage;
            laypage.render({
                elem: 'demo7'
                ,count: total //数据总数
                ,theme: '#914FF1'
                ,jump: function(obj,first){
                    page=obj.curr;
                    limit=obj.limit;
                    if(!first){
                        showQuestion();
                    }
                }
            });
        });
    }
    $(function () {
        showQuestion();
        getPage()
    })
</script>
&lt;%&ndash;我的问答 分页&ndash;%&gt;
<script>
    var page = 1;
    var limit = 5;
    var total;
    function showReply() {
        $.ajax({
            type: "post",
            url: "/myfaqq/faqtestr",
            async: false,
            dataType: 'json',
            data: {
                "page": page,
                "limit": limit,
            },
            success: function (replly){
                total = replly.countr;
                var reply = replly.rList;
                var html = '';
                for (var i = 0;i < reply.length;i++){
                    /*我的回答 已采纳*/
                    if (reply.accept ==1){
                        html += '<div class="reply_waik_adopted">';
                        html += '<p class="reply_date">'+ reply[i].formatDate+'</p>';
                        html += '<p class="adopted">已采纳</p>';
                        html += '<p class="reply_adopted_msg">';
                        html += '<a href="javascript:;">'+ reply[i].responseContent+'</a>';
                        html += '</p>';
                        html += '<i class="layui-icon layui-icon-praise"' +
                            'style="margin-left: 30px;color: #494949;">'+ reply[i].zanCount+'</i>';
                        html += '<i class="layui-icon layui-icon-tread"' +
                            'style="margin-left: 20px;color: #494949;">'+ reply[i].caiCount+'</i>';
                        html += '<i class="layui-icon layui-icon-dialogue"\n' +
                            'style="margin-left: 20px;color: #494949;">'+ reply[i].replyCount+'</i>';
                        html += '<p class="reply_adopted_share">分享</p>';
                        html += '</div>';
                    }
                    /*我的回答 未采纳*/
                    if (reply.accept==0){
                        html += '<div class="reply_waik">';
                        html += '<p class="reply_date">'+reply[i].formatDate+'</p>';
                        html += '<p class="reply_msg">';
                        html += '<a href="javascript:;">'+reply[i].responseContent+'</a>';
                        html += '</p>';
                        html += '<i class="layui-icon layui-icon-praise"' +
                            'style="margin-left: 30px;color: #494949;">'+ reply[i].zanCount+'</i>';
                        html += '<i class="layui-icon layui-icon-tread"' +
                            'style="margin-left: 20px;color: #494949;">'+ reply[i].caiCount+'</i>';
                        html += '<i class="layui-icon layui-icon-dialogue"' +
                            'style="margin-left: 20px;color: #494949;">'+ reply[i].replyCount+'</i>';
                        html += '<p class="reply_dian">...</p>';
                        html += '<p class="reply_delete" onclick="delNote('+ reply[i].responseId+')">删除</p>';
                        html += '<p class="reply_edit" onclick="editNote('+ reply[i].responseContent+','+ data1[i].responseId+')">编辑</p>';
                        html += '<p class="reply_share">分享</p>';
                        html += '</div>';
                    }
                }
                $(".main_li3").empty().append(html);
            }
        })
    }
    function getPage(){
        layui.use('laypage', function() {
            var laypage = layui.laypage;
            laypage.render({
                elem: 'demo7'
                ,count: total //数据总数
                ,theme: '#914FF1'
                ,jump: function(obj,first){
                    page=obj.curr;
                    limit=obj.limit;
                    if(!first){
                        showReply();
                    }
                }
            });
        });
    }
    $(function () {
        showReply();
        getPage()
    })
</script>--%>
<script type="text/javascript">
    /*点击删除*/
    function delNote(responseId){
        var layer = layui.layer;
        layer.confirm('确定删除？',{offset:"100px"},function(index){
            $.ajax({
                type: "POST",
                url: "/myfaqq/removeResponse?responseId="+responseId,
                success: function(data){
                    /*if(data.code===1){
                        alert("删除成功！");
                        layer.msg(data);
                        /!*window.location.href = location.href;*!///删除后刷新当前页面
                        location.reload();
                    } else {
                        /!*alert("删除失败，请重新操作！");*!/
                        layer.msg(data);
                    }*/
                    layer.msg(data);
                    window.location.href = location.href;
                }
            });
            layer.close(index);
        });
    }
    /*点击编辑*/
    layui.use('layer', function(){
        var $ = layui.jquery, layer = layui.layer;
        window.editNote = function(obj,responseId){
            $("#content").html(obj);
            $("#input_hid").val(responseId);
            layer.open({
                type: 1,
                title: '我要回答',
                btn: false,
                area: ['70%','50%'],
                content: $('#demo'),
                offset: '30px'
            })
        }
    });
    /*点击提交触发事件*/
    /*function submit(){
        var layer = layui.layer;
        var content = $("#content").val();
        var resId = $("#input_hid").val();
        var jsonstr = {"responseId":resId,"responseContent":content};
        $.ajax({
            url:"/myfaqq/updateResponse",
            type:"POST",
            dataType: JSON,
            data: jsonstr,
            success: function (data) {
                if(data.code==1){
                    $(".answer_succ1").show().delay(2000).hide(300);
                    $("#demo").hide();
                    layer.closeAll();
                } else {
                    $(".answer_succ2").show().delay(2000).hide(300);
                    $("#demo").hide();
                }
            }, error: function () {
                $(".answer_succ3").show().delay(2000).hide(300);
                $("#demo").hide();
            }
        });
    }*/

    /*富文本编辑*/
    layui.use('layedit', function(){
        var layedit = layui.layedit;
        layedit.build('content',{
            tool: [
                'strong', //加粗
                'italic', //斜体
                'underline', //下划线
                'del' //删除线
            ]
        });
    });
</script>
<%--点击...显示分享 编辑 删除事件--%>
<script>
    $(".reply_delete,.reply_edit,.reply_share").hide();
    $(document).ready(function(){
        $(".reply_dian").click(function(){
            $(this).siblings(".reply_delete,.reply_edit,.reply_share").show();
            $(this).hide();
        });
    });
</script>
<!--点击选项卡(全部 我的提问 我的回答)事件-->
<script>
    $(".main_li2,.main_li3").hide();
    $(document).ready(function () {
        $(".nav_li1").click(function(){
            $(this).addClass("active").siblings().removeClass("active");
            $(".nav_li1").css("color","#8c24dd");
            $(".nav_li1").css("border-bottom","2px solid #8c24dd");
            $(".main_li_show").show();
            $(".main_li2,.main_li3").hide();
        });
        $(".nav_li2").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
            $(".nav_li1").css("color","#656565");
            $(".nav_li1").css("border-bottom","none");
            $(".main_li2").show();
            $(".main_li_show,.main_li3").hide();
        });
        $(".nav_li3").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
            $(".nav_li1").css("color","#656565");
            $(".nav_li1").css("border-bottom","none");
            $(".main_li3").show();
            $(".main_li_show,.main_li2").hide();
        });
    });
</script>
</body>
</html>
