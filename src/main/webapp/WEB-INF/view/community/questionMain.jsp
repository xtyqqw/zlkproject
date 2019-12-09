<%--
  Created by IntelliJ IDEA.
  User: 上官螃蟹
  Date: 2019/11/18
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>问答首页</title>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <script src="<%=request.getContextPath()%>/layui/css/layui.css"></script>
    <link rel="shortcut icon" href="https://gper.club/server-img/avatars/000/00/35/user_origin_3553.jpg"
          type="image/x-icon"/>
    <link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/semantic-ui/2.2.4/semantic.min.css" rel="stylesheet">
    <style type="text/css">
        body {
            overflow-x: hidden;
            overflow-y: hidden;
            height: auto;
        }

        /*发表按钮样式*/
        .quiz a {
            font-family: "Arial";
            color: #F8F8F8;
            font-size: 18px;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .quiz {
            position: relative;
            top: -100px;
            left: 924px;
            width: 100px;
            height: 40px;
            -moz-box-shadow: 2px 2px 5px #D8D8D8;
            -webkit-box-shadow: 2px 2px 5px #D8D8D8;
            box-shadow: 2px 2px 5px #D8D8D8;
            background-color: #1296db;
            text-align: center;
            line-height: 45px;
            overflow: hidden;
            vertical-align: middle;
            border-radius: 8%;
        }

        ul li {
            list-style: none;
        }

    </style>
</head>
<body>
<!--中间内容-->
<div class="m-container m-padded-tb-big animated fadeIn">
    <div style="margin-top: 15px;">
        <a href="<%=request.getContextPath()%>/question/questionGuide" target="_blank"
           class="ui mini right floated teal basic button">我要提问</a>
    </div>
    <div class="ui container" style="width: 100%;margin-left: -120px;margin-top: -12px;">
        <div class="ui stackable grid">
            <!--左边博客列表-->
            <div class="eleven wide column">
                <!--header-->
                  <div class="ui top attached segment">
                      <div class="ui middle aligned two column grid">
                          <div class="column">
                              <h3 class="ui teal header">我的问答</h3>
                          </div>
                      </div>
                  </div>
                <c:forEach items="${allQuestion}" var="all" begin="0" end="8">
                    <div class="ui padded vertical segment m-padded-tb-large">
                        <div class="ui middle aligned mobile reversed stackable grid">
                            <div class="eleven wide column">
                                <div class="right aligned five wide column">
                                        <span class="ui teal basic label m-padded-tiny m-text-thin"
                                              style="float: left;">
                                                ${all.solve}未解决
                                        </span>

                                    <h3 class="ui header">
                                        <a href="<%=request.getContextPath()%>/questionUser/find/{questionId}"
                                           name="all.quesitonId"
                                           target="_blank">
                                                ${all.questionTitle}
                                        </a>
                                    </h3>
                                </div>
                                <div class="ui grid" style="float: left;margin-top: 10px;height: 80px">
                                    <div class="eleven wide column">
                                        <div class="ui mini horizontal link list">
                                            <div class="item">
                                                <img src="https://unsplash.it/100/100?image=1005"
                                                     th:src="@{${all.userId}}" alt="" class="ui avatar image">
                                                <div class="content">
                                                    <span>${user.userName}管理员</span>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <i class="eye icon"></i>
                                                <span>${all.browseCount}</span>
                                            </div>
                                            <div class="item">
                                                <i class="calendar icon"></i>
                                                <span>${all.createTime}</span>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
