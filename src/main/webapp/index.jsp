<%--
  Created by IntelliJ IDEA.
  User: 上官螃蟹
  Date: 2019/11/18
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页跳转测试</title>
</head>
<body>
<script>
    location.href="<%=request.getContextPath() %>/test/toLogin";
</script>
<script src="<%=request.getContextPath()%>/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
</script>
<%--头部--%>
<jsp:include page="WEB-INF/jsp/header.jsp"></jsp:include>
index
<%--尾部--%>
<jsp:include page="WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>
