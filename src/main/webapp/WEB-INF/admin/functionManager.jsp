<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/module/treetable-lay/treetable.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/zTreeStyle/zTreeStyle.css" type="text/css">
    <script src="<%=request.getContextPath()%>/css/admin/module/treetable-lay/treetable.js"></script>
    <script type="test/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.ztree.excheck.js"></script>
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

        .ztree{
            margin-left: 90px;
        }

        .form p {
            margin-top: 30px;
        }

        .form input{
            width: auto;
        }

        #parentCatalogAdd{
            margin-left: 68px;
        }

        #catalogAdd{
            margin-left: 150px;
        }

        #catalogAdd,#menuAdd,#addReturn,#insertSubmit{
            margin-top: 24px;
            margin-bottom: 10px;

            margin-right: 13px;
            padding-bottom: 38px;
        }

        #insertSubmit{
            margin-left: 300px;
        }

        #menuAdd{
            margin-left: 20px;
        }


        .ztree li a{
            color: black;
        }

        .form2,.form2 p{
            position: relative;
            text-align: center;
        }
    </style>
</head>
<body>
<input type="hidden" value="${msg}" id="msg">

<div id="addForm" style="display: none">
    <form action="<%=request.getContextPath()%>/function/insert" class="form layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">类型</label>
            <div class="layui-input-block" id="IsPurchased">
                <input type="radio" id="catalogAdd" name="类型" value="0" title="目录" lay-filter="aaa"/>
                <input type="radio"  id="menuAdd" name="类型" value="1" title="菜单" checked lay-filter="aaa"/>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline">
                <input type="text" required name="name"  lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" id="addUrl">
            <label class="layui-form-label">路径</label>
            <div class="layui-input-inline">
                <input type="text" name="url" placeholder="请输入路径" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">简介</label>
            <div class="layui-input-inline">
                <input type="text" required name="comment"  lay-verify="required" placeholder="请输入简介" autocomplete="off" class="layui-input">
            </div>
        </div>
        <p id="parentCatalogAdd">上级目录</p><br>
        <div class="left">
            <ul id="zTreeContent" class="ztree"></ul>
        </div>
        <input type="text" style="display: none" hidden="hidden" id="addFunction" name="addFunction">
        <input type="submit" class="layui-btn" id="insertSubmit" value="确认">
        <input type="button" id="addReturn" class="layui-btn" value="返回"/>
    </form>
</div>

<script>
    layui.use(['form','jquery'], function(){
        var form = layui.form;
        var $= layui.$;
        form.on('radio(aaa)', function(data){
            //alert(data.value); //被点击的radio的value值
            if(data.value == "1"){
                $("#addUrl").show();
            }else{
                $("#addUrl").hide();
            }
        });
    });
</script>

<script>
    function getzTreeContent() {
        var setting = {
            async: {
                enable: true,
                url: "/function/findFunctionByUrl",
                dataType: JSON
            },
            check: {
                enable: true,
                chkStyle: "radio",
                radioType: "all"
            },
            data: {
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
        $("#editForm").hide();
        $(".xm").show();
        $("#addForm").hide();
    })
</script>

<div id="editForm" style="display: none">
    <form action="<%=request.getContextPath()%>/function/update" class="form2 layui-form">
        <input type="hidden" name="id" id="id"><br>
        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline">
                <input type="text" required id="name" name="name"  lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item updateUrl">
            <label class="layui-form-label">路径</label>
            <div class="layui-input-inline">
                <input type="text" id="url" name="url" placeholder="请输入路径" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">简介</label>
            <div class="layui-input-inline">
                <input type="text" required id="comment" name="comment"  lay-verify="required" placeholder="请输入简介" autocomplete="off" class="layui-input">
            </div>
        </div>
        <input type="submit" style="display:none;" class="layui-btn" id="updateSubmit" value="确认">
    </form>
</div>

<div class="xm" style="display: block">
    <div class="xm-d1">
        <p class="xm-d1-p">权限管理</p>
    </div>

    <div class="xm-d2">
        <div class="xm-d2-hang1" id="test">
            <div class="pzright" style="width:100%;display: flex;justify-content: flex-start;float:right;">
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
            var index=layer.msg($("#msg").val());
            layer.style(index, {
                width: 'auto',
                height:'23px'
            });
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
                treeDefaultClose: true,//是否默认折叠
                treeLinkage: false,//父级展开时是否自动展开所有子级
                elem: '#permissionTable',
                url: '<%=request.getContextPath()%>/function/functionManager',
                page: false,
                height: 423,
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
                    {templet: complain, title: '操作',width:80}
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
            getzTreeContent();
            $("#editForm").hide();
            $(".xm").hide();
            $("#addForm").show();
        });

        function complain(d){//操作中显示的内容
            return [
                '<a class="operation" lay-event="edit" href="javascript:void(0)" onclick="editDepartment(\''+ d.permissionId + '\')" title="编辑">',
                '<i class="layui-icon layui-icon-edit"></i></a>',
                '<a class="operation" lay-event="del" href="javascript:void(0)" onclick="delDepartment(\''+ d.permissionId + '\')" title="删除">',
                '<i class="layui-icon layui-icon-delete" ></i></a>',
            ].join('');
        }

        //监听工具条
        table.on('tool(permissionTable)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
            var id = data.id;
            if(data.name!=null){
                if (layEvent === 'del') {
                    layer.confirm('是否确认删除', function (index) {
                        $.ajax({
                            type: "POST",
                            url: "<%=request.getContextPath()%>/function/delete?functionId=" + id,
                            success: function (msg) {
                                if(msg){
                                    layer.msg("删除成功");
                                    obj.del();
                                }
                                if(!msg){
                                    layer.msg("该目录下仍有目录或菜单,无法删除");
                                }
                            },
                            error: function (msg) {
                                layer.msg("遇到意外错误");
                            }
                        });
                        layer.close(index);
                    });
                }else if (layEvent === 'edit') {
                    if ((data.url==null||data.url=="")){
                        $("#id").val(data.id);
                        $("#name").val(data.name);
                        $("#comment").val(data.comment);
                        $(".updateUrl").hide();
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
                    }else {
                        $("#id").val(data.id);
                        $("#name").val(data.name);
                        $("#url").val(data.url);
                        $("#comment").val(data.comment);
                        $(".updateUrl").show();
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
            }
        });
    });
</script>
</body>
</html>
