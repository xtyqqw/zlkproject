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
            width: 180px;
        }

        .form, .form input, .form select {
            position: relative;
            text-align: center;
        }

        .form{
            margin-top: 15px;
        }
    </style>
</head>
<body>
<input type="hidden" value="${msg}" id="msg">
<div id="addForm" hidden="hidden">
    <form action="<%=request.getContextPath()%>/admin/insert" class="form layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名称</label>
            <div class="layui-input-inline">
                <input type="text" required name="adminName"  lay-verify="required" placeholder="请输入用户名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户密码</label>
            <div class="layui-input-inline">
                <input type="text" name="adminPassword" required  lay-verify="required" placeholder="请输入用户密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属角色</label>
            <div class="layui-input-inline">
                <select name="adminRole" required lay-verify="required">
                    <option value="">请选择</option>
                    <c:forEach var="roleName" items="${roleNameList}">
                        <option value="${roleName.roleName}">${roleName.roleName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <input type="submit" hidden="hidden" id="insertSubmit" value="确认">
    </form>
</div>
<div id="editForm" hidden="hidden">
    <form action="<%=request.getContextPath()%>/admin/update" class="form layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名称</label>
            <div class="layui-input-inline">
                <input type="text" required id="adminName" name="adminName"  lay-verify="required" placeholder="请输入用户名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户密码</label>
            <div class="layui-input-inline">
                <input type="text" id="adminPassword" name="adminPassword" required  lay-verify="required" placeholder="请输入用户密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属角色</label>
            <div class="layui-input-inline">
                <select name="adminRole" id="adminRole" required lay-verify="required">
                    <c:forEach var="roleName" items="${roleNameList}">
                        <option value="${roleName.roleName}" <%--<c:if test="${roleName.roleName.equals($('#adminRole').val())}">selected</c:if>--%> >${roleName.roleName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <input type="hidden" name="adminId" id="adminId"><br>
        <input type="submit" hidden="hidden" id="updateSubmit" value="确认">
    </form>
</div>
<div class="layui-fluid">
    <table class="layui-table" id="demo" lay-filter="test"></table>
</div>
<script>
    layui.use(['table', 'laydate', 'form', 'util', 'layer','jquery'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.jquery;
        <c:if test="${flag}">
        $(function () {
            var index=layer.msg($("#msg").val());
            layer.style(index, {
                width: 'auto',
                height:'1px'
            });
        })
        </c:if>
        //第一个实例
        table.render({
            elem: '#demo'
            , url: '<%=request.getContextPath()%>/admin/adminManager?condition=${condition}' //数据接口
            , page: true //开启分页
            , height: $(document).height()-$('#demo').offset().top-25
            , cols: [[ //表头
                 {field: 'adminId', title: '用户编号', width: 290, sort: true}
                , {field: 'adminName', title: '用户名称', width: 130, sort: true}
                , {field: 'adminPassword', title: '用户密码', width: 290}
                , {field: 'adminRole', title: '所属角色', width: 130}
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
                '               <form type="post" action="<%=request.getContextPath()%>/admin/toAdminManager"> \n' +
                '                <div class="layui-inline">\n' +
                '                    <label class="layui-form-label hint">用户名称</label>\n' +
                '                    <div class="layui-input-block">\n' +
                '                        <input type="text" id="condition" value="${condition}" name="condition" placeholder="请输入要查询的用户名称" autocomplete="off" class="layui-input">\n' +
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
            var id = data.adminId;
            if (obj.event === 'del') {
                layer.confirm('是否确认删除', function (index) {
                    $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/admin/delete?adminId=" + id,
                        success: function (msg) {
                            obj.del();
                            layer.msg("删除成功");
                        },
                        error: function (msg) {
                            layer.msg("遇到意外错误");
                        }
                    });
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                $("#adminId").val(data.adminId);
                $("#adminName").val(data.adminName);
                $("#adminPassword").val(data.adminPassword);
                $("#adminRole").val(data.adminRole);
                layer.open({
                    title: "修改",
                    type: 1,
                    area: ['30%', '70%'],
                    content: $("#editForm"),
                    btn: ['提交'],
                    success: function(){
                      form.render('select');
                    },
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
