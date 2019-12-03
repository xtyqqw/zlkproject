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
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <title>文章详情</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
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
            <%--顶部--%>
            <div class="ui top attached segment">
                <div class="ui horizontal link list">
                    <div class="ui horizontal link list">
                        <div class="item">
                            <img src="https://unsplash.it/100/100?image=1005" alt="" class="ui avatar image">
                            <div class="content"><a href="#" class="header">老钱</a></div>
                        </div>
                        <div class="item">
                            <i class="calendar icon"></i> <span>2019-10-01</span>
                        </div>
                        <div class="item">
                            <i class="eye icon"></i> <span>2342</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui attached padded segment">
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
                <div id="content" class="typo typo-selection js-toc-content m-padded-lr-responsive m-padded-tb-large">
                    <pre>${article.articleContent}</pre>
                </div>
            </div>

            <div class="ui bottom attached segment">
                <!--留言区域列表-->
                <div id="comment-container" class="ui teal segment">
                    <%--<jsp:invoke fragment="commentList">--%>
                        <div class="ui threaded comments" style="max-width: 100%;">
                        <h3 class="ui dividing header">评论</h3>
                        <div class="comment">
                            <c:forEach items="${comments}" var="comment">
                                <a class="avatar">
                                    <img src="https://unsplash.it/100/100?image=1005">
                                </a>
                                <div class="content">
                                    <a class="author" >
                                        <span>${comment.nickname}</span>
                                        <div class="ui mini basic teal left pointing label m-padded-mini">${comment.adminComment}</div>
                                    </a>
                                    <div class="metadata">
                                        <span class="date"><fmt:formatDate value="${comment.createTime}" pattern="yyyy-MM-dd HH:mm"/></span>
                                    </div>
                                    <div class="text">
                                        ${comment.content}
                                    </div>
                                    <div class="actions">
                                        <a class="reply" data-commentid="1" data-commentnickname="QKQ" th:attr="data-commentid=${comment.id},data-commentnickname=${comment.nickname}" onclick="reply(this)">回复</a>
                                    </div>
                                </div>
                                <%--<div class="comments">
                                    <c:if test="${arrays.length(comment.replyComments)}>0">
                                        <div class="comment">
                                            <c:forEach items="${comment.replyComments}" var="reply">
                                                <a class="avatar">
                                                    <img src="https://unsplash.it/100/100?image=1005">
                                                </a>
                                                <div class="content">
                                                    <a class="author" >
                                                        <span>${reply.nickname}</span>
                                                        <div class="ui mini basic teal left pointing label m-padded-mini">${reply.adminComment}</div>
                                                        &nbsp;<span class="m-teal">@&nbsp;${reply.parentComment.nickname}</span>
                                                    </a>
                                                    <div class="metadata">
                                                        <span class="date"><fmt:formatDate value="${reply.createTime}" pattern="yyyy-MM-dd HH:mm"/></span>
                                                    </div>
                                                    <div class="text">
                                                        ${reply.content}
                                                    </div>
                                                    <div class="actions">
                                                        <a class="reply" data-commentid="1" data-commentnickname="QKQ" &lt;%&ndash;th:attr="data-commentid=${reply.id},data-commentnickname=${reply.nickname}"&ndash;%&gt; onclick="reply(this)">回复</a>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                </div>--%>
                            </c:forEach>
                        </div>
                    </div>
                    <%--</jsp:invoke>--%>
                </div>
            </div>
            <div id="comment-form" class="ui form">
                <input type="hidden" name="article.id" value="${article.id}">
                <input type="hidden" name="parentComment.id" value="-1">
                <div class="field">
                    <textarea name="content" placeholder="请输入评论信息..."></textarea>
                </div>
                <div class="fields">
                    <div class="field m-mobile-wide m-margin-bottom-small">
                        <div class="ui left icon input">
                            <i class="user icon"></i>
                            <input type="text" name="nickname" placeholder="姓名">
                        </div>
                    </div>
                    <div class="field  m-margin-bottom-small m-mobile-wide">
                        <button id="commentpost-btn" type="button" class="ui teal button m-mobile-wide"><i class="edit icon"></i>发布</button>
                    </div>
                </div>
                <div class="ui error message"></div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/jquery.scrollto@2.1.2/jquery.scrollTo.min.js"></script>

    <script src="<%=request.getContextPath() %>/community/prism/prism.js"></script>
    <script src="<%=request.getContextPath() %>/community/tocbot/tocbot.min.js"></script>
    <script src="<%=request.getContextPath() %>/community/qrcode/qrcode.min.js"></script>
    <script src="<%=request.getContextPath() %>/community/waypoints/jquery.waypoints.min.js"></script>
    <script>
        //评论表单验证
        $('.ui.form').form({
            fields: {
                content: {
                    identifier: 'content',
                    rules: [{
                        type: 'empty',
                        prompt: '请输入评论内容'
                    }
                    ]
                },
                nickname: {
                    identifier: 'nickname',
                    rules: [{
                        type: 'empty',
                        prompt: '请输入你的大名'
                    }]
                }
            }
        });

        /*$(function () {
            $("#comment-container").load("comments/6");
        });*/

        /*点击提交按钮后校验*/
        $('#commentpost-btn').click(function () {
            var boo = $('.ui.form').form('validate form');
            if (boo) {
                console.log('校验成功');
                postData();
            } else {
                console.log('校验失败');
            }
        });

        function postData() {
            $("#comment-container").load(/*/comments*/"/comments",{
                "parentComment.id" : $("[name='parentComment.id']").val(),
                "article.id" : $("[name='article.id']").val(),
                "nickname": $("[name='nickname']").val(),
                "content" : $("[name='content']").val()
            },function (responseTxt, statusTxt, xhr) {
                $(window).scrollTo($('#comment-container'),500);
                clearContent();
            });
        }

        function clearContent() {
            $("[name='content']").val('');
            $("[name='parentComment.id']").val(-1);
            $("[name='content']").attr("placeholder", "请输入评论信息...");
        }


        function reply(obj) {
            var commentId = $(obj).data('commentid');
            var commentNickname = $(obj).data('commentnickname');
            $("[name='content']").attr("placeholder", "@"+commentNickname).focus();
            $("[name='parentComment.id']").val(commentId);
            $(window).scrollTo($('#comment-form'),500);
        }
    </script>
</body>
</html>
