<%--
  Created by IntelliJ IDEA.
  User: 上官螃蟹
  Date: 2019/11/18
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css"/>
    <script src="../js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>
    *{margin: 0;padding: 0;font-family: "微软雅黑";}
    .clear{clear: both;}
    .main{width: 100%;}
    .maininfo{width: 960px;margin: 0 auto;height: 1000px;}
    .banner{height: 350px;width: 100%;margin-top: 20px;}
    .banner img{cursor: pointer;}
    .banner_nav{width: 150px;height: 350px;border-radius: 5px;background: white;float: left;box-shadow: 0 2px 2px rgba(10,16,20,.24),0 0 2px rgba(10,16,20,.12)}
    .banner_nav ul{padding-top: 35px;padding-left: 0;margin-left: 20px;}
    .banner_nav ul li{list-style: none;width: 130px;height: 35px;background: white;text-align: center;line-height: 35px;cursor: pointer}
    .banner_nav ul li p{width: 110px;height: 35px;border-radius: 5px;}
    .banner_nav ul li p:hover{background: #914ff1;color: white;}
    .banner_nav_li{margin-top: 45px;}
    #banner_img div img{width: 800px;height: 350px;}
    #ul_none{z-index: 10;position: absolute;left: -10px;}
    .li_none{width: 810px;height: 350px;background: #f8f9fb;box-shadow: 0 2px 2px rgba(10,16,20,.24),0 0 2px rgba(10,16,20,.12)}
    .banner_img{width: 800px;height: 100%;float: right;background: white;border-radius: 5px;}
    #ul_none .box{display: none;}
    #ul_none .box.active{display: block;}
    .title_p{background:url(../img/yuan.png) no-repeat center;height: 40px;text-align: center;font-size: 20px;line-height: 40px;}
    .signin{height: 70px;width: 860px;margin-top: 20px;border-radius: 5px;box-shadow:0 0 2px;padding: 25px 50px;}
    .signin .signin_date li{width: 25px;height: 25px;border-radius: 50%;background: #914ff1;float: left;margin-top: 20px;}
    .signin .signin_date li span{color: white;display: inline-block;margin-left: 6px;line-height: 25px;}
    .signin .signin_date li p{margin-left: 4px;}
    .signin .signin_date .signin_date_li{margin-left: 30px;}
    .signin .signin_img{width: 300px;height: 52px;background:url(../img/signin.png) no-repeat center;margin:10px 0 0 410px;}
    .signin .signin_btn{float: right;position: relative;top: -45px;}
    .signin .signin_btn .s_btn{width: 90px;height: 40px;border: 0;background: #914ff1;color: white;cursor: pointer;}
    #click_none{margin: 0 auto;width: 20px;margin-top: 10px;}
    .li_none_box{padding: 30px 60px;}
    .li_none_box_nav{height: 70px;width: 100%;}
    .li_none_box_nav h2{margin-left: 10px;}
    .li_none_box_nav li{float: left;}
    .li_none_box_nav li a{color: #777777;font-size: 14px;margin-left: 10px;}
    .li_none_box_nav li a:hover{color:#6157e2;}
    .li_none_box_class{margin-top:20px;}
    .li_none_box_class li{width: 41%;height: 58px;float: left;padding: 10px;}
    .li_none_box_class li:hover{box-shadow: 0 0 5px;}
    .li_none_box_class dl{float: right;display: inline-block;}
    .li_none_box_class dl dt{font-size: 13px;color: grey;margin:13px 0 0 0;}
    .li_none_box_class dl dd{font-size: 12px;color: darkgrey;}
    .rank{height: 60px;width: 900px;padding: 30px 10px 0 10px;}
    .rank li{float:left;width: 19%;padding-left: 27px;}
    .rank dl{margin:5px 0 0 35px;}
    .rank dt{font-size: 10px;color: black;}
    .rank dd{font-size: 11px;color: gray;}
    .rank_first{background:url(../img/jin.png) no-repeat left;}
    .rank_second{background:url(../img/yin.png) no-repeat left;}
    .rank_third{background:url(../img/tong.png) no-repeat left;}
    .rank .rank_me{padding-left: 0;}
    .rank .rank_me p{display: inline-block;font-size: 9px;float: left;margin: 10px 5px 0 0;}
    .rank .rank_more{width: 100px;float: right;padding-left: 35px;margin-top: 5px;}
    .rank .rank_more .rank_more_p{width: 100px;height: 30px;color: white;background-color:#914ff1;border-radius: 3px;display: inline-block;line-height: 30px;text-align: center;cursor: pointer;}
    .rank .rank_more .rank_more_m{width: 200px;height: 600px;background: #f8f9fb;position: absolute;right: 280px;float:right;z-index: 10;display: none;}
    .rank .rank_more .rank_more_li{width: 155px;margin:15px 0 10px 20px;}
    .state{width: 960px;height: 200px;margin-top: 10px;border-top: 2px solid #914ff1;}
    .state_p{width: 160px;height: 40px;background: #914ff1;color: white;text-align: center;font-size: 18px;line-height: 38px;margin: 0 auto;}
    .state_box{width: 960px;height: 120px;padding-top: 20px;}
    .state_box ul{margin-left: 110px;}
    .state_box li{width: 140px;height: 75px;float: left;margin-left: 80px;box-shadow: 1px 1px 5px 3px #D4D4D4;text-align: center;padding-top: 15px;}
    .state_box h3{font-weight: 600;}
    .state_box p{font-size: 10px;color:gray;line-height: 15px;margin-top: 5px;}
    .state_box p span{font-size: 15px;color: #914ff1;}
    .studing_ul{margin-top: 30px;}
    .studing_ul li{float: left;margin:0 20px;}
    .studing_ul .studing_ul_li_none{width: 42px;height: 1px;}
    .studing img{width: 200px;height: 100px;display: block;}
    .studing .studing_ul_f_dd p{color: white;font-size: 12px;position: relative;top: -36px;left: 5px;}
    .studing .studing_ul_s_dd p{font-size: 12px;position: relative;top: -31px;display: inline-block;}
    .studing .studing_ul_f_dd span{color: white;font-size: 10px;position: relative;top: -36px;left: 5px;}
    .layui-rate li i.layui-icon{font-size: 10px;}
</style>
<script>
    layui.use('rate', function(){
        var rate = layui.rate;
        //渲染
        var ins1 = rate.render({
            elem: '#test1'  //绑定元素
            ,readonly: true,
            value: 5
        });
    });
</script>
<body>
<%--引入头部--%>
<jsp:include page="jsp/header.jsp"></jsp:include>
<div class="main">
    <div class="maininfo">
        <div class="banner">
            <div class="banner_nav">
                <ul>
                    <li class="nav_li_none">
                        <p>JAVA</p>
                    </li>
                    <li class="banner_nav_li">
                        <p>大数据</p>
                    </li>
                    <li class="banner_nav_li">
                        <p>HTML,CSS</p>
                    </li>
                    <li class="banner_nav_li">
                        <p>JAVASCRIPT</p>
                    </li>
                </ul>
            </div>
            <div class="banner_img layui-carousel" id="banner_img">
                <!--弹出菜单-->
                <ul id="ul_none">
                    <li class="li_none box">
                        <div class="li_none_box">
                            <div class="li_none_box_nav">
                                <h2>JAVA</h2>
                                <ul>
                                    <li>
                                        <a href="javascript:;">JAVA基础</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">JAVA框架</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="li_none_box_class">
                                <ul>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转JAVA，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转JAVA，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转JAVA，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转JAVA，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="li_none box">
                        <div class="li_none_box">
                            <div class="li_none_box_nav">
                                <h2>大数据</h2>
                                <ul>
                                    <li>
                                        <a href="javascript:;">大数据</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">hadoop</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="li_none_box_class">
                                <ul>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转大数据，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转大数据，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转大数据，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转大数据，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="li_none box">
                        <div class="li_none_box">
                            <div class="li_none_box_nav">
                                <h2>HTML,CSS</h2>
                                <ul>
                                    <li>
                                        <a href="javascript:;">HTML</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">CSS</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="li_none_box_class">
                                <ul>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转HTML,CSS，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转HTML,CSS，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转HTML,CSS，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转HTML,CSS，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="li_none box">
                        <div class="li_none_box">
                            <div class="li_none_box_nav">
                                <h2>JAVASCRIPT</h2>
                                <ul>
                                    <li>
                                        <a href="javascript:;">JAVASCRIPT</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">JQUERY</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="li_none_box_class">
                                <ul>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转JAVASCRIPT，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转JAVASCRIPT，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转JAVASCRIPT，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <div>
                                            <a href="javascript:;">
                                                <img style="width: 80px;height: 60px;float: left;" src="../img/1.jpg"/>
                                            </a>
                                        </div>
                                        <dl>
                                            <dt>玩转JAVASCRIPT，从入门到精通</dt>
                                            <dd>
                                                <span>学习人数：2345人</span>
                                                <span>230节</span>
                                                <span>￥2300.00</span>
                                            </dd>
                                        </dl>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
                <!--轮播图-->
                <div carousel-item>
                    <div>
                        <img src="../img/1.jpg">
                    </div>
                    <div>
                        <img src="../img/2.jpg">
                    </div>
                    <div>
                        <img src="../img/3.jpg">
                    </div>
                    <div>
                        <img src="../img/4.jpg">
                    </div>
                </div>
            </div>
        </div>
        <!--点击隐藏按钮-->
        <div id="click_none">
            <i class="layui-icon layui-icon-up"></i>
        </div>
        <div class="clear"></div>
        <c:if test="true">
            <!--我的任务模块-->
            <div class="mission">
                <div class="title">
                    <p class="title_p">我的任务</p>
                </div>
                <!--签到模块-->
                <div class="signin">
                    <div class="signin_date">
                        <ul>
                            <li>
                                <span>√</span>
                                <p>18</p>
                            </li>
                            <li class="signin_date_li">
                                <span>√</span>
                                <p>19</p>
                            </li>
                            <li class="signin_date_li">
                                <span>√</span>
                                <p>20</p>
                            </li>
                            <li class="signin_date_li">
                                <span>√</span>
                                <p>21</p>
                            </li>
                            <li class="signin_date_li">
                                <span>√</span>
                                <p>22</p>
                            </li>
                            <li class="signin_date_li">
                                <span>√</span>
                                <p>23</p>
                            </li>
                            <li class="signin_date_li">
                                <span>√</span>
                                <p>24</p>
                            </li>
                        </ul>
                    </div>
                    <div class="signin_img"></div>
                    <div class="signin_btn">
                        <form action="javascript:;" method="get">
                            <input type="submit" class="s_btn" value="签到"/>
                        </form>
                    </div>
                </div>
                <!--今日学习情况-->
                <div class="study">
                    <!--学习排名-->
                    <div class="rank">
                        <ul>
                            <c:forEach begin="0" end="0" items="${userList}" var="user" varStatus="su">
                            <li class="rank_first">
                                <div>
                                    <a href="javascript:;">
                                        <img style="width: 30px;height: 30px;float: left;border-radius: 50%;" src="${user.userImg}"/>
                                    </a>
                                </div>
                                <dl>
                                    <dt>${user.userRealname}</dt>
                                    <dd>
                                        <span>练习时长：${user.userAllTime}h</span>
                                    </dd>
                                </dl>
                            </li>
                            </c:forEach>
                            <c:forEach begin="1" end="1" items="${userList}" var="user" varStatus="su">
                            <li class="rank_second">
                                <div>
                                    <a href="javascript:;">
                                        <img style="width: 30px;height: 30px;float: left;border-radius: 50%;" src="${user.userImg}"/>
                                    </a>
                                </div>
                                <dl>
                                    <dt>${user.userRealname}</dt>
                                    <dd>
                                        <span>练习时长：${user.userAllTime}h</span>
                                    </dd>
                                </dl>
                            </li>
                            </c:forEach>
                            <c:forEach begin="2" end="2" items="${userList}" var="user" varStatus="su">
                            <li class="rank_third">
                                <div>
                                    <a href="javascript:;">
                                        <img style="width: 30px;height: 30px;float: left;border-radius: 50%;" src="${user.userImg}"/>
                                    </a>
                                </div>
                                <dl>
                                    <dt>${user.userRealname}</dt>
                                    <dd>
                                        <span>练习时长：${user.userAllTime}h</span>
                                    </dd>
                                </dl>
                            </li>
                            </c:forEach>
                            <li class="rank_me">
                                <p>NO.<span>${rank}</span></p>
                                <div>
                                    <a href="javascript:;">
                                        <img style="width: 30px;height: 30px;float: left;border-radius: 50%;" src="${user1.userImg}"/>
                                    </a>
                                </div>
                                <dl>
                                    <dt>${user1.userRealname}</dt>
                                    <dd>
                                        <span>练习时长：${user1.userAllTime}h</span>
                                    </dd>
                                </dl>
                            </li>
                            <!--查看更多-->
                            <li class="rank_more">
                                <p class="rank_more_p">查看更多</p>
                                <div class="rank_more_m">
                                    <ul>
                                        <c:forEach begin="0" end="9" items="${userList}" var="user" varStatus="su">
                                        <li class="rank_me rank_more_li">
                                            <div>
                                                <p>NO.<span>${su.count}</span></p>
                                                <a href="javascript:;">
                                                    <img style="width: 30px;height: 30px;float: left;border-radius: 50%;" src="${user.userImg}"/>
                                                </a>
                                            </div>
                                            <dl>
                                                <dt>${user.userRealname}</dt>
                                                <dd>
                                                    <span>练习时长：${user.userAllTime}h</span>
                                                </dd>
                                            </dl>
                                        </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!--学习情况-->
                    <div class="state">
                        <p class="state_p">今日学习情况</p>
                        <div class="state_box">
                            <ul>
                                <li>
                                    <h3>学习时长</h3>
                                    <p><span>${user1.userDateTime}</span>小时</p>
                                    <p>已超过<span>${rankBai}</span>%的同学</p>
                                </li>
                                <li>
                                    <h3>学习成长量</h3>
                                    <p><span>${xueXi}</span></p>
                                    <p>已超过<span>${rankBai}</span>%的同学</p>
                                </li>
                                <li>
                                    <h3>技能水平</h3>
                                    <p><span>${jiNeng}</span></p>
                                    <p>已超过<span>${rankBai}</span>%的同学</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--正在学习模块-->
            <div class="studing">
                <div class="title title_flow1">
                    <p class="title_p">正在学习</p>
                </div>
                <div class="flow_div">

                </div>
            </div>
            <div class="clear"></div>
            <!--个性推荐模块-->
            <div class="studing">
                <div class="title title_flow2">
                    <p class="title_p">个性推荐</p>
                </div>
                <div class="flow_div2">

                </div>
            </div>
        </c:if>
        <div class="clear"></div>
        <!--热门推荐模块-->
        <div class="studing">
            <div class="title title_flow3">
                <p class="title_p">热门推荐</p>
            </div>
            <div class="flow_div3">

            </div>
        </div>
        <div class="clear"></div>
        <!--精品推荐模块-->
        <div class="studing">
            <div class="title title_flow4">
                <p class="title_p">精品推荐</p>
            </div>
            <div class="flow_div4">

            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<%--引入尾部--%>
<jsp:include page="jsp/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        carousel.render({
            elem: '#banner_img'
            ,width: '800px'
            ,height: '350px'
            ,autoplay: true
            ,arrow: 'none'
        });
    });
    $(function(){
        $(".banner_nav li").on("mouseenter",function(){
            var index = $(this).index();
            $(this).addClass("nav_li_none").siblings().removeClass("nav_li_none");
            $("#ul_none .box").eq(index).addClass("active").siblings().removeClass("active");
        })
        $('.banner').mouseleave(function() {
            $("#ul_none .box").removeClass("active").siblings().removeClass("active");
        });
    })
    $(function(){
        $("#click_none").click(function(){
            if($('.banner').is(':hidden')){
                $('.banner').show();
            }else{
                $('.banner').hide();
            }
        })
        $(".rank_more_p").click(function(){
            if($('.rank_more_m').is(':hidden')){
                $('.rank_more_m').show();
            }else{
                $('.rank_more_m').hide();
            }
        });
    })
    layui.use('flow', function(){
        var flow = layui.flow;
        flow.load({
            elem: '.flow_div' //流加载容器
            ,isAuto:false
            ,done: function(page, next){ //执行下一页的回调
                setTimeout(function(){
                    var lis = [];
                    var limit =8;
                    var data={"page":page,"limit":limit};
                    $.ajax({
                        type :"POST",
                        url:"/index/toFlow",
                        dataType:"json",
                        data:data,
                        success:function(result) {
                            layui.each(result.coursesList, function (i, courses) {
                            lis.push('<ul class="studing_ul flow-default">'+
                                '<li>'+
                                '<dl>'+
                                '<dt>'+
                                '<a href="javascript:;">'+
                                '<img src="'+courses.introducePic+'" />'+
                                '</a>'+
                                '</dt>'+
                                '<dd class="studing_ul_f_dd">'+
                                '<p>'+courses.introduceText+'</p>'+
                                '<span>JAVA</span>'+
                                '<span>SPRING</span>'+
                                '<span class="stars"></span>'+
                                '</dd>'+
                                '<dd class="studing_ul_s_dd">'+
                                '<p>学习人数：<span>'+courses.studentNum+'</span>人</p><br/>'+
                                '<p>￥<span>'+courses.price+'</span>上次学习时间：<span>2018-10-12</span></p>'+
                                '</dd>'+
                                '</dl>'+
                                '</li>'+
                                '</ul>')
                            })
                            next(lis.join(''), page < 3);
                        }
                    });
                }, 500);
            }
        });
    });
    layui.use('flow', function(){
        var flow = layui.flow;
        flow.load({
            elem: '.flow_div2' //流加载容器
            ,isAuto:false
            ,done: function(page, next){ //执行下一页的回调
                setTimeout(function(){
                    var lis = [];
                    var limit =8;
                    var data={"page":page,"limit":limit};
                    $.ajax({
                        type :"POST",
                        url:"/index/toFlow",
                        dataType:"json",
                        data:data,
                        success:function(result) {
                            layui.each(result.coursesList, function (i, courses) {
                                lis.push('<ul class="studing_ul flow-default">'+
                                    '<li>'+
                                    '<dl>'+
                                    '<dt>'+
                                    '<a href="javascript:;">'+
                                    '<img src="'+courses.introducePic+'" />'+
                                    '</a>'+
                                    '</dt>'+
                                    '<dd class="studing_ul_f_dd">'+
                                    '<p>'+courses.introduceText+'</p>'+
                                    '<span>JAVA</span>'+
                                    '<span>SPRING</span>'+
                                    '<span class="stars"></span>'+
                                    '</dd>'+
                                    '<dd class="studing_ul_s_dd">'+
                                    '<p>学习人数：<span>'+courses.studentNum+'</span>人</p><br/>'+
                                    '<p>￥<span>'+courses.price+'</span>上次学习时间：<span>2018-10-12</span></p>'+
                                    '</dd>'+
                                    '</dl>'+
                                    '</li>'+
                                    '</ul>')
                            })
                            next(lis.join(''), page < 3);
                        }
                    });
                }, 500);
            }
        });
    });
    layui.use('flow', function(){
        var flow = layui.flow;
        flow.load({
            elem: '.flow_div3' //流加载容器
            ,isAuto:false
            ,done: function(page, next){ //执行下一页的回调
                setTimeout(function(){
                    var lis = [];
                    var limit =8;
                    var data={"page":page,"limit":limit};
                    $.ajax({
                        type :"POST",
                        url:"/index/toFlow",
                        dataType:"json",
                        data:data,
                        success:function(result) {
                            layui.each(result.coursesList, function (i, courses) {
                                lis.push('<ul class="studing_ul flow-default">'+
                                    '<li>'+
                                    '<dl>'+
                                    '<dt>'+
                                    '<a href="javascript:;">'+
                                    '<img src="'+courses.introducePic+'" />'+
                                    '</a>'+
                                    '</dt>'+
                                    '<dd class="studing_ul_f_dd">'+
                                    '<p>'+courses.introduceText+'</p>'+
                                    '<span>JAVA</span>'+
                                    '<span>SPRING</span>'+
                                    '<span class="stars"></span>'+
                                    '</dd>'+
                                    '<dd class="studing_ul_s_dd">'+
                                    '<p>学习人数：<span>'+courses.studentNum+'</span>人</p><br/>'+
                                    '<p>￥<span>'+courses.price+'</span>上次学习时间：<span>2018-10-12</span></p>'+
                                    '</dd>'+
                                    '</dl>'+
                                    '</li>'+
                                    '</ul>')
                            })
                            next(lis.join(''), page < 3);
                        }
                    });
                }, 500);
            }
        });
    });
    layui.use('flow', function(){
        var flow = layui.flow;
        flow.load({
            elem: '.flow_div4' //流加载容器
            ,isAuto:false
            ,done: function(page, next){ //执行下一页的回调
                setTimeout(function(){
                    var lis = [];
                    var limit =8;
                    var data={"page":page,"limit":limit};
                    $.ajax({
                        type :"POST",
                        url:"/index/toFlow",
                        dataType:"json",
                        data:data,
                        success:function(result) {
                            layui.each(result.coursesList, function (i, courses) {
                                lis.push('<ul class="studing_ul flow-default">'+
                                    '<li>'+
                                    '<dl>'+
                                    '<dt>'+
                                    '<a href="javascript:;">'+
                                    '<img src="'+courses.introducePic+'" />'+
                                    '</a>'+
                                    '</dt>'+
                                    '<dd class="studing_ul_f_dd">'+
                                    '<p>'+courses.introduceText+'</p>'+
                                    '<span>JAVA</span>'+
                                    '<span>SPRING</span>'+
                                    '<span class="stars"></span>'+
                                    '</dd>'+
                                    '<dd class="studing_ul_s_dd">'+
                                    '<p>学习人数：<span>'+courses.studentNum+'</span>人</p><br/>'+
                                    '<p>￥<span>'+courses.price+'</span>上次学习时间：<span>2018-10-12</span></p>'+
                                    '</dd>'+
                                    '</dl>'+
                                    '</li>'+
                                    '</ul>')
                            })
                            next(lis.join(''), page < 3);
                        }
                    });
                }, 500);
            }
        });
    });
</script>
</html>
