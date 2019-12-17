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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/commentManager.css" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/commentManager.js"></script>
    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>--%>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" type="text/css">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
</head>
<body>
    <div id="main_body">
        <%--<div id="top_select">
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
        </div>--%>
        <table id="sections_table" lay-filter="sectionsTable"></table>
        <div id="editContentBox" hidden="hidden">
            <span id="sm_id" style="display: none"></span>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">讲师回复</label>
                <div class="layui-input-block">
                    <textarea id="sectionIntroEdit" placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
                <div id="editSubmitBtn" class="myBtn" style="left: 396px">提交</div>
            </div>
        </div>

    </div>
</body>
</html>