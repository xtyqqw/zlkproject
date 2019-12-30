<%--
  Created by IntelliJ IDEA.
  User: Anduin
  Date: 2019/12/10
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css" />
    <link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
    <script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>
    h2{margin: 20px 0;}
</style>
<body>
<form action="<%=request.getContextPath() %>/articles/update" method="post">
    <h2>修改标题：</h2>
    <input class="layui-text" style="margin-left: 23px;width: 800px;height: 40px;line-height: 40px;" type="text" name="title" value="${articles.title}">
    <h2>修改图片：</h2>
    <div class="layui-input-inline uploadHeadImage" style="margin-bottom:2vw;">
        <div class="layui-upload-drag"  id="headImg">
            <i class="layui-icon"></i>
            <p style="font-size: 1vw;">点击上传图片</p>
        </div>
        <input type="hidden" name="figures" id="userImg"  >
    </div>
    <div class="layui-input-inline" style="margin:0 0 3vw 3vw;">
        <div class="layui-upload-list">
            <img class="layui-upload-img headImage" name="figures" src="${articles.figures}"   id="demo1"
                 style="width: 10vw; height: 10vw;">
            <p id="demoText"></p>
        </div>
    </div>
    <h2>修改内容：</h2>
    <div id="md-content">
        <textarea class="editormd-markdown-textarea" name="articleContent" style="display: none">${articles.articleContent}</textarea>
        <textarea class="editormd-html-textarea" name="articleContentHtml" style="display: none">${articles.articleContentHtml}</textarea>
    </div>
    <input type="text" name="articleId" hidden="hidden" value="${articles.articleId}"/>
    <input type="submit" class="layui-btn" style="float: right;margin: 30px 50px 0 30px" value="提交">
</form>
<form action="/articles/toarticles" method="get">
    <input type="submit" class="layui-btn" style="float: right;margin-top: 30px;background: grey" value="返回">
</form>
</body>
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath() %>/editormd/editormd.min.js"></script>
<script>
    /*MarkDown组件*/
    var testEditor;
    $(function() {
        testEditor = editormd("md-content", {
            width : "95%",
            height : 640,
            syncScrolling : "single",
            //你的lib目录的路径
            path : "<%=request.getContextPath() %>/editormd/lib/",
            toolbarIcons: function () {  //自定义工具栏
                return editormd.toolbarModes['simple']; // full, simple, mini
            },
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/uploadfile",
            //这个配置是为了能够提交表单,使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中,方便post提交表单
            saveHTMLToTextarea : true
        });
    });

    layui.use(["jquery", "upload", "form", "layer", "element"], function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;
        //拖拽上传
        var uploadInst = upload.render({
            elem: '#headImg'
            //文件上传地址
            , url: '<%=request.getContextPath()%>/articles/uploadImg'
            , size: 500
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //服务器上传成功
                layer.msg(res.message,{icon: 1});
                //获取图片路径URL
                $("#userImg").val(res.url)
            }
            //错误重新上传
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
        element.init();
    });
</script>
</html>
