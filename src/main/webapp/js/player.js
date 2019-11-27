window.onload=function () {
/*-----------------------------------------播放器 begin----------------------------------------------------------------*/
    var elem_all = document.getElementById("div_all");
    var elem_video = document.getElementById("div_video");
    var elem_controller = document.getElementById("div_controller");
    var elem_pgBtn = document.getElementById("pg_btn");
    var elem_pgBar = document.getElementById("pg_bar");
    var elem_pgBg = document.getElementById("pg_bg");
    var elem_vbBtn = document.getElementById("vb_btn");
    var elem_vbBar = document.getElementById("vb_bar");
    var elem_vbBg = document.getElementById("vb_bg");
    var elem_btnPlay = document.getElementById("btn_play");
    var elem_video1 = document.getElementById("video1");
    var elem_currentTime = document.getElementById("current_time");
    var elem_totalTime = document.getElementById("total_time");
    var elem_volumeNum = document.getElementById("volume_num");
    //鼠标是否点击进度条按钮 变量
    var state = false;
    //鼠标是否点击音量条按钮 变量
    var volumeState = false;
    //鼠标点击事件发生的X轴/Y轴偏移量
    var move = 0;
    //最终偏移量
    var res = 0;
    //是否全屏的状态变量
    var screenState = false;
    var interval_cache = null;
    var delay_cache = null;
    var cache_res = 0;
    var CTrecord = 0;
    var isMousemove = false;
    var isClose = false;
    var sharpState = false;

    //切换视频函数
    function switchVideo (src) {
        document.getElementById("video_src").src = src;
        elem_video1.load();
        clearInterval(interval1);
        elem_btnPlay.innerHTML = "&#xe652;";
        elem_pgBtn.style.left = 0 + 'px';
        elem_pgBar.style.width = 0 + 'px';
        elem_currentTime.innerText = '00:00:00';
        clearInterval(interval_cache);
        document.getElementById("pg_cache").style.width = 0 + 'px';
    }

    //在浏览器控制台输出缓冲信息函数
    function printCache () {
        console.log('length:'+elem_video1.buffered.length);
        for (var i=0;i<elem_video1.buffered.length;i++){
            console.log('start:'+elem_video1.buffered.start(i));
            console.log('end:'+elem_video1.buffered.end(i));
        }
    }

    //重置缓冲条函数
    function resetCache () {
        delay_cache = setInterval(function () {
            clearInterval(interval_cache);
            var clickVideoTime = elem_video1.duration * cache_res/$("#pg_bg").width();
            var length = elem_video1.buffered.length;
            for(var i=0;i<length;i++){
                var min = elem_video1.buffered.start(i);
                var max = elem_video1.buffered.end(i);
                if(clickVideoTime >= min && clickVideoTime <= max){
                    clearInterval(delay_cache);
                    interval_cache = setInterval(function () {
                        printCache();
                        var res = elem_video1.buffered.end(i)/elem_video1.duration * $("#pg_bg").width();
                        document.getElementById("pg_cache").style.width = res + 'px';
                        if(elem_video1.buffered.end(0) === elem_video1.duration){
                            clearInterval(interval_cache);
                        }
                    },1000);
                    break;
                }
            }
        },200);
    }

    //音量条动作响应函数
    function volumeBarAction (ev) {
        move = 80 - (ev.pageY - $("#vb_bg").offset().top);
        if(move <= 0) {
            res = 0;
        }else if(move >= $("#vb_bg").height()){
            res = $("#vb_bg").height();
        }else if(move > 0 && move < $("#vb_bg").height()){
            res = move;
        }
        elem_vbBtn.style.top = (15-res-6) + 'px';
        elem_vbBar.style.top = (80-res) + 'px';
        elem_volumeNum.innerText = Math.round(res/80*100)+'';
        elem_video1.volume = Math.round(res/80*100)/100;
    }

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

    //刷新/关闭 事件监听
    window.onbeforeunload = function () {
        isClose = true;
    };

    //刷新/关闭 事件监听
    window.onunload = function () {
        if (isClose){
            var data = {'time':elem_video1.currentTime};
            $.ajax({
                type : "POST",
                async: false,
                url : "/player/recordTime",
                data : data
            });
        }
    };

    //视频等待事件监听
    elem_video1.addEventListener("waiting",function () {
        elem_btnPlay.innerHTML = "&#xe652;";
    });

    //视频播放事件监听
    elem_video1.addEventListener("playing",function () {
        elem_btnPlay.innerHTML = "&#xe651;";
    });

    //成功获取资源长度事件监听
    elem_video1.addEventListener("loadedmetadata",function () {
        if (!sharpState) {
            $.ajax({
                type : "POST",
                async: false,
                url : "/player/readRecord",
                success:function (res) {
                    elem_video1.currentTime = res;
                    elem_pgBtn.style.left = res/elem_video1.duration * $("#pg_bg").width() + 'px';
                    elem_pgBar.style.width = res/elem_video1.duration * $("#pg_bg").width() + 'px';
                    elem_currentTime.innerText = format(res);
                }
            });
        }
        sharpState = false;
        interval_cache = setInterval(function () {
            printCache();
            var res = elem_video1.buffered.end(elem_video1.buffered.length-1)/elem_video1.duration * $("#pg_bg").width();
            document.getElementById("pg_cache").style.width = res + 'px';
            if(elem_video1.buffered.end(0) === elem_video1.duration){
                clearInterval(interval_cache);
            }
        },1000);
    });

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
            elem_all.style.width = window.document.body.offsetWidth + 'px';
            elem_all.style.height = window.document.body.offsetHeight + 'px';
            elem_all.style.margin = "auto";
            var res = elem_video1.buffered.end(0)/elem_video1.duration * $("#pg_bg").width();
            document.getElementById("pg_cache").style.width = res + 'px';
            document.getElementById("fscreen").style.display = "none";
            document.getElementById("escreen").style.display = "block";
            document.getElementById("l_func").style.overflow = "visible";
            document.getElementById("r_video").style.overflow = "visible";
            screenState = false;
        }else{
            $("#div_video_all").css("overflow","hidden");
            $("#div_all").offset({top:$("#r_video").offset().top,left:$("#r_video").offset().left});
            elem_all.style.width = "100%";
            elem_all.style.height = "100%";
            elem_all.style.margin = "auto";
            var res = elem_video1.buffered.end(0)/elem_video1.duration * $("#pg_bg").width();
            document.getElementById("pg_cache").style.width = res + 'px';
            document.getElementById("fscreen").style.display = "block";
            document.getElementById("escreen").style.display = "none";
            document.getElementById("l_func").style.overflow = "hidden";
            document.getElementById("r_video").style.overflow = "hidden";
        }
    });

    //监听成功获取资源长度事件
    elem_video1.addEventListener('loadedmetadata',function () {
        elem_totalTime.innerText = format(elem_video1.duration);
    });

    //进度条点击
    elem_pgBg.onmousedown = function (ev) {
        move = ev.clientX - $("#pg_bg").offset().left;
        if(move <= 8) {
            res = move;
            elem_pgBtn.style.left = 0 + 'px';
        }else if(move >= $("#pg_bg").width()-8){
            res = move;
            elem_pgBtn.style.left = $("#pg_bg").width()-16 + 'px';
        }else if(move > 0 && move < $("#pg_bg").width()-8){
            res = move;
            elem_pgBtn.style.left = res-8 + 'px';
        }
        cache_res = res;
        elem_pgBar.style.width = res + 'px';
        elem_currentTime.innerText = format(Math.round(elem_video1.duration * res/$("#pg_bg").width()));
        elem_video1.currentTime = Math.round(elem_video1.duration * res/$("#pg_bg").width());


        if (!state) {
            resetCache();
        }

    };

    //音量条点击
    elem_vbBg.onmousedown = function (ev) {
        volumeBarAction(ev);
    };

    //进度条按钮 鼠标按下事件
    elem_pgBtn.onmousedown = function () {
        state = true;
    };

    //音量条按钮 鼠标按下事件
    elem_vbBtn.onmousedown = function () {
        volumeState = true;
    };

    document.onmouseup = function () {
        state = false;
        volumeState = false;
        if (isMousemove){
            resetCache();
        }
        isMousemove = false;
    };

    //拖动 进度条/音量条
    document.onmousemove = function (ev) {
        if (state) {
            move = ev.clientX - $("#pg_bg").offset().left;
            if(move <= 0) {
                res = 0;
                elem_pgBtn.style.left = res + 'px';
            }else if(move >= $("#pg_bg").width()){
                res = $("#pg_bg").width();
                elem_pgBtn.style.left = res-16 + 'px';
            }else if(move > 0 && move < $("#pg_bg").width()){
                res = move;
                elem_pgBtn.style.left = res-8 + 'px';
            }
            cache_res = res;
            elem_pgBar.style.width = res + 'px';
            elem_currentTime.innerText = format(Math.round(elem_video1.duration * res/$("#pg_bg").width()));
            elem_video1.currentTime = Math.round(elem_video1.duration * res/$("#pg_bg").width());
            isMousemove = true;
        } else if (volumeState) {
            volumeBarAction(ev);
        }
    };

    var interval1 = null;
    // 播放/暂停 按钮点击
    elem_btnPlay.onclick = function () {
        if(elem_video1.paused){
            elem_video1.play();
            elem_video1.volume = parseInt(elem_volumeNum.innerText)/100;
            elem_totalTime.innerText = format(elem_video1.duration);
            elem_btnPlay.innerHTML = "&#xe651;";
            interval1 = setInterval(function () {
                res = elem_video1.currentTime/elem_video1.duration * $("#pg_bg").width();
                elem_pgBtn.style.left = res + 'px';
                elem_pgBar.style.width = res + 'px';
                elem_currentTime.innerText = format(elem_video1.currentTime);
                CTrecord = elem_video1.currentTime;
                if(elem_video1.ended) {
                    elem_btnPlay.innerHTML = "&#xe652;";
                    clearInterval(interval1);
                    elem_pgBtn.style.left = 0 + 'px';
                    elem_pgBar.style.width = 0 + 'px';
                    elem_currentTime.innerText = '00:00:00';
                }
            },1000);
        }else{
            elem_video1.pause();
            elem_btnPlay.innerHTML = "&#xe652;";
            clearInterval(interval1);
        }
    };

    //点击播放速度选项
    $(".speed_option").click(function () {
        var str = $(this).text()+'';
        str = str.substring(0,str.length-1);
        elem_video1.playbackRate = parseFloat(str);
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
    elem_video.onmousemove = function () {
        elem_controller.style.bottom = "60px";
        elem_pgBtn.style.display = "block";
        if (!timeOut1State) {
            timeOut1 = setTimeout(function () {
                elem_controller.style.bottom = "6px";
                elem_pgBtn.style.display = "none";
                timeOut1State = false;
            }, 2000);
            timeOut1State = true;
        }
    };
    elem_video.onmouseout = function () {
        if (!timeOut1State) {
            timeOut1 = setTimeout(function () {
                elem_controller.style.bottom = "6px";
                elem_pgBtn.style.display = "none";
                timeOut1State = false;
            }, 2000);
            timeOut1State = true;
        }
    };
    elem_controller.onmouseover = function () {
        clearTimeout(timeOut1);
        timeOut1State = false;
        elem_controller.style.bottom = "60px";
        elem_pgBtn.style.display = "block";
    };
    elem_controller.onmouseout = function () {
        if (!timeOut1State) {
            timeOut1 = setTimeout(function () {
                elem_controller.style.bottom = "6px";
                elem_pgBtn.style.display = "none";
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

    /*--------清晰度 begin---------------------------------------------------------------------------------------------*/
    //点击清晰度按钮
    $("#sharpness_btn").click(function () {
        $("#sharpness_option_box").css("display","block");
    });

    //点击清晰度选项
    $(".sharpness_option").click(function () {
        sharpState = true;
        var currentTime = elem_video1.currentTime;
        elem_totalTime.innerText = '--:--:--';
        clearInterval(interval1);
        clearInterval(delay_cache);
        clearInterval(interval_cache);
        if('超清'===$(this).text()){
            document.getElementById("video_src").src = "http://47.98.183.4:8888/group1/M00/00/00/rBBUH13Xo7GAK6HTCnvSt70QyI4511.mp4";
        }else if('普清'===$(this).text()){
            document.getElementById("video_src").src = "http://47.98.183.4:8888/group1/M00/00/00/rBBUH13XjVyAVYH-AxDnTtIGlSU552.mp4";
        }
        elem_video1.load();
        elem_video1.currentTime = currentTime;
        elem_btnPlay.innerHTML = "&#xe652;";


        $("#sharpness_btn").text($(this).text());
        $("#sharpness_option_box").css("display","none");
    });

    //鼠标 进入/离开 清晰度选项
    $(".sharpness_option").hover(function () {
        $(this).css("background-color","#5FB878");
    },function () {
        $(this).css("background-color","#0C0C0C");
    });
    /*--------清晰度 end-----------------------------------------------------------------------------------------------*/

/*-----------------------------------------播放器 end------------------------------------------------------------------*/


/*-----------------------------------------学生笔记 begin--------------------------------------------------------------*/

    $("#icon-biji").click(function () {
        $("#div_stuNote").css("display","block");
    });
    $("#stuNote_btn1").click(function () {
        var isEmpty = true;
        var lengthState = true;
        var contentHtml = '' + editor.txt.html();
        var contentText = '' + editor.txt.text();
        if (contentText === ''){
            isEmpty = true;
        }else {
            isEmpty = false;
        }
        var arrP = $("#div_text").children(0).children();
        for (var i=0;i<arrP.length;i++){
            if (arrP.eq(i).children("img").length > 0){
                isEmpty = false;
            }
        }
        var data = {'content':contentHtml};
        if(contentHtml.length>512){
            alert("内容超出最大长度限制！");
            lengthState = false;
        }
        if (isEmpty){
            alert("内容为空无法提交！");
        }
        if(lengthState && !isEmpty){
            $.ajax({
                type : "POST",
                url : "/stuNote/submit",
                data : data,
                success : function (res) {
                    alert(res.retmsg);
                    if (res.retmsg === '保存成功'){
                        editor.txt.clear();
                    }
                }
            });
        }
        lengthState = true;
    });
    $("#stuNote_btn2").click(function () {
        $("#div_stuNote").css("display","none");
    });
    $("#stuNoteCloseBtn").click(function () {
        $("#div_stuNote").css("display","none");
    });

    var E = window.wangEditor;
    var editor = new E('#div_toolBar', '#div_text');
    editor.customConfig.menus = [
        'bold',
        'italic',
        'underline',
        'image',
        'code'
    ];
    // 隐藏"网络图片"tab
    editor.customConfig.showLinkImg = false;
    editor.customConfig.uploadFileName = 'file';
    editor.customConfig.uploadImgServer = 'stuNote/uploadPic';
    editor.customConfig.uploadImgTimeout = 1000*20;
    editor.customConfig.uploadImgMaxLength = 1;
    editor.customConfig.uploadImgHooks = {
        before: function (xhr, editor, files) {

        },
        success: function (xhr, editor, result) {

        },
        fail: function (xhr, editor, result) {

        },
        error: function (xhr, editor) {

        },
        timeout: function (xhr, editor) {

        },
        customInsert: function (insertImg, result, editor) {
            var url = result.data;
            insertImg(url)
        }
    };
    editor.create();

/*-----------------------------------------学生笔记 end----------------------------------------------------------------*/

};

//切换视频函数
function switchVideo (src) {
    alert("应用到了");
}