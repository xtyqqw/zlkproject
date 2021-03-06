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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css"/>
    <link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/semantic-ui/2.2.4/semantic.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css"/>
    <style>
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
        <a class="btn btn-default" style="color:#914EF3;border: 1px solid #ccc;" id="a1"
           href="<%=request.getContextPath() %>/question/questionGuide" role="button">
            &lsaquo;&nbsp;&nbsp;返回</a>
    </div>
    <div style="margin-top: -45px;margin-left: 730px;float: left;">
        <h4 id="h4">问题编辑</h4>
    </div>

    <div class="m-container m-padded-tb-big">
        <div class="ui container">
            <form action="<%=request.getContextPath() %>/question/addQuestion" method="post" class="ui form"
                  id="publish">
                <div class="required field">
                    <div class="ui left labeled input">
                        <div class="ui selection compact violet basic dropdown label">
                            <input type="hidden" value="待解决" name="solve">
                            <i class="dropdown icon"></i>
                            <div class="text">待解决</div>
                            <div class="menu">
                                <div class="item" data-value="0">待解决</div>
                                <div class="item" data-value="1">已解决</div>
                            </div>
                        </div>
                        <input type="text" name="questionTitle" placeholder="标题：简短描述标题,以问号结尾,最多只能输入30字"
                               maxlength="30">
                    </div>
                </div>

                <div class="required field">
                    <div id="md-content" style="z-index: 1 !important;">
                        <textarea class="editormd-markdown-textarea" name="questionContent"
                                  style="display: none"></textarea>
                        <!--第二个隐藏文本域,用来构造生成的HTML代码,方便表单POST提交,这里的name可以任意取,后台接受时以这个name键为准-->
                        <textarea class="editormd-html-textarea" name="questionContentHtml"
                                  style="display: none"></textarea>
                    </div>
                </div>

                <div class="required field">
                    <div class="ui left labeled input">
                        <label class="ui basic violet label">问题摘要</label>
                        <input type="text" name="questionSynopsis" placeholder="请输入一些问题摘要,这样能方便他人快捷的了解你的问题,注意字数不要过多">
                    </div>
                </div>
                <div class="two fields">
                    <div class="required field">
                        <div class="ui left labeled action input">
                            <label class="ui compact violet basic label" placeholder="">问题类别</label>
                            <div class="ui fluid selection dropdown">
                                <input type="hidden" name="typeName">
                                <i class="dropdown icon"></i>
                                <div class="default text">请选择问答类别</div>
                                <div class="menu">
                                    <div class="item" data-value="JAVA">JAVA</div>
                                    <div class="item" data-value="Linux">Linux</div>
                                    <div class="item" data-value="HTML">HTML</div>
                                    <div class="item" data-value="MYSQL">MYSQL</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="required field">
                        <div class="ui left labeled action input">
                            <label class="ui compact violet basic label">问题标签</label>
                            <div class="ui fluid selection multiple search dropdown">
                                <input type="hidden" name="tagIds">
                                <i class="dropdown icon"></i>
                                <div class="default text">请选择标签</div>
                                <div class="menu">
                                    <c:forEach items="${tags}" var="tag">
                                        <div class="item" data-value="${tag.tagId}">${tag.tagName}</div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui right aligned container">
                    <button type="submit" id="publish-btn" onclick="publish()" class="ui violet button">发布问题
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/editormd.js"></script>
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
            emoji: false,
            toolbarIcons: function () {  //自定义工具栏
                return editormd.toolbarModes['simple']; // full, simple, mini
            },
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "/question/uploadMarkdownImg",
            //这个配置是为了能够提交表单,使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中,方便post提交表单
            saveHTMLToTextarea: true
        });
    });

    /*下拉框渲染开启*/
    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });
    $('.ui.dropdown').dropdown({
        on: 'hover'
    });

    /*表单验证开启*/
    function publish() {
        $('.ui.form').form({
            inline: true,
            on: 'blur',
            fields: {
                questionTitle: {
                    identifier: 'questionTitle',
                    rules: [{
                        type: 'empty',
                        prompt: '问题不能为空呦'
                    }, {
                        type: 'maxLength[30]',
                        prompt: '请注意问题标题最大长度不能超过30'
                    }]
                },
                questionContent: {
                    identifier: 'questionContent',
                    rules: [{
                        type: 'empty',
                        prompt: '问题内容不能为空哟'
                    }]
                },
                questionSynopsis: {
                    identifier: 'questionSynopsis',
                    rules: [{
                        type: 'empty',
                        prompt: '问题摘要内容不能为空哟'
                    }, {
                        type: 'maxLength[150]',
                        prompt: '请注意问题摘要最大长度不能超过150'
                    }]
                },
                typeName: {
                    identifier: 'typeName',
                    rules: [{
                        type: 'empty',
                        prompt: '请选择一个问题类别'
                    }]
                },
                tagName: {
                    identifier: 'tagIds',
                    rules: [{
                        type: 'minCount[1]',
                        prompt: '请选择一个问题标签'
                    }, {
                        type: 'maxCount[3]',
                        prompt: '最多只能选择三个问题标签'
                    }]
                }
            },
            onSuccess: function () {
                alert("发布成功,请耐心等待审核");
            },
        });
    }
</script>

</body>
</html>
