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
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon"/>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-select/1.9.1/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/bootstrap/css/bootstrapValidator.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <script src="/layui/layui.js"></script>
    <style>
        .top {
            height: auto;
            width: 100%;
            left: 0px;
            margin-top: 0px; /*离顶部的距离为0*/
        }
        .header {
            width: 100%;
            height: 60px;
            background-color: #FCFCFC;
            left: 0px;
            margin-top: 0px;
            border-bottom: 1px solid #F5F5F5;
        }
        header input {
            margin-left: -240px;
            margin-top: 7px;
            padding: 10px;
            border: 0; /* 去除未选中状态边框*/
            outline: none; /* 去除选中状态边框*/
            background-color: rgba(0, 0, 0, 0); /* 透明背景*/
        }
        header a {
            text-decoration: none !important;
            margin-top: 100px;

            font-size: 25px;
            margin-left: 800px;
        }

    </style>

</head>
<body>
<div class="top">
    <div class="header">
        <div style="margin-top: 20px;margin-left: -1220px">
            <a class="btn btn-default" href="<%=request.getContextPath() %>/question/hint" role="button">
                &lsaquo;&nbsp;&nbsp;返回</a>
        </div>
        <div style="margin-top: -35px;">
            <h4 style="color: #778899">问题编辑</h4>
        </div>
    </div>
    <form action="<%=request.getContextPath() %>/question/addQuestion" method="post">
        <div>
            <input type="text" id="title" style="color: #8D8D8D;font-size:30px;border:none;width: 1290px;height:70px;"
                   name="questionTitle"
                   placeholder="简明扼要的描述你的标题" option="none" required minlength="2" maxlength="50">
        </div>
        <div id="test-editormd" class="form-group">
            <textarea style="display:none;" name="questionContent" class="form-control" minlength="10" maxlength="99999"></textarea>
        </div>
        <div style="width: 1293px; margin-left: 113px; margin-top: 20px; margin-bottom: 20px;" class="form-group">
            <select class="selectpicker dropup form-control show-tick" data-dropup-auto="false" title="请选择分类" name="typeName">
                <option value="java">java</option>
                <option value="linux">linux</option>
                <option value="html">html</option>
                <option value="mysql">mysql</option>
            </select>
        </div>
        <div style="width: 1293px; margin-left: 113px; margin-top: 20px; " class="form-group">
            <select class="selectpicker dropup form-control" data-dropup-auto="false" data-size="7" multiple name="tagName" title="选择标签0/3" data-live-search="true" data-live-search-placeholder="可以搜索标签..." data-max-options="3">
                <option value="java">java</option>
                <option value="java开发">java开发</option>
                <option value="spring">spring</option>
                <option value="mysql">mysql</option>
                <option value="技术生活">技术生活</option>
                <option value="面试题目">面试题目</option>
                <option value="redis">redis</option>
                <option value="c">c</option>
                <option value="云计算">云计算</option>
                <option value="c#">c#</option>
                <option value="c++">c++</option>
            </select>
        </div>
        <button type="submit" class="btn btn-info col-md-1"
                style="margin-left: 1280px; margin-top: 20px; margin-bottom:40px;background-color: #1296db">发布问题
        </button>
    </form>
</div>

<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-select/1.9.1/js/bootstrap-select.min.js"></script>
<script src="<%=request.getContextPath() %>/bootstrap/js/bootstrapValidator.min.js"></script>
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
    $(function () {
        testEditor = editormd("test-editormd", {
            codeFold: true,
            saveHTMLToTextarea: true,    // 保存 HTML 到 Textarea
            searchReplace: true,
            htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
            emoji: true,
            taskList: true,
            tocm: true,
            tex: true,
            flowChart: true,
            sequenceDiagram: true,
            placeholder: " 例:详细描述你所遇到的问题细节\n    通过图片、代码或链接完善内容\n    尝试哪些方法仍没有解决\n    你期待一个什么样的结果",
            dialogMaskBgColor: "#fff",
            gotoLine: true,
            width: "85%",
            height: 520,
            syncScrolling: "single",
            path: "../editormd/lib/",
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "/upload"
        });
    });
    $('.selectpicker').selectpicker('refresh');

    $(function () {
        $('#addArticle').bootstrapValidator({
            excluded: [':disabled'],//排除无需验证的控件
            //表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                title: {
                    validators: {
                        notEmpty: {
                            message: '标题不能为空'
                        },
                        stringLength: {
                            min: 0,
                            max: 50,
                            message: '标题长度必须在50位以内'
                        }
                    }
                },

                createArticleType: {
                    validators: {
                        notEmpty: {
                            message: '请选择发文类型'
                        }
                    }
                },
                setTags: {
                    validators: {
                        notEmpty: {
                            message: '请至少选择一个文章标签'
                        }
                    }
                },
                typeName: {
                    validators: {
                        notEmpty: {
                            message: '请至少选择一个文章方向'
                        }
                    }
                }
            },
            /*submitHandler: function (validator, form, submitButton) {
                alert("发表成功");
            }*/
        });
    });


</script>
</body>
</html>
