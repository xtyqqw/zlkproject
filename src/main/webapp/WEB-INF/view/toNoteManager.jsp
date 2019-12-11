<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>
<div class="layedit-tool-view">
    <form class="layui-form"  id="updateStuNote" action="<%=request.getContextPath()%>/note/updateStuNoteByStuNote" method="post" style="width: 400px;display: none;">
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">笔记ID</label>
            <div class="layui-input-block">
                <input type="text" name="snId" id="snId" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">举报</label>
            <div class="layui-input-block">
                <select id="report" name="report"  lay-verify="required" lay-filter="papers">
                    <option id="reportNull" value=""></option>
                    <option id="reportFalse" value="false">false</option>
                    <option id="reportTrue" value="true">true</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            </div>
        </div>
    </form>
</div>
    <table class="layui-hide" id="StuNote" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</button>
    </div>
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"  charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/toNoteManager.js" charset="utf-8"></script>
</body>
</html>