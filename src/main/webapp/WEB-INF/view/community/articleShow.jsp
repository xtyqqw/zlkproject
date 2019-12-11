<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/12/2
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>文章详情</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/typo.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/animate.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/articleShow.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/prism/prism.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/tocbot/tocbot.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
</head>
<body>
    <%@include file="../../jsp/header.jsp"%>
    <!--中间内容-->
    <div id="waypoint" class="m-container-small m-padded-tb-big animated fadeIn">
        <div class="ui container">
            <%--顶部--%>
            <div class="ui top attached segment">
                <div class="ui horizontal link list">
                    <div class="item">
                        <%--<img src="${article.user.userImg}" alt="" class="ui avatar image">--%>
                        <%--<div class="content"><a href="#" class="header">${article.user.userRealname}</a></div>--%>
                    </div>
                    <div class="item">
                        <i class="calendar icon"></i> <span><fmt:formatDate value="${article.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    </div>
                    <div class="item">
                        <i class="eye icon"></i> <span>${article.browseCount}</span>
                    </div>
                </div>
            </div>
            <div class="ui attached padded segment">
                <!--内容-->
                <div class="ui right aligned basic segment">
                    <c:if test="${article.createArticleType == 0}">
                        <div class="ui orange basic label">原创</div>
                    </c:if>
                    <c:if test="${article.createArticleType == 1}">
                        <div class="ui orange basic label">转载</div>
                    </c:if>
                    <c:if test="${article.createArticleType == 2}">
                        <div class="ui orange basic label">翻译</div>
                    </c:if>
                </div>
                <h2 class="ui center aligned header" style="box-shadow: none;">
                    ${article.title}
                </h2>
                <br>
                <!--中间主要内容部分-->
                <div id="content" class="typo typo-selection js-toc-content m-padded-lr-responsive m-padded-tb-large">
                    <pre>${article.articleContent}</pre>
                </div>
            </div>

            <div class="ui bottom attached segment">
                <!--留言区域列表-->
                <div class="ui form" id="div_stuCmt">
                    <div id="stuCmt_titleBox">
                        <h3 id="stuCmt_title" class="ui dividing header" style="box-shadow: none;height: 3vw;">评论</h3>
                    </div>
                    <div style="border: 0px solid white !important;">
                        <div id="SCS_allBox" style="margin-top: 15px;margin-bottom: 15px;">
                            <div id="cmt-content-box">
                                <ul id="art-cmt-ul-stream"></ul>
                            </div>
                        </div>
                    </div>
                    <div id="art-cmt-textBox" class="field" style="border: #5A5CAD 1px solid; height: 12vw;border-radius: 4px;margin-top: 1vw;">
                        <div id="div-artCmt-toolBar" class="toolbar" style="border-bottom: 1px #5A5CAD solid;"></div>
                        <div id="div-artCmt-text" class="text" style="height: 10vw;"></div>
                    </div>
                    <div id="art-cmt-btnBox" class="fields">
                        <div class="field m-margin-bottom-small m-mobile-wide">
                            <button id="artCmt-btn" type="button" class="ui button m-mobile-wide" style="background-color: #5A5CAD; color: #ffffff"><i class="edit icon"></i>发布</button>
                            <button id="selection_stuCmt" type="button" class="ui button m-mobile-wide" style="background-color: #5A5CAD; color: #ffffff">测试</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../../jsp/footer.jsp"%>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/jquery.scrollto@2.1.2/jquery.scrollTo.min.js"></script>

    <script src="<%=request.getContextPath() %>/js/articleShow.js"></script>
    <script src="<%=request.getContextPath() %>/layui/layui.all.js"></script>
    <script src="<%=request.getContextPath() %>/js/wangEditor.js"></script>

    <script src="<%=request.getContextPath() %>/community/prism/prism.js"></script>
    <script src="<%=request.getContextPath() %>/community/tocbot/tocbot.min.js"></script>
    <script src="<%=request.getContextPath() %>/community/waypoints/jquery.waypoints.min.js"></script>
</body>
</html>
