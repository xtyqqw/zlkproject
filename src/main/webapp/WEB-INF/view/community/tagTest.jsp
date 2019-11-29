<%--
  Created by IntelliJ IDEA.
  User: gby
  Date: 2019/11/18
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>

    <title>标签选择器</title>
    <style>
        .input {
            margin-top: 337px;
            margin-left: 107px;
            position: absolute;
        }
        .test {
            overflow-x: hidden;
            overflow-y: hidden;
            position: absolute;
            left: 115px;
            width: 1298px;
            float: left;
            height: 130px;
            top: 206px;
            border: 1px solid #ccc;
            display: none;
            background-color: #FFF;
            border: 1px solid #ccc;
        }

    </style>

</head>
<body>
<input id="tt" name="tt" class="input" type="text" placeholder="选择标签"
       style="width:1300px; height:35px; font-size: 12px; border:1px solid #ccc"/>
<div class="test" id="div">


</div>
<template>
    <el-radio-group v-model="tabPosition" style="margin-bottom: 30px;">
        <el-radio-button label="top">top</el-radio-button>
        <el-radio-button label="right">right</el-radio-button>
        <el-radio-button label="bottom">bottom</el-radio-button>
        <el-radio-button label="left">left</el-radio-button>
    </el-radio-group>

    <el-tabs :tab-position="tabPosition" style="height: 200px;">
        <el-tab-pane label="用户管理">用户管理</el-tab-pane>
        <el-tab-pane label="配置管理">配置管理</el-tab-pane>
        <el-tab-pane label="角色管理">角色管理</el-tab-pane>
        <el-tab-pane label="定时任务补偿">定时任务补偿</el-tab-pane>
    </el-tabs>
</template>
<script language="javascript" type="text/javascript">

        export default {
            data() {
                return {
                    tabPosition: 'top'
                };
            }
        };

</script>

<script language="javascript" type="text/javascript">
    function $(id) {
        return document.getElementById(id);
    }

    window.onload = function () {
        document.onclick = function (e) {
            $("div").style.display = "none";
        }
        $("tt").onclick = function (e) {
            if ($("div").style.display == "none") {
                $("div").style.display = "block";
            } else {
                $("div").style.display = "none";
            }
            stopFunc(e);
        }
        $("div").onclick = function (e) {
            stopFunc(e);
        }
    }

    function stopFunc(e) {
        document.all ? event.cancelBubble = true : e.stopPropagation();
    }
</script>


</body>
</html>
