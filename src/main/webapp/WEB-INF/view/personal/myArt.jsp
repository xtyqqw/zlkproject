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
</head>
<style>
    h2{margin: 20px 0;}
</style>
<body>
<form action="<%=request.getContextPath() %>/articles/update" method="post">
    <h2>修改标题：</h2>
    <input class="layui-text" style="margin-left: 23px;width: 800px;height: 40px;line-height: 40px;" type="text" name="title" value="${articles.title}">
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
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/uploadfile",
            //这个配置是为了能够提交表单,使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中,方便post提交表单
            saveHTMLToTextarea : true
        });
    });
</script>
</html>
