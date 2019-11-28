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
    <link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap-select.css" rel="stylesheet">
    <style>
        .header {
            width: auto;
            height: 60px;
            background-color: #F5F5F5;
        }
        .header input {
            float: left;
            width: 80px;
            padding: 10px;
            margin-left: 67px;
            margin-top: 9px;
        }
        .header a {
            text-decoration:none !important;
            color: #8D8D8D;
            font-size: 25px;
            float: right;
            margin-top: 9px;
            margin-right: 67px;
        }
    </style>
</head>
<body>
    <div>
        <div class="header">
            <input class="btn btn-default" type="button" value="<&nbsp;&nbsp;返回" οnclick="">
            <a href="javascript:void(0)">我的草稿</a>
        </div>
        <form action="<%=request.getContextPath() %>/community/article-add" method="post" class="form-group">
            <div class="input-group input-group-lg" style="width: 1215px; margin-left: 67px; margin-top: 20px; margin-bottom: 20px;">
                <input type="text" class="form-control" name="title" placeholder="简明扼要的描述你的标题">
            </div>
            <div id="test-editormd">
                <%--<textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" placeholder="开始撰写..."></textarea>
                <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
                <textarea class="editormd-html-textarea" name="articleContent"></textarea>--%>
                <textarea style="display:none;" name="articleContent"></textarea>
            </div>
            <div style="width: 1215px; margin-left: 67px; margin-top: 20px; margin-bottom: 20px;" class="list-group">
                <select class="form-control" id="" name="typeName">
                    <option selected disabled style="display: none;">请选择发文方向</option>
                    <option value="java">java</option>
                    <option value="linux">linux</option>
                    <option value="html">html</option>
                    <option value="mysql">mysql</option>
                </select>
            </div>
            <div class="input-group" style="width: 1215px; margin-left: 67px; margin-top: 20px; margin-bottom: 20px;">
                <input type="text" class="form-control" name="tagName" placeholder="选择标签0/3">
            </div>
            <div class="input-group" style="width: 1215px; margin-left: 67px; margin-top: 20px; margin-bottom: 20px;">
                <input type="text" class="form-control" name="articleDigest" placeholder="请输入文章摘要">
            </div>
            <div class="list-group" style="margin-left: -1043px;">
                <label class="radio-inline">
                    <input type="radio" value="原创" name="createArticleType">原创
                </label>
                <label class="radio-inline">
                    <input type="radio" value="转载" name="createArticleType">转载
                </label>
                <label class="radio-inline">
                    <input type="radio" value="翻译" name="createArticleType">翻译
                </label>
            </div>
            <button type="submit" class="btn btn-info col-md-1 btn-group" style="margin-left: 1170px; margin-top: 40px; background-color: #1296db">发表文章</button>
        </form>
    </div>

    <script src="<%=request.getContextPath() %>/bootstrap/js/bootstrap-select.js"></script>
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
                //你的lib目录的路径
                path : "../editormd/lib/",
                emoji : true,
                taskList : true,
                tocm : true,
                tex : true,
                flowChart : true,
                sequenceDiagram : true,
                //dialogLockScreen : true,
                //dialogShowMask : false,
                //dialogDraggable : true,
                dialogMaskOpacity : 0.4,
                dialogMaskBgColor : "#000",
                imageUpload : true,
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "/uploadfile",
                //这个配置是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单
                saveHTMLToTextarea : true
            });
        });
    </script>
</body>
</html>
