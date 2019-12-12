<%--
  Created by IntelliJ IDEA.
  User: Anduin
  Date: 2019/12/3
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/layui/css/layui.css"/>
    <script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>
    body {
        margin: 0;
        padding: 0;
    }

    .all {
        width: 100px;
        height: 30px;
        color: #914ff1;
        border-bottom: 1px solid #914FF1;
        text-align: center;
        display: inline-block;
        margin-left: 50px;
        line-height: 30px;
    }

    .num {
        display: inline-block;
        width: 100px;
        height: 30px;
        float: right;
        font-size: 13px;
        padding-top: 5px;
    }

    .context ul li {
        background: #F5F5F5;
        list-style: none;
        padding: 10px;
        border-radius: 5px;
        margin-top: 20px;
    }

    .img {
        padding: 15px 0 0 15px;
        width: 9%;
        display: inline-block;
        position: absolute;
    }

    .main {
        width: 88%;
        display: inline-block;
        position: relative;
        left: 110px;
    }

    .main ul {
        display: inline-block;
        list-style: none;
    }

    .main ul li {
        float: left;
        margin: 0;
        padding: 0 8px 0 0;
    }

    .main .tag {
        width: 50px;
        height: 18px;
        background: #914ff1;
        display: inline-block;
        border-radius: 5px;
        text-align: center;
        line-height: 18px;
        color: white;
        margin-right: 3px;
    }

    .main .time {
        display: inline-block;
        float: right;
        color: #c0c0c0;
    }

    .main .title {
        margin-top: 7px;
        font-weight: bold;
        max-width: 50em;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }

    .main .type {
        margin-top: 15px;
        color: gray;
    }

    .main .con {
        margin: 10px 0 15px 0;
        line-height: 20px;
        word-break: break-all;
    }

    .main .bom .span_w {
        width: 40px;
        display: inline-block;
        color: gray;
    }

    .main .bom .lookall, .main .bom .cur {
        cursor: pointer;
    }

    .main .bom .cur {
        float: right;
        margin-right: 15px;
    }

    .con_p {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
    }

    .tag_p {
        margin: 20px 0;
    }

    .hid_bom {
        display: none;
    }
    .check_all{width: 40px;height: 20px;background: #009688;color: white;display: inline-block;text-align: center;line-height: 20px;cursor: pointer;}
    .context ul li:hover{background: white;}
</style>
<body>
<div>
    <p class="all">我的文章</p>
    <p class="num">共<span>${articles}</span>条文章</p>
</div>
<div class="context">
    <ul>
<%--        <c:forEach items="${list}" var="list">--%>
<%--        <li>--%>
<%--            <div class="img">--%>
<%--                <img src="${list.figures}" style="height: 70px;width: 70px;border-radius: 3px;">--%>
<%--            </div>--%>
<%--            <div class="main">--%>
<%--                <p>--%>
<%--                <ul>--%>
<%--                    <c:forEach items="${list.tagList}" var="tagList">--%>
<%--                    <li>--%>
<%--                        <span class="tag">${tagList.tagName}</span>--%>
<%--                    </li>--%>
<%--                    </c:forEach>--%>
<%--                </ul>--%>
<%--                <span class="time">${list.createDate}</span>--%>
<%--                </p>--%>
<%--                <p class="title">${list.title}</p>--%>
<%--                <p class="type">${list.typeName}</p>--%>
<%--                <p class="con con_p">${list.articleContent}</p>--%>
<%--                <div class="bom">--%>
<%--                    <i class="layui-icon layui-icon-praise"></i>--%>
<%--                    <span class="span_w">${list.zanCount}</span>--%>
<%--                    <i class="layui-icon layui-icon-tread"></i>--%>
<%--                    <span class="span_w">${list.caiCount}</span>--%>
<%--                    <span>浏览</span>--%>
<%--                    <span class="span_w">${list.browseCount}</span>--%>
<%--                    <span>评论</span>--%>
<%--                    <span class="span_w">${list.commentCount}</span>--%>
<%--                    <span class="lookall">查看全文</span>--%>
<%--                    <span class="delete cur" onclick="deleteArt('${list.articleId}')">删除</span>--%>
<%--                    <span class="edit cur" onclick="editArt('${list.articleContent}','${list.articleId}')">编辑</span>--%>
<%--                    <span class="cur">分享</span>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </li>--%>
<%--        </c:forEach>--%>
    </ul>
</div>
<div id="test1"></div>
<%--<div hidden="hidden" id="demo" style="padding: 25px">--%>
<%--    <form action="<%=request.getContextPath()%>/articles/update" method="post">--%>
<%--        <textarea id="articleContent" name="articleContent"></textarea>--%>
<%--        <input type="text" id="input_hid" hidden="hidden" name="articleId">--%>
<%--        <input type="text" id="input_hid2" hidden="hidden" name="tagList">--%>
<%--        <h4>请选择文章栏目</h4>--%>
<%--        <p class="tag_p"><span style="color: red;">*</span>至少选择一个，最多选择三个</p>--%>
<%--        <div class="layui-form" pane>--%>
<%--            <input type="checkbox" value="JAVA" name="checkbox" title="JAVA" checked>--%>
<%--            <input type="checkbox" value="HTML" name="checkbox" title="HTML">--%>
<%--            <input type="checkbox" value="MYSQL" name="checkbox" title="MYSQL">--%>
<%--            <span class="check_all">确定</span>--%>
<%--        </div>--%>
<%--        <input type="submit" class="layui-btn" value="提交" style="float: right;margin-top: 20px;">--%>
<%--    </form>--%>
<%--</div>--%>
</body>
<script>
    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });
    function deleteArt(articleId){
        var layer = layui.layer;
        layer.confirm('确定删除？',{offset:"200px"},function(index){
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/articles/datele?articleId="+articleId,
                success: function(msg){
                    layer.msg(msg);
                    window.location.href = location.href;
                }
            });
            layer.close(index);
        });
    }
    // layui.use('layer', function(){
    //     var $ = layui.jquery, layer = layui.layer;
    //     window.editArt = function(obj,articleId){
    //         $("#articleContent").html(obj);
    //         $("#input_hid").val(articleId);
    //         layer.open({
    //             type: 1
    //             ,title: '编辑'
    //             ,btn: false
    //             ,area: ['70%','30%']
    //             ,content: $('#demo')
    //             ,offset: '30px'
    //         })
    //     }
    // })
    // layui.use('layedit', function(){
    //     var layedit = layui.layedit;
    //     layedit.build('articleContent',{
    //         tool: [
    //             'strong' //加粗
    //             ,'italic' //斜体
    //             ,'underline' //下划线
    //             ,'del' //删除线
    //         ]
    //     });
    // });
    $(function () {
        loadData()
        getPage()
    })
    var page = 1; //设置首页页码
    var limit = 8;  //设置一页显示的条数
    var total;    //总条数
    function loadData() {
        $.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/articles/flow",
            async: false,
            dataType: 'json',
            data: {
                "page": page,
                "limit": limit,
            },
            success: function (ret) {
                total = ret.count;  //设置总条数
                var data1 = ret.data;
                var html = '';
                for (var i = 0; i < data1.length; i++) {
                    var tagList = data1[i].tagList;
                    var htmlTag = "";
                    html += '<li>';
                    html += '<div class="img">';
                    html += '<img src="'+data1[i].figures+'" style="height: 70px;width: 70px;border-radius: 3px;">';
                    html += '</div>';
                    html += '<div class="main">';
                    html += '<p><ul>';
                    html += '<li class="tag_li">';
                    for (var j = 0;j<tagList.length;j++){
                        htmlTag +='<span class="tag">'+tagList[j].tagName+'</span>';
                    }
                    html += htmlTag;
                    html += '</li>';
                    html += '</ul>';
                    html += '<span class="time">'+data1[i].createDate+'</span></p>';
                    html += '<p class="title">'+data1[i].title+'</p>';
                    html += '<p class="type">'+data1[i].typeName+'</p>';
                    html += '<p class="con con_p">'+data1[i].articleContent+'</p>';
                    html += '<div class="bom"><i class="layui-icon layui-icon-praise"></i>';
                    html += '<span class="span_w">'+data1[i].zanCount+'</span><i class="layui-icon layui-icon-tread"></i>';
                    html += '<span class="span_w">'+data1[i].caiCount+'</span><span>浏览量</span>';
                    html += '<span class="span_w">'+data1[i].browseCount+'</span><span>评论数</span>';
                    html += '<span class="span_w">'+data1[i].commentCount+'</span><a href="/articles/toArt?articleId='+data1[i].articleId+'" class="lookall">查看修改</a>';
                    html += '<span class="delete cur" onclick="deleteArt('+ data1[i].articleId+')">删除</span>';
                    html += '<span class="cur">分享</span></div></div></li>';
                }
                $(".context ul").empty().append(html);
            }
        });
    }
    function getPage(){
        layui.use('laypage', function(){
            var laypage = layui.laypage;
            laypage.render({
                elem: 'test1'
                ,count: total,
                limit:limit,
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
    // $(function () {
    //     loadData()
    //     getPage()
    //     $(".lookall").click(function(){
    //         if(($(this).html())==="查看全文"){
    //             $(this).parent().siblings('.con').removeClass("con_p");
    //             $(this).html("收起");
    //         }else{
    //             $(this).parent().siblings('.con').addClass("con_p");
    //             $(this).html("查看全文");
    //         }
    //     })
    // })
    // var page = 1; //设置首页页码
    // var limit = 8;  //设置一页显示的条数
    // var total;    //总条数
    // function loadData() {
    //     $.ajax({
    //         type: "post",
    //         url: "/articles/flow",
    //         async: false,
    //         dataType: 'json',
    //         data: {
    //             "page": page,
    //             "limit": limit,
    //         },
    //         success: function (ret) {
    //             total = ret.count;  //设置总条数
    //             var data1 = ret.data;
    //             var html = '';
    //             for (var i = 0; i < data1.length; i++) {
    //                 var tagList = data1[i].tagList;
    //                 var htmlTag = "";
    //                 html += '<li>';
    //                 html += '<div class="img">';
    //                 html += '<img src="'+data1[i].figures+'" style="height: 70px;width: 70px;border-radius: 3px;">';
    //                 html += '</div>';
    //                 html += '<div class="main">';
    //                 html += '<p><ul>';
    //                 html += '<li class="tag_li">';
    //                 for (var j = 0;j<tagList.length;j++){
    //                     htmlTag +='<span class="tag">'+tagList[j].tagName+'</span>';
    //                 }
    //                 html += htmlTag;
    //                 html += '</li>';
    //                 html += '</ul>';
    //                 html += '<span class="time">'+data1[i].createDate+'</span></p>';
    //                 html += '<p class="title">'+data1[i].title+'</p>';
    //                 html += '<p class="type">'+data1[i].typeName+'</p>';
    //                 html += '<p class="con con_p">'+data1[i].articleContent+'</p>';
    //                 html += '<div class="bom"><i class="layui-icon layui-icon-praise"></i>';
    //                 html += '<span class="span_w">'+data1[i].zanCount+'</span><i class="layui-icon layui-icon-tread"></i>';
    //                 html += '<span class="span_w">'+data1[i].caiCount+'</span><span>浏览</span>';
    //                 html += '<span class="span_w">'+data1[i].browseCount+'</span><span>评论</span>';
    //                 html += '<span class="span_w">'+data1[i].commentCount+'</span><span class="lookall">查看全文</span>';
    //                 html += '<span class="delete cur" onclick="deleteArt('+ data1[i].articleId+')">删除</span>';
    //                 html += '<span class="edit cur" onclick="editArt(\''+data1[i].articleContent+'\','+data1[i].articleId +')">编辑</span>';
    //                 html += '<span class="cur">分享</span></div></div></li>';
    //             }
    //             $(".context ul").empty().append(html);
    //         }
    //     });
    // }
    // function getPage(){
    //     layui.use('laypage', function(){
    //         var laypage = layui.laypage;
    //         laypage.render({
    //             elem: 'test1'
    //             ,count: total,
    //             limit:limit,
    //             jump: function(obj, first){
    //                 page=obj.curr;
    //                 limit=obj.limit;
    //                 if(!first){
    //                     loadData()
    //                 }
    //             }
    //         });
    //     });
    // }
</script>
</html>
