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
    <meta charset=" utf-8">
    <meta name="author" content="http://www.softwhy.com/" />
    <title>qq</title>
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>

</head>
<body>
<input class="form-control" id="title" name="title" placeholder=" 请输入" type="text">
<a href="" id="titleCount" style="color:#9B9B9B;text-decoration: none;font-size:12px;"></a>
<script type="text/javascript">
    $("#titleCount").text((12 - $("#title").val().length) + "/12");
    $("#title").keyup(function() {
        if ($("#title").val().length > 12) {
            $("#title").val($("#title").val().substring(0, 12));
        }
        $("#titleCount").text((12 - $("#title").val().length) + "/12");
    });
</script>
</body>
</html>