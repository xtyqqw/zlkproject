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
    <title>Title</title>
    <link rel="stylesheet" href="/css/sign.css" type="text/css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <style type="text/css">
        .layui-tab-title li{
            width: 172px;
        }

        #login{
            background-color: #2D93CA;
            color: white;width: 500px;
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

        body{margin: 0;}
        #footer{
            background-color: #333C4D;
            height: 130px;
            width: 100%;
            margin-top: 100px;
            position: fixed;
            bottom: 0;

        }
        #footer ul{
            padding-top: 30px;
            width: 800px;
            height: 30px;
            margin: 0 auto;
            border-bottom: 1px solid #999999;
        }
        #footer ul li{
            float: left;
            list-style: none;
            padding-left: 30px;
        }
        #footer ul li a{
            color: #989898;
            text-decoration: none;
            float: left;
            padding-left: 20px;
        }
        #footer ul li a:hover{
            color: #F2F2F2;
        }
        #footer hr{
            width: 800px;
            color: #989898;
        }
        #footer p{
            color: #989898;
            text-align: center;
            padding-top: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
<div style="width: 500px;margin-left: 600px;border: 1px #FFFFFF;height: 650px;box-shadow: 0px 3px 5px 3px #D4D4D4;">
<center><h3 id="login">欢迎加入智量酷</h3></center>
    <br><br>
<center><span style="color:red;">${spanmsg}</span></center>
<form action="/user/signup" method="post" onsubmit="return check()" style="padding-left: 50px">

<%--    <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()"  placeholder="请输入手机号码"><span class="error" id="phoneError"></span><br>--%>
<%--    <input id="pwd1" name="userPwd" type="password" value="" onchange="checkpwd1()" placeholder="请输入密码"> <span class="error" id="checktext2"></span><br>--%>
<%--    <input id="pwd2" name="userpwd" type="password" value="" onchange="checkpwd2()" placeholder="请再次输入密码"> <span class="error" id="checktext3"></span><br>--%>
<%--    <input  name="usercode" type="text" value="" placeholder="请输入验证码"><button type="button" id="getcod" onclick="openCheck(this);">获取验证码</button>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-inline">
            <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()"  placeholder="请输入手机号码" lay-verify="required" autocomplete="off" class="layui-input"><span class="error" id="phoneError"></span>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
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
    <div class="layui-inline">
        <label class="layui-form-label">验证码</label>
        <div class="layui-input-inline">
            <input id="code1" name="usercode" type="text" value="" onchange="checkcode()" placeholder="请输入验证码" lay-verify="required|phone" autocomplete="off" class="layui-input"><span class="error" id="codeError"></span><button type="button" id="getcod" onclick="openCheck(this);" style="border: none">获取验证码</button>
        </div>
    </div><br><br>
    <input type="radio" name="ra" id="ra" onclick="changera(this);" value="a"/>我已同意<a href="../index" style="color: #2D93CA">智量酷用户协议</a><br>
    <br><br>
    <center><button type="submit" style="border: none;width: 100px;height: 30px;">提交</button></center>
</form>
</div>
<div id="box" onselectstart="return false;" style="display: none" >
    <div class="bgColor"></div>
    <div class="txt" >滑动解锁</div>
    <!--给i标签添加上相应字体图标的类名即可-->
    <div class="slider"><i class="iconfont icon-double-right"></i></div>
</div>
<%--尾部--%>
<div id="footer" style="margin-bottom: 0">
    <ul>
        <li>
            <a href="javascript:;">关于我们</a>
        </li>
        <li>
            <a href="javascript:;">加入我们</a>
        </li>
        <li>
            <a href="javascript:;">联系我们</a>
        </li>
        <li>
            <a href="javascript:;">讲师合作</a>
        </li>
        <li>
            <a href="javascript:;">帮助中心</a>
        </li>
        <li>
            <a href="javascript:;">友情链接</a>
        </li>
        <li>
            <a href="javascript:;">合作企业</a>
        </li>
    </ul>
    <p>
        copyright&nbsp;&nbsp;&nbsp;&nbsp;2017&nbsp;&nbsp;&nbsp;&nbsp;北京智量酷教育科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;京ICP备09076312号
    </p>
</div>
</body>
<script src="/js/jquery-1.12.4.js"></script>
<script src="/layui/layui.js"></script>
<script src="/js/signup.js"></script>
</html>
