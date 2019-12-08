<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/11/22
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css">
    <script src="<%=request.getContextPath() %>/layui/layui.js"></script>
    <style>
        .show {
            width: 875px;
            height: 30px;
            padding-top: 6px;
            margin-top: 10px;
            border-radius: 5px;
            margin-left: 10px;
            background-color: whitesmoke;
        }
        .show li {
            float: left;
            padding-left: 12px;
            display: inline-block;
            line-height: 15px;
            word-break: break-all;
            word-wrap: break-word;
        }
        .show a{
            float: left;
            padding: 5px;
            display: inline;
            line-height: 15px;
            word-break: break-all;
            word-wrap: break-word;
            background-color: #e7e7e7;
            color: black;
            font-size: 15px;
            border-radius: 4px;
            border: none;
            transition-duration: 0.4s;
        }
        .hide a:hover{
            background-color: #AFEEEE;
            color: #0a61ff;
        }
        .hide {
            padding-top: 6px;
            margin-top: 10px;
            margin-left: 10px;
            display: none;
            width: 875px;
            height: 60px;
            background-color: whitesmoke;
            border-radius: 5px;
            box-shadow: 0 1px 2px 0 rgba(0,0,0,0.2), 0 0 7px 0 rgba(0,0,0,0.19);
        }
        .hide li{
            float: left;
            padding-left: 12px;
        }
        .hide a{
            float: left;
            padding: 5px;
            display: inline;
            line-height: 15px;
            word-break: break-all;
            word-wrap: break-word;
            background-color: #e7e7e7;
            color: black;
            font-size: 15px;
            border-radius: 4px;
            border: none;
            transition-duration: 0.4s;
        }
    </style>
</head>
<body>
    <div class="main">
        <div class="show">
            <c:forEach items="${tagList}" var="tag" begin="0" end="10">
                <div>
                    <ul>
                        <li><a href="<%=request.getContextPath() %>/" type="button" class="">${tag.tagName}</a></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
        <div class="hide">
            <c:forEach items="${tagList}" var="tag">
                <div>
                    <ul>
                        <li><a href="javascript:void(0)" type="button" onclick="dj(this);">${tag.tagName}</a></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
    </div>
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script type="text/javascript">
        /*$(function () {
            var collection=$('.hide a');
            $.each(collection, function () {
                $(this).addClass('start');
            });
        });
        function dj(dom) {
            var collection=$('.hide a');
            $.each(collection, function () {
                $(this).removeClass('end');
                $(this).addClass('start');
            });
            $(dom).removeClass('start');
            $(dom).addClass('end');
        }*/
        $(document).on('mouseenter','.show',function () {
            $('.hide').css('display','block');
            $(this).css('display','none');
        });
        $(document).on('mouseleave','.hide',function () {
           $('.show').css('display','block');
           $(this).css('display','none');
        });
        $(function() {
            /*$("#a").click(function() {
                if($(this).nextAll().is('.hide li')) {
                    $(".hide").append($(this));
                }
                else {
                    $(".hide").prepend($(this));
                }
            });*/
            $(".hide li").click(function() {
                if($(this).nextAll().is('#a')) {
                    $(".hide").append($(this));
                }
                else {
                    $(".hide").prepend($(this));
                }
            });
        });
    </script>
</body>
</html>
