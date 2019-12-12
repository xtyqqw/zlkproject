<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试页面</title>
    <%--引入wangEditor富文本编辑器--%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/wangEditor.js"></script>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" type="text/css">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
</head>
<body>
<h1>测试</h1>
<div id="demo1" style="text-align: center;margin-top: 300px"></div>
<script type="text/javascript">
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
            , layer = layui.layer;

        laypage.render({
            elem: 'demo1'
            ,count: 100
            ,theme: '#1E9FFF'
            ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            ,jump: function(obj){
                console.log(obj)
            }
        });
    });

</script>
</body>
</html>