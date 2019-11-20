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
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1517658_362dvudv818.css">
</head>
<body>
    <div class="layui-container">
        <div class="layui-row" id="video_row">
            <div class="layui-col-md2"></div>
            <div class="layui-col-md8">
                <div id="div_video_all">
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

                            <div id="div_all">
                                <div id="div_video">
                                    <video id="video1" width="100%" height="100%">
                                        <source id="video_src" src="/img/ckin.mp4" type="video/mp4" />
                                    </video>
                                </div>
                                <div id="div_controller">
                                    <div id="pg_bg">
                                        <div id="pg_bar"></div>
                                        <div id="pg_btn"></div>
                                    </div>
                                    <div class="div_btn">
                                        <i id="btn_play" class="layui-icon" style="font-size: 30px;color: white;cursor: pointer !important;">&#xe652;</i>
                                    </div>
                                    <div id="div_time" class="div_btn">
                                        <div id="current_time" class="time">00:00:00</div>
                                        <div id="mid" class="time">/</div>
                                        <div id="total_time" class="time"></div>
                                    </div>
                                    <div id="div_void" class="div_btn"></div>
                                    <div class="div_btn" style="padding: 2px 0 0 0;">
                                        <i id="volume" class="iconfont icon-yinzhong enableClk" style="width: 100%;height: 100%;font-size: 25px;color: white;margin: 0 0 0 15px"></i>
                                        <div id="volume_bar">
                                            <div id="volume_num" style="">50</div>
                                            <div id="vb_bg">
                                                <div id="vb_bar"></div>
                                            </div>
                                            <div id="vb_btn"></div>
                                        </div>
                                    </div>
                                    <div id="div_speed" class="div_btn">
                                        <div id="speed_btn" class="enableClk">1.0x</div>
                                        <div id="speed_option_box">
                                            <div class="speed_option enableClk">2.0x</div>
                                            <div class="speed_option enableClk">1.75x</div>
                                            <div class="speed_option enableClk">1.5x</div>
                                            <div class="speed_option enableClk">1.25x</div>
                                            <div class="speed_option enableClk">1.0x</div>
                                            <div class="speed_option enableClk">0.75x</div>
                                        </div>
                                    </div>
                                    <div class="div_btn" style="padding: 2px 0 0 0;">
                                        <i id="fscreen" class="iconfont icon-quanping enableClk" style="width: 100%;height: 100%;font-size: 25px;color: white;display: block"></i>
                                        <i id="escreen" class="iconfont icon-tuichuquanping enableClk" style="width: 100%;height: 100%;font-size: 25px;color: white;display: none"></i>
                                    </div>
                                </div>
                            </div>

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
