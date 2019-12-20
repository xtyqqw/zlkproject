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
    <title>文章发布</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css" />
    <link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/semantic-ui/2.2.4/semantic.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css" />
    <style>
        .header {
            width: auto;
            height: 60px;
            background-color: #F5F5F5;
        }
        .header #a1 {
            float: left;
            width: 80px;
            padding: 10px;
            margin-left: 67px;
            margin-top: 9px;
        }
        .header #a2 {
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
        <%--顶部内容--%>
        <div class="header">
            <button id="a1" type="button" class="ui blue button" onclick="window.history.go(-1)">返回</button>
            <a href="javascript:void(0)" id="a2">我的文章</a>
        </div>
        <!--中间内容-->
        <div  class="m-container m-padded-tb-big">
            <div class="ui container">
                <form action="<%=request.getContextPath() %>/articles" method="post" class="ui form">
                    <div class="required field">
                        <div class="ui left labeled input">
                            <div class="ui selection compact basic dropdown violet label">
                                <input type="hidden" value="原创" name="createArticleType">
                                <i class="dropdown icon"></i>
                                <div class="text">原创</div>
                                <div class="menu">
                                    <div class="item" data-value="0">原创</div>
                                    <div class="item" data-value="1">转载</div>
                                    <div class="item" data-value="2">翻译</div>
                                </div>
                            </div>
                            <input type="text" name="title" placeholder="简明扼要的描述你的标题">
                        </div>
                    </div>

                    <div class="required field">
                        <div id="md-content" style="z-index: 1 !important;">
                            <textarea class="editormd-markdown-textarea" name="articleContent" style="display: none"></textarea>
                            <!--第二个隐藏文本域,用来构造生成的HTML代码,方便表单POST提交,这里的name可以任意取,后台接受时以这个name键为准-->
                            <textarea class="editormd-html-textarea" name="articleContentHtml" style="display: none"></textarea>
                        </div>
                    </div>

                    <div class="two fields">
                        <div class="required field">
                            <div class="ui left labeled action input">
                                <label class="ui compact basic violet label">方向</label>
                                <div class="ui fluid selection dropdown">
                                    <input type="hidden" name="typeName">
                                    <i class="dropdown icon"></i>
                                    <div class="default text">请选择方向</div>
                                    <div class="menu">
                                        <div class="item" data-value="java">JAVA</div>
                                        <div class="item" data-value="linux">Linux</div>
                                        <div class="item" data-value="html">HTML</div>
                                        <div class="item" data-value="mysql">MYSQL</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="required field">
                            <div class="ui left labeled action input">
                                <label class="ui compact basic violet label">标签</label>
                                <div class="ui fluid selection multiple search dropdown">
                                    <input type="hidden" name="tagIds">
                                    <i class="dropdown icon"></i>
                                    <div class="default text">请选择标签&nbsp;&nbsp;&nbsp;1&nbsp;/&nbsp;3</div>
                                    <div class="menu">
                                        <c:forEach items="${tags}" var="tag">
                                            <div class="item" data-value="${tag.tagId}">${tag.tagName}</div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="required field">
                        <div class="ui left labeled input">
                            <label class="ui basic violet label">摘要</label>
                            <input type="text" name="articleDigest" placeholder="请输入一些文章摘要,这样能方便其他同学快捷的了解你的文章,注意字数不要过多">
                        </div>
                    </div>

                    <div class="field">
                        <div class="ui left labeled input">
                            <label class="ui basic violet label">首图</label>
                            <input type="text" name="figures" placeholder="首图引用地址,可以是相关的代码截图或是引人注目的封面">
                        </div>
                    </div>

                    <%--<div class="ui error message"></div>--%>

                    <div class="ui right aligned container">
                        <button type="reset" class="ui reset secondary button">重置</button>
                        <button type="submit" onclick="publish()" class="ui button violet">发布</button>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <%--受js文件运行机制所致，引用时一定要注意顺序--%>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
    <script src="<%=request.getContextPath() %>/editormd/editormd.js"></script>
    <script type="text/javascript">
        /*MarkDown组件*/
        var testEditor;
        $(function() {
            testEditor = editormd("md-content", {
                width : "100%",
                height : 640,
                placeholder : "开始撰写...",
                syncScrolling : "single",
                //你的lib目录的路径
                path : "../editormd/lib/",
                emoji: false,
                toolbarIcons: function () {  //自定义工具栏
                    return editormd.toolbarModes['simple']; // full, simple, mini
                },
                imageUpload : true,
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "/uploadMarkdown",
                //这个配置是为了能够提交表单,使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中,方便post提交表单
                saveHTMLToTextarea : true
            });
        });

        /*下拉框渲染开启*/
        $('.menu.toggle').click(function () {
            $('.m-item').toggleClass('m-mobile-hide');
        });
        $('.ui.dropdown').dropdown({
            on : 'hover'
        });

        /*表单验证开启*/
        function publish() {
            $('.ui.form').form({
                inline: true,
                on: 'blur',
                fields: {
                    title: {
                        identifier: 'title',
                        rules: [{
                            type: 'empty',
                            prompt: '请注意文章标题不能为空'
                        }, {
                            type: 'maxLength[50]',
                            prompt: '请注意文章标题最大字数不能超过50'
                        }]
                    },
                    articleContent: {
                        identifier: 'articleContent',
                        rules: [{
                            type: 'empty',
                            prompt: '请注意文章内容不能为空'
                        }]
                    },
                    typeName: {
                        identifier: 'typeName',
                        rules: [{
                            type: 'empty',
                            prompt: '请选择一个文章方向'
                        }]
                    },
                    tagIds: {
                        identifier: 'tagIds',
                        rules: [{
                            type: 'minCount[1]',
                            prompt: '请至少选择一个文章标签'
                        }, {
                            type: 'maxCount[3]',
                            prompt: '请最多选择三个文章标签,你可以先删除多余标签,再重新选择'
                        }]
                    },
                    figures: {
                        identifier: 'figures',
                        rules: [{
                            type: 'regExp',
                            value: /^(https?|ftp|file):\/\/[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|].+(.GIF|.PNG|.DMP|.gif|.png|.bmp|.JPEG|.jpeg|.JPG|.jpg)$/,
                            prompt: '如需要添加首图,请输入正确的图片URL格式,如后缀为.png .jpg .bmp .jpeg .gif的图片网址'
                        }]
                    },
                    articleDigest: {
                        identifier: 'articleDigest',
                        rules: [{
                            type: 'empty',
                            prompt: '请注意文章摘要不能为空'
                        }, {
                            type: 'maxLength[150]',
                            prompt: '请注意文章摘要最大字数不能超过150'
                        }]
                    }
                },
                onSuccess: function () {
                    alert("发布成功,请等待审核通过");
                },
                /*onFailure: function() {
                    alert("发布失败,请确认发布内容");
                }*/
            });
        }
    </script>
</body>
</html>
