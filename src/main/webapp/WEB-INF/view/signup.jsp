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

</head>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
<center>
<form action="/user/signup" method="post" onsubmit="return check()">
    <h2>注册</h2>
    <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()"  placeholder="请输入手机号码"><span class="error" id="phoneError"></span><br>
    <input id="pwd1" name="userPwd" type="password" value="" onchange="checkpwd1()" placeholder="请输入密码"> <span class="error" id="checktext2"></span><br>
    <input id="pwd2" name="userpwd" type="password" value="" onchange="checkpwd2()" placeholder="请再次输入密码"> <span class="error" id="checktext3"></span><br>
    <input  name="usercode" type="text" value="" placeholder="请输入验证码"><button type="button" id="getcod" onclick="openCheck(this);">获取验证码</button>

    <button type="submit">提交</button>
</form>
<div id="box" onselectstart="return false;" style="visibility: hidden" >
    <div class="bgColor"></div>
    <div class="txt" >滑动解锁</div>
    <!--给i标签添加上相应字体图标的类名即可-->
    <div class="slider"><i class="iconfont icon-double-right"></i></div>
</div>
</center>
<%--尾部--%>
<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
<script src="/js/jquery-1.12.4.js"></script>
<script src="/layui/layui.js"></script>
<script src="/js/signup.js"></script>
</html>
