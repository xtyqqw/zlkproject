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
            border: 1px solid #bec3d9;
            border-radius: 50px;
            padding: 0 10px;
            background-color: #bec3d9;
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
    </style>
</head>
<body>
<%--点击关注人事件--%>
<script type="text/javascript">
    $(document).ready(function(){
        $(".attention_him").click(function(){
            $(".main").css("display","none")
            $("iframe").css("display","block");
        });
        $(".he_attention").click(function(){
            $(".main").css("display","none")
            $("iframe").css("display","block");
        });
    });
</script>
<iframe name="attention" style="border: 1px solid #fff;width: 1000px;margin: 50px 22px;
			float: left;display: none;height: 800px;"></iframe>
<%--没有关注信息--%>
<c:if test="${list.size()} == 0">
    <div class="nomain">
        <h2>对不起，你当前暂无任何关注信息</h2>
    </div>
</c:if>
<%--有关注信息--%>
<c:if test="${list.size()!= 0}">
    <div class="main">
        <c:forEach items="${list}" var="bignum" >
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
                            <a href="<%=request.getContextPath()%>/follow/userfollower"
                               name="attention" class="attention_him">${bignum.followerNum}人关注了ta</a>
                            <a href="<%=request.getContextPath()%>/follow/userfollowed"
                               name="attention" class="he_attention">ta关注了${bignum.followedNum}人</a>
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
                            <p>学习时长：${bignum.studyTime}小时</p>
                            <p>学习成长量：${bignum.studyGrowup}</p>
                            <p>技能水平：${bignum.studyStandard}</p>
                        </div>
                    </div>
                </div>
                <!-- 无最新动态 -->
                <c:if test="${bignum.list.size()==0}">
                    <div class="down">
                        <h2 class="latest_news">最新动态</h2>
                            <%--无动态--%>
                        <p class="down_no_news">该用户暂无任何动态信息</p>
                    </div>
                </c:if>
                <%--有最新动态--%>
                <c:if test="${bignum.list.size()!=0}">
                    <div class="down">
                        <h2 class="latest_news">最新动态</h2>
                        <c:forEach items="${bignum.list}" var="snum">
                            <%--1上传文章--%>
                            <c:if test="${snum.actionType==1}">
                                <div class="down_yes_news">
                                    <div class="bigp">
                                        <p class="user">${bignum.userRealname}&nbsp;</p>
                                        <span class="time">${snum.leaveTime}</span>
                                        <span class="action">上传了一篇文章：</span>
                                        <span class="article">
                                        <a href="javascript:;">${snum.articleName}</a>
                                    </span>
                                    </div>
                                    <span class="date">${snum.dateFormat}</span>
                                </div>
                            </c:if>
                            <%--2评论文章--%>
                            <c:if test="${snum.actionType==2}">
                                <div class="down_yes_news">
                                    <div class="bigp">
                                        <p class="user">${bignum.userRealname}&nbsp;</p>
                                        <span class="time">${snum.leaveTime}</span>
                                        <span class="action">评论了</span>
                                        <span class="reply_user">
                                        <a href="javascript:;">${snum.problemUser}</a>
                                    </span>
                                        <span class="action">的文章</span>
                                        <span class="article">
                                        <a href="javascript:;">${snum.articleName}</a>
                                    </span>
                                    </div>
                                    <span class="date">${snum.dateFormat}</span>
                                </div>
                            </c:if>
                            <%--3回复评论--%>
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
                                        <a href="javascript:;">${snum.articleName}</a>
                                    </span>
                                    </div>
                                    <span class="date">${snum.dateFormat}</span>
                                </div>
                            </c:if>
                            <%--4提出问题--%>
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
                            <%--5回答问题--%>
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
                            <%--6回复答案--%>
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
                            <%--上下箭头--%>
                        <i class="layui-icon layui-icon-up"
                           style="font-size: 30px;margin: 0 485px;color: #999999;" hidden></i>
                        <i class="layui-icon layui-icon-down"
                           style="font-size: 30px;margin: 0 485px;color: #999999;"></i>
                    </div>
                </c:if>
            </div>
        </c:forEach>
    </div>
    <%--<div class="flow_div"></div>--%>
