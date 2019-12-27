<%--
  Created by IntelliJ IDEA.
  User: gby
  Date: 2019/12/16
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css"/>
    <link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/semantic-ui/2.2.4/semantic.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/Semantic-UI-Calendar/calendar.css"/>
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
            margin-left: 24px;
            margin-top: 9px;
        }

        .header #a2 {
            text-decoration: none !important;
            color: #8D8D8D;
            font-size: 25px;
            float: right;
            margin-top: 9px;
            margin-right: 67px;
        }
    </style>
</head>
<body>
<div class="m-container m-padded-tb-big">
    <div class="ui container">
        <form action="<%=request.getContextPath() %>/question/update" method="post" class="ui form">
            <input type="text" name="questionId" hidden="hidden" value="${questions.questionId}">
            <div class="required field">
                <div class="ui left labeled input">
                    <div class="ui selection compact basic dropdown teal label">
                        <input type="hidden" value="${questions.solve}" name="solve">
                        <i class="dropdown icon"></i>
                        <div class="text">待解决</div>
                        <div class="menu">
                            <div class="item" data-value="待解决">待解决</div>
                            <div class="item" data-value="已解决">已解决</div>
                        </div>
                    </div>
                    <input type="text" name="title" placeholder="简明扼要的描述你的标题" value="${questions.questionTitle}">
                </div>
            </div>
            <div class="required field">
                <div class="ui left labeled input">
                    <label class="ui basic teal label">问题摘要</label>
                    <input type="text" name="questionSynopsis" placeholder="请输入一些问题摘要,这样能方便他人快捷的了解你的问题,注意字数不要过多"
                           value="${questions.questionSynopsis}">
                </div>
            </div>
            <div class="required field">
                <div id="md-content" style="z-index: 1 !important;">
                    <textarea class="editormd-markdown-textarea" name="questionContent"
                              style="display: none">${questions.questionContent}</textarea>
                    <!--第二个隐藏文本域,用来构造生成的HTML代码,方便表单POST提交,这里的name可以任意取,后台接受时以这个name键为准-->
                    <textarea class="editormd-html-textarea" name="questionContentHtml"
                              style="display: none">${questions.questionContentHtml}</textarea>
                </div>
            </div>
            <div class="two fields">
                <div class="required field">
                    <div class="ui left labeled action input">
                        <label class="ui compact basic teal label">审核状态</label>
                        <div class="ui fluid selection dropdown">
                            <input type="hidden" name="audit" value="${questions.audit}">
                            <i class="dropdown icon"></i>
                            <div class="default text">请选择审核状态</div>
                            <div class="menu">
                                <div class="item" data-value="正在审核">正在审核</div>
                                <div class="item" data-value="审核通过">审核通过</div>
                                <div class="item" data-value="审核未过">审核未过</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="required field">
                    <div class="ui left labeled action input">
                        <label class="ui compact basic teal label">问题置顶</label>
                        <div class="ui fluid selection dropdown">
                            <input type="hidden" name="questionSetTop" value="${questions.questionSetTop}">
                            <i class="dropdown icon"></i>
                            <div class="default text">请选择问题是否置顶</div>
                            <div class="menu">
                                <div class="item" data-value="置顶">置顶</div>
                                <div class="item" data-value="不置顶">不置顶</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="two fields">
                <div class="required field">
                    <div class="ui left labeled action input">
                        <label class="ui compact basic teal label">问题类别</label>
                        <div class="ui fluid selection dropdown">
                            <input type="hidden" name="typeName" value="${questions.typeName}">
                            <i class="dropdown icon"></i>
                            <div class="default text">请选择问题类别</div>
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
                        <label class="ui compact teal basic label">问题标签</label>
                        <div class="ui fluid selection multiple search dropdown">
                            <input type="hidden" name="tagName" value="${questions.tagName}">
                            <i class="dropdown icon"></i>
                            <div class="default text">请选择标签</div>
                            <div class="menu">
                                <c:forEach items="${tagList}" var="tag">
                                    <div class="item">${tag.tagName}</div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="two fields">
                <div class="required field">
                    <div class="ui left labeled input">
                        <label class="ui basic teal label">发布时间</label>
                        <input type="text" name="createTime" value="${questions.createTime}" id="createTime"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="required field">
                    <div class="ui left labeled input">
                        <label class="ui basic teal label">更新时间</label>
                        <input type="text" name="updateTime" value="${questions.updateTime}" id="updateTime"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="ui right aligned container">
                <button type="submit" onclick="publish()" class="ui button teal">提交</button>
            </div>
        </form>
    </div>
