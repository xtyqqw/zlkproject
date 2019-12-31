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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/zTreeStyle/zTreeStyle1.css" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.ztree.excheck.js"></script>

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

        #addForm,#editForm{
            margin-top: 18px;
        }

        .ztree,.form{
            margin-left: 90px;
        }

        .ztree li a{
            color: black;
        }

        .roleFunction{
            margin-top: 22px;
            margin-left: 40px;
            margin-bottom: 10px;
        }

        #insertSubmit{
            margin-left: 300px;
            padding-bottom: 38px;
        }

        #addReturn{
            margin-left: 30px;
            padding-bottom: 38px;
        }

        #updateSubmit{
            margin-left: 300px;
            padding-bottom: 38px;
        }

        #updateReturn{
            margin-left: 30px;
            padding-bottom: 38px;
        }
    </style>
</head>
<body>
<input type="hidden" value="${msg}" id="msg">
<div id="addForm" style="display: none">
    <form action="<%=request.getContextPath()%>/role/insert" class="form layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-inline">
                <input type="text" required name="roleName"  lay-verify="required" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色代码</label>
            <div class="layui-input-inline">
                <input type="text" required name="roleCode"  lay-verify="required" placeholder="请输入角色代码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <p class="roleFunction">角色权限</p>
        <div class="left">
            <ul id="zTreeContent" class="ztree"></ul>
        </div>
        <input type="text" hidden="hidden" id="addFunction" name="addFunction">
        <input type="submit" class="layui-btn" id="insertSubmit" value="确认">
        <input type="button" id="addReturn" class="layui-btn" value="返回"/>
    </form>
</div>
<script type="text/javascript">
    function getzTreeContent() {
        var setting = {
            async: {
                enable: true,
                url: "<%=request.getContextPath()%>/function/findAllFunction",
                dataType: JSON
            },
            check: {
                enable: true,
                chkStyle: "checkbox",
                chkboxType: {"Y": "ps", "N": "ps"}
            },
            data: {
                key: {
                    url: "href"
                },
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pid",
                    rootPId: 0
                }
            },
            callback: {
                onAsyncSuccess: function () {
                    var zTree = $.fn.zTree.getZTreeObj("zTreeContent");
                    zTree.expandAll(true);
                },
                beforeClick: function (treeId, treeNode) {
                    var zTree = $.fn.zTree.getZTreeObj("zTreeContent");
                    if (treeNode.isParent) {
                        zTree.expandNode(treeNode);
                        return false;
                    }
                },
                onClick: function (e, treeId, treeNode, clickFlag) {
                    zTreeContent.checkNode(treeNode, !treeNode.checked, true);
                }
            }
        };

        $(document).ready(function () {
            zTreeContent = $.fn.zTree.init($("#zTreeContent"), setting);
        });

        //创建一个对象
        function createObj(id,name,pid){
            this.id = id;
            this.name = name;
            this.pid = pid;
        }
        createObj.prototype.sayId = function(){
            alert(this.id);
        }
        createObj.prototype.sayName = function(){
            alert(this.name);
        }
        createObj.prototype.sayPid = function(){
            alert(this.pid);
        }

        $("#insertSubmit").click(function () {
            var treeObj=$.fn.zTree.getZTreeObj("zTreeContent");
            nodes=treeObj.getCheckedNodes(true);
            var ss=new Array();//创建list集合
            v="";
            for(var i=0;i<nodes.length;i++){
                var person = new createObj(nodes[i].id,nodes[i].name,nodes[i].pid);
                ss[i]=person;
            }
            //打包成json格式数据
            var appop = JSON.stringify(ss);
            $("#addFunction").val(appop);
        })
    }
    $("#addReturn").click(function () {
        $("#editForm").css("display","none");
        $("#table").css("display","block");
        $("#addForm").css("display","none");
    })
</script>

<div id="editForm" style="display: none">
    <form action="<%=request.getContextPath()%>/role/update" class="form layui-form">
        <input type="hidden" name="roleId" id="roleId">
        <div class="layui-form-item">
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-inline">
                <input type="text" required id="roleName" name="roleName"  lay-verify="required" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色代码</label>
            <div class="layui-input-inline">
                <input type="text" required id="roleCode" name="roleCode"  lay-verify="required" placeholder="请输入角色代码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <p class="roleFunction">角色权限</p>
        <div class="left">
            <ul id="tree" class="ztree"></ul>
        </div>
        <input type="text" hidden="hidden" id="updateFunction" name="updateFunction">
        <input type="submit" class="layui-btn" id="updateSubmit" value="确认">
        <input type="button" id="updateReturn" class="layui-btn" value="返回"/>
    </form>
