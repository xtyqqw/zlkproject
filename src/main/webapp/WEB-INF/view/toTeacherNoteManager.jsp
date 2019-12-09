<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>
<div class="layedit-tool-view">
    <form class="layui-form"  id="insertTeacherNote" action="/teacherNote/insertTNByTeacherNote" method="post" style="width: 400px;display: none;">
        <div class="layui-form-item">
            <label class="layui-form-label">所对应的<br/>小节序号</label>
            <div class="layui-input-block">
                <input type="text" name="sectionId" id="sectionId" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">讲师笔记<br/>标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" id="title" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">讲师笔记<br/>内容</label>
            <div class="layui-input-block">
                <input type="text" name="content" id="content" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            </div>
        </div>
    </form>
</div>
<div class="layedit-tool-view">
    <form class="layui-form"  id="updateTeacherNote" action="/teacherNote/updateTNByTeacherNote" method="post" style="width: 400px;display: none;">
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">讲师笔记<br/>序号</label>
            <div class="layui-input-block">
                <input type="text" name="tnId" id="uptnId" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所对应的<br/>小节序号</label>
            <div class="layui-input-block">
                <input type="text" name="sectionId" id="upsectionId" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">讲师笔记<br/>标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" id="uptitle" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">讲师笔记<br/>内容</label>
            <div class="layui-input-block">
                <input type="text" name="content" id="upcontent" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            </div>
        </div>
    </form>
</div>
    <table class="layui-hide" id="teacherNote" lay-filter="teacherNote"></table>
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="insert">新增</button>
        </div>
    </script>
    <script type="text/html" id="handle">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
            <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</button>
        </div>
    </script>
<script type="text/javascript" src="/layui/layui.js"  charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
    layui.use(['table','form','layer'], function(){
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;
        table.render({
            elem: '#teacherNote'
            ,url:'/teacherNote/selectTNAllByLimit'
            ,toolbar: '#toolbarDemo'
            ,height: 480
            ,cols: [[
                {field:'tnId', title: '讲师笔记序号', width:120}
                ,{field:'sectionId', title: '所对应小节的序号', width:150}
                ,{field:'title', title: '讲师笔记标题', width:150}
                ,{field:'content', title: '讲师笔记内容', width:150}
                ,{field:'date', title: '写笔记时的日期',templet: '<div>{{ layui.util.toDateString(d.date,"yyyy-MM-dd HH:mm:ss") }}</div>', width:170}
                ,{title:'操作', toolbar:'#handle', fixed: 'right'}
            ]]
            ,page: {
                curr:1
            }
        });
        table.on('toolbar(teacherNote)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id); //获取选中行状态
            var evend = obj.event;
            if (evend==="insert"){
                layer.open({
                    title: "新增",
                    type: 1,
                    area: ['40%', '50%'],
                    content: $("#insertTeacherNote")
                });
            }
        });
        table.on('tool(teacherNote)',function (obj) {
            var tnId=obj.data.tnId;
            var event = obj.event;
            if(event=="delete"){
                layer.open({
                    content:'是否删除？'
                    ,btn:['是','否']
                    ,yes:function () {
                        $.ajax({
                            type: "POST",
                            url: "/teacherNote/deleteByTNId",
                            data: {"tnId":tnId},
                            success: function (result) {
                                //flag = false;
                                layer.msg("删除成功");
                                table.reload('teacherNote',{
                                    url:'/teacherNote/selectTNAllByLimit',
                                    toolbar: '#toolbarDemo',
                                    height: 480,
                                    page:{
                                        curr:1
                                    }
                                });
                            }
                        });
                    }
                    ,btn2:function () {
                        flag = false;
                    }
                });
            }
            else if(obj.event === 'edit'){
                console.log(obj.data);
                var data = obj.data;
                $("#uptnId").val(data.tnId);
                $("#upsectionId").val(data.sectionId);
                $("#uptitle").val(data.title);
                $("#upcontent").val(data.content);
                layer.open({
                    title: "修改",
                    type: 1,
                    area: ['30%', '50%'],
                    content: $("#updateTeacherNote")
                });
            }
        });
    });

</script>
</body>
</html>