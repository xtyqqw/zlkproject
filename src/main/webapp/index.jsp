<%--
  Created by IntelliJ IDEA.
  User: 上官螃蟹
  Date: 2019/11/18
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
</head>
<body>
<script type="text/javascript">
    location.href = "<%=request.getContextPath()%>/";
</script>
<body>

</body>
</html>
