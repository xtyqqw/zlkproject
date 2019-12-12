<%--
  Created by IntelliJ IDEA.
  User: sanliangsan
  Date: 2019/11/21
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--jstl约束--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <script src="/js/jquery-1.12.4.js"></script>
    <script src="../layui/layui.js"></script>
    <style type="text/css">
        body{

        }
        .list1{
            float: left;
            padding: 20px;
        }
        .list1 p{
            text-align: left;
            text-indent: 2em;
            line-height: 24px;
            display:block;
            max-height: 300px;
            min-height: 300px;
            margin-top: 30px;
            overflow:hidden;
            width:200px;
        }
    </style>
    <style type="text/css">
        .headimg{width: 100%;height: 150px;}
        .headimg img{width: 100%;}
        .div1{width: 100%;height: 70%;}
        .waik{background: #FFFFFF;width: 60%;height: 800px;
            margin: 0px auto;padding-bottom: 20px;}
        h2{padding: 40px;letter-spacing: 20px;/*margin-left: 350px;*/}
        .box{/*padding-left: 250px;*/ }
        .box li{line-height: 44px;width: 100%;overflow: hidden;}
        /* 字体样式 */
        .box li label {width: 80px;height: 50px;float: left;line-height: 50px;text-align: right;
            padding-right: 20px;}
        /* 输入框的样式 */
        .box li input{padding: 6px 0;font-size: 16px;width: 300px;height: 40px;line-height: 28px;
            border: 1px solid #dddddd;text-indent: 0.5em;float: left;border-radius: 5px;}
        .recruit_bac{width: 300px;height: 40px;border-radius: 5px;border: 1px solid #dddddd;}
        .recruit_sex{width: 300px;height: 40px;border-radius: 5px;border: 1px solid #dddddd;}
        .error{clear: both;display: block;color: red;padding-left: 90px;padding-bottom: 5px;
            height: 20px;float: left;font-size: 12px;line-height: 20px;}
        .submit input{display: inline-block;width: 100px;height: 50px;background-color: #01AAED;
            color: #FFFFFF;font-size: 17px;line-height: 40px;outline: none;border: none;
            border-radius: 5px;cursor: pointer;}
        .submit .login{margin-left: 300px;}
        .submit .reset{margin-left: 100px;position: absolute;background-color: #dddddd;
            border: 1px solid #dddddd;color: #000000;}
    </style>
</head>
<body>
<%--<p style="color: red">${msg}</p>--%>
<script type="text/javascript">
    //验证手机号
    function phone() {
        var regPhone = /^1([356789]\d|5[0-35-9]|7[3678])\d{8}$/;
        var phone = document.getElementById("recruit_phone").value;
        var bool = regPhone.test(phone);
        if(bool == true){
            document.getElementById("phoneError").innerHTML="";
            return true;
        } else {
            document.getElementById("phoneError").innerHTML="请输入正确的手机号";
            document.getElementById("phoneError").style.color="red";
            return false;
        }
    }
    //验证邮箱
    function email() {
        var id = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var txtemail= document.getElementById("recruit_mail").value;
        var bool = id.test(txtemail);
        if(bool == true){
            document.getElementById("emailError").innerHTML="";
            return true;
        }else{
            document.getElementById("emailError").innerHTML="格式不对如jack@163.com";
            document.getElementById("emailError").style.color="red";
            return false;
        }
    }
    //验证身份证号码
    function num() {
        var regPhone=/^[1-9]\d{5}(18|19|20)\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
        var num=document.getElementById("recruit_number").value;
        var bool=regPhone.test(num);
        if(bool==true){
            document.getElementById("numberError").innerHTML="";
            return true
        }else {
            document.getElementById("numberError").innerHTML="请输入正确身份证号";
            document.getElementById("numberError").style.color="red";
            return false;
        }
    }
    function check() {
        var check = phone() && email() && num();
        return check;
    }
</script>
<div class="layui-container">
    <div class="layui-collapse" lay-accordion="">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">合作讲师</h2>
            <div class="layui-colla-content">
                <c:forEach items="${list}" var="user">
                    <div class="list1">
                        <h3>资深讲师：${user.lecturerName}</h3>
                        <p>${user.lecturerIntro}</p>
                        <img style="width:150px; height:150px; border-radius:50%; overflow:hidden;" src="${user.lecturerPhotor}">
                    </div>
                </c:forEach>
            </div>
        </div>
        <%--        <div style="clear: both;"></div>--%>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">招聘信息</h2>
            <div class="layui-colla-content">
                <p>联系我们：<br>
                    地址：北京市海淀区四道口路2号京果商厦A座4层466<br>
                    电话：010-53567019<br>
                    工作时间：9：30--18：00<br></p>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>请填写个人信息</legend>
                </fieldset>
                <form class="waik" action="<%=request.getContextPath()%>/recruit/recruits" method="post" onsubmit="return check()" >
                    <ul class="box">
                        <li>
                            <label>姓名</label>
                            <input type="text" placeholder="请输入姓名" required="required"
                                   name="recruitName" id="recruit_name" oninput="if(value.length>2)value=value.slice(0,10)" autocomplete="off"/>
                            <span class="error" style="color: grey">(不能多于十个文字)</span>
                        </li>
                        <li>
                            <label>学历</label>
                            <select name="recruitBac" class="recruit_bac" id="recruit_bac">
                                <option value="专科">专科</option>
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                                <option value="博士后">博士后</option>
                            </select>
                        </li><br />
                        <li>
                            <label>身份证号码</label>
                            <input type="text" placeholder="请输入证件号码" required="required"
                                   name="recruitNumber" id="recruit_number" onchange="num()"/>
                            <span class="error" id="numberError"></span>
                        </li>
                        <li>
                            <label>手机号码</label>
                            <input type="text" placeholder="请输入手机号码" required="required"
                                   name="recruitPhone" id="recruit_phone" onchange="phone()" />
                            <span class="error" id="phoneError"></span>
                        </li>
                        <li>
                            <label>电子邮箱</label>
                            <input type="recruit_mail" placeholder="请输入电子邮箱" required="required"
                                   name="recruitMail" id="recruit_mail" onchange="email()" />
                            <span class="error" id="emailError"></span>
                        </li>
                        <li>
                            <label>地址</label>
                            <input type="text" placeholder="请输入居住地址" required="required"
                                   name="recruitSite" id="recruit_site" oninput="if(value.length>2)value=value.slice(0,50)"/>
                            <span class="error" id="error" style="color: grey">(不能多余五十个文字)</span>
                        </li>
                        <li>
                            <label>性别</label>
                            <select name="recruitSex" class="recruit_sex" id="recruit_sex">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </li><br />
                    </ul>
                    <div class="submit">                   <%--添加提交弹窗--%>
                        <input class="login" type="button" onclick="javascript:return confirm('您确认要提交表单吗？');"  value="提交"/>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script>

    layui.use(['element', 'layer'], function(){
        var element = layui.element;
        var layer = layui.layer;
    });
    $(function () {
        $(".login").click(function () {
            var recruitName=$("#recruit_name").val();
            var recruitBac=$("#recruit_bac").val();
            var recruitNumber=$("#recruit_number").val();
            var recruitPhone=$("#recruit_phone").val();
            var recruitMail=$("#recruit_mail").val();
            var recruitSite=$("#recruit_site").val();
            var recruitSex=$("#recruit_sex").val();
            var recruit={
                "recruitName":recruitName,
                "recruitBac":recruitBac,
                "recruitNumber":recruitNumber,
                "recruitPhone":recruitPhone,
                "recruitMail":recruitMail,
                "recruitSite":recruitSite,
                "recruitSex":recruitSex
            };
            $.ajax({
                type:'post',
                url:"<%=request.getContextPath()%>/recruit/recruits",
                data:recruit,
                datatype:'json',
                success:function (msg) {
                    alert(msg.msg);

                }
            });
        })
    })

</script>

</body>
</html>
