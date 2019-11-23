$(document).ready(function () {
    $(".l_func_icon").mouseenter(function(){
        $(this).css("background-color","white");
        $(this).css("color","black");
        $(this).css("cursor","Pointer");
    });
    $(".l_func_icon").mouseleave(function(){
        $(".l_func_icon").css("background-color","black");
        $(".l_func_icon").css("color","white");
    });

    $("#icon-mulu").click(function () {
        $.ajax({
            type: "POST",
            url:"/chapter/findChapters",
            success:function (data) {
                $("#mulu_div").css("display","block");
                var str = "";
                var chapters = data.chapters;
                $.each(chapters,function (i,chapter) {
                    str += "<ul>";
                    str += "<span>"+chapter.chapterName+"</span>";
                    // $.each(chapter.sectionList,function (i, section) {
                    //     str +="<li><a>"+section.sectionName+"</a></li>";
                    // })
                });
                $("#mulu_div").html(str);
            }
        })

    });

    $("ul span").click(function () {
        var er = $(this).parent().find("li");
        var yi = $(this).parent().siblings("ul");
        if ($(er).css("display")=="none"){
            $(er).slideDown();
        }else {
            $(er).slideUp();
        }
        $(yi).find("li").slideUp();
    });

    /*
    播放器 begin--------------------------------------------------------------------------------------------------------
    */
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
    var interval_cache = null;
    var timeOut_cache = null;
    var cache_res = 0;
    var CTrecord = 0;
    var isMousemove = false;

    //视频等待事件监听
    video1.addEventListener("waiting",function () {
        btn_play.innerHTML = "&#xe652;";
    });

    //视频播放事件监听
    video1.addEventListener("playing",function () {
        btn_play.innerHTML = "&#xe651;";
    });

    //成功获取资源长度事件监听
    video1.addEventListener("loadedmetadata",function () {
        interval_cache = setInterval(function () {
            console.log('length:'+video1.buffered.length);
            for (var i=0;i<video1.buffered.length;i++){
                console.log('start:'+video1.buffered.start(i));
                console.log('end:'+video1.buffered.end(i));
            }
            var res = video1.buffered.end(video1.buffered.length-1)/video1.duration * $("#pg_bg").width();
            document.getElementById("pg_cache").style.width = res + 'px';
            if(video1.buffered.end(0) === video1.duration){
                clearInterval(interval_cache);
            }
        },1000);
    });

    //切换视频方法
    function switchVideo (src) {
        document.getElementById("video_src").src = src;
        video1.load();
        clearInterval(interval1);
        btn_play.innerHTML = "&#xe652;";
        btn.style.left = 0 + 'px';
        bar.style.width = 0 + 'px';
        currentTime.innerText = '00:00:00';
        clearInterval(interval_cache);
        document.getElementById("pg_cache").style.width = 0 + 'px';
    }

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
            $("#div_video_all").css("overflow","visible");
            $("#div_all").offset({top:0,left:0});
            all.style.width = window.screen.width + '';
            all.style.height = window.screen.height + '';
            all.style.margin = "auto";
            var res = video1.buffered.end(0)/video1.duration * $("#pg_bg").width();
            document.getElementById("pg_cache").style.width = res + 'px';
            document.getElementById("fscreen").style.display = "none";
            document.getElementById("escreen").style.display = "block";
            screenState = false;
        }else{
            $("#div_video_all").css("overflow","hidden");
            $("#div_all").offset({top:$("#r_video").offset().top,left:$("#r_video").offset().left});
            all.style.width = "100%";
            all.style.height = "100%";
            all.style.margin = "auto";
            var res = video1.buffered.end(0)/video1.duration * $("#pg_bg").width();
            document.getElementById("pg_cache").style.width = res + 'px';
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
        cache_res = res;
        bar.style.width = res + 'px';
        currentTime.innerText = format(Math.round(video1.duration * res/$("#pg_bg").width()));
        video1.currentTime = Math.round(video1.duration * res/$("#pg_bg").width());


        if (!state) {
            timeOut_cache = setTimeout(function () {
                clearTimeout(timeOut_cache);
                clearInterval(interval_cache);
                var clickVideoTime = video1.duration * cache_res/$("#pg_bg").width();
                var length = video1.buffered.length;
                for(var i=0;i<length;i++){
                    var min = video1.buffered.start(i);
                    var max = video1.buffered.end(i);
                    if(clickVideoTime >= min && clickVideoTime <= max){
                        interval_cache = setInterval(function () {
                            console.log('length:'+video1.buffered.length);
                            for (var l=0;l<video1.buffered.length;l++){
                                console.log('start:'+video1.buffered.start(l));
                                console.log('end:'+video1.buffered.end(l));
                            }
                            var res = video1.buffered.end(i)/video1.duration * $("#pg_bg").width();
                            document.getElementById("pg_cache").style.width = res + 'px';
                            if(video1.buffered.end(0) === video1.duration){
                                clearInterval(interval_cache);
                            }
                        },1000);
                        break;
                    }
                }
            },1000);
        }

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
        if (isMousemove){
            timeOut_cache = setTimeout(function () {
                clearTimeout(timeOut_cache);
                clearInterval(interval_cache);
                var clickVideoTime = video1.duration * cache_res/$("#pg_bg").width();
                var length = video1.buffered.length;
                for(var i=0;i<length;i++){
                    var min = video1.buffered.start(i);
                    var max = video1.buffered.end(i);
                    if(clickVideoTime >= min && clickVideoTime <= max){
                        interval_cache = setInterval(function () {
                            console.log('length:'+video1.buffered.length);
                            for (var l=0;l<video1.buffered.length;l++){
                                console.log('start:'+video1.buffered.start(l));
                                console.log('end:'+video1.buffered.end(l));
                            }
                            var res = video1.buffered.end(i)/video1.duration * $("#pg_bg").width();
                            document.getElementById("pg_cache").style.width = res + 'px';
                            if(video1.buffered.end(0) === video1.duration){
                                clearInterval(interval_cache);
                            }
                        },1000);
                        break;
                    }
                }
            },1000);
        }
        isMousemove = false;
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
            cache_res = res;
            bar.style.width = res + 'px';
            currentTime.innerText = format(Math.round(video1.duration * res/$("#pg_bg").width()));
            video1.currentTime = Math.round(video1.duration * res/$("#pg_bg").width());
            isMousemove = true;
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
                CTrecord = video1.currentTime;
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


    //控制栏 显示/隐藏  begin--------------------------------------------------------------------------------------------
    var timeOut1 = null;
    var timeOut1State = false;
    video.onmousemove = function () {
        controller.style.bottom = "60px";
        btn.style.display = "block";
        if (!timeOut1State) {
            timeOut1 = setTimeout(function () {
                controller.style.bottom = "6px";
                btn.style.display = "none";
                timeOut1State = false;
            }, 2000);
            timeOut1State = true;
        }
    };
    video.onmouseout = function () {
        if (!timeOut1State) {
            timeOut1 = setTimeout(function () {
                controller.style.bottom = "6px";
                btn.style.display = "none";
                timeOut1State = false;
            }, 2000);
            timeOut1State = true;
        }
    };
    controller.onmouseover = function () {
        clearTimeout(timeOut1);
        timeOut1State = false;
        controller.style.bottom = "60px";
        btn.style.display = "block";
    };
    controller.onmouseout = function () {
        if (!timeOut1State) {
            timeOut1 = setTimeout(function () {
                controller.style.bottom = "6px";
                btn.style.display = "none";
                timeOut1State = false;
            }, 2000);
            timeOut1State = true;
        }
    };
    //控制栏 显示/隐藏 end-----------------------------------------------------------------------------------------------


    //音量条 显示/隐藏 begin---------------------------------------------------------------------------------------------
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
    //音量条 显示/隐藏 end-----------------------------------------------------------------------------------------------

    /*清晰度 begin---------------------------------------------------------------------------------------------*/

    //点击清晰度按钮
    $("#sharpness_btn").click(function () {
        $("#sharpness_option_box").css("display","block");
    });

    //点击清晰度选项
    $(".sharpness_option").click(function () {
        var currentTime = video1.currentTime;
        totalTime.innerText = '--:--:--';
        clearInterval(interval1);
        clearTimeout(timeOut_cache);
        clearInterval(interval_cache);
        if('超清'===$(this).text()){
            document.getElementById("video_src").src = "http://47.98.183.4:8888/group1/M00/00/00/rBBUH13Xo7GAK6HTCnvSt70QyI4511.mp4";
        }else if('普清'===$(this).text()){
            document.getElementById("video_src").src = "http://47.98.183.4:8888/group1/M00/00/00/rBBUH13XjVyAVYH-AxDnTtIGlSU552.mp4";
        }
        video1.load();
        video1.currentTime = currentTime;
        btn_play.innerHTML = "&#xe652;";


        $("#sharpness_btn").text($(this).text());
        $("#sharpness_option_box").css("display","none");
    });

    //鼠标 进入/离开 清晰度选项
    $(".sharpness_option").hover(function () {
        $(this).css("background-color","#5FB878");
    },function () {
        $(this).css("background-color","#0C0C0C");
    });

    /*清晰度 end-----------------------------------------------------------------------------------------------*/

    /*
    播放器 end----------------------------------------------------------------------------------------------------------
    */
});

