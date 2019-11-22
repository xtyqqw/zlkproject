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
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/sign.css" type="text/css">
    <script src="/js/jquery-1.12.4.js"></script>
    <script src="/layui/layui.js" charset="utf-8"></script>
    <style type="text/css">
        .layui-tab-title li{
            width: 172px;
        }

        #login{
            background-color: #2D93CA;
            color: white;width: 400px;
            height:35px;
            margin-top: 20px;
            padding-top: 10px;
        }
        .login{
            border: none;
            background-color: #2D93CA;
            color: white;
            width: 100px;
            height:35px;
        }
        .signup{
            background-color: #2D93CA;margin-top: 20px;padding-top: 7px;color: white;width: 100px;margin-left: 100px;height:28px;text-decoration:none;display:inline-block
        }
    </style>
</head>
<body>
<%--引入头部--%>
<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
<center><h3 id="login">用户登录</h3>
<div class="layui-tab layui-tab-card" style="margin-top: 20px;width: 400px;height: 500px;">
    <ul class="layui-tab-title">
        <li class="layui-this" >手机号/密码登陆</li>
        <li >验证码登陆</li>
    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show">
            <span style="margin-left: 25px;color: red">${spanmsg}</span>
            <form action="/user/signupbypwd" method="post">
<%--                <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()"  placeholder="请输入手机号码"><br>--%>
<%--                <input id="pwd1" name="userPwd" type="password" value="" onchange="checkpwd1()" placeholder="请输入密码"> <br>--%>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-inline">
                        <input id="" name="phonenum" value="" type="text" onchange="phone()" lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input id="pwd1" name="userPwd" type="password" value="" onchange="checkpwd1()" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <center><button class="login" type="submit" style="">登陆</button><a class="signup" href="<%=request.getContextPath()%>/user/tosignup"  >注册</a></center>
            </form>
        </div>
        <div class="layui-tab-item">
            <span>${spanmsg}</span>
            <form action="/user/signupbycode" method="post">
<%--                <input name="phonenum" value="" type="text" placeholder="请输入手机号码"> <br>--%>
<%--                <input placeholder="请输入验证码"><button type="button">获取验证码</button> <br>--%>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-inline">
                        <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()" lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">验证码</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="usercode" lay-verify="required|phone" autocomplete="off" class="layui-input"><button type="button" id="getcod" onclick="openCheck(this);" style="border: none">获取验证码</button>
                    </div>
                </div>
<%--                <div class="layui-form-item">--%>
<%--                    <label class="layui-form-label">密码</label>--%>
<%--                    <div class="layui-input-inline">--%>
<%--                        <input name="code" type="password" value="" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input"><button type="button">获取验证码</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
               <center><button class="login" type="submit">登陆</button><a class="signup" href="<%=request.getContextPath()%>/user/tosignup">注册</a></center>
            </form>
        </div>
    </div>
</div>
    <div id="box" onselectstart="return false;" style="visibility: hidden" >
        <div class="bgColor"></div>
        <div class="txt" >滑动解锁</div>
        <!--给i标签添加上相应字体图标的类名即可-->
        <div class="slider"><i class="iconfont icon-double-right"></i></div>
    </div>
</center>
<%--引入尾部--%>
<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>

<script src="/js/signup.js"></script>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function(){
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项'+ (Math.random()*1000|0) //用于演示
                    ,content: '内容'+ (Math.random()*1000|0)
                    ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            ,tabDelete: function(othis){
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            ,tabChange: function(){
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function(elem){
            location.hash = 'test='+ $(this).attr('lay-id');
        });

    });
</script>

</html>
