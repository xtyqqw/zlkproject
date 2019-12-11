<%--
  Created by IntelliJ IDEA.
  User: HRY
  Date: 2019/12/7
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/sectionsManager.css" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sectionsManager.js"></script>
    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>--%>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" type="text/css">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
</head>
<body>
    <div id="main_body">
        <div id="top_select">
            <div id="ts_1" class="layui-form" lay-filter="course_select_box">
                <select id="courseSelect" name="course" lay-filter="course_select" lay-search>
                    <option value="">请选择一个课程</option>
                    <c:forEach items="${CourseAndChapter}" var="course">
                        <option value="${course.coursesId}">(ID:${course.coursesId}) ${course.coursesName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="spaceDiv"></div>
            <div id="ts_2" class="layui-form" lay-filter="chapter_select_box">
                <select id="chapterSelect" name="chapter" lay-filter="chapter_select" lay-search>
                    <option value="">请选择一个章节（请先选择一个课程）</option>
                </select>
            </div>
        </div>
        <table id="sections_table" lay-filter="sectionsTable"></table>
        <div class="layui-btn-container" id="topToolBar" hidden="hidden">
            <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
        </div>
        <div id="addContentBox" hidden="hidden">
            <div id="ACB_1" class="layui-form" lay-filter="ACB1_course_select_box">
                <select id="ACB1_courseSelect" name="course" lay-filter="ACB1_course_select" lay-search>
                    <option value="">请选择一个课程</option>
                    <c:forEach items="${CourseAndChapter}" var="course">
                        <option value="${course.coursesId}">(ID:${course.coursesId}) ${course.coursesName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="spaceDiv"></div>
            <div id="ACB_2" class="layui-form" lay-filter="ACB2_chapter_select_box">
                <select id="ACB2_chapterSelect" name="chapter" lay-filter="ACB1_chapter_select" lay-search>
                    <option value="">请选择一个章节（请先选择一个课程）</option>
                </select>
            </div>
            <div class="spaceDiv"></div>
            <div class="layui-form-item">
                <label class="layui-form-label">小节序号</label>
                <div class="layui-input-block">
                    <input type="text" id="sectionNum" required  lay-verify="number" placeholder="请输入小节序号" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">小节名</label>
                <div class="layui-input-block">
                    <input type="text" id="sectionName" required  lay-verify="required" placeholder="请输入小节名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">小节介绍</label>
                <div class="layui-input-block">
                    <textarea id="sectionIntro" placeholder="请输入介绍内容" class="layui-textarea"></textarea>
                </div>
            </div>
            <span id="video_time" style="display: none">0</span>
            <button type="button" class="layui-btn" id="normalVideo_btn">
                <span id="nv_path" style="display: none"></span>
                <span id="nv_url" style="display: none"></span>
                <i class="layui-icon">&#xe67c;</i>上传普清视频
            </button>
            <span id="nv_retmsg">尚未上传</span>
            <div class="spaceDiv"></div>
            <button type="button" class="layui-btn" id="supperVideo_btn">
                <span id="sv_path" style="display: none"></span>
                <span id="sv_url" style="display: none"></span>
                <i class="layui-icon">&#xe67c;</i>上传超清视频
            </button>
            <span id="sv_retmsg">尚未上传</span>
            <div class="spaceDiv"></div>
            <div id="addSubmitBtn" class="myBtn" style="left: 396px">提交</div>
        </div>

        <div id="editContentBox" hidden="hidden">
            <div id="ECB_1" class="layui-form" lay-filter="ECB1_course_select_box">
                <select id="ECB1_courseSelect" name="course" lay-filter="ECB1_course_select" lay-search>
                    <option value="">请选择一个课程</option>
                    <c:forEach items="${CourseAndChapter}" var="course">
                        <option value="${course.coursesId}">(ID:${course.coursesId}) ${course.coursesName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="spaceDiv"></div>
            <div id="ECB_2" class="layui-form" lay-filter="ECB2_chapter_select_box">
                <select id="ECB2_chapterSelect" name="chapter" lay-filter="ECB1_chapter_select" lay-search>
                    <option value="">请选择一个章节（请先选择一个课程）</option>
                </select>
            </div>
            <div class="spaceDiv"></div>
            <div class="layui-form-item">
                <label class="layui-form-label">小节序号</label>
                <div class="layui-input-block">
                    <input type="text" id="sectionNumEdit" required  lay-verify="number" placeholder="请输入小节序号" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">小节名</label>
                <div class="layui-input-block">
                    <input type="text" id="sectionNameEdit" required  lay-verify="required" placeholder="请输入小节名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">小节介绍</label>
                <div class="layui-input-block">
                    <textarea id="sectionIntroEdit" placeholder="请输入介绍内容" class="layui-textarea"></textarea>
                </div>
            </div>
            <span id="video_time_edit" style="display: none">0</span>
            <button type="button" class="layui-btn" id="normalVideo_btn_edit">
                <span id="nv_path_edit" style="display: none"></span>
                <span id="nv_url_edit" style="display: none"></span>
                <i class="layui-icon">&#xe67c;</i>上传普清视频
            </button>
            <span id="nv_retmsg_edit">尚未上传</span>
            <div class="spaceDiv"></div>
            <button type="button" class="layui-btn" id="supperVideo_btn_edit">
                <span id="sv_path_edit" style="display: none"></span>
                <span id="sv_url_edit" style="display: none"></span>
                <i class="layui-icon">&#xe67c;</i>上传超清视频
            </button>
            <span id="sv_retmsg_edit">尚未上传</span>
            <div class="spaceDiv"></div>
            <div id="editSubmitBtn" class="myBtn" style="left: 396px">提交</div>
        </div>
    </div>
</body>
</html>