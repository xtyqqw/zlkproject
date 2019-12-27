    <%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/16
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css" />
    <link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/semantic-ui/2.2.4/semantic.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css" />
</head>
<body>
<div>
    <div  class="m-container m-padded-tb-big">
        <div class="ui container">
            <form action="<%=request.getContextPath() %>/article/update" method="post" class="ui form">
                <input type="text" name="articleId" hidden="hidden" value="${articles.articleId}">
                <div class="required field">
                    <div class="ui left labeled input">
                        <div class="ui selection compact basic dropdown violet label">
                            <input type="hidden" value="${articles.createArticleType}" name="createArticleType">
                            <i class="dropdown icon"></i>
                            <div class="text">原创</div>
                            <div class="menu">
                                <div class="item" data-value="0">原创</div>
                                <div class="item" data-value="1">转载</div>
                                <div class="item" data-value="2">翻译</div>
                            </div>
                        </div>
                        <input type="text" name="title" placeholder="简明扼要的描述你的标题" value="${articles.title}">
                    </div>
                </div>

                <div class="required field">
                    <div class="ui left labeled input">
                        <label class="ui basic violet label">摘要</label>
                        <input type="text" name="articleDigest" placeholder="请输入一些文章摘要,这样能方便其他同学快捷的了解你的文章,注意字数不要过多" value="${articles.articleDigest}">
                    </div>
                </div>

                <div class="required field">
                    <div id="md-content" style="z-index: 1 !important;">
                        <textarea class="editormd-markdown-textarea" name="articleContent" style="display: none">${articles.articleContent}</textarea>
                        <!--第二个隐藏文本域,用来构造生成的HTML代码,方便表单POST提交,这里的name可以任意取,后台接受时以这个name键为准-->
                        <textarea class="editormd-html-textarea" name="articleContentHtml" style="display: none">${articles.articleContentHtml}</textarea>
                    </div>
                </div>

                <div class="two fields">
                    <div class="required field">
                        <div class="ui left labeled input">
                            <label class="ui basic violet label">浏览数</label>
                            <input type="text" name="browseCount" placeholder="请输入浏览数" value="${articles.browseCount}">
                        </div>
                    </div>
                    <div class="required field">
                        <div class="ui left labeled input">
                            <label class="ui basic violet label">发布时间</label>
                            <input type="text" name="createTime" value="${articles.createTime}" id="createTime" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="two fields">
                    <div class="required field">
                        <div class="ui left labeled input">
                            <label class="ui basic violet label">评论数</label>
                            <input type="text" name="commentCount" placeholder="请输入评论数" value="${articles.commentCount}">
                        </div>
                    </div>
                    <div class="required field">
                        <div class="ui left labeled input">
                            <label class="ui basic violet label">更新时间</label>
                            <input type="text" name="updateTime" value="${articles.updateTime}" id="updateTime" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="two fields">
                    <div class="required field">
                        <div class="ui left labeled input">
                            <label class="ui basic violet label">赞数</label>
                            <input type="text" name="zanCount" placeholder="请输入赞数" value="${articles.zanCount}">
                        </div>
                    </div>
                    <div class="required field">
                        <div class="ui left labeled action input">
                            <label class="ui compact basic violet label">文章方向</label>
                            <div class="ui fluid selection dropdown">
                                <input type="hidden" name="typeName" value="${articles.typeName}">
                                <i class="dropdown icon"></i>
                                <div class="default text">请选择文章方向</div>
                                <div class="menu">
                                    <div class="item" data-value="java">JAVA</div>
                                    <div class="item" data-value="linux">Linux</div>
                                    <div class="item" data-value="html">HTML</div>
                                    <div class="item" data-value="mysql">MYSQL</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="two fields">
                    <div class="required field">
                        <div class="ui left labeled input">
                            <label class="ui basic violet label">踩数</label>
                            <input type="text" name="caiCount" placeholder="请输入踩数" value="${articles.caiCount}">
                        </div>
                    </div>
                    <div class="required field">
                        <div class="ui left labeled action input">
                            <label class="ui compact basic violet label">文章置顶</label>
                            <div class="ui fluid selection dropdown">
                                <input type="hidden" name="articleSetTop" value="${articles.articleSetTop}">
                                <i class="dropdown icon"></i>
                                <div class="default text">请选择文章是否置顶</div>
                                <div class="menu">
                                    <div class="item" data-value="0">置顶</div>
                                    <div class="item" data-value="1">不置顶</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="two fields">
                    <div class="required field">
                        <div class="ui left labeled action input">
                            <label class="ui compact basic violet label">举报</label>
                            <div class="ui fluid selection dropdown">
                                <input type="hidden" name="inform" value="${articles.inform}">
                                <i class="dropdown icon"></i>
                                <div class="default text">请选择是否举报</div>
                                <div class="menu">
                                    <div class="item" data-value="0">举报</div>
                                    <div class="item" data-value="1">不举报</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="required field">
                        <div class="ui left labeled action input">
                            <label class="ui compact basic violet label">审核状态</label>
                            <div class="ui fluid selection dropdown">
                                <input type="hidden" name="approval" value="${articles.approval}">
                                <i class="dropdown icon"></i>
                                <div class="default text">请选择审核状态</div>
                                <div class="menu">
                                    <div class="item" data-value="0">审核中</div>
                                    <div class="item" data-value="1">已审核</div>
                                    <div class="item" data-value="2">审核未通过</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--<div class="required field">
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
                </div>--%>

                <div class="two fields">
                    <div class="field">
                        <div class="ui left labeled input">
                            <label class="ui basic violet label">首图</label>
                            <div class="ui animated fade violet button" id="figuresBtn" style="width: 100%;z-index: auto;">
                                <div class="visible content">上传图片</div>
                                <div class="hidden content">
                                    可以是相关的代码截图或是引人注目的封面
                                </div>
                            </div>
                            <input type="hidden" name="figures" id="figures" value="${articles.figures}">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left labeled input" style="width: 100%;height: 215px;">
                            <label class="ui basic violet label" style="height: 3vw;">示例</label>
                            <img class="ui medium rounded image" name="figures" src="${articles.figures}" id="figuresURL" style="width: 90%;">
                        </div>
                    </div>
                </div>

                <div class="ui right aligned container">
                    <button type="submit" onclick="publish()" class="ui button violet">提交</button>
                </div>

            </form>
        </div>
    </div>
