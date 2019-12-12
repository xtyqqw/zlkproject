<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: l
  Date: 2019/9/16
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <style type="text/css">
        #demo{
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
        }
        .search {
            float: right;
            width: 450px;
        }

        .hint {
            width: auto;
        }

        #condition{
            width: 200px;
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
    <form action="<%=request.getContextPath()%>/dept/insert" class="form">
        部门名称 <input type="text" required placeholder="请输入部门名称" name="deptName"><br>
        部门代码 <input type="text" required placeholder="请输入部门代码" name="deptCode"><br>
        <input type="submit" hidden="hidden" id="insertSubmit" value="确认">
    </form>
</div>
<div id="editForm" hidden="hidden">
    <form action="<%=request.getContextPath()%>/dept/update" class="form">
        <input type="hidden" name="deptId" id="deptId"><br>
        部门名称 <input type="text" required id="deptName" placeholder="请输入部门名称" name="deptName"><br>
        部门代码 <input type="text" required id="deptCode" placeholder="请输入部门代码" name="deptCode"><br>
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

        laydate.render({
            elem: '#createTime'
            , type: 'datetime'
            , format: 'yyyy-MM-dd HH:mm:ss'
        });
        form.render();
        //第一个实例
        var renderTable = function () {
            table.render({
                elem: '#demo'
                , url: '<%=request.getContextPath()%>/log/logManager?condition=${condition}' //数据接口
                , page: true //开启分页
                , height: $(document).height()-$('#demo').offset().top-20
                , limit: 100
                , cols: [[ //表头
                    {type: 'checkbox'}
                    , {field: 'logId', title: '日志编号', width: 110, sort: true}
                    , {field: 'name', title: '操作者名称', width: 120, sort: true}
                    , {field: 'description', title: '操作描述', width: 340}
                    , {field: 'ip', title: 'IP地址', width: 150}
                    , {field: 'type', title: '浏览器类型', width: 105}
                    , {
                        field: 'time',
                        title: '操作时间',
                        templet: '<div>{{ layui.util.toDateString(d.time,"yyyy-MM-dd HH:mm:ss") }}</div>',
                        width: 170
                    }/*
                    , {
                        title: '操作', align: 'center', toolbar: '' +
                            '<div class="layui-btn-group">' +
                            '<button type="button" class="layui-btn layui-btn-danger" lay-event="del">删除</button>' +
                            '</div>'
                    }*/
                ]]
                , limits: [24,50, 100]
                , toolbar: '<div class="layui-btn-group">' +
                    '<button type="hidden" class="layui-btn layui-btn-danger" lay-event="add">批量删除</button>' +
                    '<div class="layui-card search">\n' +
                    '        <div class="layui-form layui-card-header layuiadmin-card-header-auto" >\n' +
                    '            <div class="layui-form-item">' +
                    '               <form type="post" action="<%=request.getContextPath()%>/log/toLogManager"> \n' +
                    '                <div class="layui-inline">\n' +
                    '                    <label class="layui-form-label hint">操作者名称</label>\n' +
                    '                    <div class="layui-input-block">\n' +
                    '                        <input type="text" id="condition" name="condition" value="${condition}" placeholder="请输入要查询的操作者名称" autocomplete="off" class="layui-input">\n' +
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

        renderTable();

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            var data = checkStatus.data;
            var data2 = data.logId;
            switch (obj.event) {
                case 'add':
                    if (data.length === 0) {
                        layer.msg("请至少选择一条日志");
                    }else {
                        layer.confirm('是否确认删除', function (index) {
                            var data1 = JSON.stringify(data);
                            $.ajax({
                                url: '<%=request.getContextPath()%>/log/delete',
                                contentType: "application/json;charset=UTF-8",
                                data: {"data": data1},
                                success: function () {
                                    renderTable();
                                    layer.msg("删除成功");
                                },
                                error: function () {
                                    layer.msg("选择数据量过多,一般24条以下");
                                }
                            });
                            layer.close(index);
                        });
                    }
                    break;
            }
            ;
        });
    });
</script>
</body>
</html>
