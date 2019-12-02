<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css" />

    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>

    <style type="text/css">
        .search {
            float: right;
            width: 410px;
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
            width: 60%;
        }
    </style>
</head>
<body>
<input type="hidden" value="${msg}" id="msg">
<%--<div id="addForm" hidden="hidden">
    <form action="<%=request.getContextPath()%>/article/insert" class="form">
        文章ID <input type="text" required placeholder="请输入文章ID" name="articleId"><br>
        文章标题 <input type="text" required placeholder="请输入文章标题" name="title"><br>
        浏览数 <input type="text" required placeholder="请输入浏览数" name="browseCount"><br>
        评论数 <input type="text" required placeholder="请输入浏览数" name="commentCount"><br>
        发布时间 <input type="text" required placeholder="请输入发布时间" id="createTime1" name="createTime"><br>
        插图相对路径 <input type="text" required placeholder="请输入插图相对路径" name="figures"><br>
        插图绝对路径 <input type="text" required placeholder="请输入插图绝对路径" name="figuresReal"><br><br>
        文章摘要 <textarea rows="5" cols="60" required placeholder="请输入文章摘要" name="articleDigest"></textarea><br><br>
        文章内容 <textarea rows="10" cols="60" required placeholder="请输入文章内容" name="articleContent"></textarea><br>
        赞数 <input type="text" required placeholder="请输入赞数" name="zanCount"><br>
        踩数 <input type="text" required placeholder="请输入踩数" name="caiCount"><br>
        举报 <input type="text" required placeholder="请输入举报" name="inform"><br>
        <input type="submit" hidden="hidden" id="insertSubmit" value="确认">
    </form>
</div>--%>
<div id="editForm" hidden="hidden">
    <form action="<%=request.getContextPath()%>/article/update" class="form" method="post">
        <input type="hidden" name="articleId" id="articleId"><br>
        <table class="editorTable" align="center" style="margin: auto;border-collapse: separate;border-spacing: 20px;">
            <tr>
                <td valign="bottom">文章标题</td>
                <td><input type="text" readonly required id="title" placeholder="请输入文章标题" name="title"></td>
            </tr>
            <tr>
                <td valign="bottom">浏览数</td>
                <td><input type="text" required id="browseCount" placeholder="请输入浏览数" name="browseCount"></td>
            </tr>
            <tr>
                <td valign="bottom">评论数</td>
                <td><input type="text" required id="commentCount" placeholder="请输入浏览数" name="commentCount"></td>
            </tr>
            <tr>
                <td valign="bottom">发布时间</td>
                <td><input type="text" required id="createTime" placeholder="请输入发布时间" name="createTime"></td>
            </tr>
            <tr>
                <td valign="bottom">更新时间</td>
                <td><input type="text" required id="updateTime" placeholder="请输入更新时间" name="updateTime"></td>
            </tr>
            <tr>
                <td valign="bottom">插图相对路径</td>
                <td><input type="text" required id="figures" placeholder="请输入插图相对路径" name="figures"></td>
            </tr>
            <tr>
                <td valign="bottom">插图绝对路径</td>
                <td><input type="text" required id="figuresReal" placeholder="请输入插图绝对路径" name="figuresReal"></td>
            </tr>
            <tr>
                <td valign="bottom">赞数</td>
                <td><input type="text" required id="zanCount" placeholder="请输入赞数" name="zanCount"></td>
            </tr>
            <tr>
                <td valign="bottom">踩数</td>
                <td><input type="text" required id="caiCount" placeholder="请输入踩数" name="caiCount"></td>
            </tr>
            <tr>
                <td valign="bottom">举报</td>
                <td><input type="text" required id="inform" placeholder="请输入举报" name="inform"></td>
            </tr>
            <tr>
                <td valign="bottom">用户id</td>
                <td><input type="text" required id="userId" placeholder="请输入用户id" name="userId"></td>
            </tr>
            <tr>
                <td valign="bottom">发文类型</td>
                <td><input type="text" required id="createArticleType" placeholder="请输入发文类型" name="createArticleType"></td>
            </tr>
            <tr>
                <td valign="bottom">文章置顶</td>
                <td><input type="text" required id="articleSetTop" placeholder="请输入文章置顶" name="articleSetTop"></td>
            </tr>
            <tr>
                <td valign="bottom">审核</td>
                <td><input type="text" required id="approval" placeholder="请输入审核" name="approval"></td>
            </tr>
            <tr>
                <td>文章摘要</td>
                <td><textarea rows="5" cols="60" readonly required id="articleDigest" name="articleDigest"></textarea><br></td>
            </tr>
            <tr>
                <td>文章内容</td>
                <td><textarea rows="10" cols="60" readonly required id="articleContent" name="articleContent"></textarea><br></td>
            </tr>
        </table>

        <%--<div id="test-editormd">
            <p style="margin-top: -30px;margin-left: 50px;"> 文章内容 </p>
            <textarea readonly required id="articleContent" name="articleContent"></textarea>
        </div>--%>

    </select><br>
        <input type="submit" hidden="hidden" id="updateSubmit" value="确认">
    </form>
