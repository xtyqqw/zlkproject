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
    <link rel="stylesheet" type="text/css" href="../../../layui/css/layui.css"/>
    <script src="../../../js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../../layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
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
        background: gainsboro;
        display: inline-block;
        border-radius: 5px;
        text-align: center;
        line-height: 18px;
        color: white;
    }

    .main .time {
        display: inline-block;
        float: right;
        color: #c0c0c0;
    }

    .main .title {
        margin-top: 7px;
        font-weight: bold;
    }

    .main .type {
        margin-top: 15px;
        color: gray;
    }

    .main .con {
        margin: 10px 0 15px 0;
        line-height: 20px;
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
</style>
<body>
<div>
    <p class="all">我的文章</p>
    <p class="num">共<span>${articles}</span>条文章</p>
</div>
<div class="context">
    <ul>
        <c:forEach items="${list}" var="list">
        <li>
            <div class="img">
                <img src="${list.figuresReal}" style="height: 70px;width: 70px;border-radius: 3px;">
            </div>
            <div class="main">
                <p>
                <ul>
                    <c:forEach items="${list.tagList}" var="tagList">
                    <li>
                        <span class="tag">${tagList.tagName}</span>
                    </li>
                    </c:forEach>
                </ul>
                <span class="time">2019-12-02 10:55</span>
                </p>
                <p class="title">${list.title}</p>
                <p class="type">${list.typeName}</p>
                <p class="con con_p">${list.articleContent}</p>
                <div class="bom">
                    <i class="layui-icon layui-icon-praise"></i>
                    <span class="span_w">${list.zanCount}</span>
                    <i class="layui-icon layui-icon-tread"></i>
                    <span class="span_w">${list.caiCount}</span>
                    <span>浏览</span>
                    <span class="span_w">${list.browseCount}</span>
                    <span>评论</span>
                    <span class="span_w">${list.commentCount}</span>
                    <span class="lookall">查看全文</span>
                    <span class="delete cur" onclick="deleteArt('${list.articleId}')">删除</span>
                    <span class="edit cur" onclick="editArt('${list.articleContent}','${list.articleId}')">编辑</span>
                    <span class="cur">分享</span>
                </div>
            </div>
        </li>
        </c:forEach>>
    </ul>
</div>
<div hidden="hidden" id="demo" style="padding: 25px">
    <form action="<%=request.getContextPath()%>/articles/" method="post">
        <textarea id="articleContent" name="articleContent"></textarea>
        <input type="text" id="input_hid" hidden="hidden" name="articleId">
        <h4>请选择文章栏目</h4>
        <p class="tag_p"><span style="color: red;">*</span>至少选择一个，最多选择三个</p>
        <div class="layui-form" pane>
            <input type="checkbox" value="JAVA" name="" title="JAVA" checked>
            <input type="checkbox" value="HTML" name="" title="HTML">
            <input type="checkbox" value="MYSQL" name="" title="MYSQL">
        </div>
        <input class="layui-btn" value="提交" style="float: right;margin-top: 20px;">
    </form>
</div>
</body>
<script>
    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });
    $(function(){
        $(".lookall").click(function(){
            if(($(this).html())==="查看全文"){
                $(this).parent().siblings('.con').removeClass("con_p");
                $(this).html("收起");
            }else{
                $(this).parent().siblings('.con').addClass("con_p");
                $(this).html("查看全文");
            }
        })
    })
    function deleteArt(articleId){
        var layer = layui.layer;
        layer.confirm('确定删除？',{offset:"200px"},function(index){
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/articles/datele?articleId="+articleId,
                success: function(msg){
                    layer.msg(msg);
                }
            });
            layer.close(index);
        });
    }
    layui.use('layer', function(){
        var $ = layui.jquery, layer = layui.layer;
        window.editArt = function(){
            $("#articleContent").html(obj);
            $("#input_hid").val(articleId);
            layer.open({
                type: 1
                ,title: '编辑'
                ,btn: false
                ,area: ['70%','50%']
                ,content: $('#demo')
                ,offset: '30px'
            })
        }
    })
    layui.use('layedit', function(){
        var layedit = layui.layedit;
        layedit.build('articleContent',{
            tool: [
                'strong' //加粗
                ,'italic' //斜体
                ,'underline' //下划线
                ,'del' //删除线
            ]
        });
    });
</script>
</html>
