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
            border: #8D8D8D 2px solid;
            width: 750px;
            height: 25px;
            padding: 12px;
            margin: 20px;
            border-radius: 5px;
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
            margin: 20px;
            display: none;
            border: #1E9FFF 2px solid;
            width: 750px;
            height: 100px;
            /*padding: 12px;*/
            border-radius: 5px;
            box-shadow: 0 3px 11px 0 rgba(0,0,0,0.2), 0 0 11px 0 rgba(0,0,0,0.19);
        }
        .hide .all {
            float: left;
            margin-left: 12px;
            margin-top: 12px;
        }
        .hide li{
            float: left;
            padding-left: 12px;
            padding-top: 12px;
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
        .start {
            cursor: pointer;
        }
        .end {
            cursor: pointer;
            background-color: #AFEEEE;
            color: #0a61ff;
            border: none;
        }
    </style>
</head>
<body>
    <div class="main">
        <div class="show">
            <a href="<%=request.getContextPath() %>/" type="button" class="">全部</a>
            <c:forEach items="${tagList}" var="tag" begin="0" end="10">
                <div>
                    <ul>
                        <li><a href="<%=request.getContextPath() %>/" type="button" class="">${tag.tagName}</a></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
        <div class="hide">
            <a href="javascript:void(0)" type="button" class="all">全部</a>
            <a style="display: none" id="a"></a>
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
