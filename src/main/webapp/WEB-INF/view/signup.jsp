<%--
  Created by IntelliJ IDEA.
  User: 上官螃蟹
  Date: 2019/11/18
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="/css/sign.css" type="text/css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="../../js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        body{margin: 0;}
        *{
            margin: 0;
            padding: 0;
        }
        #wrap {
            margin-top: 40px;
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
            top: 20%;
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
            text-align:center;
            display: inline-block;
            font-size: 28px;
            margin-top: 30px;
            width: 400px;
        }
        #wrap .logGet .logD.logDtip {
            width: 400px;
            border-bottom: 2px solid #ee7700;
            margin-bottom: 60px;
            margin-top: 0px;
            margin-right: auto;
            margin-left: auto;
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
            width: 350px;
            position: relative;
            margin-bottom: 30px;
            margin-top: 30px;
            margin-right: auto;
            margin-left: auto;
        }
        #wrap .logGet .logC {
            width: 350px;
            margin-top: 0px;
            margin-right: auto;
            margin-bottom: 0px;
            margin-left: auto;
        }
        .layui-tab-title li{
            width: 172px;
        }
    </style>
</head>
<body style="background-color: #ecf5f4">
<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
<div class="wrap" id="wrap" style="margin-top: 0px">
    <div class="logGet">
        <!-- 头部提示信息 -->
        <div class="logD logDtip">
            <p class="p1">账号注册</p>
        </div>
        <span>${spanmsg}</span>
<center><span style="color:red;">${spanmsg}</span></center>
<form action="/users/signup" method="post" onsubmit="return check()">

<%--    <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()"  placeholder="请输入手机号码"><span class="error" id="phoneError"></span><br>--%>
<%--    <input id="pwd1" name="userPwd" type="password" value="" onchange="checkpwd1()" placeholder="请输入密码"> <span class="error" id="checktext2"></span><br>--%>
<%--    <input id="pwd2" name="userpwd" type="password" value="" onchange="checkpwd2()" placeholder="请再次输入密码"> <span class="error" id="checktext3"></span><br>--%>
<%--    <input  name="usercode" type="text" value="" placeholder="请输入验证码"><button type="button" id="getcod" onclick="openCheck(this);">获取验证码</button>--%>
<%--    <div class="layui-form-item">--%>
<%--        <label class="layui-form-label">手机号</label>--%>
<%--        <div class="layui-input-inline">--%>
<%--            <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()"  placeholder="请输入手机号码" lay-verify="required" autocomplete="off" class="layui-input"><span class="error" id="phoneError"></span>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="lgD">
        <img src="img/logName.png" width="20" height="20" alt=""/>
        <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()" lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input"><span class="error" id="phoneError"></span>
    </div>
    <div class="lgD">
        <img src="img/logName.png" width="20" height="20" alt=""/>
        <input id="pwd1" name="userPwd" type="password" value="" onchange="checkpwd1()" lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input"><span class="error" id="checktext2"></span>
    </div>
    <!-- 输入框 -->
    <div class="lgD">
        <img src="img/logName.png" width="20" height="20" alt=""/>
        <input id="pwd2" name="userpwd" type="password" value="" onchange="checkpwd2()" placeholder="请再次输入密码" lay-verify="required"  autocomplete="off" class="layui-input"><span class="error" id="checktext3"></span>
    </div>
    <div class="lgD">
        <img src="img/logPwd.png" width="20" height="20" alt=""/>
        <input id="code1" name="usercode" type="text" value="" onchange="checkcode()" placeholder="请输入验证码" lay-verify="required|phone" autocomplete="off" class="layui-input"><span class="error" id="codeError"></span><button type="button" id="getcod" onclick="openCheck(this);" style="border: none;background-color: #ee7700;color: #fff">获取验证码</button>
    </div><br><br>
    <input name="ck" onclick="doJudge()" id="ck" type="checkbox" value="" style="margin-left: 130px;margin-right: 10px">已阅读并同意
    <a>《智量酷安全协议》</a>
    <br><br>
    <div class="logC">
        <a href="" target="_self"><button id="btn1" disabled="disabled"   type="submit">注册</button></a>
    </div>
</form>
    </div>
</div>
<div id="box" onselectstart="return false;" style="display: none" >
    <div class="bgColor"></div>
    <div class="txt" >滑动解锁</div>
    <!--给i标签添加上相应字体图标的类名即可-->
    <div class="slider"><i class="iconfont icon-double-right"></i></div>
</div>

</body>
<script src="/layui/layui.js"></script>
<script src="/js/signup.js"></script>
<script type="text/javascript">
    function doJudge(){//判断是否选中的自定义函数
        if(document.getElementById('ck').checked=true){//判断id为ck的复选框(input框)的状态是否是选中，假设是选中
            $("#btn1").removeAttr("disabled");//如果是，移除id为btn的标签的disabled属性
        }
    }

</script>
</html>
