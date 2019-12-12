<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
</head>
<body>
    <div id="insertCourseDiv" style="width: 400px; display: none">
        <form class="layui-form"  id="insertCourseForm">
            <div class="layui-form-item" style="display: none">
                <label class="layui-form-label">课程ID</label>
                <div class="layui-input-block">
                    <input type="text" name="coursesId" id="coursesId" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">课程名</label>
                <div class="layui-input-block">
                    <input type="text" name="coursesName" id="coursesName" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">课程方向:</label>
                <div class="layui-input-block">
                    <select class="layui-select" name="typeId" id="coursesType" lay-filter="typeName" lay-search>
                        <option value="">请选择课程方向</option>
                        <c:forEach items="${typeList}" var="type">
                            <option value="${type.typeId}">(ID:${type.typeId}) ${type.typeName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">课程标签</label>
                <div class="layui-input-block" id="tagCheck" lay-filter="check">

                </div>
            </div>
            <%--<div class="layui-form-item" style="display: none">
                <label class="layui-form-label">章节数</label>
                <div class="layui-input-block">
                    <input type="number" name="chapterNum" id="chapterNum" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="display: none">
                <label class="layui-form-label">小节数</label>
                <div class="layui-input-block">
                    <input type="number" name="sectionNum" id="sectionNum" class="layui-input">
                </div>
            </div>--%>
            <div class="layui-form-item">
                <label class="layui-form-label">金额</label>
                <div class="layui-input-block">
                    <input type="number" name="price" id="price" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">封面图片</label>
                <div class="layui-input-inline">
                    <div class="layui-upload-drag" id="coverPic">
                        <i class="layui-icon"></i>
                        <p>点击上传图片</p>
                    </div>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="coverPicImg">
                        <p id="coverPicText"></p>
                    </div>
                    <input type="hidden" name="coverPic" id="coverPicInput"  >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">课程视频</label>
                <div class="layui-input-inline">
                    <div class="layui-upload-drag" id="introduceVideo">
                        <i class="layui-icon"></i>
                        <p>点击上传视频</p>
                    </div>
                    <div class="layui-upload-list" id="videoDiv" style="display: none">
                        <video class="layui-upload-video" id="introduceVideo1" controls = controls></video>
                        <p id="introduceVideoText"></p>
                    </div>
                    <input type="hidden" name="introduceVideo" id="introduceVideoInput"  >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">简介文字</label>
                <div class="layui-input-block">
                    <textarea name="introduceText" id="introduceText" placeholder="请输入简介内容" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">简介图片</label>
                <div class="layui-input-inline">
                    <div class="layui-upload-drag" id="introducePic">
                        <i class="layui-icon"></i>
                        <p>点击上传图片</p>
                    </div>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="introducePicImg">
                        <p id="introducePicText"></p>
                    </div>
                    <input type="hidden" name="introducePic" id="introducePicInput"  >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">特点文字</label>
                <div class="layui-input-block">
                    <textarea name="featureText" id="featureText" placeholder="请输入特点内容" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">特点图片</label>
                <div class="layui-input-inline">
                    <div class="layui-upload-drag" id="featurePic">
                        <i class="layui-icon"></i>
                        <p>点击上传图片</p>
                    </div>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="featurePicImg">
                        <p id="featurePicText"></p>
                    </div>
                    <input type="hidden" name="featurePic" id="featurePicInput">
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

    <table id="course" lay-filter="course"></table>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container layui-inline">
            <button class="layui-btn" lay-event="insert">新增</button>
        </div>
        <div class="layui-input-inline">
            <form>
                <div class="layui-inline">
                    <label class="layui-form-label" style="width: auto">课程名称:</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="coursesName" id="coursesNameInput" placeholder="请输入想查询的课程名称">
                    </div>
                </div>
                <div class="layui-inline">
                    <button class="layui-btn" lay-event="submit" id="seek">查询</button>
                </div>
            </form>
        </div>
    </script>





    <script type="text/javascript" >
        layui.use(['table','layer','form',"upload","element"], function(){
            var table = layui.table,//表格
                layer = layui.layer,//弹层
                form = layui.form,//表单
                upload = layui.upload,//图片上传
                element = layui.element,//元素
                $ = layui.jquery;

            table.render({
                elem: '#course'
                ,height:'full-20'
                ,url:'<%=request.getContextPath()%>/courseManager/findAllByLimit'
                ,toolbar: '#toolbarDemo'
                ,cols: [[
                    {field:'coursesId', width:100, title: '课程ID', edit: 'text', sort: true}
                    ,{field:'introduceVideo', width:150, title: '视频', templet:function (data) {
                            return "<video controls src='"+data.introduceVideo+"'/>"
                        }}/*templet:'<video controls src="{{d.introduceVideo}}">' +
                            // '<source src="{{d.introduceVideo}}" type="video/mp4">' +
                            // '您的浏览器不支持 HTML5 video 标签。' +
                            '</video>'}*/
                    ,{field:'coursesName', width:100, title: '课程名'}
                    ,{field:'studentNum', width:100, title: '学习人数', sort: true}
                    ,{field:'chapterNum', width:100, title: '章节数'}
                    ,{field:'sectionNum', width: 100, title: '小节数'}
                    ,{field:'typeId', width: 100, title: '课程方向id'}
                    ,{field:'coursesTagId', width: 100, title: '课程标签id'}
                    ,{field:'price', width:100, title: '金额', sort: true}
                    ,{field:'coverPic', width:150, title: '封面图片',templet:function (data) {
                            return "<img src='"+data.coverPic+"'/>"
                        }}
                    ,{field:'introduceText', width:100, title: '简介文字', sort: true}
                    ,{field:'introducePic', width:150, title: '简介图片', templet:function (data) {
                            return "<img src='"+data.introducePic+"'/>"
                        }}
                    ,{field:'featureText', width:100, title: '特点文字'}
                    ,{field:'featurePic', width:150, title: '特点图片', templet:function (data) {
                            return "<img src='"+data.featurePic+"'/>"
                        }}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]]
                ,page: true

            });

            //头工具栏事件
            table.on('toolbar(course)', function(obj){
                var evend = obj.event;
                if (evend==="insert"){
                    layer.open({
                        title: "新增",
                        type: 1,
                        area: ['80%', '80%'],
                        content: $("#insertCourseDiv"),
                        btn:['提交'],
                        success:function(index,layero){
                            clear();
                            form.on('submit(submit)',function (data) {
                                layer.alert(data.field.coursesName);
                                $.ajax({
                                    type: "POST",
                                    url:"<%=request.getContextPath()%>/courseManager/insertByCourse",
                                    data:data.field,
                                    dataType:"json",
                                    success:function (result) {
                                        layer.alert(result.message);
                                        table.reload('course', {
                                             method: "post"
                                            , height:'full-20'
                                            , url: '<%=request.getContextPath()%>/courseHomePage/findAllByLimit'
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
                } else if (evend==="submit"){
                    let coursesName = $("#coursesNameInput").val();
                    table.reload('course', {
                        method: "post"
                        , height:'full-20'
                        , url: '<%=request.getContextPath()%>/courseManager/findByCoursesNameLimit?coursesName='+coursesName
                        , page:{
                            curr:1
                        }
                        , toolbar: '#toolbarDemo'
                    });
                }
            });

            //监听行工具事件
            table.on('tool(course)', function(obj){
                var data = obj.data;
                console.log(obj);
                if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        $.ajax({
                            type : "POST",
                            async: false,
                            url :"<%=request.getContextPath()%>/courseManager/deleteByCourseId",
                            data: {"courseId":data.coursesId},
                            success: function (result) {
                                // layer.msg("删除成功");
                                layer.alert(result.message);
                                table.reload('course',{
                                    url: '<%=request.getContextPath()%>/courseManager/findAllByLimit',
                                    height:'full-20',
                                    method: 'post',
                                    toolbar: '#toolbarDemo',
                                    page:{
                                        curr:1
                                    }
                                });
                            }
                        });
                    });
                } else if(obj.event === 'edit'){
                    clear();
                    $("#coverPicImg").attr("src",data.coverPic);
                    $("#introduceVideo1").val("src",data.introduceVideo);
                    $("#introducePicImg").attr("src",data.introducePic);
                    $("#featurePicImg").attr("src",data.featurePic);
                    $("#coursesId").val(data.coursesId);
                    $("#coursesName").val(data.coursesName);
                    $("#price").val(data.price);
                    $("#coverPicInput").val(data.coverPic);
                    $("#introduceVideoInput").val(data.introduceVideo);
                    $("#introduceText").val(data.introduceText);
                    $("#introducePicInput").val(data.introducePic);
                    $("#featureText").val(data.featureText);
                    $("#featurePicInput").val(data.featurePic);
                    $("#coursesType").val(data.typeId);
                    form.render('select');
                    $("#tagCheck").val(data.coursesTagId);
                    form.render('radio');
                    layer.open({
                        title: "编辑",
                        type: 1,
                        area: ['80%', '80%'],
                        content: $("#insertCourseDiv"),
                        btn:['提交'],
                        success:function(index,layero){
                            form.on('submit(submit)',function (data) {
                                $.ajax({
                                    type: "POST",
                                    url:"<%=request.getContextPath()%>/courseManager/updateCourses",
                                    data:data.field,
                                    dataType:"json",
                                    success:function (result) {
                                        layer.msg("修改成功");
                                    }
                                })
                            })
                        },
                        yes:function (index, layero) {
                            layero.find('form').find('button[lay-submit]').click();
                        }/*,
                        end:*/
                    });
                }
            });


            //拖拽上传
            let uploadInst1 = upload.render({
                elem: '#introduceVideo'
                ,url: '<%=request.getContextPath()%>/courseManager/uploadPic'
                ,accept: 'file'
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#videoDiv').css("display","inline");
                        $('#introduceVideo1').attr('src', result); //图片链接（base64）
                    });
                }
                ,done: function(res){
                    //上传成功
                    layer.msg(res.message);
                    $("#introduceVideoInput").val(res.url)
                }
                ,error: function(){
                    //演示失败状态，并实现重传
                    var introduceVideoText = $('#introduceVideoText');
                    introduceVideoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                    introduceVideoText.find('.demo-reload').on('click', function(){
                        uploadInst1.upload();
                    });
                }
            });
            let uploadInst2 = upload.render({
                elem: '#coverPic'
                ,url: '<%=request.getContextPath()%>/courseManager/uploadPic'
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#coverPicImg').attr('src', result); //图片链接（base64）
                    });
                }
                ,done: function(res){
                    //上传成功
                    layer.msg(res.message);
                    $("#coverPicInput").val(res.url)
                }
                ,error: function(){
                    //演示失败状态，并实现重传
                    var coverPicText = $('#coverPicText');
                    coverPicText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                    coverPicText.find('.demo-reload').on('click', function(){
                        uploadInst2.upload();
                    });
                }
            });
            let uploadInst3 = upload.render({
                elem: '#introducePic'
                ,url: '<%=request.getContextPath()%>/courseManager/uploadPic'
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#introducePicImg').attr('src', result); //图片链接（base64）
                    });
                }
                ,done: function(res){
                    //上传成功
                    layer.msg(res.message);
                    $("#introducePicInput").val(res.url)
                }
                ,error: function(){
                    //演示失败状态，并实现重传
                    let introducePicText = $('#introducePicText');
                    introducePicText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                    introducePicText.find('.demo-reload').on('click', function(){
                        uploadInst3.upload();
                    });
                }
            });
            let uploadInst4 = upload.render({
                elem: '#featurePic'
                ,url: '<%=request.getContextPath()%>/courseManager/uploadPic'
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#featurePicImg').attr('src', result); //图片链接（base64）
                    });
                }
                ,done: function(res){
                    //上传成功
                    layer.msg(res.message);
                    $("#featurePicInput").val(res.url)
                }
                ,error: function(){
                    //演示失败状态，并实现重传
                    let featurePicText = $('#featurePicText');
                    featurePicText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                    featurePicText.find('.demo-reload').on('click', function(){
                        uploadInst4.upload();
                    });
                }
            });

            //课程方向下拉框监听事件
            form.on('select(typeName)', function (data) {
                let typeId = data.value;
                $.ajax({
                    type:"POST",
                    url:"<%=request.getContextPath()%>/tagKe/findTagByTypeId",
                    data:{"typeId":typeId},
                    dataType:"json",
                    success:function (res) {
                        $("#tagCheck").empty();
                        $.each(res.tagList,function (i, tag) {
                            $("#tagCheck").append('<input type="radio" name="coursesTagId" title="'+tag.tagName+'" value="'+tag.tagId+'">');
                        });
                        form.render('radio');
                    }
                })
            });

            //清空表单数据
            function clear() {
                $("#coursesId").val();
                $("#coursesName").val();
                $("#price").val();
                $("#coverPicInput").val();
                $("#introduceVideoInput").val();
                $("#introduceText").val();
                $("#introducePicInput").val();
                $("#featureText").val();
                $("#featurePicInput").val();
                $("#coursesType").val();
                $("#tagCheck").val();
                form.render();
            }


        });
    </script>
</body>
</html>