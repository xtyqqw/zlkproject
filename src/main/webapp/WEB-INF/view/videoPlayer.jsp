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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/videoPlayer.css" type="text/css">
    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>--%>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" type="text/css">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1515327_e9zpgf0s8tn.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1517658_our4ohnho6.css">

    <%--引入wangEditor富文本编辑器--%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/wangEditor.js"></script>

    <%--<script type="text/javascript" src="/js/player.js"></script>--%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/videoPlayer.js"></script>
</head>
<body>
    <span id="pageType" style="display: none">videoPlayer</span>
    <div class="FS_hidden">
        <jsp:include page="../jsp/header.jsp"></jsp:include>
    </div>
    <div class="layui-container">
        <span id="sectionId" style="display: none">${sectionId}</span>
        <span id="userId" style="display: none">${userId}</span>
        <div class="layui-row" id="video_row">
            <div class="layui-col-md2"></div>
            <div class="layui-col-md8">
                <div id="div_video_all">
                    <div id="l_func">
                        <div class="l_func_icon" id="icon-mulu">
                            <i class="iconfont icon-mulu-copy side-bar-icon"></i><br>
                            <span class="icon_text">目录</span>
                        </div>
                        <div class="l_func_icon" id="icon-wenda">
                            <i class="iconfont icon-wenda side-bar-icon"></i><br>
                            <span class="icon_text">问答</span>
                        </div>
                        <div class="l_func_icon" id="icon-biji">
                            <i class="iconfont icon-shenhebijijishibenxiezi side-bar-icon"></i><br>
                            <span class="icon_text">笔记</span>
                        </div>
                        <div class="l_func_icon" id="icon-pinglun">
                            <i class="iconfont icon-pinglun side-bar-icon"></i><br>
                            <span class="icon_text">评论</span>
                        </div>
                    </div>
                    <div id="r_video">
<%--------------------------播放器 begin ------------------------------------------------------------------------------%>
                        <div id="div_all">
                            <div id="div_video">
                                <video id="video1" width="100%" height="100%">
                                    <source id="video_src" src="${addr1}" type="video/mp4" />
                                </video>
                                <div id="waitIcon_box">
                                    <i id="waitIcon" class="iconfont icon-loading_"></i>
                                </div>
                                <div id="memoryLoadBox">
                                    已从上次观看处开始，点击<span id="goHead" style="color: #1E9FFF;text-decoration: underline;cursor: pointer">此处</span>从头开始
                                </div>
                            </div>
                            <div id="div_controller">
                                <div id="pg_bg">
                                    <div id="pg_cache"></div>
                                    <div id="pg_bar"></div>
                                    <div id="pg_btn"></div>
                                </div>
                                <div class="div_btn">
                                    <i id="btn_play" class="layui-icon" style="font-size: 30px;color: white;cursor: pointer !important;">&#xe652;</i>
                                </div>
                                <div id="div_time" class="div_btn">
                                    <div id="current_time" class="time">00:00:00</div>
                                    <div id="mid" class="time">/</div>
                                    <div id="total_time" class="time">--:--:--</div>
                                </div>
                                <div class="div_btn float_right" style="padding: 2px 0 0 0;width: 30px">
                                    <i id="fscreen" class="iconfont icon-quanping enableClk" style="font-size: 25px;color: white;display: block"></i>
                                    <i id="escreen" class="iconfont icon-tuichuquanping enableClk" style="font-size: 25px;color: white;display: none"></i>
                                </div>
                                <div id="div_sharpness" class="div_btn float_right">
                                    <span id="nv" style="display: none">${addr1}</span>
                                    <span id="sv" style="display: none">${addr2}</span>
                                    <div id="sharpness_btn" class="enableClk">普清</div>
                                    <div id="sharpness_option_box">
                                        <div class="sharpness_option enableClk">超清</div>
                                        <div class="sharpness_option enableClk">普清</div>
                                    </div>
                                </div>
                                <div id="div_speed" class="div_btn float_right">
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
                                <div class="div_btn float_right" style="padding: 2px 0 0 0;">
                                    <i id="volume" class="iconfont icon-yinzhong enableClk" style="width: 100%;height: 100%;font-size: 25px;color: white;margin: 0 0 0 15px"></i>
                                    <div id="volume_bar">
                                        <div id="volume_num" style="">50</div>
                                        <div id="vb_bg">
                                            <div id="vb_bar"></div>
                                        </div>
                                        <div id="vb_btn"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
