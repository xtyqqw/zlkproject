<%--
  Created by IntelliJ IDEA.
  User: 上官螃蟹
  Date: 2019/12/2
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/css/sign.css" type="text/css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <title>login</title>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }

        #wrap {
            height: 419px;
            width: 100px;
            background-image: url(4.jpg);
            background-repeat: no-repeat;
            background-position: center center;
            position: relative;
        }

        #wrap .logGet {
            margin-left: 750px;
            height: 408px;
            width: 368px;
            position: absolute;
            background-color: #FFFFFF;
            top: 20%;
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

        .copyright {
            font-family: "宋体";
            color: #FFFFFF;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);  /* 使用css3的transform来实现 */
            height: 60px;
            width: 40%;
            text-align:center;
        }


    </style>

    <style type="text/css">
        body{margin: 0;}
        #footer{
            background-color: #333C4D;
            height: 130px;
            width: 100%;
            margin-top: 50px;
            margin-bottom: 0;
            position: absolute;
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

<body >
<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>

<div class="wrap" id="wrap">
    <div class="logGet">
        <!-- 头部提示信息 -->
        <div class="logD logDtip">
            <p class="p1">重置密码</p>
        </div>
        <span>${spanmsg}</span>
        <form action="/user/changepwd" onsubmit="return check()" method="post">
            <div class="lgD">
                <img src="img/logName.png" width="20" height="20" alt=""/>
                <input id="userPhonenum" name="phonenum" value="" type="text" onchange="phone()" lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
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
            </div>
            <div class="logC">
                <a href="" target="_self"><button>修改密码</button></a>
            </div>
        </form>
    </div>
</div>

<div id="box" onselectstart="return false;" style="visibility: hidden" >
    <div class="bgColor"></div>
    <div class="txt" >滑动解锁</div>
    <!--给i标签添加上相应字体图标的类名即可-->
    <div class="slider"><i class="iconfont icon-double-right"></i></div>
</div>

<div id="footer" style="position:fixed;bottom: 0">
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
