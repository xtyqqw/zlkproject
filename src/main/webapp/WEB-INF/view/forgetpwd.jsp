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
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        #wrap {
            height: 719px;
            width: 100;
            background-image: url(4.jpg);
            background-repeat: no-repeat;
            background-position: center center;
            position: relative;
        }
        #head {
            height: 120px;
            width: 100;
            background-color: #66CCCC;
            text-align: center;
            position: relative;
        }
        #foot {
            width: 100;
            height: 126px;
            background-color: #CC9933;
            position: relative;
        }
        #wrap .logGet {
            height: 408px;
            width: 368px;
            position: absolute;
            background-color: #FFFFFF;
            top: 20%;
            right: 15%;
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
            width: 86%;
            border-bottom: 1px solid #ee7700;
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


        .title {
            font-family: "宋体";
            color: #FFFFFF;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);  /* 使用css3的transform来实现 */
            font-size: 36px;
            height: 40px;
            width: 30%;
        }

        #title{
            background-color: #2D93CA;
            color: white;width: 400px;
            height:35px;
            margin-top: 20px;
            padding-top: 10px;
        }
        #form-pwd{
            margin-left: 35%;
            margin-top: 20px;
            box-shadow: 1px 1px 5px rgba(0,0,0,0.2);
            width: 30%;
        }
        .layui-form-item{
            margin-left: 58px;
        }
        #sbtn{
            border: none;
            background-color: #2D93CA;
            color: white;
            width: 100px;
            height:35px;
        }
    </style>
</head>
<body>
<h2 class="title" id="title">重置密码</h2>
<form id="form-pwd" action="changepwd" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-inline">
            <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()" lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-inline">
            <input id="pwd1" name="userPwd" type="password" value="" onchange="checkpwd1()" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input"><span class="error" id="checktext2"></span>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-inline">
            <input id="pwd2" name="userpwd" type="password" value="" onchange="checkpwd2()" placeholder="请再次输入密码" lay-verify="required"  autocomplete="off" class="layui-input"><span class="error" id="checktext3"></span>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">验证码</label>
        <div class="layui-input-inline">
            <input id="code1" name="usercode" type="text" value="" onchange="checkcode()" placeholder="请输入验证码" lay-verify="required|phone" autocomplete="off" class="layui-input"><span class="error" id="codeError"></span><button type="button" id="getcod" onclick="openCheck(this);" style="border: none">获取验证码</button>
        </div>
    </div><br>
    <button id="sbtn" type="submit" style="border: none;width: 100px;height: 30px;">提交</button>
</form>
<div id="box" onselectstart="return false;" style="visibility: hidden" >
    <div class="bgColor"></div>
    <div class="txt" >拖动滑块进行验证</div>
    <!--给i标签添加上相应字体图标的类名即可-->
    <div class="slider"><i class="iconfont icon-double-right"></i></div>
</div>

</body>
<script src="/js/jquery-1.12.4.js"></script>
<script src="/layui/layui.js"></script>
<script src="/js/signup.js"></script>
</html>