</div>

</body>
<%--受js文件运行机制所致，引用时一定要注意顺序--%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
<script src="<%=request.getContextPath() %>/Semantic-UI-Calendar/calendar.js"></script>
<script src="<%=request.getContextPath() %>/editormd/editormd.js"></script>
<script src="<%=request.getContextPath() %>/layui/layui.js"></script>
<script type="text/javascript">
    //日期js
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#createTime'
            //类型
            , type: 'datetime'
            //  设置选择日期不能超过当前日期
            , max: getNowFormatDate()
        });
    });
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#updateTime'
            //类型
            , type: 'datetime'
            //  设置选择日期不能超过当前日期
            , max: getNowFormatDate()
        });
    });

    //  设置选择日期不能超过当前日期
    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month
            + seperator1 + strDate + " " + date.getHours() + seperator2
            + date.getMinutes() + seperator2 + date.getSeconds();
        return currentdate;
    }


    //转换日期格式
    var date = $("#createTime").val();

    function formatDate(date) {
        date = new Date(date);
        //获取年月日,时分秒的值
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        var d = date.getDate();
        var H = date.getHours();
        var m1 = date.getMinutes();
        var s = date.getSeconds();
        m = m < 10 ? ("0" + m) : m;
        d = d < 10 ? ("0" + d) : d;
        H = H < 10 ? ("0" + H) : H;
        m1 = m1 < 10 ? ("0" + m1) : m1;
        s = s < 10 ? ("0" + s) : s;
        return y + "-" + m + "-" + d + "  " + H + ":" + m1 + ":" + s;
    }

    date = formatDate(date);
    $("#createTime").val(date);

    //转换日期格式
    var date = $("#updateTime").val();

    function formatDate(date) {
        date = new Date(date);
        //获取年月日,时分秒的值
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        var d = date.getDate();
        var H = date.getHours();
        var m1 = date.getMinutes();
        var s = date.getSeconds();
        m = m < 10 ? ("0" + m) : m;
        d = d < 10 ? ("0" + d) : d;
        H = H < 10 ? ("0" + H) : H;
        m1 = m1 < 10 ? ("0" + m1) : m1;
        s = s < 10 ? ("0" + s) : s;
        return y + "-" + m + "-" + d + "  " + H + ":" + m1 + ":" + s;
    }

    date = formatDate(date);
    $("#updateTime").val(date);
    /*MarkDown组件*/
    var testEditor;
    $(function () {
        testEditor = editormd("md-content", {
            width: "100%",
            height: 640,
            placeholder: "例:详细描述你所遇到的问题细节\n    通过图片、代码或链接完善内容\n    尝试哪些方法仍没有解决\n    你期待一个什么样的结果",
            syncScrolling: "single",
            //你的lib目录的路径
            path: "<%=request.getContextPath() %>/editormd/lib/",
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

    layui.use(["jquery", "upload", "layer", "element"], function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            upload = layui.upload;
        //拖拽上传
        var uploadInst = upload.render({
            elem: '#figuresBtn',
            url: '<%=request.getContextPath() %>/uploadFigures',
            size: 1024,
            before: function (obj) {
                //预读本地文件,回显用
                obj.preview(function (index, file, result) {
                    //图片链接
                    $('#figuresURL').attr('src', result);
                });
            },
            done: function (res) {
                //服务器上传成功
                layer.msg(res.message, {icon: 1});
                //获取图片路径URL
                $("#figures").val(res.url)
            }
        });
        element.init();
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
                        prompt: '请注意问题标题不能为空'
                    }, {
                        type: 'maxLength[50]',
                        prompt: '请注意问题标题最大字数不能超过50'
                    }]
                },
                questionContent: {
                    identifier: 'questionContent',
                    rules: [{
                        type: 'empty',
                        prompt: '请注意问题内容不能为空'
                    }]
                },
                typeName: {
                    identifier: 'typeName',
                    rules: [{
                        type: 'empty',
                        prompt: '请选择一个问题类别'
                    }]
                },
                tagIds: {
                    identifier: 'tagName',
                    rules: [{
                        type: 'minCount[1]',
                        prompt: '请至少选择一个问题标签'
                    }, {
                        type: 'maxCount[3]',
                        prompt: '请最多选择三个问题标签,你可以先删除多余标签,再重新选择'
                    }]
                },
            },

        });
    }
</script>
</html>