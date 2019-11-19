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
    <script src="/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        var phonenumber;//输入的手机号码
        var phonecode; //输入的验证码
        var code;       //获取到的验证码
        var t; //倒计时对象

        //获取验证码
        function getcode(e) {
            phonenumber = document.getElementById("userPhonenum");
            if(phonenumber.value.length == 0){
                alert("请输入手机号码");
            }else{
                if(!(/^1[34578]\d{9}$/.test(phonenumber.value))){
                    alert("手机号码有误，请重填")
                }else{
                    //这里写死了 应该调用获取验证码的接口
                    // code = 000000;
                    alert(phonenumber.value)
                    var userPhonenum = phonenumber.value;
                    var jsondata={//前端可以发送数据给后端，json形式
                        userPhonenum:userPhonenum
                    }
                    $.ajax({
                        url:'<%=request.getContextPath()%>/user/jsontest',
                        type:'post',
                        // contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: jsondata, /*传给后端的数据格式json*/

                        success:function(data){
                            // code = data.code;
                            // alert(code);
                        }
                    })
                    //按照指定的周期（以毫秒计）来调用函数或计算表达式。
                    //最好是在ajax请求之后再调用函数
                    t = setInterval(function () {
                        countdown(e)
                    }, 1000)
                    alert("验证码已发送");
                    //获取验证码成功后调用倒计时函数
                    countdown(e);
                }
            }
        }

        //按钮的倒计时
        var time = 60;
        function countdown(e){
            if (time == 0) {
                //这里时设置当时间到0的时候重新设置点击事件，并且默认time修改为60
                e.setAttribute("onclick","getcode(this)");
                document.getElementById("getcod").innerText="获取验证码";
                time = 60;
                clearInterval(t);
            }else{
                //这里是显示时间倒计时的时候点击不生效
                e.setAttribute("onclick", '');
                document.getElementById("getcod").innerHTML="重新发送"+time;
                time--;
            }
        }

    </script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
<form action="" method="post">
    <h2>注册</h2>
    <input id="userPhonenum" name="userPhonenum" value="" type="text" placeholder="请输入手机号码"><br>
    <input name="userPwd" type="password" value="" placeholder="请输入密码"><br>
    <input name="userPwd" type="password" value="" placeholder="请再次输入密码"><br>
    <input name="usercode" type="text" value="" placeholder="请输入验证码"><button type="button" id="getcod" onclick="getcode(this);">获取验证码</button>
    <button type="submit">提交</button>
</form>
<button onclick="abb();">233</button>
<%--尾部--%>
<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>
