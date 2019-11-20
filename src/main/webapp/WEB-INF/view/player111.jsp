<%--
  Created by IntelliJ IDEA.
  User: HRY
  Date: 2019/11/18
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1517658_362dvudv818.css">
    <script src="/layui/layui.js"></script>
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        #div_all{
            width: 1000px;
            height: 500px;
            margin: 10px auto;
            overflow: hidden;
        }
        #div_video{
            width: 100%;
            height: 100%;
            background-color: black;
            position: relative;
            left: 0;
            top: 0;
        }
        #div_controller{
            width: 100%;
            height: 70px;
            background-color: #0C0C0C;
            opacity: 0.8;
            position: relative;
            left: 0;
            bottom: -10px;
            transition: bottom 1s;
        }
        #pg_bg{
            width: 100%;
            height: 8px;
            background-color: #c9c9c9;
            position: relative;
            top: 0;
            left: 0;
            cursor: pointer !important;
        }
        #pg_bar{
            width: 0;
            height: 8px;
            background-color: #5FB878;
            position: relative;
            top: 0;
            left: 0;
            cursor: pointer !important;
        }
        #pg_btn{
            width: 16px;
            height: 16px;
            border-radius: 4px;
            background-color: #ffffff;
            position: relative;
            left: 0;
            bottom: 12px;
            cursor: pointer !important;
        }
        .div_btn{
            width: 50px;
            height: 50px;
            float: left;
            margin: 10px 10px;
        }
        #div_void{
            width: 54%;
        }
        #div_time{
            width: 135px;
        }
        .time{
            float: left;
            height: 50px;
            font-size: 15px;
            color: white;
            padding: 7px 0;
        }
        #current_time{
            width: 60px;
        }
        #mid{
            width: 15px;
            text-align: center;
        }
        #total_time{
            width: 60px;
        }
        .enableClk{
            cursor: pointer;
        }
        #volume_bar{
            width: 50px;
            height: 120px;
            background-color: #0C0C0C;
            position: relative;
            bottom: 175px;
            border-radius: 5px;
            display: none;
        }
        #vb_bg{
            width: 4px;
            height: 80px;
            background-color: #c9c9c9;
            border-radius: 2px;
            position: relative;
            margin: 0 auto;
            top: 15px;
            cursor: pointer;
            overflow: hidden;
        }
        #vb_bar{
            width: 100%;
            height: 100%;
            background-color: #5FB878;
            border-radius: 2px;
            position: relative;
            top: 40px;
            left: 0;
            cursor: pointer;
        }
        #vb_btn{
            width: 12px;
            height: 12px;
            border-radius: 6px;
            background-color: white;
            position: relative;
            left: 19px;
            top: -31px;
            cursor: pointer;
        }
        #volume_num{
            margin: 0 auto;
            color: white;
            width: 25px;
            height: 16px;
            position: relative;
            top: 10px;
            text-align: center;
        }
        #speed_btn{
            width: 100%;
            height: 23px;
            border-radius: 5px;
            border: solid 2px white;
            color: white;
            font-size: 15px;
            text-align: center;
            padding: 5px 0 0 0;
        }
        #speed_option_box{
            width: 54px;
            height: 168px;
            background-color: #0C0C0C;
            border-radius: 5px;
            position: relative;
            bottom: 220px;
            display: none;
        }
        .speed_option{
            width: 100%;
            height: 23px;
            background-color: #0C0C0C;
            border-radius: 5px;
            color: white;
            font-size: 15px;
            text-align: center;
            padding: 5px 0 0 0;
        }
    </style>
    <script>
        window.onload = function () {
            var all = document.getElementById("div_all");
            var video = document.getElementById("div_video");
            var controller = document.getElementById("div_controller");
            var btn = document.getElementById("pg_btn");
            var bar = document.getElementById("pg_bar");
            var bg = document.getElementById("pg_bg");
            var vb_btn = document.getElementById("vb_btn");
            var vb_bar = document.getElementById("vb_bar");
            var vb_bg = document.getElementById("vb_bg");
            var btn_play = document.getElementById("btn_play");
            var video1 = document.getElementById("video1");
            var currentTime = document.getElementById("current_time");
            var totalTime = document.getElementById("total_time");
            var volume_num = document.getElementById("volume_num");
            var state = false;
            var volumeState = false;
            var move = 0;
            var res = 0;
            var screenState = false;

            //全屏按钮点击
            document.getElementById("fscreen").onclick = function () {
                screenState = true;
                document.documentElement.requestFullscreen();
            };

            //退出全屏按钮点击
            document.getElementById("escreen").onclick = function () {
                screenState = false;
                document.exitFullscreen();
            };

            //监听全屏改变事件
            window.addEventListener("fullscreenchange",function () {
                if (screenState) {
                    all.style.width = "100%";
                    all.style.height = "100%";
                    all.style.margin = "0";
                    document.getElementById("fscreen").style.display = "none";
                    document.getElementById("escreen").style.display = "block";
                    screenState = false;
                }else{
                    all.style.width = "1000px";
                    all.style.height = "500px";
                    all.style.margin = "10px auto";
                    document.getElementById("fscreen").style.display = "block";
                    document.getElementById("escreen").style.display = "none";
                }
            });

            //视频时长格式转换函数  hh:mm:ss
            function format(num){
                num = Math.round(num);
                var hour = parseInt((num / 3600)+'');
                var minute = parseInt(((num % 3600) / 60)+'');
                var second = (num % 3600) % 60;
                if (hour === 0){
                    hour = '00';
                }else if (hour > 0 && hour < 10){
                    hour = '0' + hour;
                }
                if (minute === 0){
                    minute = '00';
                }else if (minute > 0 && minute < 10){
                    minute = '0' + minute;
                }
                if (second === 0){
                    second = '00';
                }else if (second > 0 && second < 10){
                    second = '0' + second;
                }
                return hour+':'+minute+':'+second;
            }

            //监听成功获取资源长度事件
            video1.addEventListener('loadedmetadata',function () {
                totalTime.innerText = format(video1.duration);
            });

            //进度条点击
            bg.onmousedown = function (ev) {
                move = ev.clientX - $("#pg_bg").offset().left;
                if(move <= 8) {
                    res = move;
                    btn.style.left = 0 + 'px';
                }else if(move >= $("#pg_bg").width()-8){
                    res = move;
                    btn.style.left = $("#pg_bg").width()-16 + 'px';
                }else if(move > 0 && move < $("#pg_bg").width()-8){
                    res = move;
                    btn.style.left = res-8 + 'px';
                }
                bar.style.width = res + 'px';
                currentTime.innerText = format(Math.round(video1.duration * res/$("#pg_bg").width()));
                video1.currentTime = Math.round(video1.duration * res/$("#pg_bg").width());
            };

            //音量条点击
            vb_bg.onmousedown = function (ev) {
                move = 80 - (ev.pageY - $("#vb_bg").offset().top);
                if(move <= 0) {
                    res = 0;
                }else if(move >= $("#vb_bg").height()){
                    res = $("#vb_bg").height();
                }else if(move > 0 && move < $("#vb_bg").height()){
                    res = move;
                }
                vb_btn.style.top = (15-res-6) + 'px';
                vb_bar.style.top = (80-res) + 'px';
                volume_num.innerText = Math.round(res/80*100)+'';
                video1.volume = Math.round(res/80*100)/100;
            };

            btn.onmousedown = function () {
                state = true;
            };

            vb_btn.onmousedown = function () {
                volumeState = true;
            };

            document.onmouseup = function () {
                state = false;
                volumeState = false;
            };

            //拖动 进度条/音量条
            document.onmousemove = function (ev) {
                if (state) {
                    move = ev.clientX - $("#pg_bg").offset().left;
                    if(move <= 0) {
                        res = 0;
                        btn.style.left = res + 'px';
                    }else if(move >= $("#pg_bg").width()){
                        res = $("#pg_bg").width();
                        btn.style.left = res-16 + 'px';
                    }else if(move > 0 && move < $("#pg_bg").width()){
                        res = move;
                        btn.style.left = res-8 + 'px';
                    }
                    bar.style.width = res + 'px';
                    currentTime.innerText = format(Math.round(video1.duration * res/$("#pg_bg").width()));
                    video1.currentTime = Math.round(video1.duration * res/$("#pg_bg").width());
                } else if (volumeState) {
                    move = 80 - (ev.pageY - $("#vb_bg").offset().top);
                    if(move <= 0) {
                        res = 0;
                    }else if(move >= $("#vb_bg").height()){
                        res = $("#vb_bg").height();
                    }else if(move > 0 && move < $("#vb_bg").height()){
                        res = move;
                    }
                    vb_btn.style.top = (15-res-6) + 'px';
                    vb_bar.style.top = (80-res) + 'px';
                    volume_num.innerText = Math.round(res/80*100)+'';
                    video1.volume = Math.round(res/80*100)/100;
                }
            };

            var interval1 = null;
            // 播放/暂停 按钮点击
            btn_play.onclick = function () {
                if(video1.paused){
                    video1.play();
                    video1.volume = parseInt(volume_num.innerText)/100;
                    totalTime.innerText = format(video1.duration);
                    btn_play.innerHTML = "&#xe651;";
                    interval1 = setInterval(function () {
                        res = video1.currentTime/video1.duration * $("#pg_bg").width();
                        btn.style.left = res + 'px';
                        bar.style.width = res + 'px';
                        currentTime.innerText = format(video1.currentTime);
                        if(video1.ended) {
                            btn_play.innerHTML = "&#xe652;";
                            clearInterval(interval1);
                            btn.style.left = 0 + 'px';
                            bar.style.width = 0 + 'px';
                            currentTime.innerText = '00:00:00';
                        }
                    },1000);
                }else{
                    video1.pause();
                    btn_play.innerHTML = "&#xe652;";
                    clearInterval(interval1);
                }
            };

            //点击播放速度选项
            $(".speed_option").click(function () {
                var str = $(this).text()+'';
                str = str.substring(0,str.length-1);
                video1.playbackRate = parseFloat(str);
                $("#speed_btn").text($(this).text());
                $("#speed_option_box").css("display","none");
            });

            //点击播放速度按钮
            $("#speed_btn").click(function () {
                $("#speed_option_box").css("display","block");
            });

            //鼠标 进入/离开 播放速度选项
            $(".speed_option").hover(function () {
                $(this).css("background-color","#5FB878");
            },function () {
                $(this).css("background-color","#0C0C0C");
            });


            //控制栏 显示/隐藏  begin
            var timeOut1 = null;
            var timeOut1State = false;
            video.onmousemove = function () {
                controller.style.bottom = "60px";
                if (!timeOut1State) {
                    timeOut1 = setTimeout(function () {
                        controller.style.bottom = "-10px";
                        timeOut1State = false;
                    }, 2000);
                    timeOut1State = true;
                }
            };
            video.onmouseout = function () {
                if (!timeOut1State) {
                    timeOut1 = setTimeout(function () {
                        controller.style.bottom = "-10px";
                        timeOut1State = false;
                    }, 2000);
                    timeOut1State = true;
                }
            };
            controller.onmouseover = function () {
                clearTimeout(timeOut1);
                timeOut1State = false;
                controller.style.bottom = "60px";
            };
            controller.onmouseout = function () {
                if (!timeOut1State) {
                    timeOut1 = setTimeout(function () {
                        controller.style.bottom = "-10px";
                        timeOut1State = false;
                    }, 2000);
                    timeOut1State = true;
                }
            };
            //控制栏 显示/隐藏 end


            //音量条 显示/隐藏 begin
            var timeOut = null;
            document.getElementById("volume").onmouseover = function () {
                document.getElementById("volume_bar").style.display = "block";
            };
            document.getElementById("volume").onmouseout = function () {
                timeOut = setTimeout(function () {
                    document.getElementById("volume_bar").style.display = "none";
                },1500);
            };
            document.getElementById("volume_bar").onmouseover = function () {
                document.getElementById("volume_bar").style.display = "block";
                clearTimeout(timeOut);
            };
            document.getElementById("volume_bar").onmouseout = function () {
                document.getElementById("volume_bar").style.display = "none";
            }
            //音量条 显示/隐藏 end
        }
    </script>
