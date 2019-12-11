<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"  charset="utf-8"></script>

</head>
<body>

    <table class="layui-table" id="stuQa" lay-filter="stuQa"></table>


    <script type="text/html" id="barDemo">
        <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
    </script>

    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container layui-inline">
            <button class="layui-btn" lay-event="report">举报优先</button>
        </div>
        <div class="layui-input-inline">
            <form class="layui-inline layui-form">
                <div class="layui-inline">
<%--                    <input name="coursesName" id="coursesNameInput" class="layui-input" autocomplete="off" onkeyup="search()">--%>
                    <select class="layui-btn-checked" name="selectName" id="select" lay-filter="select" onchange="selectChange()">
                        <option></option>
                        <option value="userRealname">用户名</option>
                        <option value="sectionName">小节名</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="" id="selectInput" placeholder="请输入搜索项">
                </div>
                <div class="layui-inline">
                    <button class="layui-btn" lay-event="submit" id="seek">查询</button>
                </div>
            </form>
        </div>
    </script>

    <script type="text/html" id="switchTpl">
        <input type="checkbox" name="report" value="{{d.sqaId}}" lay-skin="switch" lay-text="已举报|举报" lay-filter="reportDemo" {{ d.report ==="已举报"?'checked':'' }}>
    </script>




    <script type="text/javascript" >
        layui.use(['table','layer','form'], function(){
            var table = layui.table;//表格
            var layer = layui.layer;//弹层
            var form = layui.form;//表单

            table.render({
                elem: '#stuQa'
                ,height:'full-50'
                ,url:'<%=request.getContextPath()%>/stuQaManager/selectAllLimit'
                ,method:'POST'
                ,toolbar: '#toolbarDemo'
                ,cols: [[
                    {field:'sqaId', width:90, title: '问答ID',sort: true}
                    ,{field:'pId', width:90, title: '问答父ID', sort: true}
                    ,{field:'sectionId', width:90, title: '小节ID',sort: true}
                    ,{field:'userId', width:90, title: '用户ID',sort: true}
                    ,{field:'content', width:200,title: '问答内容'}
                    ,{field:'answerNum', width:110, title: '回答数量', sort: true}
                    ,{field:'viewNum', width:110, title: '浏览数量', sort: true}
                    ,{field:'share', width:110, title: '共享状态', sort: true}
                    ,{field:'report', width:110, title: '举报状态', templet:'#switchTpl',sort: true}
                    ,{field:'date', width:200,title: '问答添加日期', sort: true}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:80,align:"center"}
                ]]
                ,page: true
            });


            //头工具栏事件
            table.on('toolbar(stuQa)', function(obj){
                var evend = obj.event;
                if (evend==="report"){
                    table.reload('stuQa', {
                        url: '<%=request.getContextPath()%>/stuQaManager/reportDesc'
                        , height:'full-50'
                        , method:'post'
                        , page:{
                            curr:1
                        }
                        , toolbar: '#toolbarDemo'
                    });
                }
            });

            //监听select选择事件
            form.on('select(select)',function (data) {
                alert(data.value);
                $("#selectInput").attr("name",data.value);
            });


            //根据章节内容模糊查询
            $("#seek").click(function () {
                let name = $("#selectInput").attr("name");
                let val = $("#selectInput").val();
                table.reload('stuQa', {
                    url: '<%=request.getContextPath()%>/stuQaManager/fuzzySelect'
                    , height:'full-50'
                    , method:'post'
                    , where:{
                        name:name,
                        val:val
                    }
                    , page:{
                        curr:1
                    }
                    , toolbar: '#toolbarDemo'
                });
            });

            //监听行工具事件
            table.on('tool(stuQa)', function(obj){
                var data = obj.data;
                if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        $.ajax({
                            type : "POST",
                            async: false,
                            url :"<%=request.getContextPath()%>/stuQaManager/deleteStuQa",
                            data: {"sqaId":data.sqaId},
                            success: function (data) {
                                layer.alert(data.msg);
                                table.reload('stuQa',{
                                    url: '<%=request.getContextPath()%>/stuQaManager/selectAllLimit',
                                    height:'full-50',
                                    method: 'post',
                                    toolbar: '#toolbarDemo',
                                    page:{
                                        curr:1
                                    }
                                });
                            }
                        });
                    });
                }
            });

            //监听举报操作
            form.on('switch(reportDemo)', function(data){
                layer.alert(data.value);
                let report = "";
                if (data.elem.checked){
                    report = "已举报";
                }else {
                    report = "举报";
                }
                $.ajax({
                    type : "POST",
                    async: false,
                    url :"<%=request.getContextPath()%>/stuQaManager/updateReport",
                    data: {"sqaId":data.value,"report":report},
                    success: function (data) {
                        layer.alert(data.msg);
                        table.reload('stuQa',{
                            url: '<%=request.getContextPath()%>/stuQaManager/selectAllLimit',
                            height:'full-50',
                            method: 'post',
                            toolbar: '#toolbarDemo',
                            page:{
                                curr:1
                            }
                        });
                    }

                })
            });
        })

    </script>
</body>
</html>