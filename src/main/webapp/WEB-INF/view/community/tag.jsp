<%--
  Created by IntelliJ IDEA.
  User: gby
  Date: 2019/11/18
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>title-jquery-tag</title>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <script src="/layui/layui.js"></script>
</head>
<body>
<div class="layui-tab" lay-filter="test1">
    <ul class="layui-tab-title">
        <li class="layui-this" lay-id="111" >文章列表</li>
        <li lay-id="222">发送信息</li>
        <li lay-id="333">权限分配</li>
        <li lay-id="444">审核</li>
        <li lay-id="555">订单管理</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">1</div>
        <div class="layui-tab-item">2</div>
        <div class="layui-tab-item">3</div>
        <div class="layui-tab-item">4</div>
        <div class="layui-tab-item">5</div>
    </div>
</div>
<script>
    layui.use('element', function(){
        var element = layui.element;

        //获取hash来切换选项卡，假设当前地址的hash为lay-id对应的值
        var layid = location.hash.replace(/^#test1=/, '');
        element.tabChange('test1', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项

        //监听Tab切换，以改变地址hash值
        element.on('tab(test1)', function(){
            location.hash = 'test1='+ this.getAttribute('lay-id');
        });
    });
</script>

</body>
</html>