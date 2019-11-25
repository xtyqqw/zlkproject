<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <style type="text/css">
        .search {
            float: right;
            width: 450px;
        }

        .hint {
            width: auto;
        }

        .form, .form input, .form select {
            position: relative;
            text-align: center;
        }

        .form input, .form select {
            margin-top: 15px;
            height: 24px;
            width: auto;
        }
    </style>
</head>
<body>
<input type="hidden" value="${msg}" id="msg">
<div id="addForm" hidden="hidden">
    <form action="<%=request.getContextPath()%>/article/insert" class="form">
        文章ID <input type="text" required placeholder="请输入文章ID" name="articleId"><br>
        文章标题 <input type="text" required placeholder="请输入文章标题" name="title"><br>
        浏览数 <input type="text" required placeholder="请输入浏览数" name="browseCount"><br>
        评论数 <input type="text" required placeholder="请输入浏览数" name="commentCount"><br>
        发布时间 <input type="text" required placeholder="请输入发布时间" id="createTime" name="createTime"><br>
        插图相对路径 <input type="text" required placeholder="请输入插图相对路径" name="figures"><br>
        插图绝对路径 <input type="text" required placeholder="请输入插图绝对路径" name="figuresReal"><br>
        文章摘要 <input type="text" required placeholder="请输入文章摘要" name="articleDigest"><br>
        文章内容 <input type="text" required placeholder="请输入文章内容" name="articleContent"><br>
        赞数 <input type="text" required placeholder="请输入赞数" name="zanCount"><br>
        踩数 <input type="text" required placeholder="请输入踩数" name="caiCount"><br>
        举报 <input type="text" required placeholder="请输入举报" name="inform"><br>

        <input type="submit" hidden="hidden" id="insertSubmit" value="确认">
    </form>
</div>
<div id="editForm" hidden="hidden">
    <form action="<%=request.getContextPath()%>/article/update" class="form">
        <input type="hidden" name="articleId" id="articleId"><br>
        文章标题 <input type="text" required placeholder="请输入文章标题" name="title"><br>
        浏览数 <input type="text" required placeholder="请输入浏览数" name="browseCount"><br>
        评论数 <input type="text" required placeholder="请输入浏览数" name="commentCount"><br>
        更新时间 <input type="text" required placeholder="请输入更新时间" id="updateTime" name="updateTime"><br>
        插图相对路径 <input type="text" required placeholder="请输入插图相对路径" name="figures"><br>
        插图绝对路径 <input type="text" required placeholder="请输入插图绝对路径" name="figuresReal"><br>
        文章摘要 <input type="text" required placeholder="请输入文章摘要" name="articleDigest"><br>
        文章内容 <input type="text" required placeholder="请输入文章内容" name="articleContent"><br>
        赞数 <input type="text" required placeholder="请输入赞数" name="zanCount"><br>
        踩数 <input type="text" required placeholder="请输入踩数" name="caiCount"><br>
        举报 <input type="text" required placeholder="请输入举报" name="inform"><br>
    </select><br>
        <input type="submit" hidden="hidden" id="updateSubmit" value="确认">
    </form>
</div>
<div class="layui-fluid">
    <table class="layui-table" id="demo" lay-filter="test"></table>
