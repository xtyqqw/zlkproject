$(document).ready(function () {

    layui.use(['element','flow'],function () {
        var element =layui.element,
            $ = layui.jquery,
            flow = layui.flow,
            sectionId = "";

            note_flow(sectionId);

        /*功能栏鼠标移入移出功能*/
        $(".l_func_icon").mouseenter(function(){
            $(this).css("background-color","white");
            $(this).css("color","black");
            $(this).css("cursor","Pointer");
        });
        $(".l_func_icon").mouseleave(function(){
            $(".l_func_icon").css("background-color","black");
            $(".l_func_icon").css("color","white");
        });

        /*点击目录功能*/
        $("#icon-mulu").click(function () {
            var display = $("#mulu_div").css("display");
            console.log(display);
            if (display ==="none"){
                $.ajax({
                    type: "POST",
                    url:"/chapter/findChapters",
                    success:function (data) {
                        $("#mulu_div").css("display","block");
                        var str = "";
                        var state = "";
                        var chapters = data.chapters;
                        $.each(chapters,function (i,chapter) {
                            str += "<ul>";
                            str += "<span class=\"headline\">"+chapter.chapterName+"</span>";
                            $.each(chapter.sectionList,function (i, section) {
                                var time = section.sectionTime;
                                console.log(time);
                                var time1 = format(time);
                                var sectionId = section.sectionId;
                                str += "<li>";
                                str += "<input hidden name=\"sectionId\" value=\""+sectionId+"\">";
                                $.ajax({
                                    type:"POST",
                                    url:"/section/findState?sectionId="+sectionId,
                                    async:false,
                                    success:function (data) {
                                        state = data.state;
                                        console.log(state);
                                        return state;
                                    }
                                });
                                console.log(state);
                                if (state === "播放中"){
                                    str += "<i class=\"iconfont icon-bofang state\"></i>";
                                }else if (state === "已播放"){
                                    str += "<i class=\"iconfont icon-wancheng state\"></i>";
                                }else if (state === "未开始"){
                                    str += "<i class=\"iconfont icon-suoding state\"></i>";
                                }
                                str +=section.sectionName;
                                str +="<span class=\"duration\">"+time1+"</span>";
                                str +="</li>";
                            });
                            str += "</ul>";
                        });
                        $("#mulu_div").html(str);
                    }
                });
            }else {
                $("#mulu_div").css("display","none");
            }

        });

        /*竖边选择栏*/
        $(document).on("click","ul span",function(){
            var er = $(this).parent().find("li");
            var yi = $(this).parent().siblings("ul");
            if ($(er).css("display")==="none"){
                $(er).slideDown();
            }else {
                $(er).slideUp();
            }
            $(yi).find("li").slideUp();
        });

        /*小节视频点击更换*/
        $(document).on("click","ul li",function(){
            var sectionId = $(this).find("input").val();
            console.log(sectionId);
            $.ajax({
                type:"POST",
                url:"/section/findVideoAddr?sectionId="+sectionId,
                success:function (data) {
                    var src = data.videoAddr;
                    switchVideo(src);
                    $("#mulu_div").css("display","none");
                }
            });
            note_flow(sectionId);
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

        //切换视频方法
        function switchVideo (src) {
            document.getElementById("video_src").src = src;
            video1.load();
            clearInterval(interval1);
            btn_play.innerHTML = "&#xe652;";
            btn.style.left = 0 + 'px';
            bar.style.width = 0 + 'px';
            currentTime.innerText = '00:00:00';
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
                $(".FS_hidden").css("display","none");
                $("#div_all").offset({top:0,left:0});
                all.style.width = window.screen.width + '';
                all.style.height = window.screen.height + '';
                all.style.margin = "auto";
                document.getElementById("fscreen").style.display = "none";
                document.getElementById("escreen").style.display = "block";
                screenState = false;
            }else{
                $("#div_all").offset({top:$("#r_video").offset().top,left:$("#r_video").offset().left});
                all.style.width = "100%";
                all.style.height = "100%";
                all.style.margin = "auto";
                document.getElementById("fscreen").style.display = "block";
                document.getElementById("escreen").style.display = "none";
                $(".FS_hidden").css("display","block");
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
        };
        //音量条 显示/隐藏 end
        /*
        播放器 end----------------------------------------------------------------------------------------------------------
        */

        /*选项卡bigin*/
        function note_flow(sectionId) {
            $("#lay_flow1").empty();
            flow.load({
                elem:'#lay_flow1',//流加载容器
                isAuto:false,
                done: function (page, next) { //加载下一页
                    var lis =[];
                    var limit = 5;
                    var data = {"sectionId":sectionId,"page":page,"limit":limit};
                    console.log(data);
                    $.ajax({
                        type:"POST",
                        url:"/teacherNote/findNotes",
                        dataType:"json",
                        data:data,
                        success:function (result) {
                            var str = "";
                            layui.each(result.notes,function (i, note) {
                                str += "<div class='note_div'>";
                                str += "<h1 class='note_title'>"+note.title+"</h1>";
                                str += "<div class='note_content_div'><p>"+note.content+"</p></div>";
                                str += "</div>";
                            });
                            lis.push(str);
                            next(lis.join(''),page<result.pages);
                        }
                    })
                }
            })
        }

    });

});

