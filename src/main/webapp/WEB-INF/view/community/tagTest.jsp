<%--
  Created by IntelliJ IDEA.
  User: gby
  Date: 2019/11/18
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>tag测试</title>
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <script src="/layui/layui.js"></script>
    <style type="text/css">
        .comment_cen_div {
            width: 1300px;
            height: 150px;
            border: 1px solid #ccc;
            margin-left: 100px;
            margin-top: -193px;
        }

        .input {
            height: 30px;
            width: 1250px;
            font-size: 12px;
            margin-left: 8px;
            margin-top: 5px;
            border: none;
        }

        .one {
            cursor: pointer;
            width: 1300px;
            margin-top: 233px;
            margin-left: 100px;
            height: 40px;
            border: 1px solid #ccc;
        }

        .la {
            text-align: center;
            float: left;
            height: 18px;
            width: auto;
            padding: 5px;
            background-color: #eee;
            border-radius: 4px;
            margin: 8px;
        }

        .li {
            margin-top: -5px;

        }
    </style>

    <script type="text/javascript">
        $(function () {
            $("#click").hide();
            $("#click").dialog('close')
        });

        function btn() {
            var show = document.getElementById("click");
            if (show.style.display == '') {
                show.style.display = 'none';
            } else {
                show.style.display = '';
            }
        }

        $("#click").click(function (event) {
            event.stopPropagation();
        });
    </script>
</head>
<body>
<div class="one" id="btn" onclick="btn()">
    <input type="text" class="input" id="input" minlength="2" maxlength="50" placeholder="选择标签">

</div>

<div id="click" class="comment_cen_div">
    <div class="layui-tab" style="margin: 0px;">
        <ul class="layui-tab-title">
                <li class="layui-this" style="margin-top: 0px;">java</li>
                <li  style="margin-top: 0px;">mysql</li>
                <li  style="margin-top: 0px;">s ss</li>
                <li  style="margin-top: 0px;">qqqq</li>
        </ul>

        <div class="layui-tab-content">

            <div class="layui-tab-item layui-show">
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
            </div>
            <div class="layui-tab-item">
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
            </div>
            <div class="layui-tab-item ">
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
            </div>
            <div class="layui-tab-item">
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>

                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
                <a href="javascript:;" class="li">
                    <li class="la">java</li>
                </a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;

        //…
    });
</script>
</body>
</html>