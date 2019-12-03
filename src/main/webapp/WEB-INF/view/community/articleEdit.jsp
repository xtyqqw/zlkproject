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
    <title>我的问题</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    <link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-select/1.9.1/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.4.5/css/bootstrapValidator.min.css" rel="stylesheet">
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
        <div class="header">
            <a id="a1" class="btn btn-default" type="button" href="<%=request.getContextPath() %>/community/article-guide"><&nbsp;&nbsp;返回</a>
            <a href="javascript:void(0)" id="a2">我的草稿</a>
        </div>
        <form action="<%=request.getContextPath() %>/community/article-add" method="post" class="form-group" id="addArticle">
            <div class="form-group input-group input-group-lg" style="width: 1215px; margin-left: 67px; margin-top: 20px; margin-bottom: 20px;">
                <input type="text" class="form-control" name="title" placeholder="简明扼要的描述你的标题">
            </div>
            <div id="test-editormd" class="form-group">
                <%--<textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" placeholder="开始撰写..."></textarea>
                <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
                <textarea class="editormd-html-textarea" name="articleContent"></textarea>--%>
                <textarea style="display: none;" name="articleContent" class="form-control"></textarea>
            </div>
            <div style="width: 1215px; margin-left: 67px; margin-top: 20px; margin-bottom: 20px;" class="form-group">
                <select class="selectpicker dropup form-control show-tick" data-dropup-auto="false" title="请选择方向" name="typeName">
                    <option value="java">java</option>
                    <option value="linux">linux</option>
                    <option value="html">html</option>
                    <option value="mysql">mysql</option>
                </select>
            </div>
            <div style="width: 1215px; margin-left: 67px; margin-top: 20px; margin-bottom: 20px;" class="form-group">
                <select id="selectTag" class="selectpicker dropup form-control" data-dropup-auto="false" data-size="7" multiple name="tagName" title="选择标签1/1" data-live-search="true" data-live-search-placeholder="可以搜索标签..." data-max-options="1">
                    <c:forEach items="${tagsList}" var="tags">
                        <option value="${tags.tagId}">${tags.tagName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group" style="width: 1215px; margin-left: 67px; margin-top: 20px; margin-bottom: 20px;">
                <input type="text" class="form-control" name="articleDigest" placeholder="请输入文章摘要">
            </div>
            <div class="form-group" style="margin-left: -1043px;">
                <label class="radio-inline">
                    <input type="radio" value="0" name="createArticleType">原创
                </label>
                <label class="radio-inline">
                    <input type="radio" value="1" name="createArticleType">转载
                </label>
                <label class="radio-inline">
                    <input type="radio" value="2" name="createArticleType">翻译
                </label>
            </div>
            <div class="form-group">
                <button type="submit" id="btn_edit" class="btn btn-info col-md-1 btn-group" style="margin-left: 1170px; margin-top: 40px; background-color: #1296db">发表文章</button>
            </div>
        </form>
    </div>

    <%--受js文件运行机制所致，引用时一定要注意顺序--%>
    <script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-select/1.9.1/js/bootstrap-select.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.4.5/js/bootstrapValidator.min.js"></script>
    <script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>

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
        //MarkDown组件
        var testEditor;
        $(function() {
            testEditor = editormd("test-editormd", {
                width : "90%",
                height : 640,
                placeholder : "开始编辑...",
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
                imageUploadURL : "/uploadfile"
                //这个配置是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单
                //saveHTMLToTextarea : true
            });
        });

        $('.selectpicker').selectpicker('refresh');

        $(function () {
            $('#addArticle').bootstrapValidator({
                excluded: [":disabled"],//关键配置，表示只对于禁用域不进行验证，其他的表单元素都要验证
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
                                max: 30,
                                message: '标题长度必须在30位以内'
                            }
                        }
                    },
                    /*articleContent: {
                        validators: {
                            notEmpty: {
                                message: '文章内容不能为空'
                            }
                        }
                    },*/
                    articleDigest: {
                        validators: {
                            notEmpty: {
                                message: '文章摘要不能为空'
                            },
                            stringLength: {
                                min: 0,
                                max: 100,
                                message: '摘要长度必须在100位以内'
                            }
                        }
                    },
                    createArticleType: {
                        validators: {
                            notEmpty: {
                                message: '请选择发文类型'
                            }
                        },
                        feedbackIcons: false
                    },
                    tagName: {
                        validators: {
                            notEmpty: {
                                message: '请至少选择一个文章标签'
                            }
                        },
                        feedbackIcons: false
                    },
                    typeName: {
                        validators: {
                            notEmpty: {
                                message: '请至少选择一个文章方向'
                            }
                        },
                        feedbackIcons: false
                    }
                },
                /*submitHandler: function (validator, form, submitButton) {
                    alert("发表成功");
                }*/
            });
        });

        /*$(function(){
             //参数设置，若用默认值可以省略以下面代
            toastr.options = {
                "closeButton": false, //是否显示关闭按钮
                "debug": false, //是否使用debug模式
                "positionClass": "toast-top-full-width",//弹出窗的位置
                "showDuration": "300",//显示的动画时间
                "hideDuration": "1000",//消失的动画时间
                "timeOut": "5000", //展现时间
                "extendedTimeOut": "1000",//加长展示时间
                "showEasing": "swing",//显示时的动画缓冲方式
                "hideEasing": "linear",//消失时的动画缓冲方式
                "showMethod": "fadeIn",//显示时的动画方式
                "hideMethod": "fadeOut" //消失时的动画方式
            };
            //成功提示绑定
            $("#btn_edit").click(function(){
                toastr.success("文章发表成功");
            });
        });*/
    </script>
</body>
</html>
