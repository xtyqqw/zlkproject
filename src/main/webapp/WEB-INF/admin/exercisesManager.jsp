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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/exercisesManager.js"></script>
    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>--%>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" type="text/css">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <%--<style>
    #zhang1{
        position: absolute;
        top: 0px;
        left: 26%;
    }
    #ke1{
        width: 160px;
    }

        #jie1{
            position: absolute;
            top: 0px;
            left: 55%;
        }

    </style>--%>
</head>
<body>
    <div>
        <div id="insertExercisesDiv" style="width: 400px; display: none">
            <form class="layui-form"  id="insertExercisesForm" method="post">
                <div class="layui-form-item" style="display: none">
                    <label class="layui-form-label">习题Id:</label>
                    <div class="layui-input-block">
                        <input type="text" name="eId" id="eId" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" id="coursesDiv">
                    <label class="layui-form-label">课程名称:</label>
                    <div class="layui-input-block" lay-filter="coursesNameInsertDiv">
                        <select class="layui-select" name="coursesId" id="coursesNameInsertSelect" lay-filter="coursesNameSelect" lay-search >
                            <option value="">请选择一个课程</option>
                            <c:forEach items="${coursesList}" var="course">
                                <option value="${course.coursesId}">(ID:${course.coursesId}) ${course.coursesName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item" id="chapterDiv">
                    <label class="layui-form-label">章节名称:</label>
                    <div class="layui-input-block layui-form" lay-filter="chapterNameInsertDiv">
                        <select class="layui-select" name="chapterId" id="chapterNameInsertSelect" lay-filter="chapterNameSelect" lay-search >
                            <option value="">请选择一个章节(请先选择一个课程)</option>

                        </select>
                    </div>
                </div>
                <div class="layui-form-item" id="sectionDiv">
                    <label class="layui-form-label">小节名称:</label>
                    <div class="layui-input-block layui-form" lay-filter="sectionNameInsertDiv">
                        <select class="layui-select" name="sectionId" id="sectionNameInsertSelect" lay-filter="sectionNameSelect" lay-search>
                            <option value="">请选择一个小节(请先选择一个章节)</option>

                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">习题类型:</label>
                    <div class="layui-input-block">
                        <select class="layui-select" name="type" id="type" lay-filter="typeSelect" lay-search>
                            <option value="">请选择一个习题类型</option>
                            <option value="单项选择题">单项选择题</option>
                        </select>
                    </div>
                </div>
                <%--<div class="layui-form-item" id="exerciseNumInputDiv">
                    <label class="layui-form-label">习题序号</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="exerciseNum" id="exerciseNumInput" readonly="readonly">
                    </div>
                </div>--%>
                <div class="layui-form-item layui-form" lay-filter="exerciseNumDiv" id="exerciseNumSelectDiv">
                    <label class="layui-form-label">习题序号</label>
                    <div class="layui-input-block">
                        <%--<select class="layui-select" name="exerciseNum" id="exerciseNumSelect" lay-filter="exerciseNumSelect">
                            <option value="">请选择习题序号</option>
                        </select>--%>
                        <input type="text" name="exerciseNum" id="exerciseNum" class="layui-input" disabled="true">
                    </div>
                </div>

                <div class="layui-form-item" style="display: none">
                    <input type="text" class="layui-input" name="exercisesLastNum" id="exercisesLastNum">
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">习题内容:</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" id="title" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">答案A:</label>
                    <div class="layui-input-block">
                        <textarea type="text" class="layui-input" name="answerA" id="answerA"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">答案B:</label>
                    <div class="layui-input-block">
                        <textarea type="text" class="layui-input" name="answerB" id="answerB"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">答案C:</label>
                    <div class="layui-input-block">
                        <textarea type="text" class="layui-input" name="answerC" id="answerC"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">答案D:</label>
                    <div class="layui-input-block">
                        <textarea type="text" class="layui-input" name="answerD" id="answerD"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">正确答案:</label>
                    <div class="layui-input-block">
                        <textarea type="text" class="layui-input" name="truth" id="truth"></textarea>
                    </div>
                </div>
                <div class="layui-form-item layui-hide">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit lay-filter="submit">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>


        <div class="layui-form" id="select_box">
            <div class="layui-form-item">
                <label class="layui-form-label">课程名称:</label>
                <div class="layui-input-block" lay-filter="coursesNameDiv" id="ke1">
                    <select class="layui-select" name="coursesId" id="coursesNameSelect" lay-filter="coursesName" lay-search>
                        <option value="">请选择一个课程</option>
                        <c:forEach items="${coursesList}" var="course">
                            <option value="${course.coursesId}">(ID:${course.coursesId}) ${course.coursesName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" id="zhang1">
                <label class="layui-form-label">章节名称:</label>
                <div class="layui-input-block layui-form" lay-filter="chapterNameDiv">
                    <select class="layui-select" name="chapterId" id="chapterNameSelect" lay-filter="chapterName" lay-search>
                        <option value="">请选择一个章节(请先选择一个课程)</option>

                    </select>
                </div>
            </div>
            <div class="layui-form-item" id="jie1">
                <label class="layui-form-label">小节名称:</label>
                <div class="layui-input-block layui-form" lay-filter="sectionNameDiv">
                    <select class="layui-select" name="sectionId" id="sectionNameSelect" lay-filter="sectionName" lay-search>
                        <option value="">请选择一个小节(请先选择一个章节)</option>

                    </select>
                </div>
            </div>
        </div>


        <table class="layui-table" id="exercises" lay-filter="exercises"></table>


        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container layui-inline">
                <button class="layui-btn layui-btn-sm" lay-event="insert">新增</button>
            </div>
        </script>

    </div>
</body>
</html>