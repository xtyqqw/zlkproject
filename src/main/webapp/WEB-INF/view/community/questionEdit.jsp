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
    <title>提问编辑页面</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css"/>
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon"/>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .top {
            height: auto;
            width: 100%;
            left: 0px;
            top: 0px; /*离顶部的距离为0*/
        }

        .header {
            width: 100%;
            height: 60px;
            background-color: #FCFCFC;
            left: 0px;
            top: 0px;
            border-bottom: 1px solid #F5F5F5;
            /*border-style: solid;
            border-top-style: none;
            border-left-style: none;
            border-right-style: none;*/
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

        .tab1 {
            width: 1295px;
            font-size: 16px;
            padding: 1px;
            border-top: 1px solid #CFCFCF;
            border-bottom: 1px solid #CFCFCF;
            border-left: 1px solid #CFCFCF;
            border-right: 1px solid #CFCFCF;
        }

        .menu {
            list-style: none;
        }

        .menu li {
            text-align: center;
            float: left;
            margin-right: 1px;
            width: 50px;
            cursor: pointer
        }

        #menu li.tabFocus {
            width: 50px;
            font-weight: bold;
            border-bottom: 0;
            z-index: 100;
            position: relative
        }

        #content {
            width: 1300px;
            height: 90px;
            padding: 0px;
            clear: left;
            position: relative;
            top: -23px;
            margin-left: -15px;
        }

        #content li {
            display: none
        }

        #content li.c {
            display: block;
            float: left;
        }

        .cl {
            background-color: #F5F5F5;
            width: 50px;
            height: 20px;
            line-height: 10px;
            text-align: center;
            border: 1px solid #eee;
            margin: 10px;
            font-size: 12px;
            cursor: pointer;
        }

        .p1 {
            color: #8D8D8D
        }
    </style>
</head>
<body>
<div class="top">
    <div class="header">
        <div style="margin-top: 20px;margin-left: -1220px">
            <a class="btn btn-default" href="<%=request.getContextPath() %>/question/hint" role="button">
                <_moz_generated_content_before></_moz_generated_content_before> &lsaquo;&nbsp;&nbsp;返回</a>
        </div>
        <div style="margin-top: -35px;">
            <h4 style="color: #778899">问题编辑</h4>
        </div>

        <%-- <a href="javascript:void(0)">我的草稿</a>--%>
    </div>
    <form action="<%=request.getContextPath() %>/question/addQuestion" method="post">
        <div>
            <input type="text" style="color: #8D8D8D;font-size:30px;border:none;width: 1290px;height:70px;" name="title"
                   placeholder="简明扼要的描述你的标题" option="none" oninput="if(value.length>3)value=value.slice(0,50)"  >
        </div>
        <div id="test-editormd">
            <textarea style="display:none;" name="articleContent"></textarea>
        </div>
        <div  class="input-box" style="width: 1295px; margin-left: 110px; margin-top: 30px; margin-bottom: 20px;">
            <p>
                <input id="i" type="text" style="font-size: 12px" class="form-control" name="title" required
                       placeholder="选择标签" >
            </p>
        </div>
                <div class="tab1" align="center" id="aaa">
                    <ul id="menu" class="menu">
                        <li class="tabFocus"><p class="p1">1111</p></li>
                        <li><p class="p1">2222</p></li>
                        <li><p class="p1">3333</p></li>
                        <li><p class="p1">4444</p></li>
                        <li><p class="p1">5555</p></li>
                        <li><p class="p1">6666</p></li>
                        <li><p class="p1">7777</p></li>
                     </ul>
            <ul id="content" class="menu">
                <li class="c">
                    <div class="cl">家具</div>
                    <div class="cl">汉语</div>
                    <div class="cl">汉语</div>
                </li>
                <li class="c">
                    <div class="cl">内容</div>
                    <div class="cl">汉语</div>
                </li>
                <li class="c">
                    <div class="cl">二手3</div>
                    <div class="cl">汉语</div>
                </li>
                <li class="c">
                    <div class="cl">电器</div>
                    <div class="cl">电器</div>
                    <div class="cl">电器</div>
                    <div class="cl">汉语</div>
                    <div class="cl">汉语</div>
                </li>

            </ul>
        </div>

<button type="submit" class="btn btn-info col-md-1"
        style="margin-left: 1280px; margin-top: 15px; background-color: #1296db">发布问题
</button>
</form>
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
    var testEditor;
    $(function () {
        testEditor = editormd("test-editormd", {
           /*      theme: "dark",
                 previewTheme: "dark",
                 editorTheme: "pastel-on-dark",*/
                 //markdown : md,
                 codeFold: true,
                 saveHTMLToTextarea: true,    // 保存 HTML 到 Textarea
                 searchReplace: true,
                 //watch : false,                // 关闭实时预览
                 htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
                 //toolbar  : false,             //关闭工具栏
                 //previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
                 emoji: true,
                 taskList: true,
                 tocm: true,
                  tex: true,
                 flowChart: true,
                 sequenceDiagram: true,
            placeholder : " 例:详细描述你所遇到的问题细节\n    通过图片、代码或链接完善内容\n    尝试哪些方法仍没有解决\n    你期待一个什么样的结果",
            dialogMaskBgColor    : "#fff",
            gotoLine: true,
            width: "85%",
            height: 520,
            syncScrolling: "single",
            path: "../editormd/lib/",
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "/imageUpload"
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $("#menu li").each(function (index) { //带参数遍历各个选项卡
            $(this).click(function () { //注册每个选卡的单击事件
                $("#menu li.tabFocus").removeClass("tabFocus"); //移除已选中的样式
                $(this).addClass("tabFocus"); //增加当前选中项的样式
                //显示选项卡对应的内容并隐藏未被选中的内容
                $("#content li:eq(" + index + ")").show()
                    .siblings().hide();
            });
        });
    })
</script>
<script type="text/javascript">
   var isBox=false;

   $(".tab1").hide();
   $(".form-control").focus(function () {
       $(this).click(".tab1").show();
       isBox=true;
   })


</script>

</body>
</html>
