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
    <title>${article.title}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/typo.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/animate.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/articleShow.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/prism/prism.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/tocbot/tocbot.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1517658_our4ohnho6.css">

    <style type="text/css">
        /*底部样式*/
        body{margin: 0;}
        #footer{
            background-color: #333C4D;
            height: 130px;
            width: 100%;
            margin-top: 50px;
            margin-bottom: 0;
            position: absolute;
        }
        #footer ul{
            padding-top: 30px;
            width: 800px;
            height: 60px;
            margin: 0 auto;
            border-bottom: 1px solid #999999;
        }
        #footer ul li{
            float: left;
            list-style: none;
            padding-left: 30px;
        }
        #footer ul li a{
            color: #989898;
            text-decoration: none;
            float: left;
            padding-left: 20px;
        }
        #footer ul li a:hover{
            color: #F2F2F2;
        }
        #footer hr{
            width: 800px;
            color: #989898;
        }
        #footer p{
            color: #989898;
            text-align: center;
            padding-top: 10px;
        }
    </style>
</head>
<body>
    <%@include file="../../jsp/header.jsp"%>
    <!--中间内容-->
    <div id="waypoint" class="m-container-small m-padded-tb-big animated fadeIn">
        <div class="ui container">
            <!--顶部-->
            <div class="ui top attached segment">
                <div class="ui horizontal link list">
                    <div class="item">
                        <img src="${article.user.userImg}" alt="" class="ui avatar image">
                        <div class="content"><a href="javascript:void(0)" class="header" style="box-shadow: none;height: auto;">${article.user.userRealname}</a></div>
                    </div>
                    <div class="item">
                        <i class="calendar icon"></i> <span><fmt:formatDate value="${article.updateTime}" type="both" dateStyle="long" timeStyle="short"/></span>
                    </div>
                    <div class="item">
                        <i class="eye icon"></i> <span>${article.browseCount}</span>
                    </div>
                </div>
            </div>
            <div class="ui attached segment">
                <!--图片区域-->
                <img src="${article.figures}" alt="" class="ui fluid rounded image">
            </div>
            <div class="ui attached padded segment">
                <!--内容-->
                <div class="ui right aligned basic segment field">
                    <div class="ui violet basic label">${article.typeName}</div>
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
                <!--标签-->
                <div class="m-padded-lr-responsive" style="margin-bottom: 55px;margin-top: -20px;">
                    <c:forEach items="${article.tags}" var="tag">
                        <div class="column" style="margin-right: 15px;float: left;">
                            <div class="ui basic teal left pointing label">${tag.tagName}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="ui bottom attached segment">
                <!--留言区域列表-->
                <div class="ui form" id="div_stuCmt">
                    <div id="stuCmt_titleBox">
                        <h3 id="stuCmt_title" class="ui dividing header" style="box-shadow: none;height: 3vw;">评论</h3>
                    </div>
                    <div id="SCS_allBox" style="margin-top: 15px;margin-bottom: 15px;border: 0px solid white !important;">
                        <div id="ART_contentBox">
                            <ul id="art_cmt_stream"></ul>
                        </div>
                    </div>
                    <div id="art-cmt-textBox" class="field violet" style="border: 1px solid; height: 12vw;border-radius: 4px;margin-top: 1vw;">
                        <div id="div_artCmt_toolBar" class="toolbar"></div>
                        <div id="div_artCmt_text" class="text" style="height: 10vw;"></div>
                    </div>
                    <div id="art-cmt-btnBox" class="fields">
                        <div class="field m-margin-bottom-small m-mobile-wide" style="margin-top: 3px;">
                            <div class="ui left">
                                <button id="artCmt_btn" type="button" class="ui button m-mobile-wide violet"><i class="edit icon"></i>发布</button>
                            </div>
                        </div>
                        <div class="field m-margin-bottom-small m-mobile-wide" style="margin-top: 3px;">
                            <button id="look_artCmt" type="button" class="ui button m-mobile-wide violet"><i class="external share icon"></i>查看</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        <ul>
            <li>
                <a href="/aboutus/aboutus">关于我们</a>
            </li>
            <li>
                <a href="/aboutus/aboutus">加入我们</a>
            </li>
            <li>
                <a href="/aboutus/aboutus">联系我们</a>
            </li>
            <li>
                <a href="/aboutus/aboutus">讲师合作</a>
            </li>
            <li>
                <a href="/aboutus/aboutus">帮助中心</a>
            </li>
            <li>
                <a href="/aboutus/aboutus">友情链接</a>
            </li>
            <li>
                <a href="/aboutus/aboutus">合作企业</a>
            </li>
        </ul>
        <p>
            copyright&nbsp;&nbsp;&nbsp;&nbsp;2017&nbsp;&nbsp;&nbsp;&nbsp;北京智量酷教育科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;京ICP备09076312号
        </p>
    </div>

    <%--<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>--%>
    <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
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
