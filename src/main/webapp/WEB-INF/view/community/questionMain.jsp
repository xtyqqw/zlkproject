<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试页面</title>

</head>
<body>
<div class="body-left">
    <div class="tab">
        <a href="<%=request.getContextPath()%>/question/findQuestionAll" target="pageTags">全部提问</a>
        <span>|</span>
        <a href="<%= request.getContextPath()%>/question/findQuestionMy" target="pageTags">我的提问</a>
    </div>
    <iframe class="iframe" name="pageTags" frameborder="1" src="<%= request.getContextPath()%>/question/findQuestionAll"></iframe>
</div>

</body>
</html>