</div>
<div class="layui-fluid">
    <table class="layui-table" id="demo" lay-filter="test"></table>
</div>

<script src="<%=request.getContextPath() %>/editormd/editormd.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/marked.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/prettify.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/raphael.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/underscore.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/sequence-diagram.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/flowchart.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/lib/jquery.flowchart.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/editormd.js"></script>
<script type="text/javascript">

    /*var testEditor;
    $(function() {
        testEditor = editormd("test-editormd", {
            width : 600,
            height : 500,
            syncScrolling : "single",
            path : "../editormd/lib/",
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/imageUpload"
        });
    });*/

    //MarkDown组件
    $(function() {
        var editorMdView;
        editorMdView = editormd.markdownToHTML("articleContent", {
            htmlDecode : "style,script,iframe",  // you can filter tags decode
            width : 600,
            height : 500,
            emoji : false,
            taskList : true,
            tex : true,  // 默认不解析
            flowChart : true,  // 默认不解析
            sequenceDiagram : true // 默认不解析
        });
    });

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
            elem: '#createTime1'
            , type: 'datetime'
            , format: 'yyyy-MM-dd HH:mm:ss'
        });
        laydate.render({
            elem: '#createTime'
            , type: 'datetime'
            , format: 'yyyy-MM-dd HH:mm:ss'
        });
        laydate.render({
            elem: '#updateTime'
            ,type: 'datetime'
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
                , {field: 'articleId', title: '文章ID', width: 80, sort: true}
                , {field: 'title', title: '文章标题', width: 100, sort: true}
                , {field: 'browseCount', title: '浏览数', width: 80}
                , {field: 'commentCount', title: '评论数', width: 80}
                , {field: 'createTime',title: '发布时间',width: 80}
                , {field: 'updateTime',title: '更新时间',width: 80}
                , {field: 'figures', title: '插图相对路径', width: 80}
                , {field: 'figuresReal', title: '插图绝对路径', width: 80}
                , {field: 'articleDigest', title: '文章摘要', width: 80}
                , {field: 'articleContent', title: '文章内容', width: 80}
                , {field: 'zanCount', title: '赞数', width: 80}
                , {field: 'caiCount', title: '踩数', width: 80}
                , {field: 'inform', title: '举报', width: 80}
                , {field: 'userId', title: '用户id', width: 80}
                , {field: 'createArticleType', title: '发文类型', width: 80}
                , {field: 'articleSetTop', title: '文章置顶', width: 80}
                , {field: 'approval', title: '审核', width: 80}
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
                /*'<button type="button" class="layui-btn" lay-event="">新增文章</button>' +*/
                '<div class="layui-card search">\n' +
                '        <div class="layui-form layui-card-header layuiadmin-card-header-auto" >\n' +
                '            <div class="layui-form-item">' +
                '               <form type="post" action="/article/toArticleManager"> \n' +
                '                <div class="layui-inline">\n' +
                '                    <label class="layui-form-label hint">文章标题</label>\n' +
                '                    <div class="layui-input-block">\n' +
                '                        <input type="text" id="condition" name="condition" value="${condition}" placeholder="请输入文章标题名称" autocomplete="off" class="layui-input">\n' +
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
                        area: ['70%', '70%'],
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
        table.on('tool(test)', function (obj) {//注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data;//获得当前行数据（json格式的键值对）
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
                $("#userId").val(data.userId);
                $("#createArticleType").val(data.createArticleType);
                $("#articleSetTop").val(data.articleSetTop);
                $("#approval").val(data.approval);
                layer.open({
                    title: "修改",
                    type: 1,
                    shadeClose: true,
                    shade: 0.8,
                    area: '800px',
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