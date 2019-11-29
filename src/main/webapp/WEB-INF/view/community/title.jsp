<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gby
  Date: 2019/11/22
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章标题</title>

</head>
<body>
<div style="margin-left: 200px;margin-top: 100px;">
    <a href="<%=request.getContextPath() %>/draft/find/${articleId}" style="padding: auto"><span> ${title}</span></a>
    <p>${articleContent}</p>
</div>
<script type=" text/javascript">
    //打开详情页
    function detail(id) {
        var a = document.createElement("a");
        a.href = "<%=request.getContextPath() %>/draft/find?id=" + id;
        console.log(a);
        a.target = '_new'; //指定在新窗口打开
        a.click();//触发打开事件
    }
</script>

</body>
</html>
