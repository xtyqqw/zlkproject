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
        .nomain {
            margin: 50px auto;
            text-align: center;
        }

        .nomain h2 {
            color: #999999;
            letter-spacing: 5px;
            font-size: 24px;
        }
    </style>
</head>
<body>
<%--没有关注信息--%>
<c:if test="true">
    <div class="nomain">
        <h2>对不起，你当前暂无任何关注信息</h2>
    </div>
</c:if>
<%--有关注信息--%>
<c:if test="">
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
            <!-- 最新动态 -->
            <div class="down">
                <h2 class="latest_news">最新动态</h2>
                <!-- 无最新动态 -->
                <!-- <p class="down_no_news">该用户暂无任何动态信息</p> -->
                <c:forEach begin="0" end="2">
                    <%--上传文章--%>
                    <c:if test="">
                        <div class="down_yes_new">
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
                    <%--评论文章--%>
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
                    <%--回复评论--%>
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
                    <%--提出问题--%>
                    <c:if test="">
                        <div class="down_yes_new">
                            <div class="bigp">
                                <p class="user">骑驴看唱本</p>
                                <span class="time">1小时前</span>
                                <span class="action">提出了一个问题：</span>
                                <span class="article">
								<a href="javascript:;">前端工程师与后端工程师哪个更重要</a>
							</span>
                            </div>
                            <span class="date">2018-8-8   07:08</span>
                        </div>
                    </c:if>
                    <%--上传问题--%>
                    <%--回答问题--%>
                    <%--回复答案--%>
                </c:forEach>

                <div class="down_yes_news">
                    <div class="bigp">
                        <p class="user">骑驴看唱本</p>
                        <span class="time">1天前</span>
                        <span class="action">上传了一篇文章：</span>
                        <span class="article">
								<a href="javascript:;">钢铁是怎样炼成的</a>
							</span>
                    </div>
                    <span class="date">2018-8-8   07:08</span>
                </div>
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
                <div class="down_yes_news">
                    <div class="bigp">
                        <p class="user">骑驴看唱本</p>
                        <span class="time">4天前</span>
                        <span class="action">评论了</span>
                        <span class="reply_user">
								<a href="javascript:;">一笑面恩仇一笑面恩仇</a>
							</span>
                        <span class="jiu">就</span>
                        <span class="problem_user">
								<a href="javascript:;">一笑面恩仇</a>：
							</span>
                        <span class="article">
								<a href="javascript:;">前端工程师与后端工程师哪个更重要</a>
							</span>
                    </div>
                    <span class="date">2018-8-8   07:08</span>
                </div>
                <div class="up_down">
                    <!-- <i class="layui-icon layui-icon-up"
                        style="font-size: 30px;margin: 0 485px;color: #999999;"></i> -->
                    <i class="layui-icon layui-icon-down"
                       style="font-size: 30px;margin: 0 485px;color: #999999;"></i>
                </div>
            </div>
        </div>
    </div>
</c:if>
</body>
</html>