</head>
<body>
    <div id="div_all">
        <div id="div_video">
            <video id="video1" width="100%" height="100%">
                <source src="/img/ckin.mp4" type="video/mp4" />
            </video>
        </div>
        <div id="div_controller">
            <div id="pg_bg">
                <div id="pg_bar"></div>
                <div id="pg_btn"></div>
            </div>
            <div class="div_btn">
                <i id="btn_play" class="layui-icon" style="font-size: 30px;color: white;cursor: pointer !important;">&#xe652;</i>
            </div>
            <div id="div_time" class="div_btn">
                <div id="current_time" class="time">00:00:00</div>
                <div id="mid" class="time">/</div>
                <div id="total_time" class="time"></div>
            </div>
            <div id="div_void" class="div_btn"></div>
            <div class="div_btn" style="padding: 2px 0 0 0;">
                <i id="volume" class="iconfont icon-yinzhong enableClk" style="width: 100%;height: 100%;font-size: 25px;color: white;margin: 0 0 0 15px"></i>
                <div id="volume_bar">
                    <div id="volume_num" style="">50</div>
                    <div id="vb_bg">
                        <div id="vb_bar"></div>
                    </div>
                    <div id="vb_btn"></div>
                </div>
            </div>
            <div id="div_speed" class="div_btn">
                <div id="speed_btn" class="enableClk">1.0x</div>
                <div id="speed_option_box">
                    <div class="speed_option enableClk">2.0x</div>
                    <div class="speed_option enableClk">1.75x</div>
                    <div class="speed_option enableClk">1.5x</div>
                    <div class="speed_option enableClk">1.25x</div>
                    <div class="speed_option enableClk">1.0x</div>
                    <div class="speed_option enableClk">0.75x</div>
                </div>
            </div>
            <div class="div_btn" style="padding: 2px 0 0 0;">
                <i id="fscreen" class="iconfont icon-quanping enableClk" style="width: 100%;height: 100%;font-size: 25px;color: white;display: block"></i>
                <i id="escreen" class="iconfont icon-tuichuquanping enableClk" style="width: 100%;height: 100%;font-size: 25px;color: white;display: none"></i>
            </div>
        </div>
    </div>
</body>
</html>
