window.onload=function(){
    //一、定义了一个获取元素的方法
    function getEle(selector){
        return document.querySelector(selector);
    }
    //二、获取到需要用到的DOM元素
    var box = getEle("#box"),//容器
        bgColor = getEle(".bgColor"),//背景色
        txt = getEle(".txt"),//文本
        slider = getEle(".slider"),//滑块
        icon = getEle(".slider>i"),
        successMoveDistance = box.offsetWidth- slider.offsetWidth,//解锁需要滑动的距离
        downX,//用于存放鼠标按下时的位置
        isSuccess = false;//是否解锁成功的标志，默认不成功

    //三、给滑块添加鼠标按下事件
    slider.onmousedown = mousedownHandler;

    //3.1鼠标按下事件的方法实现
    function mousedownHandler(e){
        bgColor.style.transition = "";
        slider.style.transition = "";
        var e = e || window.event || e.which;
        downX = e.clientX;
        //在鼠标按下时，分别给鼠标添加移动和松开事件
        document.onmousemove = mousemoveHandler;
        document.onmouseup = mouseupHandler;
    };

    //四、定义一个获取鼠标当前需要移动多少距离的方法
    function getOffsetX(offset,min,max){
        if(offset < min){
            offset = min;
        }else if(offset > max){
            offset = max;
        }
        return offset;
    }

    //3.1.1鼠标移动事件的方法实现
    function mousemoveHandler(e){
        var e = e || window.event || e.which;
        var moveX = e.clientX;
        var offsetX = getOffsetX(moveX - downX,0,successMoveDistance);
        bgColor.style.width = offsetX + "px";
        slider.style.left = offsetX + "px";

        if(offsetX == successMoveDistance){
            success();
        }
        //如果不设置滑块滑动时会出现问题（目前还不知道为什么）
        e.preventDefault();
    };

    //3.1.2鼠标松开事件的方法实现
    function mouseupHandler(e){
        if(!isSuccess){
            bgColor.style.width = 0 + "px";
            slider.style.left = 0 + "px";
            bgColor.style.transition = "width 0.8s linear";
            slider.style.transition = "left 0.8s linear";
        }
        document.onmousemove = null;
        document.onmouseup = null;
    };

    //五、定义一个滑块解锁成功的方法
    function success(){
        isSuccess = true;
        txt.innerHTML = "解锁成功";
        bgColor.style.backgroundColor ="lightgreen";
        slider.className = "slider active";
        icon.className = "iconfont icon-xuanzhong";
        //滑动成功时，移除鼠标按下事件和鼠标移动事件
        slider.onmousedown = null;
        document.onmousemove = null;
    };

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
                //测试用数据
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

    //密码
    function checkpwd1() {
        var check = false;
        //获取密码输入框输入的值
        var password = document.getElementById("pwd1").value;
        if (password.length == 6) {
            document.getElementById("checktext2").innerHTML = "";
            check = true;
        } else {
            document.getElementById("checktext2").innerHTML = "密码必须是六位";
            check = false;
        }
        return check;
    }
    //确认密码
    function checkpwd2() {
        var check = false;
        var pwd1 = document.getElementById("pwd1").value;
        var pwd2 = document.getElementById("pwd2").value;
        if (pwd1 != pwd2) {
            document.getElementById("checktext3").innerHTML = "两次输入密码不一致";
            check = false;
        } else {
            document.getElementById("checktext3").innerHTML = "";
            check = true;
        }
        return check;
    }
    //验证手机号
    function phone() {
        var regPhone = /^1([356789]\d|5[0-35-9]|7[3678])\d{8}$/;
        var phone = document.getElementById("userPhonenum").value;
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

    function check(){
        var check = checkpwd1() && checkpwd2()  && phone();
        return check;
    }
}