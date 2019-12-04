<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>
    <table class="layui-hide" id="StuNote" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</button>
    </div>
</script>
<script type="text/javascript" src="/layui/layui.js"  charset="utf-8"></script>
<script src="/js/toNoteManager.js" charset="utf-8"></script>
</body>
</html>