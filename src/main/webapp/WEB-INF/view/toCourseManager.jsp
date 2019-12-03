<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>
    <form class="layui-form"  id="insertCourse" action="/courseHomePage/insertByCourse" method="post" style="width: 400px; display: none;">
        <div class="layui-form-item">
            <label class="layui-form-label">课程视频</label>
            <div class="layui-input-inline uploadHeadImage">
                <div class="layui-upload-drag" id="introduceVideo">
                    <i class="layui-icon"></i>
                    <p>点击上传视频</p>
                </div>
                <input type="hidden" name="introduceVideo" id="introduceVideo1"  >
            </div>
        </div>
        <div class="layui-form-item" style="display: none;">
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
            <label class="layui-form-label">章节数</label>
            <div class="layui-input-block">
                <input type="number" name="chapterNum" id="chapterNum" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">小节数</label>
            <div class="layui-input-block">
                <input type="number" name="sectionNum" id="sectionNum" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">金额</label>
            <div class="layui-input-block">
                <input type="number" name="price" id="price" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">封面图片</label>
            <div class="layui-input-inline uploadHeadImage">
                <div class="layui-upload-drag" id="coverPic">
                    <i class="layui-icon"></i>
                    <p>点击上传图片</p>
                </div>
                <input type="hidden" name="coverPic" id="coverPic1"  >
            </div>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="coverPic2">
                <p id="coverPicText"></p>
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
            <div class="layui-input-inline uploadHeadImage">
                <div class="layui-upload-drag" id="introducePic">
                    <i class="layui-icon"></i>
                    <p>点击上传图片</p>
                </div>
                <input type="hidden" name="introducePic" id="introducePic1"  >
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
            <div class="layui-input-inline uploadHeadImage">
                <div class="layui-upload-drag" id="featurePic">
                    <i class="layui-icon"></i>
                    <p>点击上传图片</p>
                </div>
                <input type="hidden" name="featurePic" id="featurePic1"  >
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <table class="layui-hide" id="course" lay-filter="course"></table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="insert">新增</button>
        </div>
    </script>
<script type="text/javascript" src="/layui/layui.js"  charset="utf-8"></script>
<script type="text/javascript" >
    layui.use(['table','layer','form'], function(){
        var table = layui.table;//表格
        var layer = layui.layer;//弹层
        var form = layui.form;//表单
        table.render({
            elem: '#course'
            ,url:'/courseHomePage/findAllByLimit'
            ,toolbar: '#toolbarDemo'
            ,height: 480
            ,cols: [[
                {field:'coursesId', width:100, title: '课程ID', edit: 'text', sort: true}
                ,{field:'introduceVideo', width:100, title: '视频', templet:'<div><video controls  >' +
                        '<source src="{{d.introduceVideo}}" type="video/mp4">' +
                        '您的浏览器不支持 HTML5 video 标签。' +
                        '</video></div>'}
                ,{field:'coursesName', width:100, title: '课程名', edit: 'text'}
                ,{field:'studentNum', width:100, title: '学习人数', edit: 'text', sort: true}
                ,{field:'chapterNum', width:100, title: '章节数', edit: 'text'}
                ,{field:'sectionNum', width: 100, title: '小节数', edit: 'text'}
                ,{field:'price', width:100, title: '金额', edit: 'text', sort: true}
                ,{field:'coverPic', width:100, title: '封面图片',templet:'<div><img src="{{d.coverPic}}"></div>'}
                ,{field:'introduceText', width:100, title: '简介文字', edit: 'text', sort: true}
                ,{field:'introducePic', width:100, title: '简介图片', templet:'<div><img src="{{d.introducePic}}"></div>'}
                ,{field:'featureText', width:100, title: '特点文字', edit: 'text'}
                ,{field:'featurePic', width:100, title: '特点图片', templet:'<div><img src="{{d.featurePic}}"></div>'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page: true
        });
        //头工具栏事件
        table.on('toolbar(course)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id); //获取选中行状态
            var evend = obj.event;
            if (evend==="insert"){
                layer.open({
                    title: "新增",
                    type: 1,
                    area: ['40%', '80%'],
                    content: $("#insertCourse")
                });
            };
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
                        url :"/courseHomePage/deleteByCourseId",
                        data: {"courseId":data.coursesId},
                        success: function (data) {
                            console.log(data);
                            layer.msg("删除成功");
                            table.reload('course',{
                                url: '/courseHomePage/findAllByLimit',
                                height: 480,
                                toolbar: '#toolbarDemo',
                                page:{
                                    curr:1
                                }
                            });
                        }
                    });
                });
            } else if(obj.event === 'edit'){
                layer.prompt({
                    formType: 2
                    ,value: data.email
                }, function(value, index){
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });
    });
    layui.use(["jquery", "upload", "form", "layer", "element"], function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;
        //拖拽上传
        upload.render({
            elem: '#introduceVideo'
            ,url: '/uploadTest'
            ,accept: 'video'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                console.log(res)
            }
        });
        upload.render({
            elem: '#coverPic'
            ,url: '/uploadTest'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    console.log(result);
                    $('#coverPic2').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                console.log(res)
            }
        });upload.render({
            elem: '#introducePic'
            ,url: '/uploadTest'
            ,done: function(res){
                console.log(res)
            }
        });upload.render({
            elem: '#featurePic'
            ,url: '/uploadTest'
            ,done: function(res){
                console.log(res)
            }
        });


    });
</script>
</body>
</html>