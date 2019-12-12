<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/12/11
  Time: 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>点标签查文章</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
</head>
<body>
    <div  class="m-container-small m-padded-tb-big animated fadeIn">
        <div class="ui container" style="width: 100% !important">
            <div class="ui top attached violet segment">
                <c:forEach items="${pages.content}" var="articlesTags">
                    <div class="ui padded vertical segment m-padded-tb-large">
                        <div class="ui middle aligned mobile reversed stackable grid" >
                            <div class="eleven wide column">
                                <div class="ui horizontal link list">
                                    <div class="item">
                                        <h3 class="ui header">
                                            <a href="<%=request.getContextPath() %>/community/article-show?articleId=${articlesTags.articleId}" target="_blank" class="m-black">${articlesTags.title}</a>
                                        </h3>
                                    </div>
                                    <div class="item" style="margin-left: 30px;">
                                        <c:if test="${articlesTags.createArticleType == 0}">
                                            <div class="ui orange basic label">原创</div>
                                        </c:if>
                                        <c:if test="${articlesTags.createArticleType == 1}">
                                            <div class="ui orange basic label">转载</div>
                                        </c:if>
                                        <c:if test="${articlesTags.createArticleType == 2}">
                                            <div class="ui orange basic label">翻译</div>
                                        </c:if>
                                    </div>
                                </div>
                                <p class="m-text" style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 3;">${articlesTags.articleDigest}</p>
                                <div class="ui grid">
                                    <div class="row">
                                        <div class="eleven wide column">
                                            <div class="ui horizontal link list">
                                                <div class="item">
                                                    <div class="content"><a href="<%=request.getContextPath() %>/community/article-show?articleId=${articlesTags.articleId}" target="_blank" class="header">${articlesTags.user.userRealname}</a></div>
                                                </div>
                                                <div class="item">
                                                    <i class="calendar icon"></i><span><fmt:formatDate value="${articlesTags.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                                </div>
                                                <div class="item">
                                                    <i class="eye icon"></i> <span>${articlesTags.browseCount}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right aligned five wide column">
                                            <a href="<%=request.getContextPath() %>/community/article-show?articleId=${articlesTags.articleId}" target="_blank" class="ui violet basic label m-text-thin">${articlesTags.typeName}</a>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <c:forEach items="${articlesTags.tags}" var="tag">
                                            <div class="column" style="margin-right: 25px;">
                                                <a href="<%=request.getContextPath() %>/community/tags?tagId=${tag.tagId}" class="ui violet basic left pointing label m-text-thin">${tag.tagName}</a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>

                            <div class="five wide column">
                                <a href="<%=request.getContextPath() %>/community/article-show?articleId=${articlesTags.articleId}" target="_blank">
                                    <img src="${articlesTags.figures}" alt="" class="ui rounded image">
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${pages.totalPages > 1}">
                <div class="ui bottom attached segment">
                    <div class="ui middle aligned two column grid">
                        <div class="column">
                            <c:if test="${!pages.first}">
                                <a href="<%=request.getContextPath() %>/community/tags?tagId=${activeTagId}&page=${pages.number-1}" class="ui mini violet basic button">上一页</a>
                            </c:if>
                        </div>
                        <div class="right aligned column">
                            <c:if test="${!pages.last}">
                                <a href="<%=request.getContextPath() %>/community/tags?tagId=${activeTagId}&page=${pages.number+1}" class="ui mini violet basic button">下一页</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

</body>
</html>
