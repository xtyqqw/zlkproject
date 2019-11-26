<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/11/26
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章编辑页面</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        header {
            width: auto;
            height: 60px;
            background-color: #F5F5F5;
            /*border-style: solid;
            border-top-style: none;
            border-left-style: none;
            border-right-style: none;*/
        }
        header input {
            margin-left: -240px;
            margin-top: 7px;
            padding: 10px;
        }
        header a {
            text-decoration:none !important;
            margin-top: 100px;
            color: #8D8D8D;
            font-size: 25px;
            margin-left: 800px;
        }
    </style>
</head>
<body>
    <div>
        <header>
            <input class="btn btn-default" type="button" value="<&nbsp;&nbsp;返回" οnclick="">
            <a href="javascript:void(0)">我的草稿</a>
        </header>
        <form action="<%=request.getContextPath() %>/" method="post">
            <div class="input-group input-group-lg" style="width: 1210px; margin-left: 70px; margin-top: 20px; margin-bottom: 20px;">
                <input type="text" class="form-control" name="title" placeholder="简明扼要的描述你的标题">
            </div>
            <div id="test-editormd">
                <textarea style="display:none;" name="articleContent"></textarea>
            </div>
            <div style="width: 1210px; margin-left: 70px; margin-top: 20px; margin-bottom: 20px;">
                <input type="text" class="form-control" name="title" placeholder="请输入文章摘要">
            </div>
            <div class="col-sm-5" style="margin-left: -130px">
                <label for="" class="radio-inline">
                    <input type="radio" name="createArticleType" id="" value="0">
                    原创
                </label>
                <label for="" class="radio-inline">
                    <input type="radio" name="createArticleType" id="" value="1">
                    转载
                </label>
                <label for="" class="radio-inline">
                    <input type="radio" name="createArticleType" id="" value="2">
                    翻译
                </label>
            </div>
            <button type="submit" class="btn btn-info col-md-1" style="margin-right: 70px; margin-top: 40px; background-color: #1296db">发表文章</button>
        </form>
    </div>

    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/editormd/editormd.min.js"></script>
    <script src="<%=request.getContextPath() %>/editormd/lib/marked.min.js"></script>
    <script src="<%=request.getContextPath() %>/editormd/lib/prettify.min.js"></script>
    <script src="<%=request.getContextPath() %>/editormd/lib/raphael.min.js"></script>
    <script src="<%=request.getContextPath() %>/editormd/lib/underscore.min.js"></script>
    <script src="<%=request.getContextPath() %>/editormd/lib/sequence-diagram.min.js"></script>
    <script src="<%=request.getContextPath() %>/editormd/lib/flowchart.min.js"></script>
    <script src="<%=request.getContextPath() %>/editormd/lib/jquery.flowchart.min.js"></script>
    <script src="<%=request.getContextPath() %>/editormd/editormd.js"></script>
    <script type="text/javascript">
        var testEditor;
        $(function() {
            testEditor = editormd("test-editormd", {
                width : "90%",
                height : 640,
                syncScrolling : "single",
                path : "../editormd/lib/",
                imageUpload : true,
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "/imageUpload"
            });
        });
    </script>
</body>
</html>
