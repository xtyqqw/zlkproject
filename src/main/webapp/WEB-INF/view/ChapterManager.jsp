<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"  charset="utf-8"></script>
    <style type="text/css">
        #select_box{
            width: 50%;
            margin: 20px 0;
        }
    </style>
</head>
<body>
<div>
    <div id="insertChapterDiv" style="width: 400px; display: none">
        <form class="layui-form"  id="insertChapterForm" method="post">
            <div class="layui-form-item" style="display: none">
                <label class="layui-form-label">章节ID</label>
                <div class="layui-input-block">
                    <input type="text" name="chapterId" id="chapterId" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">课程名称:</label>
                <div class="layui-input-block">
                    <select class="layui-select" name="coursesId" id="coursesNameInsertSelect" lay-filter="coursesNameSelect" lay-search>
                        <option value="">请选择课程</option>
                        <c:forEach items="${coursesList}" var="course">
                            <option value="${course.coursesId}">(ID:${course.coursesId}) ${course.coursesName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">章节名</label>
                <div class="layui-input-block">
                    <input type="text" name="chapterName" id="chapterName" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">章节序号</label>
                <div class="layui-input-block">
                    <input type="number" name="chapterNum" id="chapterNum" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="display: none">
                <label class="layui-form-label">小节数</label>
                <div class="layui-input-block">
                    <input type="number" name="sectionNum" id="sectionNum" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="display: none">
                <label class="layui-form-label">章节时长</label>
                <div class="layui-input-block">
                    <input type="number" name="chapterTime" id="chapterTime" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-hide">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn" lay-submit lay-filter="submit">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>


    <div class="layui-form" id="select_box">
        <label class="layui-form-label">课程名称:</label>
        <div class="layui-input-block">
            <select class="layui-select" name="coursesName" id="coursesNameSelect" lay-filter="coursesName" lay-search>
                <option value="">请选择课程</option>
                <c:forEach items="${coursesList}" var="course">
                    <option value="${course.coursesId}">(ID:${course.coursesId}) ${course.coursesName}</option>
                </c:forEach>
            </select>
        </div>
    </div>


    <table class="layui-table" id="chapter" lay-filter="chapter"></table>


    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container layui-inline">
            <button class="layui-btn layui-btn-sm" lay-event="insert">新增</button>
        </div>
    </script>
</div>

    <script type="text/javascript" >
        layui.use(['table','layer','form'], function(){
            var table = layui.table;//表格
            var layer = layui.layer;//弹层
            var form = layui.form;//表单
            table.render({
                elem: '#chapter'
                ,height:'full-20'
                ,url:'<%=request.getContextPath()%>/chapterManager/selectAll'
                ,method:'POST'
                ,toolbar: '#toolbarDemo'
                ,cols: [[
                    {field:'coursesId', width:100, title: '课程ID',sort: true}
                    ,{field:'chapterId', width:100, title: '章节ID', sort: true}
                    ,{field:'chapterName', title: '章节名'}
                    ,{field:'chapterNum', width:100, title: '章节序号'}
                    ,{field:'sectionNum', width:100, title: '小节数量'}
                    ,{field:'chapterTime', title: '章节视频时长', templet:function (d) {
                            return format(d.chapterTime);
                        },sort: true}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]]
                ,page: true
            });

            //视频时长格式转换函数  hh:mm:ss
            function format(num) {
                num = Math.round(num);
                var hour = parseInt((num / 3600) + '');
                var minute = parseInt(((num % 3600) / 60) + '');
                var second = (num % 3600) % 60;
                if (hour === 0) {
                    hour = '00';
                } else if (hour > 0 && hour < 10) {
                    hour = '0' + hour;
                }
                if (minute === 0) {
                    minute = '00';
                } else if (minute > 0 && minute < 10) {
                    minute = '0' + minute;
                }
                if (second === 0) {
                    second = '00';
                } else if (second > 0 && second < 10) {
                    second = '0' + second;
                }
                return hour + ':' + minute + ':' + second;
            }

            //头工具栏事件
            table.on('toolbar(chapter)', function(obj){
                var checkStatus = table.checkStatus(obj.config.id); //获取选中行状态
                var event = obj.event;
                if (event==="insert"){
                    layer.open({
                        title: "新增",
                        type: 1,
                        area: ['40%', '80%'],
                        content: $("#insertChapterDiv"),
                        btn:['提交'],
                        success:function(index,layero){
                            form.on('submit(submit)',function (data) {
                                $.ajax({
                                    type: "POST",
                                    url:"<%=request.getContextPath()%>/chapterManager/insertChapter",
                                    data:$('#insertChapterForm').serialize(),
                                    dataType:"json",
                                    success:function (result) {
                                        layer.alert(result.msg);
                                        table.reload('chapter', {
                                            url: '<%=request.getContextPath()%>/chapterManager/selectAll'
                                            , height:'full-20'
                                            , method:"POST"
                                            , page:{
                                                curr:1
                                            }
                                            , toolbar: '#toolbarDemo'
                                        });
                                    }
                                })
                            })
                        },
                        yes:function (index, layero) {
                            layero.find('form').find('button[lay-submit]').click();
                        }
                    });
                }
            });

            //监听行工具事件
            table.on('tool(chapter)', function(obj){
                var data = obj.data;
                console.log(obj);
                if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        $.ajax({
                            type : "POST",
                            async: false,
                            url :"<%=request.getContextPath()%>/chapterManager/deleteChapter",
                            data: {"chapterId":data.chapterId},
                            success: function (result) {
                                console.log(result);
                                layer.alert(result.msg);
                                table.reload('chapter',{
                                    url: '<%=request.getContextPath()%>/chapterManager/selectAll',
                                    height:'full-20',
                                    method: 'POST',
                                    toolbar: '#toolbarDemo',
                                    page:{
                                        curr:1
                                    }
                                });
                            }
                        });
                    });
                } else if(obj.event === 'edit') {
                    $("#chapterId").val(data.chapterId);
                    $("#coursesNameInsertSelect").val(data.coursesId);
                    $("#chapterName").val(data.chapterName);
                    $("#chapterNum").val(data.chapterNum);
                    $("#chapterTime").val(data.chapterTime);
                    $("#sectionNum").val(data.sectionNum);
                    layer.open({
                        title: "编辑",
                        type: 1,
                        area: ['40%', '80%'],
                        content: $("#insertChapterDiv"),
                        btn: ['提交'],
                        success: function (index, layero) {
                            form.on('submit(submit)', function (data) {
                                $.ajax({
                                    type: "POST",
                                    async: false,
                                    url: "<%=request.getContextPath()%>/chapterManager/updateChapter",
                                    data: data.field,
                                    dataType: "json",
                                    success: function (result) {
                                        layer.message(result.msg);
                                        table.reload('chapter', {
                                            url: '<%=request.getContextPath()%>/chapterManager/selectAll'
                                            , height:'full-20'
                                            , method: "POST"
                                            , page: {
                                                curr: 1
                                            }
                                            , toolbar: '#toolbarDemo'
                                        });
                                    }
                                })
                            })
                        },
                        yes: function (index, layero) {
                            layero.find('form').find('button[lay-submit]').click();
                        }
                    });
                }
            });

            //下拉框监听事件
            form.on('select(coursesName)', function (data) {
                let coursesId = data.value;
                table.reload('chapter', {
                    url: '<%=request.getContextPath()%>/chapterManager/selectByCoursesId'
                    , height:'full-20'
                    , method: "POST"
                    , where:{
                        coursesId:coursesId
                    }
                    , page: {
                        curr: 1
                    }
                    , toolbar: '#toolbarDemo'
                });
            });

        })

    </script>
</body>
</html>