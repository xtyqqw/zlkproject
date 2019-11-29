<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/11/22
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>markdown文本</title>
    <base href="<%=basePath %>">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css"/>
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon"/>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .editormd-html-preview {
            width: 90%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div class="article">
    <div class="content" id="layer">
        <div id="test-editormd-view">
            <h2>${article.title}</h2>
            <textarea id="append-test" style="display:none;" >${article.articleContent}</textarea>
        </div>
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
        /*$.get("test.md", function(markdown) {

           testEditormdView = editormd.markdownToHTML("test-editormd-view", {
               markdown        : markdown ,//+ "\r\n" + $("#append-test").text(),
               //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
               htmlDecode      : "style,script,iframe",  // you can filter tags decode
               //toc             : false,
               tocm            : true,    // Using [TOCM]
               //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
               //gfm             : false,
               //tocDropdown     : true,
               // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
               emoji           : true,
               taskList        : true,
               tex             : true,  // 默认不解析
               flowChart       : true,  // 默认不解析
               sequenceDiagram : true,  // 默认不解析
           });

           //console.log("返回一个 jQuery 实例 =>", testEditormdView);

           // 获取Markdown源码
           //console.log(testEditormdView.getMarkdown());

           //alert(testEditormdView.getMarkdown());
       });*/
        testEditormdView = editormd.markdownToHTML("test-editormd-view", {
            htmlDecode      : "style,script,iframe",
            emoji           : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true,  // 默认不解析
        });
    });
</script>
</body>
</html>
