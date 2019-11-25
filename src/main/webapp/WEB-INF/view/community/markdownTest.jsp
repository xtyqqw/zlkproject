<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/11/22
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>markdown练习</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div id="layout">
        <header>
            <h1>Markdown 例子</h1>
        </header>
        <form action="<%=request.getContextPath() %>/markdownTest" method="post">
            <div id="test-editormd">
                <textarea style="display:none;" name="markdownContent"></textarea>
            </div>
            <button type="submit" class="btn btn-info col-md-offset-3 col-md-6">添加</button>
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

            /*
            testEditor = editormd({
                id      : "test-editormd",
                width   : "90%",
                height  : 640,
                path    : "../lib/"
            });
            */
        });
    </script>

</body>
</html>
