<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/11/27
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>他关注的人</title>
    <script src="/js/jquery-1.12.4.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <style type="text/css">
        .hefollows{margin: 0;padding: 0;background-color: #FAFAFA;padding-bottom: 10px}
        .hefollows_top{
            height: 4px;
            background-color: #713ED7;
            border-top: none;
        }
        .hefollows_title{
            width: 180px;height: 55px;
            background-color: #713ED7;
            border-radius: 3px;
            margin: 0 auto;
        }
        .hefollows_title p{
            color: #FFFFFF;
            text-align: center;
            font-size: 20px;
            margin-top: 0;
            padding: 10px 0;
            letter-spacing: 8px;
        }
        /* 内容 */
        .hefollows_main{
            margin: 20px;
            height: 150px;
        }
        .hefollows_main:hover{
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
            cursor: pointer;
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
            background-color: #713ed7;
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
        /*没有关注人*/
        .hefollows .noperson{
            text-align: center;
            padding: 30px;
            font-size: 18px;
            color:#999;
        }
        /*取消关注弹窗*/
        .att_success1,.att_success2,.att_success3,.att_success4,.att_success5{
            width: 400px;
            height: 70px;
            text-align: center;
            position: fixed;
            margin-left: 100px;
            box-shadow: 1px 1px 5px 1px #D4D4D4;
            background-color: #FFFFFF;
            border-radius: 3px;
        }
        .att_success_zi1,.att_success_zi2,.att_success_zi3,.att_success_zi4,.att_success_zi5{
            font-size: 18px;
            position: fixed;
        }
        .att_success_zi1{
            margin: 23px 160px;
        }
        .att_success_zi2{
            margin: 23px 100px;
        }
        .att_success_zi3{
            margin: 23px 120px;
        }
        .att_success_zi4{
            margin: 23px 170px;
        }
        .att_success_zi5{
            margin: 23px 130px;
        }
        .att_success_ok1,.att_success_ok2,.att_success_no1,.att_success_no2,.att_success_noo{
            height: 20px;
            width: 20px;
            border-radius: 50%;
            text-align: center;
            line-height: 1;
            color: #fff;
            font-size: 20px;
            float: left;
            position: fixed;
            margin: 25px 20px 25px 90px;
        }
        .att_success_ok1,.att_success_ok2{
            border: 1px solid #5ab62f;
            background-color: #5ab62f;
        }
        .att_success_ok1{
            margin-left: 130px;
        }
        .att_success_ok2{
            margin-left: 135px;
        }
        .att_success_no1,.att_success_no2{
            border: 1px solid #d34748;
            background-color: #d34748;
            margin-left: 60px;
        }
        .att_success_no1{
            margin-left: 60px;
        }
        .att_success_no2{
            margin-left: 100px;
        }
        .att_success_noo{
            border: 1px solid #f5bb29;
            background-color: #f5bb29;
            margin-left: 85px;
        }
    </style>
</head>
<body>
<div class="hefollows">
    <div class="hefollows_top"></div>
    <div class="hefollows_title">
        <p>TA关注的人</p>
    </div>
    <%--返回上一页--%>
    <a href="javascript:history.go(-1)" style="margin-left: 30px;margin-top: -30px;position: fixed">
        <i class="layui-icon layui-icon-return" style="font-size: 20px"></i>
    </a>
    <c:if test="${list.size()==0}">
        <p class="noperson">ta没有关注任何人</p>
    </c:if>
    <c:if test="${list.size()!=0}">
        <div class="main"></div>
        <%--<c:forEach items="${list}" var="list">
            <div class="hefollows_main">
                <div class="main_left">
                    <!-- 头像 -->
                    <img src="../../img/headimg.jpg" />
                    <!-- 昵称 -->
                    <p class="name">${list.userRealname}</p>
                    <!-- 关注状态 -->
                    <div class="attention_type">
                        <c:if test="${list.userId!=userId}">
                            <!-- 已关注 -->
                            <c:if test="${list.followType==1}">
                                <span style="display: none">${list.userId}</span>
                                <p class="ok">√</p>
                                <p class="ok_zi">已关注</p>
                            </c:if>
                            <!-- 加关注 -->
                            <c:if test="${list.followType==0}">
                                <span style="display: none">${list.userId}</span>
                                <p class="jia">+</p>
                                <p class="no_zi">加关注</p>
                            </c:if>
                        </c:if>
                        <div class="att_tan">
                            <div class="att_success1">
                                <p class="att_success_ok1">√</p>
                                <p class="att_success_zi1">取消关注成功!</p>
                            </div>
                            <div class="att_success2">
                                <p class="att_success_no1">X</p>
                                <p class="att_success_zi2">取消关注失败，请重新操作！</p>
                            </div>
                            <div class="att_success3">
                                <p class="att_success_noo">!</p>
                                <p class="att_success_zi3">加载超时，请稍后再试！</p>
                            </div>
                            <div class="att_success4">
                                <p class="att_success_ok2">√</p>
                                <p class="att_success_zi4">关注成功!</p>
                            </div>
                            <div class="att_success5">
                                <p class="att_success_no2">X</p>
                                <p class="att_success_zi5">关注失败，请重新操作！</p>
                            </div>
                        </div>
                    </div>
                    <!-- 个性签名 -->
                    <p class="sdf">失败并不可怕，可怕的是你不渴望成功！可怕的是你不渴望成功！</p>
                    <!-- 关注人情况 -->
                    <div class="attention_person">
                        <a class="attention_him">${list.followedNum}人关注了ta</a>
                        <a class="he_attention">ta关注了${list.followerNum}人</a>
                    </div>
                </div>
                <div class="main_right">
                    <div class="xuexili">
                        <i class="layui-icon layui-icon-chart"
                           style="float: left;margin-right: 10px;font-size: 20px;"></i>
                        <p>学习力：${list.studyPower}</p>
                        <p>学习效率：${list.studyEfficiency}</p>
                    </div>
                    <div class="learntime">
                        <i class="layui-icon layui-icon-log"
                           style="float: left;margin-right: 10px;font-size: 20px;"></i>
                        <p>学习时长：${list.userDateTime}小时</p>
                        <p>学习成长量：${list.studyGrowup}</p>
                        <p>技能水平：${list.studyStandard}</p>
                    </div>
                </div>
            </div>
        </c:forEach>--%>
        <div id="demo7" style="float: right;margin: 50px 20px auto"></div>
    </c:if>
    <input id="user_id" value="${userId}" style="display: none">
</div>
<%--分页--%>
<script>
    $(function () {
        /*分页*/
        showHefollows();getPage();
        /*点击已关注 取消关注*/
        $(".ok_zi").click(function () {
            let str = $(this).prev().prev().text() + '';
            nofollow(str,$(this));
        });
        /*点击加关注*/
        $(".no_zi").click(function () {
            let str = $(this).prev().prev().text() + '';
            jiafollow(str,$(this));
        });
        $(".att_success1,.att_success2,.att_success3,.att_success4,.att_success5").hide();
    });
    /*----------------------分页--------------------------*/
    var page = 1;
    var limit = 2;
    var total;
    var userId1 =${userId};
    function showHefollows() {
        $.ajax({
            type: "post",
            url: "/follow/userfollowed",
            async: false,
            dataType: 'json',
            data: {
                "page": page,
                "limit": limit,
                "userId":userId1
            },
            success: function (data) {
                total = data.count;
                var foll = data.list;
                var userId = data.userId;
                var html = '';
                for (var i = 0;i<foll.length;i++){
                    html += '<div class="hefollows_main"><div class="main_left">';
                    html += '<img src="../../img/headimg.jpg" /><p class="name">'+ foll[i].userRealname+'</p>';
                    html += '<div class="attention_type">';
                    if (foll[i].userId!==userId) {
                        if (foll[i].followType === 1) {
                            html += '<span style="display: none">' + foll[i].userId + '</span>';
                            html += '<p class="ok">√</p><p class="ok_zi">已关注</p>';
                        }
                        if (foll[i].followType === 0) {
                            html += '<span style="display: none">' + foll[i].userId + '</span>';
                            html += '<p class="jia">+</p><p class="no_zi">加关注</p>';
                        }
                    }
                    html += '<div class="att_tan"><div class="att_success1">';
                    html += '<p class="att_success_ok1">√</p><p class="att_success_zi1">取消关注成功!</p>';
                    html += '</div><div class="att_success2">';
                    html += '<p class="att_success_no1">X</p><p class="att_success_zi2">取消关注失败，请重新操作！</p>';
                    html += '</div><div class="att_success3">';
                    html += '<p class="att_success_noo">!</p><p class="att_success_zi3">加载超时，请稍后再试！</p>';
                    html += '</div><div class="att_success4">';
                    html += '<p class="att_success_ok2">√</p><p class="att_success_zi4">关注成功!</p>';
                    html += '</div><div class="att_success5">';
                    html += '<p class="att_success_no2">X</p><p class="att_success_zi5">关注失败，请重新操作！</p>';
                    html += '</div></div></div><p class="sdf">失败并不可怕，可怕的是你不渴望成功！可怕的是你不渴望成功！</p>';
                    html += '<div class="attention_person">';
                    html += '<a class="attention_him">'+ foll[i].followedNum+'人关注了ta</a>';
                    html += '<a class="he_attention">ta关注了'+ foll[i].followerNum+'人</a>';
                    html += '</div></div><div class="main_right"><div class="xuexili">';
                    html += '<i class="layui-icon layui-icon-chart"' +
                        'style="float: left;margin-right: 10px;font-size: 20px;"></i>';
                    html += '<p>学习力：'+ foll[i].studyPower+'</p>';
                    html += '<p>学习效率：'+ foll[i].studyEfficiency+'</p>';
                    html += '</div><div class="learntime">';
                    html += '<i class="layui-icon layui-icon-log"' +
                        'style="float: left;margin-right: 10px;font-size: 20px;"></i>';
                    html += '<p>学习时长：'+ foll[i].userDateTime+'小时</p>';
                    html += '<p>学习成长量：'+ foll[i].studyGrowup+'</p>';
                    html += '<p>技能水平：'+ foll[i].studyStandard+'</p>';
                    html += '</div></div></div>';
                }
                $(".main").empty().append(html);
            }
        })
    }
    function getPage(){
        layui.use('laypage', function() {
            var laypage = layui.laypage;
            //完整功能
            laypage.render({
                elem: 'demo7'
                ,count: total //数据总数
                ,theme: '#914FF1'
                ,limit:limit
                ,layout: ['prev', 'page', 'next', 'count']
                ,jump: function(obj,first){
                    page=obj.curr;
                    limit=obj.limit;
                    if(!first){
                        showHefollows();
                        $(".ok_zi").click(function () {
                            let str = $(this).prev().prev().text() + '';
                            nofollow(str,$(this));
                        });
                        /*点击加关注*/
                        $(".no_zi").click(function () {
                            let str = $(this).prev().prev().text() + '';
                            jiafollow(str,$(this));
                        });
                        $(".att_success1,.att_success2,.att_success3,.att_success4,.att_success5").hide();
                    }
                }
            });
        });
    }
    /*-----------------------点击已关注 取消关注--------------------*/
    function nofollow(userId,mythis){
        $.ajax({
            url:"/follow/defollow?userId="+userId,
            type:"GET",
            dataType:"json",
            context: userId,
            success:function (data) {
                if (data.code === '1'){
                    mythis.hide();
                    mythis.siblings(".ok").hide();
                    mythis.siblings(".jia,.no_zi").show();
                    mythis.parents().siblings(".att_tan").children(".att_success1").show().delay(2000).hide(300);
                } else {
                    mythis.parents().siblings(".att_tan").children(".att_success2").show().delay(2000).hide(300);
                }
            },
            error:function () {
                mythis.parents().siblings(".att_tan").children(".att_success3").show().delay(2000).hide(300);
            }
        });
    }
    /*---------------------------点击加关注--------------------------*/
    function jiafollow(userId,mythis){
        $.ajax({
            url:"/follow/follow?userId="+userId,
            type:"GET",
            dataType:"json",
            success:function (data) {
                if (data.code === '1'){
                    mythis.hide();
                    mythis.siblings(".jia").hide();
                    mythis.siblings(".ok,.ok_zi").show();
                    mythis.parents().siblings(".att_tan").children(".att_success4").show().delay(2000).hide(300);
                } else {
                    mythis.parents().siblings(".att_tan").children(".att_success5").show().delay(2000).hide(300);
                }
            },
            error:function () {
                mythis.parents().siblings(".att_tan").children(".att_success3").show().delay(2000).hide(300);
            }
        });
    }
</script>
</body>
</html>
