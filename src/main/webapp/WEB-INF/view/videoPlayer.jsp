<%--
  Created by IntelliJ IDEA.
  User: HRY
  Date: 2019/11/18
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>VideoPlayer</title>
    <link rel="stylesheet" href="/css/videoPlayer.css" type="text/css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/js/videoPlayer.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1515327_hg0yh7cunv.css">
</head>
<body>
    <div class="layui-container">
        <div class="layui-row" id="video_row">
            <div class="layui-col-md2"></div>
            <div class="layui-col-md8">
                <div id="div_video">
                    <div id="l_func">
                        <div class="l_func_icon" id="icon-mulu">
                            <i class="iconfont icon-mulu-copy"></i><br>
                            <span class="icon_text">目录</span>
                        </div>
                        <div class="l_func_icon" id="icon-wenda">
                            <i class="iconfont icon-wenda"></i><br>
                            <span class="icon_text">问答</span>
                        </div>
                        <div class="l_func_icon" id="icon-biji">
                            <i class="iconfont icon-shenhebijijishibenxiezi"></i><br>
                            <span class="icon_text">笔记</span>
                        </div>
                        <div class="l_func_icon" id="icon-pinglun">
                            <i class="iconfont icon-pinglun"></i><br>
                            <span class="icon_text">评论</span>
                        </div>
                    </div>
                    <div id="r_video">
                        <div id="video_div">视频播放器</div>
                        <div style="display: none" id="mulu_div">
                            <span>${chapters} hhh</span>
                            <c:forEach items="${chapters}" var="chapter">
                                <span>${chapter.chapterName}</span>
                            </c:forEach>
                            <c:forEach var="chapter" items="${chapters}">
                                <ul>
                                    <span>${chapter.chapterName}</span>
                                    <span>${name}</span>
                                    <c:forEach var="section" items="${sections}">
                                        <li>${section.sectionName}</li>
                                    </c:forEach>
                                </ul>
                            </c:forEach>
                            <ul>
                                <span>点击</span>
                                <li>1</li>
                                <li>2</li>
                                <li>3</li>
                                <li>4</li>
                                <li>5</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-md2"></div>
        </div>
    </div>

</body>
</html>
