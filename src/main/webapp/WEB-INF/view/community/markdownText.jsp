<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/11/22
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>markdown文本</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .editormd-html-preview {
            width: 90%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div id="layout">
        <div id="test-editormd-view">
            <textarea id="append-test" style="display:none;">${markdownContent}</textarea>
        </div>
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
        $(function() {
            var testEditormdView;
            testEditormdView = editormd.markdownToHTML("test-editormd-view", {
                htmlDecode : "style,script,iframe",  // you can filter tags decode
                emoji : true,
                taskList : true,
                tex : true,  // 默认不解析
                flowChart : true,  // 默认不解析
                sequenceDiagram : true  // 默认不解析
            });
        });
    </script>
</body>
</html>