</div>
</body>
<%--受js文件运行机制所致，引用时一定要注意顺序--%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
<script src="<%=request.getContextPath() %>/editormd/editormd.js"></script>
<script src="<%=request.getContextPath() %>/layui/layui.js"></script>
<script type="text/javascript">
    //日期js
    layui.use('laydate',function(){
        var laydate=layui.laydate;
        laydate.render({
            elem: '#createTime'
            //类型
            ,type:'datetime'
            //  设置选择日期不能超过当前日期
            ,max : getNowFormatDate()
        });
    });
    layui.use('laydate',function(){
        var laydate=layui.laydate;
        laydate.render({
            elem: '#updateTime'
            //类型
            ,type:'datetime'
            //  设置选择日期不能超过当前日期
            ,max : getNowFormatDate()
            ,value: new Date()
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
    function formatDate(date){
        date = new Date(date);
        //获取年月日,时分秒的值
        var y=date.getFullYear();
        var m=date.getMonth()+1;
        var d=date.getDate();
        var H=date.getHours();
        var m1=date.getMinutes();
        var s=date.getSeconds();
        m = m<10?("0"+m):m;
        d = d<10?("0"+d):d;
        H = H<10?("0"+H):H;
        m1 = m1<10?("0"+m1):m1;
        s = s<10?("0"+s):s;
        return y+"-"+m+"-"+d+"  "+H+":"+m1+":"+s;
    }
    date = formatDate(date);
    $("#createTime").val(date);

    //转换日期格式
    var date = $("#updateTime").val();
    function formatDate(date){
        date = new Date(date);
        //获取年月日,时分秒的值
        var y=date.getFullYear();
        var m=date.getMonth()+1;
        var d=date.getDate();
        var H=date.getHours();
        var m1=date.getMinutes();
        var s=date.getSeconds();
        m = m<10?("0"+m):m;
        d = d<10?("0"+d):d;
        H = H<10?("0"+H):H;
        m1 = m1<10?("0"+m1):m1;
        s = s<10?("0"+s):s;
        return y+"-"+m+"-"+d+"  "+H+":"+m1+":"+s;
    }
    date = formatDate(date);
    $("#updateTime").val(date);

    /*$('#example1').calendar({
        ampm: false,
        type: 'datatime'
    });
    $('#example2').calendar({
        ampm: false,
        type: 'datatime'
    });*/

    /*$('.example1').calendar({
        type: 'datetime',//datatime年月日时分  data就是年月日
        ampm: false,//默认会有 上午，下午，或者AM PM，false就会没有默认的PM AM上午下午；文档写的是中文要在text里设置，但是我写的时候本地好好的是英文，但是一上线就成了中文，如 9:00 上午，所以该处设置成了false
        endCalendar: $('.example2'),//开始时间选好后，会调起结束时间，而且结束时间不会大于开始时间
        formatter: { // 自定义日期的格式
            date: function(date, settings) {
                if (!date) return '';
                var year  = date.getFullYear();
                var month = date.getMonth() + 1;
                var day   = date.getDate();
                month = month < 10 ? '0'+month : month;
                day   = day   < 10 ? '0'+day : day;
                return year + '-' + month + '-' + day;//不写时分hours minute也会返回
            }
        }
    });

    $('.example2').calendar({
        type: 'datetime',//datatime年月日时分  data就是年月日
        ampm: false,//默认会有 上午，下午，或者AM PM，false就会没有默认的PM AM上午下午；文档写的是中文要在text里设置，但是我写的时候本地好好的是英文，但是一上线就成了中文，如 9:00 上午，所以该处设置成了false
        startCalendar: $('.example1'),//开始时间选好后，会调起结束时间，而且结束时间不会大于开始时间
        formatter: { // 自定义日期的格式
            date: function(date, settings) {
                if (!date) return '';
                var year  = date.getFullYear();
                var month = date.getMonth() + 1;
                var day   = date.getDate();
                month = month < 10 ? '0'+month : month;
                day   = day   < 10 ? '0'+day : day;
                return year + '-' + month + '-' + day;//不写时分hours minute也会返回
            }
        }
    });*/

    /*MarkDown组件*/
    var testEditor;
    $(function() {
        testEditor = editormd("md-content", {
            width : "100%",
            height : 640,
            placeholder : "开始撰写...",
            syncScrolling : "single",
            //你的lib目录的路径
            path : "<%=request.getContextPath() %>/editormd/lib/",
            emoji: false,
            toolbarIcons: function () {  //自定义工具栏
                return editormd.toolbarModes['simple']; // full, simple, mini
            },
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/article/uploadManager",
            //这个配置是为了能够提交表单,使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中,方便post提交表单
            saveHTMLToTextarea : true
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
            url: '<%=request.getContextPath() %>/article/managerFigures',
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
                layer.msg(res.message,{icon: 1});
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
            /*onSuccess: function () {
                alert("编辑成功");
            },
            onFailure: function() {
                alert("发布失败,请确认发布内容");
            }*/
        });
    }


</script>

</html>