<%--------------------------播放器 end---------------------------------------------------------------------------------%>
                        <%--功能栏目录--%>
                        <div style="display: none" id="mulu_div">

                        </div>
                        <%--功能栏问答--%>
                        <div style="display: none" id="wenda_div">
                            <div class="editor_title">
                                <div id="editor_title_span">
                                    <span>提问题</span>
                                </div>
                                <div id="stu_qa_close_div">
                                    <i id="stu_qa_close_btn" class="iconfont icon-icon-test enableClk"></i>
                                </div>
                            </div>
                            <div id="stu_qa_editor">
                                <div id="toolbar_div" class="toolbar"></div>
                                <div id="text_div" class="text" <%--onkeyup="checkLength(400);"--%>></div>
                                <div id="btn_div">
                                    <button type="button" id="btn_submit_wenda">提交</button>
                                    <button type="reset" id="btn_reset_wenda">取消</button>
                                </div>
                            </div>
                        </div>
                        <%--功能栏学生笔记--%>
                        <div id="div_stuNote">
                            <div id="stuNote_titleBox">
                                <div id="stuNote_title">记笔记</div>
                                <div id="stuNote_closeBtn">
                                    <i id="stuNoteCloseBtn" class="iconfont icon-icon-test enableClk"></i>
                                </div>
                            </div>
                            <div id="stuNote_textBox">
                                <div id="div_stuNote_toolBar" class="toolbar"></div>
                                <div id="div_stuNote_text" class="text"></div>
                            </div>
                            <div id="stuNote_btnBox">
                                <div id="stuNote_btn1" class="stuNote_btn" style="background-color: #5A5CAD">提交</div>
                                <div id="stuNote_btn2" class="stuNote_btn" style="background-color: #7aa6da">取消</div>
                            </div>
                        </div>
                        <%--功能栏学生评论--%>
                        <div id="div_stuCmt">
                            <div id="stuCmt_titleBox">
                                <div id="stuCmt_title">评论</div>
                                <div id="stuCmt_closeBtn">
                                    <i id="stuCmtCloseBtn" class="iconfont icon-icon-test enableClk"></i>
                                </div>
                            </div>
                            <div id="stuCmt_textBox">
                                <div id="div_stuCmt_toolBar" class="toolbar"></div>
                                <div id="div_stuCmt_text" class="text"></div>
                            </div>
                            <div id="stuCmt_btnBox">
                                <div id="stuCmt_btn1" class="stuCmt_btn" style="background-color: #5A5CAD">提交</div>
                                <div id="stuCmt_btn2" class="stuCmt_btn" style="background-color: #7aa6da">取消</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-md2"></div>
        </div>

        <div class="layui-row FS_hidden" id="tab_row">
            <div class="layui-col-md2"></div>
            <div class="layui-col-md8 layui-tab">
                <div class="layui-tab-title" id="layui-tab-title">
                    <li class="layui-this li_show" id="teacherNote-tab">讲师笔记</li>
                    <li class="li_hide"></li>
                    <li id="selection_stuNote" class="li_show">学生笔记</li>
                    <li class="li_hide"></li>
                    <li id="selection_stuCmt" class="li_show">学生评论</li>
                    <li class="li_hide"></li>
                    <li class="li_show" id="stuQa-tab">学生问答</li>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show" id="lay_flow1">
                        <div>
                            <span></span>
                            <div>
                                <p></p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-tab-item"></div>
                    <div class="layui-tab-item" style="border: 0px solid white !important;">
                        <div id="SNS_allBox">
                            <div id="SNS_top_box">
                                <div class="SNS_top_selection" style="border-bottom: 3px solid rgb(102,71,238);color:rgb(102,71,238)">最新</div>
                                <div class="SNS_top_selection">点赞</div>
                                <div class="SNS_top_btn">只看我的</div>
                            </div>
                            <div class="placeSpace"></div>
                            <div id="SNS_contentBox">
                                <ul id="SNS_ul_stream"></ul>
                            </div>
                        </div>
                    </div>
                    <div class="layui-tab-item"></div>
                    <div class="layui-tab-item" style="border: 0px solid white !important;">
                        <div id="SCS_allBox">
                            <div id="SCS_contentBox">
                                <ul id="SCS_ul_stream"></ul>
                            </div>
                        </div>
                    </div>
                    <div class="layui-tab-item"></div>
                    <div class="layui-tab-item">
                        <div class="layui-tab layui-tab-brief" id="stuQatab" lay-filter="docDemoTabBrief">
                            <ul class="layui-tab-title">
                                <li class="layui-this" id="stuQaall-tab">全部</li>
                                <li id="stuQaelite-tab">精华</li>
                            </ul>
                            <div class="layui-tab-content">
                                <div class="layui-tab-item layui-show stuQa-item" id="stuQaall">

                                </div>
                                <div class="layui-tab-item stuQa-item" id="stuQaelite"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-md2"></div>
        </div>
    </div>

    <div style="clear: both" class="FS_hidden">
        <jsp:include page="../jsp/footer.jsp"></jsp:include>
    </div>

    <div id="answer-div" hidden="hidden">
        <div id="answer-editor"></div>
        <button class="layui-btn" id="answer-submit" style="display: none">提交</button>
    </div>

    <div id="exercises" hidden="hidden"></div>
</body>
</html>
