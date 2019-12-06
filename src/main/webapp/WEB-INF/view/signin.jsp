<%--
  Created by IntelliJ IDEA.
  User: 上官螃蟹
  Date: 2019/11/21
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/sign.css" type="text/css">
    <script src="/js/jquery-1.12.4.js"></script>
    <script src="/layui/layui.js" charset="utf-8"></script>
    <style type="text/css">
        body {
            margin: 0;
        }

        * {
            margin: 0;
            padding: 0;
        }

        #wrap {
            margin-top: 50px;
            background-repeat: no-repeat;
            background-position: center center;
            position: relative;
        }

        #wrap .logGet {
            margin-left: 500px;
            height: 600px;
            width: 600px;
            position: absolute;
            background-color: #FFFFFF;
            top: 10%;
            border-radius: 5px;
            box-shadow: 2px 3px 5px 3px #D4D4D4;
        }

        .logC a button {
            width: 100%;
            height: 45px;
            background-color: #ee7700;
            border: none;
            color: white;
            font-size: 18px;
        }

        .logGet .logD.logDtip .p1 {
            display: inline-block;
            font-size: 28px;
            margin-top: 30px;
            width: 86%;
        }

        #wrap .logGet .logD.logDtip {
            width: 400px;
            border-bottom: 2px solid #ee7700;
            margin-bottom: 60px;
            margin-top: 0px;
            margin-right: auto;
            margin-left: auto;
            text-align: center;
        }

        .logGet .lgD img {
            position: absolute;
            top: 12px;
            left: 8px;
        }

        .logGet .lgD input {
            width: 100%;
            height: 42px;
            text-indent: 2.5rem;
        }

        #wrap .logGet .lgD {
            width: 86%;
            position: relative;
            margin-bottom: 30px;
            margin-top: 30px;
            margin-right: auto;
            margin-left: auto;
        }

        #wrap .logGet .logC {
            width: 86%;
            margin-top: 0px;
            margin-right: auto;
            margin-bottom: 0px;
            margin-left: auto;
        }

        .layui-tab-title li {
            width: 172px;
        }
    </style>
</head>
<body style="background-color: #ecf5f4">
<%--引入头部--%>
<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
<div class="wrap" id="wrap">
    <div class="logGet">
        <!-- 头部提示信息 -->
        <div class="logD logDtip">
            <p class="p1">登陆</p>
        </div>
        <div class="layui-tab layui-tab-card" style="width: 400px;height: 400px;margin: 0 auto">
            <ul class="layui-tab-title">
                <li class="layui-this">验证码登陆</li>
                <li>手机号/密码登陆</li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;">
                <div class="layui-tab-item layui-show">
                    <span>${spanmsg}</span>
                    <form action="/users/signupbycode" method="post">
                        <%--                <input name="phonenum" value="" type="text" placeholder="请输入手机号码"> <br>--%>
                        <%--                <input placeholder="请输入验证码"><button type="button">获取验证码</button> <br>--%>
                        <div class="lgD">
                            <i class="layui-icon layui-icon-cellphone"
                               style="position:relative;bottom: -33px;left: 10px;font-size: 20px"></i>
                            <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()"
                                   lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                        </div>
                        <div class="lgD">
                            <i class="layui-icon layui-icon-vercode"
                               style="position:relative;bottom: -33px;left: 10px;font-size: 20px"></i>
                            <input id="code1" name="usercode" type="text" value="" onchange="checkcode()"
                                   placeholder="请输入验证码" lay-verify="required|phone" autocomplete="off"
                                   class="layui-input"><span class="error" id="codeError"></span>
                            <button type="button" id="getcod" onclick="openCheck(this);"
                                    style="border: none;background-color: #ee7700;color: #fff;padding: 10px;margin-top: 10px">
                                获取验证码
                            </button>
                        </div>
                        <div class="logC">
                            <a href="" target="_self">
                                <button>登陆</button>
                            </a>
                        </div>
                    </form>
                </div>
                <div class="layui-tab-item">
                    <span style="margin-left: 25px;color: red">${spanmsg}</span>
                    <form action="/users/signupbypwd" method="post">
                        <%--                <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()"  placeholder="请输入手机号码"><br>--%>
                        <%--                <input id="pwd1" name="userPwd" type="password" value="" onchange="checkpwd1()" placeholder="请输入密码"> <br>--%>
                        <div class="lgD">
                            <i class="layui-icon layui-icon-cellphone" style="position:relative;bottom: -33px;left: 10px;font-size: 20px"></i>
                            <input name="phonenum" value="" type="text" onchange="phone()" lay-verify="required"
                                   placeholder="请输入手机号" autocomplete="off" class="layui-input">
                        </div>
                        <div class="lgD">
                            <i class="layui-icon layui-icon-password"
                               style="position:relative;bottom: -33px;left: 10px;font-size: 20px"></i>
                            <input id="pwd1" name="userPwd" type="password" value="" onchange="checkpwd1()"
                                   lay-verify="required" placeholder="请输入密码" autocomplete="off"
                                   class="layui-input"><span class="error" id="checktext2"></span>
                        </div>
                        <div class="logC">
                            <a href="" target="_self">
                                <button>登陆</button>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <div id="box" onselectstart="return false;" style="visibility: hidden">
        <div class="bgColor"></div>
        <div class="txt">滑动解锁</div>
        <!--给i标签添加上相应字体图标的类名即可-->
        <div class="slider"><i class="iconfont icon-double-right"></i></div>
    </div>
</div>
</body>

<script src="/js/signup.js"></script>

<script>
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function () {
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项' + (Math.random() * 1000 | 0) //用于演示
                    , content: '内容' + (Math.random() * 1000 | 0)
                    , id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            , tabDelete: function (othis) {
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            , tabChange: function () {
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function () {
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function (elem) {
            location.hash = 'test=' + $(this).attr('lay-id');
        });

    });
</script>

</html>
