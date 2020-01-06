<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>社区问题后台管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/community/prism/prism.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/community/css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/community/css/me.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/community/css/typo.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css"/>
    <link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/community/prism/prism.js"></script>
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>

    <style type="text/css">
        .search {
            margin-top: -2px;
            float: right;
            width: 410px;
        }

        .del {
            margin-left: -490px;
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

        #articleContentHtml {
            word-break: break-all;
        }

        .layui-layer-tips {
            word-break: break-all;
        }
    </style>
</head>
<body>
<input type="hidden" value="${msg}" id="msg">

<div class="layui-fluid">
    <table class="layui-table" id="demo" lay-filter="test"></table>
</div>

<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath() %>/editormd/editormd.min.js"></script>
<script type="text/html" id="bar">
    <button type="button" class="layui-btn" lay-event="edit">编辑</button>
    <button type="button" class="layui-btn layui-btn-danger" lay-event="del">删除</button>

</script>
<script type="text/javascript">
    //后台问题管理页面中，问题标题的移入事件，显示具体内容
    $('body').on('mouseenter', '.layui-table-view td[data-field = "questionTitle"]', function () {
        var msg = $(this).find('div').text();
        tipsInx = layer.tips(msg, this, {
            tips: [3, '#009688'],
            time: 2000
        });
    });
    //后台问题管理页面中，问题内容的移入事件，显示具体内容
    $('body').on('mouseenter', '.layui-table-view td[data-field = "questionContent"]', function () {
        var msg = $(this).find('div').text();
        tipsInx = layer.tips(msg, this, {
            tips: [1, '#009688'],
            time: 2000
        });
    });
    //后台问题管理页面中，问题内容的移入事件，显示具体内容
    $('body').on('mouseenter', '.layui-table-view td[data-field = "questionContentHtml"]', function () {
        var msg = $(this).find('div').text();
        tipsInx = layer.tips(msg, this, {
            tips: [1, '#009688'],
            time: 2000
        });
    });
    //后台问题管理页面中，问题内容的移入事件，显示具体内容
    $('body').on('mouseenter', '.layui-table-view td[data-field = "questionSynopsis"]', function () {
        var msg = $(this).find('div').text();
        tipsInx = layer.tips(msg, this, {
            tips: [1, '#009688'],
            time: 2000
        });
    });

    //后台问题管理页面中，问题发布时间的移入事件，显示具体内容
    $('body').on('mouseenter', '.layui-table-view td[data-field = "createTime"]', function () {
        var msg = $(this).find('div').text();
        tipsInx = layer.tips(msg, this, {
            tips: [3, '#009688'],
            time: 2000
        });
    });
    //后台问题管理页面中，问题发布时间的移入事件，显示具体内容
    $('body').on('mouseenter', '.layui-table-view td[data-field = "updateTime"]', function () {
        var msg = $(this).find('div').text();
        tipsInx = layer.tips(msg, this, {
            tips: [3, '#009688'],
            time: 2000
        });
    });

    //MarkDown组件
    $(function () {
        var editorMdView;
        editorMdView = editormd.markdownToHTML("articleContent", {
            htmlDecode: "style,script,iframe",  // you can filter tags decode
            width: 600,
            height: 500,
            emoji: false,
            taskList: true,
            tex: true,  // 默认不解析
            flowChart: true,  // 默认不解析
            sequenceDiagram: true // 默认不解析
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
            var index = layer.msg($("#msg").val());
            layer.style(index, {
                width: 'auto',
                height: 'auto'
            });
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
        var renderTable = function () {
            table.render({
                elem: '#demo'
                , url: '<%=request.getContextPath()%>/question/questionManager?condition=${condition}' //数据接口
                , page: true //开启分页
                , height: $(document).height() - $('#demo').offset().top - 20
                , cols: [[ //表头
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'questionId', title: '问题ID', width: 120, sort: true,align:'center'}
                    , {field: 'questionTitle', title: '问题标题', width: 120, sort: true,align:'center'}
                    , {field: 'questionContentHtml', title: '问题内容', width: 120,align:'center'}
                    , {field: 'questionSynopsis', title: '简要', width: 120,align:'center'}
                    , {
                        field: 'solve', title: '问题状态',align:'center', width: 120,
                        templet: function (data) {// 替换数据
                            if (data.solve == "0") {
                                return "待解决";
                            } else if (data.solve == "1") {
                                return "已解决";
                            }
                        }
                    }
                    , {field: 'browseCount', title: '浏览数', width: 120,align:'center'}
                    , {field: 'createTime', title: '发布时间', width: 120,align:'center'}
                    , {field: 'updateTime', title: '更新时间', width: 120,align:'center'}
                    , {field: 'questionSetTop', title: '置顶',align:'center', width: 120,
                        templet: function (data) {// 替换数据
                            if (data.questionSetTop == "0") {
                                return "置顶";
                            } else if (data.questionSetTop == "1") {
                                return "不置顶";
                            }
                        }
                    }
                    , {field: 'audit', title: '审核',align:'center', width: 120,
                        templet: function (data) {// 替换数据
                            if (data.audit == 0) {
                                return "正在审核";
                            } else if (data.audit == "1") {
                                return "审核通过";
                            } else if (data.audit == "2") {
                                return "审核未过";
                            }
                        }
                    }
                    , {field: 'typeName', title: '类别',align:'center', width: 120}
                    , {
                        title: '操作', width: 180, align: 'center', fixed: 'right', toolbar: '#bar'

                    }
                ]]
                , limits: [5, 10, 20]
                , toolbar: '<div class="layui-btn-group">' +
                    '<button type="button" class="layui-btn del" lay-event="delete">批量删除</button>' +
                    '<div class="layui-card search">\n' +
                    '        <div class="layui-form layui-card-header layuiadmin-card-header-auto" >\n' +
                    '            <div class="layui-form-item">' +
                    '               <form type="post" action="<%=request.getContextPath()%>/question/toQuestionManager"> \n' +
                    '                <div class="layui-inline">\n' +
                    '                    <label class="layui-form-label hint">问题标题</label>\n' +
                    '                    <div class="layui-input-block">\n' +
                    '                        <input type="text" id="condition" name="condition" value="${condition}" placeholder="请输入问题标题名称" autocomplete="off" class="layui-input">\n' +
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
        };
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

        renderTable();

        //批量删除
        table.on('toolbar(test)', function (obj) {//注：tool 是工具条事件名
            var checkStatus = table.checkStatus(obj.config.id);
            var data = checkStatus.data;//获得当前行数据（json格式的键值对）
            switch (obj.event) {
                case 'delete':
                    if (data.length === 0) {
                        layer.msg("请至少选择一条数据");
                    } else {
                        layer.confirm('是否确认删除', function (index) {
                            var data1 = JSON.stringify(data);
                            $.ajax({
                                url: "<%=request.getContextPath()%>/question/deleteList",
                                contentType: "application/json;charset=UTF-8",
                                data: {"data": data1},
                                success: function () {
                                    renderTable();
                                    layer.msg("删除成功");
                                },
                                error: function () {
                                    layer.msg("删除失败");
                                }
                            });
                            layer.close(index);
                        });
                    }
                    break;
            }
            ;
        });
        //监听行工具事件
        table.on('tool(test)', function (obj) {//注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data;//获得当前行数据（json格式的键值对）
            var id = data.questionId;
            if (obj.event === 'del') {
                layer.confirm('是否确认删除', function (index) {
                    obj.del();
                    $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/question/delete?questionId=" + id,
                        success: function (msg) {
                            layer.alert("删除成功");
                        },
                        error: function (msg) {
                            layer.alert("删除失败");
                        }
                    });
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {//编辑
                window.location.href = "<%=request.getContextPath()%>/question/toUpdate?questionId=" + id;
                $("#questionId").val(data.questionId);
                $("#questionIitle").val(data.questionIitle);
                $("#questionContent").val(data.questionContent);
                $("#questionContentHtml").val(data.questionContentHtml);
                $("#questionSynopsis").val(data.questionSynopsis);
                $("#solve").val(data.solve);
                $("#createTime").val(data.createTime);
                $("#updateTime").val(data.updateTime);
                $("#browseCount").val(data.browseCount);
                $("#questionSetTop").val(data.questionSetTop);
                $("#audit").val(data.audit);
                $("#typeName").val(data.typeName);
                layer.open({
                    title: "编辑",
                    type: 1,
                    shade: 0.8,
                    area: ['99%', '99%'],
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