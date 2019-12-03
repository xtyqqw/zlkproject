<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/12/2
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章详情</title>
    <link href="https://cdn.bootcss.com/semantic-ui/2.2.4/components/accordion.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/typo.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/animate.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/prism/prism.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/tocbot/tocbot.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css" />
</head>
<body>
<!--中间内容-->
<div id="waypoint" class="m-container-small m-padded-tb-big animated fadeIn">
    <div class="ui container">
        <div class="ui  attached padded segment">
            <!--内容-->
            <div class="ui right aligned basic segment">
                <div class="ui orange basic label">
                    ${article.createArticleType}
                </div>
            </div>

            <h2 class="ui center aligned header">
            ${article.title}
            </h2>
            <br>
            <!--中间主要内容部分-->
            <div id="content" class="typo  typo-selection js-toc-content m-padded-lr-responsive m-padded-tb-large">
                ${article.articleContent}
            </div>
        </div>
    </div>
</div>

</body>
</html>
