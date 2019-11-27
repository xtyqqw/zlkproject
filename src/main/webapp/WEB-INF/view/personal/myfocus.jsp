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
            margin: auto 10px;
        }
        .up_left .attention_type .ok{
            border: 1px solid #5ab62f;
            background-color: #5ab62f;
        }
        .up_left .attention_type .jia{
            border: 1px solid #343434;
            background-color: #343434;
        }
        .up_left .attention_type .ok_zi,.no_zi{
            font-size: 14px;
            color: #999999;
            float: left;
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
        .down .up_down{
            width: 1000px;
            margin-top: 240px;
            padding-bottom: 20px;
        }
    </style>
</head>
<body>
<%--没有关注信息--%>
<c:if test="">
    <div class="nomain">
        <h2>对不起，你当前暂无任何关注信息</h2>
    </div>
</c:if>
<%--有关注信息--%>
<c:if test="true">
    <div class="main">
        <div class="waik">
            <div class="up">
                <div class="up_left">
                    <!-- 头像 -->
                    <img src="../../img/headimg.jpg"/>
                    <!-- 昵称 -->
                    <p class="name">骑驴看唱本</p>
                    <!-- 关注状态 -->
                    <div class="attention_type">
                        <!-- 已关注 -->
                        <p class="ok">√</p>
                        <p class="ok_zi">已关注</p>
                        <!-- 加关注 -->
                            <%--<p class="jia">+</p>
                            <p class="no_zi">加关注</p>--%>
                    </div>
                    <!-- 个性签名 -->
                    <p class="sdf">失败并不可怕，可怕的是你不渴望成功！可怕的是你不渴望成功！</p>
                    <!-- 关注人情况 -->
                    <div class="attention_person">
                        <a class="attention_him" href="javascript:;">n人关注了他</a>
                        <a class="he_attention" href="javascript:;">他关注了n人</a>
                    </div>
                </div>
                <!-- 上半部分的右边部分 -->
                <div class="up_right">
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
            <!-- 无最新动态 -->
            <c:if test="">
                <div class="down">
                    <h2 class="latest_news">最新动态</h2>
                    <%--无动态--%>
                    <p class="down_no_news">该用户暂无任何动态信息</p>
                </div>
            </c:if>
            <%--有最新动态--%>
            <c:if test="true">
                <div class="down">
                    <h2 class="latest_news">最新动态</h2>
                    <c:forEach begin="0" end="4" ><%--items=""--%>
                        <%--1上传文章--%>
                        <c:if test="">
                            <div class="down_yes_news">
                                <div class="bigp">
                                    <p class="user">骑驴看唱本</p>
                                    <span class="time">刚刚</span>
                                    <span class="action">上传了一篇文章：</span>
                                    <span class="article">
                                        <a href="javascript:;">钢铁是怎样炼成的</a>
                                    </span>
                                </div>
                                <span class="date">2018-8-8   07:08</span>
                            </div>
                        </c:if>
                        <%--2评论文章--%>
                        <c:if test="">
                            <div class="down_yes_news">
                                <div class="bigp">
                                    <p class="user">骑驴看唱本</p>
                                    <span class="time">2小时前</span>
                                    <span class="action">评论了</span>
                                    <span class="reply_user">
                                        <a href="javascript:;">小马</a>
                                    </span>
                                    <span class="action">的文章</span>
                                    <span class="article">
                                        <a href="javascript:;">前端工程师与后端工程师哪个更重要</a>
                                    </span>
                                </div>
                                <span class="date">2018-8-8   07:08</span>
                            </div>
                        </c:if>
                        <%--3回复评论--%>
                        <c:if test="">
                            <div class="down_yes_news">
                                <div class="bigp">
                                    <p class="user">骑驴看唱本</p>
                                    <span class="time">2小时前</span>
                                    <span class="action">回复了</span>
                                    <span class="reply_user">
                                        <a href="javascript:;">小马</a>
                                    </span>
                                    <span class="jiu">就</span>
                                    <span class="problem_user">
                                        <a href="javascript:;">一笑面恩仇</a>：
                                    </span>
                                    <span class="action">的文章</span>
                                    <span class="article">
                                        <a href="javascript:;">前端工程师与后端工程师哪个更重要</a>
                                    </span>
                                </div>
                                <span class="date">2018-8-8   07:08</span>
                            </div>
                        </c:if>
                        <%--4提出问题--%>
                        <c:if test="">
                            <div class="down_yes_news">
                                <div class="bigp">
                                    <p class="user">骑驴看唱本</p>
                                    <span class="time">2天前</span>
                                    <span class="action">提出了一个问题：</span>
                                    <span class="article">
                                        <a href="javascript:;">前端工程师与后端工程师哪个更重要</a>
                                    </span>
                                </div>
                                <span class="date">2018-8-8   07:08</span>
                            </div>
                        </c:if>
                        <%--5回答问题--%>
                        <c:if test="">
                            <div class="down_yes_news">
                                <div class="bigp">
                                    <p class="user">骑驴看唱本</p>
                                    <span class="time">2小时前</span>
                                    <span class="action">回答了</span>
                                    <span class="reply_user">
                                        <a href="javascript:;">小马</a>
                                    </span>
                                    <span class="action">的问题</span>
                                    <span class="article">
                                        <a href="javascript:;">前端工程师与后端工程师哪个更重要</a>
                                    </span>
                                </div>
                                <span class="date">2018-8-8   07:08</span>
                            </div>
                        </c:if>
                        <%--6回复答案--%>
                        <c:if test="true">
                            <div class="down_yes_news">
                                <div class="bigp">
                                    <p class="user">骑驴看唱本</p>
                                    <span class="time">2小时前</span>
                                    <span class="action">回复了</span>
                                    <span class="reply_user">
                                        <a href="javascript:;">小马小马向前看</a>
                                    </span>
                                    <span class="jiu">就</span>
                                    <span class="problem_user">
                                        <a href="javascript:;">一笑面恩仇</a>：
                                    </span>
                                    <span class="action">的问题</span>
                                    <span class="article">
                                        <a href="javascript:;">前端工程师与后端工程师哪个更重要</a>
                                    </span>
                                </div>
                                <span class="date">2018-8-8   07:08</span>
                            </div>
                        </c:if>
                    </c:forEach>
                    <!-- <i class="layui-icon layui-icon-up"
                        style="font-size: 30px;margin: 0 485px;color: #999999;"></i> -->
                    <i class="layui-icon layui-icon-down"
                       style="font-size: 30px;margin: 0 485px;color: #999999;"></i>
                </div>
            </c:if>
        </div>
    </div>
</c:if>
</body>
</html>
