<%--
  Created by IntelliJ IDEA.
  User: 上官螃蟹
  Date: 2019/11/29
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>忘记密码</title>
    <link rel="stylesheet" href="/css/sign.css" type="text/css">
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>
<form>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-inline">
            <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()" lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-inline">
        <label class="layui-form-label">验证码</label>
        <div class="layui-input-inline">
            <input id="code1" name="usercode" type="text" value="" onchange="checkcode()" placeholder="请输入验证码" lay-verify="required|phone" autocomplete="off" class="layui-input"><span class="error" id="codeError"></span><button type="button" id="getcod" onclick="openCheck(this);" style="border: none">获取验证码</button>
        </div>
    </div>
</form>
<div id="box" onselectstart="return false;" style="visibility: hidden" >
    <div class="bgColor"></div>
    <div class="txt" >滑动解锁</div>
    <!--给i标签添加上相应字体图标的类名即可-->
    <div class="slider"><i class="iconfont icon-double-right"></i></div>
</div>
</body>
<script src="/js/jquery-1.12.4.js"></script>
<script src="/layui/layui.js"></script>
<script src="/js/signup.js"></script>
</html>
