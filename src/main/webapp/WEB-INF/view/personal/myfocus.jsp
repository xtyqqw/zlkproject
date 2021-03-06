<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/11/26
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>我的关注</title>
    <script src="/js/jquery-1.12.4.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <style type="text/css">
        /*没有关注信息*/
        .nomain {margin: 50px auto;text-align: center;}
        .nomain h2 {color: #999999;letter-spacing: 5px;font-size: 24px;}
        /* 有关注信息 */
        .main{margin: 0 auto;width: 1000px;}
        .waik{background-color: #FAFAFA;}
        .waik:hover{background-color: #fff;box-shadow: 1px 1px 5px 1px #D4D4D4;}
        /* 上半部分 */
        .up{margin: 20px;height: 150px;border-bottom: 1px solid #D4D4D4;}
        /* 上半部分的左边 */
        .up_left{float: left;padding: 20px;}
        /* 头像 */
        .up_left img{
            height: 50px;width: 50px;
            border-radius: 50%;
            float: left;
        }
        /* 昵称 */
        .up_left .name{
            float: left;
            font-size: 16px;
            line-height: 3;
            margin: 0 20px;
        }
        /* 关注状态 */
        .up_left .attention_type{
            float: left;
            margin: 13px auto;
            cursor: pointer;
        }
        /* 已关注和加关注的图标样式 */
        .up_left .attention_type .ok,.jia{
            height: 20px;
            width: 20px;
            border-radius: 50%;
            text-align: center;
            line-height: 1;
            color: #fff;
            font-size: 20px;
            float: left;
        }
        .up_left .attention_type .ok{
            border: 1px solid #5ab62f;
            background-color: #5ab62f;
        }
        .up_left .attention_type .jia{
            border: 1px solid #343434;
            background-color: #343434;
            display: none;
        }
        .up_left .attention_type .no_zi{
            display: none;
        }
        .up_left .attention_type .ok_zi,.no_zi{
            font-size: 14px;
            color: #999999;
            float: left;
            padding-left: 7px;
        }
        /* 个性签名 */
        .up_left .sdf{
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
            border: 1px solid #914FF1;
            border-radius: 50px;
            padding: 0 10px;
            background-color: #914FF1;
            color: #fff;
        }
        .attention_person .attention_him{
            margin-right: 20px;
        }
        .attention_person .attention_him:hover{
            background-color: #914ef3;
            cursor: pointer;
        }
        .attention_person .he_attention:hover{
            background-color: #914ef3;
            cursor: pointer;
            color: #fff;
        }
        .up_right{
            float: right;
        }
        .up_right .xuexili,.learntime{
            margin: 20px auto;
            padding: 8px;
        }
        .up_right .xuexili p{
            float: left;
            margin-right: 20px;
            color: #676767;
            padding: 2px 0;
        }
        .up_right .learntime p{
            float: left;
            margin-right: 20px;
            color: #676767;
            padding: 2px 0;
        }
        /* 最新动态 */
        .down .latest_news{
            margin-left: 110px;
            padding-bottom: 10px;
        }
        /* 无动态 */
        .down .down_no_news{
            margin: 10px auto;
            text-align: center;
            font-size: 17px;
            color: #999;
            padding-bottom: 70px;
        }
        /* 有动态 */
        .down .down_yes_news{
            float: left;
            padding: 5px 20px 10px 150px;
            width: 800px;
            font-size: 16px;
        }
        .down .bigp{
            width: 650px;
            overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;
            display: inline-block;
        }
        .down .bigp .user{
            float: left;
        }
        .down .bigp .time,.article{
            color: #904ff1;
        }
        .down .down_yes_news .date{
            float: right;
            color: #999999;
            font-size: 15px;
        }
        .down .bigp a{
            color: #904ff1;
        }
        /*取消关注弹窗*/
        .att_tan{
            left: 330px;
            top: 200px;
        }
        .att_success1,.att_success2,.att_success3,.att_success4,.att_success5{
            width: 400px;
            height: 70px;
            text-align: center;
            position: fixed;
            margin: 100px 300px;
            box-shadow: 1px 1px 5px 1px #D4D4D4;
            background-color: #FFFFFF;
            border-radius: 3px;
        }
        .att_success_zi1,.att_success_zi2,.att_success_zi3,.att_success_zi4,.att_success_zi5{
            font-size: 18px;
            position: fixed;
        }
        .att_tan .att_success_zi1{
            margin: 23px 160px;
        }
        .att_tan .att_success_zi2{
            margin: 23px 100px;
        }
        .att_tan .att_success_zi3{
            margin: 23px 120px;
        }
        .att_tan .att_success_zi4{
            margin: 23px 170px;
        }
        .att_tan .att_success_zi5{
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
<%--点击关注人事件--%>
<script type="text/javascript">
    $(document).ready(function(){
        $(".attention_him").click(function(){
            $(".main").css("display","none");
            $("iframe").css("display","block");
        });
        $(".he_attention").click(function(){
            $(".main").css("display","none");
            $("iframe").css("display","block");
        });
    });
</script>
<iframe name="attention" style="border: 1px solid #fff;width: 1000px;margin: 50px 22px;
			float: left;display: none;height: 800px;"></iframe>
<%--没有关注信息--%>
<c:if test="${count == 0}">
    <div class="nomain">
        <h2>对不起，你当前暂无任何关注信息</h2>
    </div>
</c:if>
<%--有关注信息--%>
<c:if test="${count!= 0}">
    <div class="main">
        <%--<c:forEach items="${list}" var="bignum" >
            <div class="waik">
                <div class="up">
                    <div class="up_left">
                        <!-- 头像 -->
                        <img src="../../img/headimg.jpg"/>
                        <!-- 昵称 -->
                        <p class="name">${bignum.userRealname}</p>
                        <!-- 关注状态 -->
                        <div class="attention_type">
                            <!-- 已关注 -->
                            <span style="display: none">${bignum.userId}</span>
                            <p class="ok">√</p>
                            <p class="ok_zi">已关注</p>
                            <!-- 加关注 -->
                            <span style="display: none">${bignum.userId}</span>
                            <p class="jia">+</p>
                            <p class="no_zi">加关注</p>
                        </div>
                        &lt;%&ndash;已关注未关注的弹窗&ndash;%&gt;
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
                        <!-- 个性签名 -->
                        <p class="sdf">失败并不可怕，可怕的是你不渴望成功！可怕的是你不渴望成功！</p>
                        <!-- 关注人情况 -->
                        <div class="attention_person">
                            <a href="<%=request.getContextPath()%>/follow/userfollowed?userId=${bignum.userId}"
                               name="attention" class="attention_him">${bignum.followedNum}人关注了ta</a>
                            <a href="<%=request.getContextPath()%>/follow/userfollower?userId=${bignum.userId}"
                               name="attention" class="he_attention">ta关注了${bignum.followerNum}人</a>
                        </div>
                    </div>
                    <!-- 上半部分的右边部分 -->
                    <div class="up_right">
                        <div class="xuexili">
                            <i class="layui-icon layui-icon-chart"
                               style="float: left;margin-right: 10px;font-size: 20px;"></i>
                            <p>学习力：${bignum.studyPower}</p>
                            <p>学习效率：${bignum.studyEfficiency}</p>
                        </div>
                        <div class="learntime">
                            <i class="layui-icon layui-icon-log"
                               style="float: left;margin-right: 10px;font-size: 20px;"></i>
                            <p>学习时长：${bignum.userDateTime}小时</p>
                            <p>学习成长量：${bignum.studyGrowup}</p>
                            <p>技能水平：${bignum.studyStandard}</p>
                        </div>
                    </div>
                </div>
                <!-- 无最新动态 -->
                <c:if test="${bignum.list.size()==0}">
                    <div class="down">
                        <h2 class="latest_news">最新动态</h2>
                            &lt;%&ndash;无动态&ndash;%&gt;
                        <p class="down_no_news">该用户暂无任何动态信息</p>
                    </div>
                </c:if>
                &lt;%&ndash;有最新动态&ndash;%&gt;
                <c:if test="${bignum.list.size()!=0}">
                    <div class="down">
                        <h2 class="latest_news">最新动态</h2>
                        <c:forEach items="${bignum.list}" var="snum">
                            &lt;%&ndash;1上传文章&ndash;%&gt;
                            <c:if test="${snum.actionType==1}">
                                <div class="down_yes_news">
                                    <div class="bigp">
                                        <p class="user">${bignum.userRealname}&nbsp;</p>
                                        <span class="time">${snum.leaveTime}</span>
                                        <span class="action">上传了一篇文章：</span>
                                        <span class="article">
                                        <a href="/community/article-show?articleId="+${snum.articleId}>${snum.articleName}</a>
                                    </span>
                                    </div>
                                    <span class="date">${snum.dateFormat}</span>
                                </div>
                            </c:if>
                            &lt;%&ndash;2评论文章&ndash;%&gt;
                            <c:if test="${snum.actionType==2}">
                                <div class="down_yes_news">
                                    <div class="bigp">
                                        <p class="user">${bignum.userRealname}&nbsp;</p>
                                        <span class="time">${snum.leaveTime}</span>
                                        <span class="action">评论了</span>
                                        <span class="reply_user">
                                        <a href="/community/article-show?articleId="+${snum.articleId}>${snum.problemUser}</a>
                                    </span>
                                        <span class="action">的文章</span>
                                        <span class="article">
                                        <a href="javascript:;">${snum.articleName}</a>
                                    </span>
                                    </div>
                                    <span class="date">${snum.dateFormat}</span>
                                </div>
                            </c:if>
                            &lt;%&ndash;3回复评论&ndash;%&gt;
                            <c:if test="${snum.actionType == 3}">
                                <div class="down_yes_news">
                                    <div class="bigp">
                                        <p class="user">${bignum.userRealname}&nbsp;</p>
                                        <span class="time">${snum.leaveTime}</span>
                                        <span class="action">回复了</span>
                                        <span class="reply_user">
                                        <a href="javascript:;">${snum.replyUser}</a>
                                    </span>
                                        <span class="jiu">就</span>
                                        <span class="problem_user">
                                        <a href="javascript:;">${snum.problemUser}</a>：
                                    </span>
                                        <span class="action">的文章</span>
                                        <span class="article">
                                        <a href="/community/article-show?articleId="+${snum.articleId}>${snum.articleName}</a>
                                    </span>
                                    </div>
                                    <span class="date">${snum.dateFormat}</span>
                                </div>
                            </c:if>
                            &lt;%&ndash;4提出问题&ndash;%&gt;
                            <c:if test="${snum.actionType ==4}">
                                <div class="down_yes_news">
                                    <div class="bigp">
                                        <p class="user">${bignum.userRealname}&nbsp;</p>
                                        <span class="time">${snum.leaveTime}</span>
                                        <span class="action">提出了一个问题：</span>
                                        <span class="article">
                                        <a href="javascript:;">${snum.articleName}</a>
                                    </span>
                                    </div>
                                    <span class="date">${snum.dateFormat}</span>
                                </div>
                            </c:if>
                            &lt;%&ndash;5回答问题&ndash;%&gt;
                            <c:if test="${snum.actionType ==5}">
                                <div class="down_yes_news">
                                    <div class="bigp">
                                        <p class="user">${bignum.userRealname}&nbsp;</p>
                                        <span class="time">${snum.leaveTime}</span>
                                        <span class="action">回答了</span>
                                        <span class="reply_user">
                                        <a href="javascript:;">${snum.problemUser}</a>
                                    </span>
                                        <span class="action">的问题</span>
                                        <span class="article">
                                        <a href="javascript:;">${snum.articleName}</a>
                                    </span>
                                    </div>
                                    <span class="date">${snum.dateFormat}</span>
                                </div>
                            </c:if>
                            &lt;%&ndash;6回复答案&ndash;%&gt;
                            <c:if test="${snum.actionType ==6}">
                                <div class="down_yes_news">
                                    <div class="bigp">
                                        <p class="user">${bignum.userRealname}&nbsp;</p>
                                        <span class="time">${snum.leaveTime}</span>
                                        <span class="action">回复了</span>
                                        <span class="reply_user">
                                        <a href="javascript:;">${snum.replyUser}</a>
                                    </span>
                                        <span class="jiu">就</span>
                                        <span class="problem_user">
                                        <a href="javascript:;">${snum.problemUser}</a>：
                                    </span>
                                        <span class="action">的问题</span>
                                        <span class="article">
                                        <a href="javascript:;">${snum.articleName}</a>
                                    </span>
                                    </div>
                                    <span class="date">${snum.dateFormat}</span>
                                </div>
                            </c:if>
                        </c:forEach>
                            &lt;%&ndash;上下箭头&ndash;%&gt;
                        <i class="layui-icon layui-icon-up"
                           style="font-size: 30px;margin: 0 485px;color: #999999;" hidden></i>
                        <i class="layui-icon layui-icon-down"
                           style="font-size: 30px;margin: 0 485px;color: #999999;"></i>
                    </div>
                </c:if>
            </div>
        </c:forEach>--%>
    </div>
    <div>
        <div id="demo7" style="float: right;margin: 50px 20px auto"></div>
    </div>

</c:if>
<script>
    $(function () {
        updown();
        showFocus();getPage();
        $(".no_zi").click(function () {
            let str = $(this).prev().prev().text() + '';
            jiafollow(str,$(this));
        });
        $(".ok_zi").click(function () {
            let str = $(this).prev().prev().text() + '';
            nofollow(str,$(this));
        });
        $(".att_success1,.att_success2,.att_success3,.att_success4,.att_success5").hide();
    });
    /*--------------------点击上下箭头显示隐藏动态---------------*/
    function updown(){
        $(".down_yes_news:eq(1)").hide();
        /*$(".down_yes_news").nextAll(".down_yes_news:eq(5)").hide();*/
        //点击向上箭头
        $(".layui-icon-up").click(function () {
            $(this).hide();
            $(this).siblings(".layui-icon-down").show();
            $(this).parent(".down").find(".down_yes_news:gt(1):lt(5)").slideUp();//动态信息向上隐藏
        });
        $(".layui-icon-down").click(function () {
            $(this).hide();
            $(this).siblings(".layui-icon-up").show();
            $(this).parent(".down").find(".down_yes_news").slideDown();//动态信息向下展示
        });
    }
    /*----------------------------点击已关注 取消关注---------------------------*/
    $(".att_success1,.att_success2,.att_success3,.att_success4,.att_success5").hide();
    $(".ok_zi").click(function () {
        let str = $(this).prev().prev().text() + '';
        nofollow(str,$(this));
    });
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
    /*----------------------------------点击加关注-------------------------------*/
    /*$(".no_zi").click(function () {
        let str = $(this).prev().prev().text() + '';
        jiafollow(str,$(this));
    });*/
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
    /*----------------------------分页---------------------------*/
    var page = 1;
    var limit = 3;
    var total;
    function showFocus() {
        $.ajax({
            type: "post",
            url: "/follow/myfollow",
            async: false,
            dataType: 'json',
            data: {
                "page": page,
                "limit": limit,
            },
            success: function (data) {
                total = data.count;
                var focus = data.list;
                var html = '';
                for (var i = 0;i<focus.length;i++){
                    html += '<div class="waik"><div class="up"><div class="up_left">';
                    if (focus[i].userImg == null){
                        html += '<img src="../../../img/headimg.png"/>';
                    }
                    if (focus[i].userImg != null){
                        html += '<img src="'+ focus[i].userImg +'"/>';
                    }
                    html += '<p class="name">'+ focus[i].userRealname+'</p>';
                    html += '<div class="attention_type">';
                    html += '<span style="display: none">'+ focus[i].userId+'</span>';
                    html += '<p class="ok">√</p><p class="ok_zi">已关注</p>';
                    html += '<span style="display: none">'+ focus[i].userId+'</span>';
                    html += '<p class="jia">+</p><p class="no_zi">加关注</p>';
                    html += '</div><div class="att_tan"><div class="att_success1">';
                    html += '<p class="att_success_ok1">√</p>';
                    html += '<p class="att_success_zi1">取消关注成功!</p>';
                    html += '</div><div class="att_success2">';
                    html += '<p class="att_success_no1">X</p>';
                    html += '<p class="att_success_zi2">取消关注失败，请重新操作！</p></div>';
                    html += '<div class="att_success3"><p class="att_success_noo">!</p>';
                    html += '<p class="att_success_zi3">加载超时，请稍后再试！</p></div>';
                    html += '<div class="att_success4"><p class="att_success_ok2">√</p>';
                    html += '<p class="att_success_zi4">关注成功!</p></div>';
                    html += '<div class="att_success5"><p class="att_success_no2">X</p>';
                    html += '<p class="att_success_zi5">关注失败，请重新操作！</p></div></div>';
                    html += '<p class="sdf">失败并不可怕，可怕的是你不渴望成功！可怕的是你不渴望成功！</p>';
                    html += '<div class="attention_person">';
                    html += '<a href="/follow/hefollows?userId='+ focus[i].userId+'"' +
                        'name="attention" class="attention_him">'+ focus[i].followedNum+'人关注了ta</a>';
                    html += '<a href="/follow/followshim?userId='+ focus[i].userId+'"' +
                        'name="attention" class="he_attention">ta关注了'+ focus[i].followerNum+'人</a>';
                    html += '</div></div><div class="up_right"><div class="xuexili">';
                    html += '<i class="layui-icon layui-icon-chart" style="float: left;margin-right: 10px;font-size: 20px;"></i>';
                    html += '<p>学习力：'+ focus[i].studyPower+'</p><p>学习效率：'+ focus[i].studyEfficiency+'</p>';
                    html += '</div><div class="learntime">';
                    html += '<i class="layui-icon layui-icon-log" style="float: left;margin-right: 10px;font-size: 20px;"></i>';
                    html += '<p>学习时长：'+ focus[i].userDateTime+'小时</p><p>学习成长量：'+ focus[i].studyGrowup+'</p>';
                    html += '<p>技能水平：'+ focus[i].studyStandard+'</p></div></div></div>';
                    if (focus[i].list.length===0){
                        html += '<div class="down"><h2 class="latest_news">最新动态</h2>';
                        html += '<p class="down_no_news">该用户暂无任何动态信息</p></div>';
                    }
                    if (focus[i].list.length!==0){
                        html += '<div class="down"><h2 class="latest_news">最新动态</h2>';
                        for (var j=0;j<focus[i].list.length;j++){
                            /*1 上传文章*/
                            if (focus[i].list.actionType===1){
                                html += '<div class="down_yes_news"><div class="bigp">';
                                html += '<p class="user">'+ focus[i].userRealname+'  </p>';
                                html += '<span class="time">'+ focus[i].list[j].leaveTime+'</span>';
                                html += '<span class="action">上传了一篇文章：</span><span class="article">';
                                html += '<a href="/community/article-show?articleId="+'+ focus[i].list[j].articleId+'>'+ focus[i].list[j].articleName+'</a>';
                                html += '</span></div><span class="date">'+ focus[i].list[j].dateFormat+'</span></div>';
                            }
                            /*2 评论文章*/
                            if (focus[i].list.actionType===2){
                                html += '<div class="down_yes_news"><div class="bigp">';
                                html += '<p class="user">'+ focus[i].userRealname+'  </p>';
                                html += '<span class="time">'+ focus[i].list[j].leaveTime+'</span>';
                                html += '<span class="action">评论了</span><span class="reply_user">';
                                html += '<a href="/community/article-show?articleId="+'+ focus[i].list[j].articleId+'>'+ focus[i].list[j].problemUser+'</a>';
                                html += '</span><span class="action">的文章</span><span class="article">';
                                html += '<a href="javascript:;">'+ focus[i].list[j].articleName+'</a>';
                                html += '</span></div>';
                                html += '<span class="date">'+ focus[i].list[j].dateFormat+'</span></div>';
                            }
                            /*3 回复评论*/
                            if (focus[i].list.actionType===3){
                                html += '<div class="down_yes_news"><div class="bigp">';
                                html += '<p class="user">'+ focus[i].userRealname+'  </p>';
                                html += '<span class="time">'+ focus[i].list[j].leaveTime+'</span>';
                                html += '<span class="action">回复了</span><span class="reply_user">';
                                html += '<a href="javascript:;">'+ focus[i].list[j].replyUser+'</a></span>';
                                html += '<span class="jiu">就</span><span class="problem_user">';
                                html += '<a href="javascript:;">'+ focus[i].list[j].problemUser+'</a>：</span>';
                                html += '<span class="action">的文章</span><span class="article">';
                                html += '<a href="/community/article-show?articleId="+'+ focus[i].list[j].articleId+'>'+ focus[i].list[j].articleName+'</a>';
                                html += '</span></div><span class="date">'+ focus[i].list[j].dateFormat+'</span></div>';
                            }
                            /*4 提出问题*/
                            if (focus[i].list.actionType===4){
                                html += '<div class="down_yes_news"><div class="bigp">';
                                html += '<p class="user">'+ focus[i].userRealname+'  </p>';
                                html += '<span class="time">'+ focus[i].list[j].leaveTime+'</span>';
                                html += '<span class="action">提出了一个问题：</span><span class="article">';
                                html += '<a href="javascript:;">'+ focus[i].list[j].articleName+'</a>';
                                html += '</span></div><span class="date">'+ focus[i].list[j].dateFormat+'</span></div>';
                            }
                            /*5 回答问题*/
                            if (focus[i].list.actionType===5){
                                html += '<div class="down_yes_news"><div class="bigp">';
                                html += '<p class="user">'+ focus[i].userRealname+'  </p>';
                                html += '<span class="time">'+ focus[i].list[j].leaveTime+'</span>';
                                html += '<span class="action">回答了</span><span class="reply_user">';
                                html += '<a href="javascript:;">'+ focus[i].list[j].problemUser+'</a></span>';
                                html += '<span class="action">的问题</span><span class="article">';
                                html += '<a href="javascript:;">'+ focus[i].list[j].articleName+'</a>';
                                html += '</span></div><span class="date">'+ focus[i].list[j].dateFormat+'</span></div>';
                            }
                            /*6 回复答案*/
                            if (focus[i].list.actionType===6){
                                html += '<div class="down_yes_news"><div class="bigp">';
                                html += '<p class="user">'+ focus[i].userRealname+'  </p>';
                                html += '<span class="time">'+ focus[i].list[j].leaveTime+'</span>';
                                html += '<span class="action">回复了</span><span class="reply_user">';
                                html += '<a href="javascript:;">'+ focus[i].list[j].replyUser+'</a></span>';
                                html += '<span class="jiu">就</span><span class="problem_user">';
                                html += '<a href="javascript:;">'+ focus[i].list[j].problemUser+'</a>：</span>';
                                html += '<span class="action">的问题</span><span class="article">';
                                html += '<a href="javascript:;">'+ focus[i].list[j].articleName+'</a>';
                                html += '</span></div>';
                                html += '<span class="date">'+ focus[i].list[j].dateFormat+'</span></div>';
                            }
                        }
                        html += '<i class="layui-icon layui-icon-up"' +
                            'style="font-size: 30px;margin: 0 485px;color: #999999;" hidden></i>';
                        html += '<i class="layui-icon layui-icon-down"' +
                            'style="font-size: 30px;margin: 0 485px;color: #999999;"></i>';
                        html += '</div>';
                    }
                    html += '</div>';
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
                        showFocus();
                        $(".no_zi").click(function () {
                            let str = $(this).prev().prev().text() + '';
                            jiafollow(str,$(this));
                        });
                        $(".ok_zi").click(function () {
                            let str = $(this).prev().prev().text() + '';
                            nofollow(str,$(this));
                        });
                        $(".att_success1,.att_success2,.att_success3,.att_success4,.att_success5").hide();
                    }
                }
            });
        });
    }
</script>
</body>
</html>
