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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/prism/prism.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/tocbot/tocbot.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/articleShow.js"></script>
    <script src="<%=request.getContextPath() %>/layui/layui.all.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/wangEditor.js"></script>
    <style>
        #SCS_contentBox{
            width: 100%;
            height: auto;
            padding: 10px 0 0 0;
        }
        .SCS_content{
            background-color: rgb(245,245,245);
            width: 90%;
            height: auto;
            margin: 0 auto 10px auto;
            font-size: 0;
            border-radius: 5px;
            overflow: hidden;
        }
        .SCS_c_lbox{
            width: 20%;
            height: 300px;
            display: inline-block;
            vertical-align: top;
            font-size: 10px;
        }
        .SCS_c_rbox{
            width: 80%;
            height: auto;
            padding: 5px 0;
            display: inline-block;
            vertical-align: top;
            font-size: 14px;
        }
        .SCS_userBox{
            position: relative;
            width: auto;
            height: auto;
            margin: 0 auto;
            top: 25px;
        }
        .SCS_headPhoto_box{
            width: 9vw;
            height: 9vw;
            margin: 0 auto;
            border-radius: 50%;
            overflow: hidden;
        }
        .SCS_userName_box{
            width: 9vw;
            height: 30px;
            margin: 10px auto;
            font-size: 24px;
            text-align: center;
        }
        .SCS_textEditor{
            width: 98%;
            height: 220px;
            margin: 0 auto 5px auto !important;
            display: block;
            overflow: hidden;
            background-color: white;
            border-radius: 5px;
        }
        .SCS_textEditor div{
            height: auto !important;
            overflow-y: hidden;
            word-wrap: break-word;
        }
        .SCS_c_replyBox{
            width: 98%;
            height: auto;
            margin: 0 auto 5px auto;
            display: none;
        }
        .SCS_replyToolBar{
            background-color: white;
            border-radius: 3px 3px 0 0;
            border: 1px solid #8D8D8D;
            border-bottom: none;
        }
        .SCS_replyEditor{
            background-color: white;
            width: 100%;
            height: 100px;
            border-radius: 0 0 3px 3px;
            border: 1px solid #8D8D8D;
            margin: 0 auto 5px auto;
            display: block;
        }
        .SCS_replyEditor .w-e-panel-container{
            height: 150px !important;
            overflow-y: auto !important;
        }
        .SCS_replyEditor .w-e-panel-tab-content{
            height: 100px !important;
        }
        .w-e-panel-tab-content textarea{
            height: 69px !important;
        }
        .SCS_replyEditor .w-e-text{
            overflow-y: auto !important;
            word-wrap: break-word;
        }
        .SCS_replyBtn{
            background-color: #5FB878;
            width: 40px;
            height: 22px;
            position: relative;
            top: 0;
            left: 646px;
            border-radius: 3px;
            color: white;
            font-size: 16px;
            text-align: center;
            cursor: pointer;
        }
        .SCS_cmt_toolBox{
            width: 98%;
            height: 30px;
            margin: 0 auto 5px auto;
            border-radius: 4px;
            background-color: white;
        }
        .SCS_reply_toolBox{
            width: 98%;
            height: 30px;
            margin: 0 auto;
            border-radius: 4px;
            background-color: white;
        }
        .SCS_replyBox{
            width: 98%;
            height: auto;
            padding: 5px 0;
            margin: 0 auto;
            display: none;
        }
        .SCS_c_t_box{
            width: 100px;
            height: 27px;
            padding: 3px 0 0 0;
            font-size: 17px;
        }
        .SCS_r_t_box{
            width: 100px;
            height: 27px;
            padding: 3px 0 0 0;
            font-size: 17px;
        }
        .SCS_spaceDiv{
            width: 10px;
            height: 100%;
        }
        .SCS_UDbtn{
            cursor: pointer;
        }
        .SCS_reportBtn{
            cursor: pointer;
        }
    </style>
</head>
<body>
    <%@include file="../../jsp/header.jsp"%>
    <%@include file="../../jsp/sidebar.jsp"%>
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
                <h2 class="ui center aligned header">
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
                <div class="ui segment" id="div_stuCmt">
                    <div class="ui threaded comments" id="stuCmt_titleBox" style="max-width: 100%;">
                        <div id="stuCmt_title">评论</div>
                        <div id="stuCmt_textBox">
                            <div id="div_stuCmt_toolBar" class="toolbar"></div>
                            <div id="div_stuCmt_text" class="text"></div>
                        </div>
                        <div id="stuCmt_btnBox">
                            <div class="field m-margin-bottom-small m-mobile-wide">
                                <button id="stuCmt_btn1" type="button" class="ui button m-mobile-wide" style="background-color: #5A5CAD; color: #ffffff"><i class="edit icon"></i>发布</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item" style="border: 0px solid white !important;">
                    <div id="SCS_allBox">
                        <div id="SCS_contentBox">
                            <ul id="SCS_ul_stream"></ul>
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

    <script src="<%=request.getContextPath() %>/community/prism/prism.js"></script>
    <script src="<%=request.getContextPath() %>/community/tocbot/tocbot.min.js"></script>
    <script src="<%=request.getContextPath() %>/community/waypoints/jquery.waypoints.min.js"></script>

</body>
</html>
