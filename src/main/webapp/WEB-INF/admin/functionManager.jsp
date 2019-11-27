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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/module/treetable-lay/treetable.css">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <script src="<%=request.getContextPath()%>/css/admin/module/treetable-lay/treetable.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <style type="text/css">
        .xm-d1{
            width: 100%;
            height: 38px;
            background-color: #C9C5C5;
        }
        .xm-d1-p{
            font-size: 15px;
            margin-left: 12px;
            padding-top: 10px;
        }
        .xm-d2{
            margin-top: 11px;
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
    <form action="<%=request.getContextPath()%>/function/insert" class="form">
        菜单名称 <input type="text" required placeholder="请输入菜单名称" name="name"><br>
        上级菜单 <input type="text" required placeholder="请输入上级菜单编号" name="parentId"><br>
        菜单URL <input type="text" required placeholder="请输入菜单路径" name="url"><br>
        菜单简介 <input type="text" required placeholder="请输入菜单简介" name="comment"><br>
        <input type="submit" hidden="hidden" id="insertSubmit" value="确认">
    </form>
</div>
<div id="editForm" hidden="hidden">
    <form action="<%=request.getContextPath()%>/function/update" class="form">
        <input type="hidden" name="functionId" id="functionId"><br>
        菜单名称 <input type="text" required id="name" placeholder="请输入菜单名称" name="name"><br>
        上级菜单 <input type="text" required id="parentId" placeholder="请输入上级菜单编号" name="parentId"><br>
        菜单URL <input type="text" required id="url" placeholder="请输入菜单路径" name="url"><br>
        菜单简介 <input type="text" required id="comment" placeholder="请输入菜单简介" name="comment"><br>
        <input type="submit" hidden="hidden" id="updateSubmit" value="确认">
    </form>
</div>
<div class="xm">
    <div class="xm-d1">
        <p class="xm-d1-p">权限管理</p>
    </div>

    <div class="xm-d2">
        <div class="xm-d2-hang1" id="test">
            <div class="pzright" style="width:101%;display: flex;justify-content: flex-start;float:right;">
                <p class="xm-d1-p2">
                    <button id="add" class="layui-btn layui-btn-sm layui-btn-radius btnys"><i class="layui-icon">&#xe608;</i>添加</button>
                    <button class="layui-btn layui-btn-sm" id="btn-expand">全部展开</button>
                    <button class="layui-btn layui-btn-sm" id="btn-fold">全部折叠</button>
                    <button class="layui-btn layui-btn-sm" id="btn-refresh">刷新表格</button>
                </p>
            </div>
            <div class="clear"></div>
        </div>
        <div class="xm-d2-hang2">
            <table id="permissionTable" class="layui-table" lay-filter="permissionTable"></table>
        </div>
    </div>
</div>
<script>
    /*使用模块加载的方式 加载文件*/
    layui.config({
        base: '<%=request.getContextPath()%>/css/admin/module/'
    }).extend({
        treetable: 'treetable-lay/treetable'
    }).use(['layer', 'table', 'treetable'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var treeTable = layui.treetable;

        <c:if test="${flag}">
        $(function () {
            layer.alert($("#msg").val());
        })
        </c:if>

        // 渲染表格
        var renderTable = function () {//树桩表格参考文档：https://gitee.com/whvse/treetable-lay
            layer.load(2);
            treeTable.render({
                treeColIndex: 1,//树形图标显示在第几列
                treeSpid: 0,//最上级的父级id
                treeIdName: 'id',//id字段的名称
                treePidName: 'pid',//pid字段的名称
                treeDefaultClose: false,//是否默认折叠
                treeLinkage: false,//父级展开时是否自动展开所有子级
                elem: '#permissionTable',
                url: '<%=request.getContextPath()%>/function/functionManager',
                page: false,
                height: 400,
                cols: [[
                    {field: 'id', title: '编号',width:80},
                    {field: 'name', title: '资源名称',width:200},
                    {field: 'url', title: '资源路径',width:280},
                    {field: 'pid', title: '父编号',width:80},
                    {field: 'comment', title: '资源简介',width:320},
                    {field: 'resType', title: '类型',width:90,
                        templet: function(d){
                            if(d.url==null){
                                return '目录';
                            }else{
                                return '菜单';
                            }
                        }
                    },
                    {templet: complain, title: '操作'}
                ]],
                //数据渲染完的回调
                done: function () {
                    //关闭加载
                    layer.closeAll('loading');
                }
            });
        };

        renderTable();

        //触发三个button按钮
        $('#btn-expand').click(function () {
            treeTable.expandAll("#permissionTable");
        });

        $('#btn-fold').click(function () {
            treeTable.foldAll("#permissionTable");
        });

        $('#btn-refresh').click(function () {
            renderTable();
        });

        $('#add').click(function () {
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
        });

        function complain(d){//操作中显示的内容
            if(d.url!=null){
                return [
                    '<a class="operation" lay-event="edit" href="javascript:void(0)" onclick="editDepartment(\''+ d.permissionId + '\')" title="编辑">',
                    '<i class="layui-icon layui-icon-edit"></i></a>',
                    '<a class="operation" lay-event="del" href="javascript:void(0)" onclick="delDepartment(\''+ d.permissionId + '\')" title="删除">',
                    '<i class="layui-icon layui-icon-delete" ></i></a>',
                ].join('');
            }else{
                return '';
            }
        }

        //监听工具条
        table.on('tool(permissionTable)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
            var id = data.functionId;
            if(data.name!=null){
                if (layEvent === 'del') {
                    layer.confirm('是否确认删除', function (index) {
                        obj.del();
                        $.ajax({
                            type: "POST",
                            url: "<%=request.getContextPath()%>/function/delete?functionId=" + id,
                            success: function (msg) {
                                layer.alert("删除成功");
                            },
                            error: function (msg) {
                                layer.alert("遇到意外错误");
                            }
                        });
                        layer.close(index);
                    });
                }else if (layEvent === 'edit') {
                    $("#functionId").val(data.functionId);
                    $("#name").val(data.name);
                    $("#parentId").val(data.parentId);
                    $("#url").val(data.url);
                    $("#comment").val(data.comment);
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
            }
        });
    });
</script>
</body>
</html>
