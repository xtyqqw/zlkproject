<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/11/27
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>关注他的人</title>
    <script src="/js/jquery-1.12.4.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <style type="text/css">
        .followhim{margin: 0;padding: 0;background-color: #FAFAFA;}
        .followhim_top{
            height: 4px;
            background-color: #713ED7;
            border-top: none;
        }
        .followhim_title{
            width: 180px;height: 55px;
            background-color: #713ED7;
            border-radius: 3px;
            margin: 0 auto;
        }
        .followhim_title p{
            color: #FFFFFF;
            text-align: center;
            font-size: 20px;
            margin-top: 0;
            padding: 10px 0px;
            letter-spacing: 8px;
        }
        /* 内容 */
        .followhim_main{
            margin: 20px;
            height: 150px;
        }
        .followhim_main:hover{
            background-color: #fff;
            box-shadow: 1px 1px 5px 1px #D4D4D4;
            border-radius: 5px;
        }
        /* 内容的左边 */
        .main_left{
            float: left;
            padding: 20px;
        }
        /* 头像 */
        .main_left img{
            height: 50px;width: 50px;
            border-radius: 50%;
            float: left;
        }
        /* 昵称 */
        .main_left .name{
            float: left;
            font-size: 16px;
            line-height: 3;
            margin: 0 20px;
        }
        /* 关注状态 */
        .main_left .attention_type{
            float: left;
            margin: 13px auto;
        }
        /* 已关注和加关注的图标样式 */
        .main_left .attention_type .ok,.jia{
            height: 20px;
            width: 20px;
            border-radius: 50%;
            text-align: center;
            line-height: 1;
            color: #fff;
            font-size: 20px;
            float: left;
        }
        .main_left .attention_type .ok{
            border: 1px solid #5ab62f;
            background-color: #5ab62f;
        }
        .main_left .attention_type .jia{
            border: 1px solid #343434;
            background-color: #343434;
            display: none;
        }
        .main_left .attention_type .no_zi{
            display: none;
        }
        .main_left .attention_type .ok_zi,.no_zi{
            font-size: 14px;
            color: #999999;
            float: left;
            padding-left: 7px;
        }
        /* 个性签名 */
        .main_left .sdf{
            margin-top: 50px;
            margin-left: 70px;
            font-size: 12px;
            color: #676767;
        }
        /* 关注人情况 */
        .attention_person{
            margin: 20px 0 30px 70px;
        }
        .attention_person .attention_him,.he_attention{
            float: left;
            border: 1px solid #bec3d9;
            border-radius: 50px;
            padding: 0 10px;
            background-color: #bec3d9;
            color: #fff;
        }
        .attention_person .attention_him{
            margin-right: 20px;
        }
        .main_right{
            float: right;
        }
        .main_right .xuexili,.learntime{
            margin: 20px auto;
            padding: 8px;
        }
        .main_right .xuexili p{
            float: left;
            margin-right: 20px;
            color: #676767;
            padding: 2px 0;
        }
        .main_right .learntime p{
            float: left;
            margin-right: 20px;
            color: #676767;
            padding: 2px 0;
        }
    </style>
</head>
<body>
<div class="followhim">
    <div class="followhim_top"></div>
    <div class="followhim_title">
        <p>关注TA的人</p>
    </div>
    <%--<div class="flow_div"></div>--%>
<c:forEach begin="0" end="2">
    <div class="followhim_main">
        <div class="main_left">
            <!-- 头像 -->
            <img src="../../img/headimg.jpg" />
            <!-- 昵称 -->
            <p class="name">骑驴看唱本</p>
            <!-- 关注状态 -->
            <div class="attention_type">
                <!-- 已关注 -->
                <p class="ok">√</p>
                <p class="ok_zi">已关注</p>
                <!-- 加关注 -->
                <p class="jia">+</p>
                <p class="no_zi">加关注</p>
            </div>
            <!-- 个性签名 -->
            <p class="sdf">失败并不可怕，可怕的是你不渴望成功！可怕的是你不渴望成功！</p>
            <!-- 关注人情况 -->
            <div class="attention_person">
                <a class="attention_him">n人关注了ta</a>
                <a class="he_attention">ta关注了n人</a>
            </div>
        </div>
        <div class="main_right">
            <div class="xuexili">
                <i class="layui-icon layui-icon-chart"
                   style="float: left;margin-right: 10px;font-size: 20px;"></i>
                <p>学习力：710</p>
                <p>学习效率：510</p>
            </div>
            <div class="learntime">
                <i class="layui-icon layui-icon-log"
                   style="float: left;margin-right: 10px;font-size: 20px;"></i>
                <p>学习时长：7小时</p>
                <p>学习成长量：13</p>
                <p>技能水平：100</p>
            </div>
        </div>
    </div>
</c:forEach>

</div>
<%--流加载--%>
<%--<script type="text/javascript">
    layui.use('flow', function () {
        var flow = layui.flow;
        flow.load({
            elem: '.flow_div' //流加载容器
            , isAuto: false
            , done: function (page, next) { //执行下一页的回调
                setTimeout(function () {
                    var lis = [];
                    var limit = 8;
                    var data = {"page": page, "limit": limit};
                    $.ajax({
                        type: "POST",
                        url: "",
                        dataType: "json",
                        data: data,
                        success: function (result) {
                            layui.each(result.coursesList, function (i, courses) {
                                lis.push(
                                    '<div class="followhim_main">' +
                                    '     <div class="main_left">' +
                                    '         <!-- 头像 -->' +
                                    '         <img src="../../img/headimg.jpg" />' +
                                    '            <!-- 昵称 -->' +
                                    '            <p class="name">骑驴看唱本</p>' +
                                    '            <!-- 关注状态 -->' +
                                    '            <div class="attention_type">' +
                                    '                <!-- 已关注 -->' +
                                    '                <p class="ok">√</p>' +
                                    '                <p class="ok_zi">已关注</p>' +
                                    '                <!-- 加关注 -->' +
                                    '                <p class="jia">+</p>' +
                                    '                <p class="no_zi">加关注</p>' +
                                    '            </div>\n' +
                                    '            <!-- 个性签名 -->' +
                                    '            <p class="sdf">失败并不可怕，可怕的是你不渴望成功！可怕的是你不渴望成功！</p>' +
                                    '            <!-- 关注人情况 -->' +
                                    '            <div class="attention_person">' +
                                    '                <a class="attention_him">n人关注了ta</a>' +
                                    '                <a class="he_attention">ta关注了n人</a>' +
                                    '            </div>' +
                                    '        </div>' +
                                    '        <div class="main_right">' +
                                    '            <div class="xuexili">' +
                                    '                <i class="layui-icon layui-icon-chart"' +
                                    '                   style="float: left;margin-right: 10px;font-size: 20px;"></i>' +
                                    '                <p>学习力：710</p>' +
                                    '                <p>学习效率：510</p>' +
                                    '            </div>' +
                                    '            <div class="learntime">' +
                                    '                <i class="layui-icon layui-icon-log"' +
                                    '                   style="float: left;margin-right: 10px;font-size: 20px;"></i>' +
                                    '                <p>学习时长：7小时</p>' +
                                    '                <p>学习成长量：13</p>' +
                                    '                <p>技能水平：100</p>' +
                                    '            </div>' +
                                    '        </div>' +
                                    '    </div>')
                            })
                            next(lis.join(''), page < 3);
                        }
                    });
                }, 500);
            }
        });
    });
</script>--%>
<%--点击关注事件--%>
<script type="text/javascript">
    $(document).ready(function () {
        $(".ok_zi").click(function () {
            $(this).hide();
            $(this).siblings(".ok").hide();
            $(this).siblings(".jia,.no_zi").show();
        });
        $(".no_zi").click(function () {
            $(this).hide();
            $(this).siblings(".jia").hide();
            $(this).siblings(".ok,.ok_zi").show();
        });
    });
</script>
</body>
</html>
