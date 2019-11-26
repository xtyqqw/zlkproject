<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>我的文章</title>
    <style type="text/css">
        .context-div{
            overflow-x:hidden;
            position: absolute;
            overflow: hidden;
            margin: auto 0;
        }
        .all{
            width: 635px;
            height: 160px;
            background-color: #FFFFFF;
            /*border-bottom: 1px solid #F0F0F0;*/
            border: #0000FF 1px solid;
        }
        .title{
            position: relative;
            left: 20px;
            top: 35px;
        }
        .title a{
            font-size: 16px;
            font-family: Arial;
            font-weight: bold;
            color: #404040;
            text-decoration:none;
        }
        .articleDigest{
            position: relative;
            width: 400px;
            left: 20px;
            top: 47px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        .articleDigest a{
            font-size: 14px;
            font-family: Arial;
            color: #808080;
            text-decoration:none;
        }
        .figures{
            position: relative;
            left: 465px;
            top: -35px;
            border: 1px solid #FD482C;
            width: 135px;
            height: 83px;
        }
        .browseCount{
            position: relative;
            left: 450px;
            bottom: 25px;
        }
        .browseCount a{
            font-size: 13px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        .commentCount{
            position: relative;
            left: 540px;
            bottom: 43px;
        }
        .commentCount a{
            font-size: 13px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        .createTime{
            position: relative;
            left: 20px;
            top: 75px;
        }
        .createTime a{
            font-size: 13px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        </style>
</head>
<body>
<div class="context-div">
    <c:forEach items="${articleList}" var="article" begin="0" end="4">
        <div class="all">
            <div class="title"><a href="<%= request.getContextPath()%>">${article.title}</a></div>
            <div class="articleDigest"><a href="<%= request.getContextPath()%>">${article.articleDigest}</a></div>
            <div class="createTime"><a href="<%= request.getContextPath()%>"><fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></a></div>
            <div class="figures"><a href="<%= request.getContextPath()%>">${article.figures}</a></div>
            <div class="browseCount"><a href="<%= request.getContextPath()%>">浏览&nbsp;${article.browseCount}</a></div>
            <div class="commentCount"><a href="<%= request.getContextPath()%>">评论&nbsp;${article.commentCount}</a></div>
        </div>
    </c:forEach>
</div>
</body>
</html>