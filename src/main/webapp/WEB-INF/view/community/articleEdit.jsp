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
    <link href="https://cdn.bootcss.com/semantic-ui/2.2.4/semantic.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.min.css" />
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
            <a href="javascript:void(0)" id="a2">我的草稿</a>
        </div>
        <!--中间内容-->
        <div  class="m-container m-padded-tb-big">
            <div class="ui container">
                <form action="<%=request.getContextPath() %>/articles" method="post" class="ui form" id="add">
                    <%--<input type="hidden" name="approval">
                    <input type="hidden" name="articleSetTop">--%>
                    <div class="required field">
                        <div class="ui left labeled input">
                            <div class="ui selection compact teal basic dropdown label">
                                <input type="hidden" value="原创" name="createArticleType">
                                <i class="dropdown icon"></i>
                                <div class="text">原创</div>
                                <div class="menu">
                                    <div class="item" data-value="原创">原创</div>
                                    <div class="item" data-value="转载">转载</div>
                                    <div class="item" data-value="翻译">翻译</div>
                                </div>
                            </div>
                            <input type="text" name="title" placeholder="简明扼要的描述你的标题">
                        </div>
                    </div>

                    <div class="required field">
                        <div id="md-content" style="z-index: 1 !important;">
                            <textarea placeholder="开始编辑..." name="articleContent" style="display: none"></textarea>
                        </div>
                    </div>

                    <div class="two fields">
                        <div class="required field">
                            <div class="ui left labeled action input">
                                <label class="ui compact teal basic label">方向</label>
                                <div class="ui fluid selection dropdown">
                                    <input type="hidden" name="typeName">
                                    <i class="dropdown icon"></i>
                                    <div class="default text">请选择方向</div>
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

                    <div class="required field">
                        <div class="ui left labeled input">
                            <label class="ui teal basic label">摘要</label>
                            <input type="text" name="articleDigest" placeholder="请输入文章摘要">
                        </div>
                    </div>

                    <div class="required field">
                        <div class="ui left labeled input">
                            <label class="ui teal basic label">首图</label>
                            <input type="text" name="figures" placeholder="首图引用地址">
                        </div>
                    </div>

                    <%--<div class="ui error message"></div>--%>

                    <div class="ui right aligned container">
                        <button <%--id="save-btn"--%> type="reset" class="ui reset secondary button">重置</button>
                        <button type="submit" id="publish-btn" class="ui teal button" onclick="add()">发布</button>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <%--受js文件运行机制所致，引用时一定要注意顺序--%>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
    <script src="<%=request.getContextPath() %>/editormd/editormd.min.js"></script>
    <script type="text/javascript">
        /*MarkDown组件*/
        var testEditor;
        $(function() {
            testEditor = editormd("md-content", {
                width : "100%",
                height : 640,
                placeholder : "开始编辑...",
                syncScrolling : "single",
                //你的lib目录的路径
                path : "../editormd/lib/",
                imageUpload : true,
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "/uploadfile"
                //这个配置是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单
                //saveHTMLToTextarea : true
            });
        });

        /*下拉框渲染开启*/
        $('.menu.toggle').click(function () {
            $('.m-item').toggleClass('m-mobile-hide');
        });
        $('.ui.dropdown').dropdown({
            on : 'hover'
        });

        function add() {
            $.ajax({
                type: 'POST',
                url: '/articles',
                data: $('#add'),
                success: function (res) {
                    if(res.data()) {
                        alert("发布成功");
                    }
                },
                error: function () {
                    alert("发布失败");
                }
            })
        }

        /*初始化审核，置顶状态*/
        /*$('#publish-btn').click(function () {
            $('[name="approval"]').val(0);
            $('[name="articleSetTop"]').val(1);
            $('#blog-form').submit();
        });*/

        /*表单验证开启*/
        $('.ui.form').form({
            inline: true,
            on: 'blur',
            fields : {
                title : {
                    identifier: 'title',
                    rules: [{
                        type : 'empty',
                        prompt: '请注意文章标题不能为空'
                    },{
                        type : 'maxLength[50]',
                        prompt: '请注意文章标题最大长度不能超过50'
                    }]
                },
                articleContent : {
                    identifier: 'articleContent',
                    rules: [{
                        type : 'empty',
                        prompt: '请注意文章内容不能为空'
                    }]
                },
                typeName : {
                    identifier: 'typeName',
                    rules: [{
                        type : 'empty',
                        prompt: '请选择一个文章方向'
                    }]
                },
                tagIds : {
                    identifier: 'tagIds',
                    rules: [{
                        type : 'empty',
                        prompt: '请至少选择一个文章标签'
                    }]
                },
                figures : {
                    identifier: 'figures',
                    rules: [{
                        type : 'empty',
                        prompt: '请注意文章首图地址不能为空'
                    },{
                        type : 'url',
                        prompt: '请输入正确的URL格式'
                    }]
                },
                articleDigest : {
                    identifier: 'articleDigest',
                    rules: [{
                        type : 'empty',
                        prompt: '请注意文章摘要不能为空'
                    },{
                        type : 'maxLength[150]',
                        prompt: '请注意文章摘要最大长度不能超过150'
                    }]
                }
            }
        });
    </script>
</body>
</html>