</div>
<script>
    layui.use(['table', 'laydate', 'form', 'util', 'layer'], function () {
        var table = layui.table;
        var laydate = layui.laydate;
        var layer = layui.layer;
        var util = layui.util;
        var form = layui.form;
        <c:if test="${flag}">
        $(function () {
            layer.alert($("#msg").val());
        })
        </c:if>
        laydate.render({
            elem: '#createTime'
            , type: 'datetime'
            , format: 'yyyy-MM-dd HH:mm:ss'
        });
        laydate.render({
            elem: '#updateTime'
            , type: 'datetime'
            , format: 'yyyy-MM-dd HH:mm:ss'
        });
        form.render();
        //第一个实例
        table.render({
            elem: '#demo'
            , url: '<%=request.getContextPath()%>/article/articleManager?condition=${condition}' //数据接口
            , page: true //开启分页
            , height: 450
            , cols: [[ //表头
                {type: 'checkbox'}
                , {field: 'articleId', title: '文章ID', width: 100, sort: true}
                , {field: 'title', title: '文章标题', width: 100, sort: true}
                , {field: 'browseCount', title: '浏览数', width: 80}
                , {field: 'commentCount', title: '评论数', width: 80}
                , {
                    field: 'createTime',
                    title: '发布时间',
                    /*templet: '<div>{{ layui.util.toDateString(d.time,"yyyy-MM-dd HH:mm:ss") }}</div>',*/
                    width: 80
                }
                , {
                    field: 'updateTime',
                    title: '更新时间',
                    /*templet: '<div>{{ layui.util.toDateString(d.time,"yyyy-MM-dd HH:mm:ss") }}</div>',*/
                    width: 80
                }
                , {field: 'figures', title: '插图相对路径', width: 80}
                , {field: 'figuresReal', title: '插图绝对路径', width: 80}
                , {field: 'articleDigest', title: '文章摘要', width: 80}
                , {field: 'articleContent', title: '文章内容', width: 80}
                , {field: 'zanCount', title: '赞数', width: 80}
                , {field: 'caiCount', title: '踩数', width: 80}
                , {field: 'inform', title: '举报', width: 80}
                , {
                    title: '操作', width: 180, align: 'center', toolbar: '' +
                        '<div class="layui-btn-group">' +
                        '<button type="button" class="layui-btn" lay-event="edit">编辑</button>' +
                        '<button type="button" class="layui-btn layui-btn-danger" lay-event="del">删除</button>' +
                        '</div>'
                }
            ]]
            , limits: [5, 10, 20]
            , toolbar: '<div class="layui-btn-group">' +
                '<button type="button" class="layui-btn" lay-event="add">增加</button>' +
                '<div class="layui-card search">\n' +
                '        <div class="layui-form layui-card-header layuiadmin-card-header-auto" >\n' +
                '            <div class="layui-form-item">' +
                '               <form type="post" action="/article/toArticleManager"> \n' +
                '                <div class="layui-inline">\n' +
                '                    <label class="layui-form-label hint">文章标题</label>\n' +
                '                    <div class="layui-input-block">\n' +
                '                        <input type="text" id="condition" name="condition" placeholder="请输入文章标题名称" autocomplete="off" class="layui-input">\n' +
                '                    </div>\n' +
                '                </div>\n' +
                '                <div class="layui-inline">\n' +
                '                    <button type="submit" class="layui-btn layuiadmin-btn-useradmin" id="sel">\n' +
                '                        <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>\n' +
                '                    </button>\n' +
                '                </div>' +
                '               </form>\n' +
                '            </div>\n' +
                '        </div>\n' +
                '    </div>' +
                '</div>'
        });
        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'add':
                    layer.open({
                        title: "添加",
                        type: 1,
                        area: ['30%', '70%'],
                        content: $("#addForm"),
                        btn: ['提交'],
                        yes: function (index, layero) {
                            layero.find("form").find("#insertSubmit").click();
                        }
                    });
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            var id = data.articleId;
            if (obj.event === 'del') {
                layer.confirm('是否确认删除', function (index) {
                    obj.del();
                    $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/article/delete?articleId=" + id,
                        success: function (msg) {
                            layer.alert("删除成功");
                        },
                        error: function (msg) {
                            layer.alert("删除失败");
                        }
                    });
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                $("#articleId").val(data.articleId);
                $("#title").val(data.title);
                $("#browseCount").val(data.browseCount);
                $("#commentCount").val(data.commentCount);
                $("#createTime").val(data.createTime);
                $("#updateTime").val(data.updateTime);
                $("#figures").val(data.figures);
                $("#figuresReal").val(data.figuresReal);
                $("#articleDigest").val(data.articleDigest);
                $("#articleContent").val(data.articleContent);
                $("#zanCount").val(data.zanCount);
                $("#caiCount").val(data.caiCount);
                $("#inform").val(data.inform);
                layer.open({
                    title: "修改",
                    type: 1,
                    area: ['30%', '70%'],
                    content: $("#editForm"),
                    btn: ['提交'],
                    yes: function (index, layero) {
                        layero.find("form").find("#updateSubmit").click();
                    }
                });
            }
        });
    });
</script>
</body>
</html>