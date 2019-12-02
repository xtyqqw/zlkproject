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
    <form action="<%=request.getContextPath()%>/tag/insert" class="form">
        类别名称 <input type="text" required placeholder="请输入类别名称" name="tagName"><br>
        所属方向名称 <select required name="tagTypeName">
                        <option value="">请选择</option>
                        <c:forEach var="typeName" items="${typeList}">
                            <option value="${typeName.typeName}">${typeName.typeName}</option>
                        </c:forEach>
                    </select><br>
        <input type="submit" hidden="hidden" id="insertSubmit" value="确认">
    </form>
</div>
<div id="editForm" hidden="hidden">
    <form action="<%=request.getContextPath()%>/tag/update" class="form">
        <input type="hidden" name="tagId" id="tagId"><br>
        类别名称 <input type="text" required id="tagName" placeholder="请输入类别名称" name="tagName"><br>
        所属方向名称 <select required name="tagTypeName" id="tagTypeName">
                        <option value="">请选择</option>
                        <c:forEach var="typeName" items="${typeList}">
                            <option value="${typeName.typeName}">${typeName.typeName}</option>
                        </c:forEach>
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
        form.render();
        //第一个实例
        table.render({
            elem: '#demo'
            , url: '<%=request.getContextPath()%>/tag/tagManager?condition=${condition}' //数据接口
            , page: true //开启分页
            , height: 480
            , cols: [[ //表头
                {type: 'checkbox'}
                , {field: 'tagId', title: '类别编号', width: 290, sort: true}
                , {field: 'tagName', title: '类别名称', width: 130, sort: true}
                , {field: 'tagTypeName', title: '所属方向名称', width: 290}
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
                '               <form type="post" action="/tag/toTagManager"> \n' +
                '                <div class="layui-inline">\n' +
                '                    <label class="layui-form-label hint">类别名称</label>\n' +
                '                    <div class="layui-input-block">\n' +
                '                        <input type="text" id="condition" name="condition" placeholder="请输入要查询的类别名称" autocomplete="off" class="layui-input">\n' +
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
            var id = data.tagId;
            if (obj.event === 'del') {
                layer.confirm('是否确认删除', function (index) {
                    obj.del();
                    $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/tag/delete?tagId=" + id,
                        success: function (msg) {
                            layer.alert("删除成功");
                        },
                        error: function (msg) {
                            layer.alert("遇到意外错误");
                        }
                    });
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                $("#tagId").val(data.tagId);
                $("#tagName").val(data.tagName);
                $("#tagTypeName").val(data.tagTypeName);
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
