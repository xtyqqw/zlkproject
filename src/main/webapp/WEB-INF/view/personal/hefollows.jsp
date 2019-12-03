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
            position: relative;
            margin: -100px auto;
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
    <c:if test="${list.size()==0}">
        <p class="noperson">ta没有关注任何人</p>
    </c:if>
    <c:if test="${list.size()!=0}">
        <c:forEach items="${list}" var="list">
            <div class="hefollows_main">
                <div class="main_left">
                    <!-- 头像 -->
                    <img src="../../img/headimg.jpg" />
                    <!-- 昵称 -->
                    <p class="name">${list.userRealname}</p>
                    <!-- 关注状态 -->
                    <div class="attention_type">
                        <!-- 已关注 -->
                        <c:if test="${list.followType==1}">
                            <p class="ok">√</p>
                            <p class="ok_zi" onclick="nofollow('${list.userId}')">已关注</p>
                        </c:if>
                        <!-- 加关注 -->
                        <c:if test="${list.followType==0}">
                            <p class="jia">+</p>
                            <p class="no_zi" onclick="jiafollow('${list.userId}')">加关注</p>
                        </c:if>

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
        </c:forEach>
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
    </c:if>


</div>
<%--点击关注事件--%>
<script type="text/javascript">
    /*点击已关注 取消关注*/
    $(".att_success1,.att_success2,.att_success3,.att_success4,.att_success5").hide();
    function nofollow(userId){
        /*var mythis = $(this);
        var layer = layui.layer;*/
        $.ajax({
            url:"/follow/defollow?userId="+userId,
            type:"GET",
            dataType:"json",
            context: userId,
            success:function (data) {
                if (data.code==1){
                    $(".ok,.ok_zi").hide();
                    $(".jia,.no_zi").show();
                    $(".att_success1").show().delay(2000).hide(300);
                    /*mythis.hide();
                    mythis.siblings(".ok").hide();
                    mythis.siblings(".jia,.no_zi").show();*/
                } else {
                    $(".att_success2").show().delay(2000).hide(300);
                }
            },
            error:function () {
                $(".att_success3").show().delay(2000).hide(300);
            }
        });
    };
    /*点击加关注*/
    function jiafollow(userId){
        $.ajax({
            url:"/follow/follow?userId="+userId,
            type:"GET",
            dataType:"json",
            success:function (data) {
                if (data.code == 1){
                    alert("关注成功！");
                    $(".ok,.ok_zi").show();
                    $(".jia,.no_zi").hide();
                    $(".att_success4").show().delay(2000).hide(300);
                    /*$(this).hide();
                    $(this).siblings(".jia").hide();
                    $(this).siblings(".ok,.ok_zi").show();
                    layer.msg("关注成功！");*/
                } else {
                    $(".att_success5").show().delay(2000).hide(300);
                }
            },
            error:function (data) {
                $(".att_success3").show().delay(2000).hide(300);
            }
        });
    };
</script>
</body>
</html>