</div>
<script type="text/javascript">
    function getZtree(data) {
        var setting = {
            async: {
                enable: true,
                url: "<%=request.getContextPath()%>/function/findAllFunction",
                dataType: JSON
            },
            check: {
                enable: true,
                chkStyle: "checkbox",
                chkboxType: {"Y": "ps", "N": "ps"}
            },
            data: {
                key: {
                    url: "href"
                },
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pid",
                    rootPId: 0
                }
            },
            callback: {
                onAsyncSuccess: function () {
                    var zTree = $.fn.zTree.getZTreeObj("tree");
                    zTree.expandAll(true);
                    var treeNode;
                    $.ajax({
                        url: "<%=request.getContextPath()%>/function/findFunctionByRoleId?roleId="+data.roleId,
                        type: 'post',
                        async:false, //==######=请求外部接收到Ajax请求 返回值的关键。===保证不是异步的请求。后面  【外部 接收变量 语句】   一定是后执行。
                        dataType: "json",
                        success: function(menus){
                            //menusData=menus;
                            //var treeNode = menus;//json总是返回全部，，//=====【嵌套post，返回两个data必须 不同名！！！】
                            treeNode=menus;
                        }
                    });
                    if (treeNode.length > 0) {
                        //遍历勾选角色关联的菜单数据
                        for (var i = 0; i < treeNode.length; i++) {
                            if (treeNode[i].url!=null && treeNode[i].url!=''  ) { //==###=排除选中父节点。
                                //根据角色菜单节点数据的属性搜索，获取与完整菜单树完全匹配的节点JSON对象集合
                                var nodes = zTree.getNodesByParam("id", treeNode[i].id, null);
                                //勾选当前选中的节点
                                zTree.checkNode(nodes[0],true,true);
                            }

                        };
                    };
                },
                beforeClick: function (treeId, treeNode) {
                    var zTree = $.fn.zTree.getZTreeObj("tree");
                    if (treeNode.isParent) {
                        zTree.expandNode(treeNode);
                        return false;
                    }
                },
                onClick: function (e, treeId, treeNode, clickFlag) {
                    tree.checkNode(treeNode, !treeNode.checked, true);
                }
            }
        };

        $(document).ready(function () {
            tree = $.fn.zTree.init($("#tree"), setting);
        });

        //创建一个对象
        function createObj(id,name,pid){
            this.id = id;
            this.name = name;
            this.pid = pid;
        }
        createObj.prototype.sayId = function(){
            alert(this.id);
        }
        createObj.prototype.sayName = function(){
            alert(this.name);
        }
        createObj.prototype.sayPid = function(){
            alert(this.pid);
        }

        $("#updateSubmit").click(function () {
            var treeObj=$.fn.zTree.getZTreeObj("tree");
            nodes=treeObj.getCheckedNodes(true);
            var ss=new Array();//创建list集合
            v="";
            for(var i=0;i<nodes.length;i++){
                var person = new createObj(nodes[i].id,nodes[i].name,nodes[i].pid);
                ss[i]=person;
            }
            //打包成json格式数据
            var appop = JSON.stringify(ss);
            $("#updateFunction").val(appop);
        })
    }
    $("#updateReturn").click(function () {
        $("#editForm").css("display","none");
        $("#table").css("display","block");
        $("#addForm").css("display","none");
    })
</script>
<div class="layui-fluid" id="table" style="display: block">
    <table class="layui-table" id="demo" lay-filter="test"></table>
</div>
<script>
    layui.use(['table', 'laydate', 'form', 'util', 'layer'], function () {
        var table = layui.table;
        var layer = layui.layer;
        <c:if test="${flag}">
        $(function () {
            var index=layer.msg($("#msg").val());
            layer.style(index, {
                width: 'auto',
                height:'23px'
            });
        })
        </c:if>
        //第一个实例
        table.render({
            elem: '#demo'
            , url: '<%=request.getContextPath()%>/role/roleManager?condition=${condition}' //数据接口
            , page: true //开启分页
            , height: $(document).height()-$('#demo').offset().top-25
            , cols: [[ //表头
                {field: 'roleId', title: '角色编号', width: 290, sort: true}
                , {field: 'roleName', title: '角色名称', width: 130, sort: true}
                , {field: 'roleCode', title: '角色代码', width: 290}
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
                '               <form type="post" action="<%=request.getContextPath()%>/role/toRoleManager"> \n' +
                '                <div class="layui-inline">\n' +
                '                    <label class="layui-form-label hint">角色名称</label>\n' +
                '                    <div class="layui-input-block">\n' +
                '                        <input type="text" id="condition" name="condition" value="${condition}" placeholder="请输入要查询的角色名称" autocomplete="off" class="layui-input">\n' +
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
                    getzTreeContent();
                    $("#editForm").css("display","none");
                    $("#table").css("display","none");
                    $("#addForm").css("display","block");
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            var id = data.roleId;
            if (obj.event === 'del') {
                layer.confirm('是否确认删除', function (index) {
                    $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/role/delete?roleId=" + id,
                        success: function (msg) {
                            if(msg){
                                layer.msg("删除成功");
                                obj.del();
                            }
                            if(!msg){
                                layer.msg("仍有用户属于该角色,无法删除");
                            }
                        },
                        error: function (msg) {
                            layer.msg("遇到意外错误");

                        }
                    });
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                $("#roleId").val(data.roleId);
                $("#roleName").val(data.roleName);
                $("#roleCode").val(data.roleCode);
                getZtree(data);
                $("#editForm").css("display","block");
                $("#table").css("display","none");
                $("#addForm").css("display","none");
            }
        });
    });
</script>
</body>
</html>
