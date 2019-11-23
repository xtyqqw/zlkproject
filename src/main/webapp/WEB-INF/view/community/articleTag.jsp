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
            width: 500px;
            height: 20px;
        }
        .show a{
            float: left;
            padding-left: 15px;

        }
        .hide {
            display: none;
            border: #1E9FFF 2px solid;
            width: 500px;
            height: 50px;
        }
        .hide a{
            float: left;
            padding-left: 15px;
        }
    </style>
</head>
<body>
    <div class="main">
        <div class="show">
            <a href="<%=request.getContextPath() %>/" type="button" class="">全部1</a>
            <c:forEach items="${tagList}" var="tag" begin="0" end="3">
                <div>
                    <ul>
                        <li><a href="<%=request.getContextPath() %>/" type="button" class="">${tag.tagName}</a></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
        <div class="hide">
            <a href="<%=request.getContextPath() %>/" type="button" class="">全部2</a>
            <c:forEach items="${tagList}" var="tag">
                <div>
                    <ul>
                        <li><a href="<%=request.getContextPath() %>/" type="button" class="">${tag.tagName}</a></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
    </div>
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).on('mouseenter','.show',function () {
            $('.hide').css('display','block');
            $(this).css('display','none');
        });
        $(document).on('mouseleave','.hide',function () {
           $('.show').css('display','block');
           $(this).css('display','none');
        });
    </script>
</body>
</html>