</c:if>
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
                        url: "/follow/follower",
                        dataType: "json",
                        data: data,
                        success: function (map) {
                            layui.each(map.list, function (i, courses) {
                                lis.push(
                                    '<div class="main">' +
                            '            <div class="waik">' +
                            '                <div class="up">' +
                            '                    <div class="up_left">' +
                            '                        <img src="../../img/headimg.jpg"/>' +
                            '                        <p class="name">'+courses.userRealname+'</p>' +
                            '                        <div class="attention_type">' +
                            '                            <p class="ok">√</p>' +
                            '                            <p class="ok_zi">已关注</p>' +
                            '                            <p class="jia">+</p>' +
                            '                            <p class="no_zi">加关注</p>' +
                            '                        </div>' +
                            '                        <p class="sdf">失败并不可怕，可怕的是你不渴望成功！可怕的是你不渴望成功！</p>' +
                            '                        <div class="attention_person">' +
                            '                            <a href="<%=request.getContextPath()%>/follow/userfollower"' +
                            '                               name="attention" class="attention_him">'+courses.followerNum+'人关注了ta</a>' +
                            '                            <a href="<%=request.getContextPath()%>/follow/userfollowed"' +
                            '                               name="attention" class="he_attention">ta关注了'+courses.followedNum+'人</a>' +
                            '                        </div>' +
                            '                    </div>' +
                            '                    <div class="up_right">' +
                            '                        <div class="xuexili">' +
                            '                            <i class="layui-icon layui-icon-chart"' +
                            '                               style="float: left;margin-right: 10px;font-size: 20px;"></i>' +
                            '                            <p>学习力：'+courses.studyPower+'</p>' +
                            '                            <p>学习效率：'+courses.studyEfficiency+'</p>' +
                            '                        </div>' +
                            '                        <div class="learntime">' +
                            '                            <i class="layui-icon layui-icon-log"' +
                            '                               style="float: left;margin-right: 10px;font-size: 20px;"></i>' +
                            '                            <p>学习时长：'+courses.studyTime+'小时</p>' +
                            '                            <p>学习成长量：'+courses.studyGrowup+'</p>' +
                            '                            <p>技能水平：'+courses.studyStandard+'</p>' +
                            '                        </div>' +
                            '                    </div>' +
                            '                </div>' +
                            '                <c:if test="'+list1.list.size()==0+'">' +
                            '                    <div class="down">' +
                            '                        <h2 class="latest_news">最新动态</h2>' +
                            '                            &lt;%&ndash;无动态&ndash;%&gt;' +
                            '                        <p class="down_no_news">该用户暂无任何动态信息</p>' +
                            '                    </div>' +
                            '                </c:if>' +
                            '                    &lt;%&ndash;有最新动态&ndash;%&gt;' +
                            '                <c:if test="${list1.list.size()>0}">' +
                            '                    <div class="down">' +
                            '                        <h2 class="latest_news">最新动态</h2>' +
                            '                        <c:forEach items="${list1.list}" >' +
                            '                            &lt;%&ndash;1上传文章&ndash;%&gt;' +
                            '                            <c:if test="${nem.actionType==1}">' +
                            '                                <div class="down_yes_news">' +
                            '                                    <div class="bigp">' +
                            '                                        <p class="user">'+courses.userRealname+'</p>' +
                            '                                        <span class="time">'+coursesnem.leaveTime+'</span>' +
                            '                                        <span class="action">上传了一篇文章：</span>' +
                            '                                        <span class="article">' +
                            '                                        <a href="javascript:;">'+courses.articleName+'</a>' +
                            '                                    </span>' +
                            '                                    </div>' +
                            '                                    <span class="date">'+courses.dateFormat+'</span>' +
                            '                                </div>' +
                            '                            </c:if>' +
                            '                            &lt;%&ndash;2评论文章&ndash;%&gt;' +
                            '                            <c:if test="${nem.actionType==2}">' +
                            '                                <div class="down_yes_news">' +
                            '                                    <div class="bigp">' +
                            '                                        <p class="user">'+courses.userRealname+'</p>' +
                            '                                        <span class="time">'+courses.leaveTime+'</span>' +
                            '                                        <span class="action">评论了</span>' +
                            '                                        <span class="reply_user">' +
                            '                                        <a href="javascript:;">'+courses.problemUser+'</a>' +
                            '                                    </span>' +
                            '                                        <span class="action">的文章</span>' +
                            '                                        <span class="article">' +
                            '                                        <a href="javascript:;">'+courses.articleName+'</a>' +
                            '                                    </span>' +
                            '                                    </div>' +
                            '                                    <span class="date">'+courses.dateFormat+'</span>' +
                            '                                </div>' +
                            '                            </c:if>' +
                            '                            &lt;%&ndash;3回复评论&ndash;%&gt;' +
                            '                            <c:if test="${nem.actionType==3}">' +
                            '                                <div class="down_yes_news">' +
                            '                                    <div class="bigp">' +
                            '                                        <p class="user">'+courses.userRealname+'</p>' +
                            '                                        <span class="time">'+courses.leaveTime+'</span>' +
                            '                                        <span class="action">回复了</span>' +
                            '                                        <span class="reply_user"' +
                            '                                        <a href="javascript:;">'+courses.replyUser+'</a>' +
                            '                                    </span>' +
                            '                                        <span class="jiu">就</span>' +
                            '                                        <span class="problem_user">' +
                            '                                        <a href="javascript:;">'+courses.problemUser+'</a>：' +
                            '                                    </span>' +
                            '                                        <span class="action">的文章</span>' +
                            '                                        <span class="article">' +
                            '                                        <a href="javascript:;">'+courses.articleName+'</a>' +
                            '                                    </span>' +
                            '                                    </div>' +
                            '                                    <span class="date">'+courses.dateFormat+'</span>' +
                            '                                </div>' +
                            '                            </c:if>' +
                            '                            &lt;%&ndash;4提出问题&ndash;%&gt;' +
                            '                            <c:if test="${nem.actionType==4}">' +
                            '                                <div class="down_yes_news">' +
                            '                                    <div class="bigp">' +
                            '                                        <p class="user">'+courses.userRealname+'</p>' +
                            '                                        <span class="time">'+courses.leaveTime+'</span>' +
                            '                                        <span class="action">提出了一个问题：</span>' +
                            '                                        <span class="article">' +
                            '                                        <a href="javascript:;">'+courses.articleName+'</a>' +
                            '                                    </span>' +
                            '                                    </div>' +
                            '                                    <span class="date">'+courses.dateFormat+'</span>' +
                            '                                </div>' +
                            '                            </c:if>' +
                            '                            &lt;%&ndash;5回答问题&ndash;%&gt;' +
                            '                            <c:if test="${nem.actionType==5}">' +
                            '                                <div class="down_yes_news">' +
                            '                                    <div class="bigp">' +
                            '                                        <p class="user">'+courses.userRealname+'</p>' +
                            '                                        <span class="time">'+courses.leaveTime+'</span>' +
                            '                                        <span class="action">回答了</span>' +
                            '                                        <span class="reply_user">' +
                            '                                        <a href="javascript:;">'+courses.problemUser+'</a>' +
                            '                                    </span>' +
                            '                                        <span class="action">的问题</span>' +
                            '                                        <span class="article">' +
                            '                                        <a href="javascript:;">'+courses.articleName+'</a>' +
                            '                                    </span>' +
                            '                                    </div>' +
                            '                                    <span class="date">'+courses.dateFormat+'</span>' +
                            '                                </div>' +
                            '                            </c:if>' +
                            '                            &lt;%&ndash;6回复答案&ndash;%&gt;' +
                            '                            <c:if test="${nem.actionType==6}">' +
                            '                                <div class="down_yes_news">' +
                            '                                    <div class="bigp">' +
                            '                                        <p class="user">'+courses.userRealname+'</p>' +
                            '                                        <span class="time">'+courses.leaveTime+'</span>' +
                            '                                        <span class="action">回复了</span>' +
                            '                                        <span class="reply_user">' +
                            '                                        <a href="javascript:;">'+courses.replyUser+'</a>' +
                            '                                    </span>' +
                            '                                        <span class="jiu">就</span>' +
                            '                                        <span class="problem_user">' +
                            '                                        <a href="javascript:;">'+courses.problemUser+'</a>：' +
                            '                                    </span>' +
                            '                                        <span class="action">的问题</span>' +
                            '                                        <span class="article">' +
                            '                                        <a href="javascript:;">'+courses.articleName+'</a>' +
                            '                                    </span>' +
                            '                                    </div>' +
                            '                                    <span class="date">'+courses.dateFormat+'</span>' +
                            '                                </div>' +
                            '                            </c:if>' +
                            '                        </c:forEach>' +
                            '                            &lt;%&ndash;上下箭头&ndash;%&gt;' +
                            '                        <i class="layui-icon layui-icon-up"' +
                            '                           style="font-size: 30px;margin: 0 485px;color: #999999;" hidden></i>' +
                            '                        <i class="layui-icon layui-icon-down"' +
                            '                           style="font-size: 30px;margin: 0 485px;color: #999999;"></i>' +
                            '                    </div>' +
                            '                </c:if>' +
                            '            </div>' +
                                '    </div>'
                                    )
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
        /*取消关注*/
        $(".ok_zi").click(function () {
            $.ajax({
                url:"/follow/defollow",
                type:"GET",
                dataType:"json",
                success:function (data) {
                    if (data.code()=="1"){
                        $(this).hide();
                        $(this).siblings(".ok").hide();
                        $(this).siblings(".jia,.no_zi").show();
                        layer.msg("取消关注成功！")
                    } else {
                        layer.msg("取消关注失败，请重新操作！");
                    }
                },
                error:function (data) {
                    layer.msg("加载超时，请稍后再试！");
                }
            });
        });
        $(".no_zi").click(function () {
            $.ajax({
                url:"/follow/follow",
                type:"GET",
                dataType:"json",
                success:function (data) {
                    if (data.code() == "1"){
                        $(this).hide();
                        $(this).siblings(".jia").hide();
                        $(this).siblings(".ok,.ok_zi").show();
                        layer.msg("关注成功！");
                    } else {
                        layer.msg("关注失败，请重新操作！");
                    }
                },
                error:function (data) {
                    layer.msg("加载超时，请稍后再试！");
                }
            });
        });
    });
</script>
<%--点击上下箭头显示隐藏动态--%>
<script type="text/javascript">
    $(document).ready(function () {
        /*$(".down_yes_news:gt(1)").hide();
        $(".down_yes_news").nextAll(".down_yes_news:eq(5)").hide();*/
        $(".down_yes_news:eq(2)").hide();
        $(".down_yes_news:eq(3)").hide();
        $(".down_yes_news:eq(4)").hide();
        $(".down_yes_news:eq(5)").hide();
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
    });
</script>
</body>
</html>
