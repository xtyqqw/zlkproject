<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/11/26
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>提问编辑页面</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css"/>
    <link rel="shortcut icon" href="/img/zlk.png" type="image/x-icon" />
    <link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-select/1.9.1/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.4.5/css/bootstrapValidator.min.css"
          rel="stylesheet">
    <link href="https://cdn.bootcss.com/semantic-ui/2.2.4/semantic.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css"/>
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <style>
        body {
            background: url("/img/12949615.jpg");
        }

        .top {
            height: auto;
            width: auto;
            left: 0;
            top: 0; /*离顶部的距离为0*/
        }

        .header {
            width: 100%;
            height: 60px;
            background-color: #F5F5F5;
        }

        .header #a1 {
            float: left;
            width: 80px;
            padding: 10px;
            margin-left: 100px;
            margin-top: 10px;
        }

        #h4 {
            color: #778899;
            font-size: 20px;
            text-align: center;
        }

    </style>

</head>
<body>
<div class="top">
    <div class="header">
        <%-- <button id="a1" type="button" class="ui blue button" onclick="window.history.go(-1)">返回</button>--%>
        <a class="btn btn-default" id="a1" href="<%=request.getContextPath() %>/question/hint" role="button">
            &lsaquo;&nbsp;&nbsp;返回</a>
    </div>
    <div style="margin-top: -45px;margin-left: 730px;float: left;">
        <h4 id="h4">问题编辑</h4>
    </div>

    <div class="m-container m-padded-tb-big">
        <div class="ui container">
            <form action="<%=request.getContextPath() %>/question/addQuestion" method="post" class="ui form" id="publish">
                <div class="required field">
                    <div class="ui left labeled input">
                        <div class="ui selection compact teal basic dropdown label">
                            <input type="hidden" value="原创" name="createQuestionType">
                            <i class="dropdown icon"></i>
                            <div class="text">原创</div>
                            <div class="menu">
                                <div class="item" data-value="原创">原创</div>
                                <div class="item" data-value="转载">转载</div>
                            </div>
                        </div>
                        <input type="text" name="questionTitle" placeholder="简明扼要的描述你的标题,最多只能输入50字" maxlength="50">
                    </div>
                </div>

                <div class="required field">
                    <div id="md-content" style="z-index: 1 !important;">
                        <textarea name="questionContent" style="display: none"></textarea>
                    </div>
                </div>

                <div class="two fields">
                    <div class="required field">
                        <div class="ui left labeled action input">
                            <label class="ui compact teal basic label" placeholder="">分类</label>
                            <div class="ui fluid selection dropdown">
                                <input type="hidden" name="typeName">
                                <i class="dropdown icon"></i>
                                <div class="default text">请选择问答分类</div>
                                <div class="menu">
                                    <div class="item" data-value="java">java</div>
                                    <div class="item" data-value="linux">linux</div>
                                    <div class="item" data-value="html">html</div>
                                    <div class="item" data-value="mysql">mysql</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left labeled action input">
                            <label class="ui compact teal basic label">标签</label>
                            <div class="ui fluid selection multiple search dropdown">
                                <input type="hidden" name="tagName">
                                <i class="dropdown icon"></i>
                                <div class="default text">请选择问答标签</div>
                                <div class="menu">
                                    <div class="item" data-value="java">java</div>
                                    <div class="item" data-value="linux">linux</div>
                                    <div class="item" data-value="html">html</div>
                                    <div class="item" data-value="mysql">mysql</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui error message"></div>
                <div class="ui right aligned container">
                    <button type="submit" id="publish-btn" class="ui teal button">发布问题</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/editormd.min.js"></script>
    <script type="text/javascript">
        /*MarkDown组件*/
        var testEditor;
        $(function () {
            testEditor = editormd("md-content", {
                width: "100%",
                height: 640,
                placeholder: " 例:详细描述你所遇到的问题细节\n    通过图片、代码或链接完善内容\n    尝试哪些方法仍没有解决\n    你期待一个什么样的结果",
                syncScrolling: "single",
                //你的lib目录的路径
                path: "../editormd/lib/",
                image: "添加图片",
                imageUpload: true,
                uploadButton: "本地上传",
                imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL: "/question/uploadImg"

            });
        });

        /*下拉框渲染开启*/
        $('.menu.toggle').click(function () {
            $('.m-item').toggleClass('m-mobile-hide');
        });
        $('.ui.dropdown').dropdown({
            on: 'hover'
        });

        /*编辑完后审核*/
        function publish() {
            $.ajax({
                type: 'POST',
                url: '/question/addQuestion',
                data: $('#publish'),
                success: function (res) {
                    if (res.data()) {
                        alert("正在审核,请耐心等待");
                    }
                },
                error: function (res) {
                    if (res.data() == null) {
                        alert("文章不符合要求");
                    }
                }
            });
        }

        /*表单验证开启*/
        $('.ui.form').form({
            fields: {
                questionTitle: {
                    identifier: 'questionTitle',
                    rules: [{
                        type: 'empty',
                        prompt: '提示：请输入文章标题'
                    }]
                },
                questionContent: {
                    identifier: 'questionContent',
                    rules: [{
                        type: 'empty',
                        prompt: '提示：请输入文章内容'
                    }]
                },
                typeName: {
                    identifier: 'typeName',
                    rules: [{
                        type: 'empty',
                        prompt: '提示：请选择文章分类'
                    }]
                },
                tagName: {
                    identifier: 'tagName',
                    rules: [{
                        type: 'empty',
                        prompt: '提示：请选择文章标签'
                    }]
                },
            }
        });
    </script>

</body>
</html>
