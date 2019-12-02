$(document).ready(function () {

    layui.use(['element', 'flow'], function () {
        var element = layui.element,
            $ = layui.jquery,
            flow = layui.flow,
            sectionId = "";
        var tagIdArray = new Array();

        note_flow(sectionId);

        // $(".w_e_text").attr("placeholder","字数不超过200字");

        /*功能栏鼠标移入移出功能*/
        $(".l_func_icon").mouseenter(function () {
            $(this).css("background-color", "white");
            $(this).css("color", "black");
            $(this).css("cursor", "Pointer");
        });
        $(".l_func_icon").mouseleave(function () {
            $(".l_func_icon").css("background-color", "black");
            $(".l_func_icon").css("color", "white");
        });

        /*点击目录功能*/
        $("#icon-mulu").click(function () {
            var display = $("#mulu_div").css("display");
            console.log(display);
            if (display === "none") {
                $.ajax({
                    type: "POST",
                    url: "/chapter/findChapters",
                    success: function (data) {
                        $("#mulu_div").css("display", "block");
                        var str = "";
                        var state = "";
                        var chapters = data.chapters;
                        $.each(chapters, function (i, chapter) {
                            str += "<ul>";
                            str += "<span class=\"headline\">" + chapter.chapterName + "</span>";
                            $.each(chapter.sectionList, function (i, section) {
                                var time = section.sectionTime;
                                console.log(time);
                                var time1 = format(time);
                                var sectionId = section.sectionId;
                                str += "<li>";
                                str += "<input hidden name=\"sectionId\" value=\"" + sectionId + "\">";
                                $.ajax({
                                    type: "POST",
                                    url: "/section/findState?sectionId=" + sectionId,
                                    async: false,
                                    success: function (data) {
                                        state = data.state;
                                        console.log(state);
                                        return state;
                                    }
                                });
                                console.log(state);
                                if (state === "播放中") {
                                    str += "<i class=\"iconfont icon-bofang state\"></i>";
                                } else if (state === "已播放") {
                                    str += "<i class=\"iconfont icon-wancheng state\"></i>";
                                } else if (state === "未开始") {
                                    str += "<i class=\"iconfont icon-suoding state\"></i>";
                                }
                                str += section.sectionName;
                                str += "<span class=\"duration\">" + time1 + "</span>";
                                str += "</li>";
                            });
                            str += "</ul>";
                        });
                        $("#mulu_div").html(str);
                    }
                });
            } else {
                $("#mulu_div").css("display", "none");
            }

        });

        /*竖边选择栏*/
        $(document).on("click", "ul span", function () {
            var er = $(this).parent().find("li");
            var yi = $(this).parent().siblings("ul");
            if ($(er).css("display") === "none") {
                $(er).slideDown();
            } else {
                $(er).slideUp();
            }
            $(yi).find("li").slideUp();
        });

        /*小节视频点击更换*/
        $(document).on("click", "ul li", function () {
            var sectionId = $(this).find("input").val();
            console.log(sectionId);
            $.ajax({
                type: "POST",
                url: "/section/findVideoAddr?sectionId=" + sectionId,
                success: function (data) {
                    var src = data.videoAddr;
                    switchVideo(src);
                    $("#mulu_div").css("display", "none");
                }
            });
            note_flow(sectionId);
        });

        /*功能栏问答点击*/
        $("#icon-wenda").click(function () {
            $("#mulu_div").css("display", "none");
            $("#wenda_div").css("display", "block");
            $.ajax({
                type:"POST",
                url:"/courseTag/findAll",
                success:function (result) {
                    var str = "";
                    var tagList = result.tagList;
                    str += "<div id='wenda_bottom_div' style='width: 100%'>";
                    str += "<span>*至少选择1个，最多选择3个</span>";
                    str += "<div style='width: 100%'>";
                    $.each(tagList,function (i,tag) {
                        str += "<div class='tagName' isselect='false'>";
                        str += "<input hidden name=\"tagId\" value=\"" + tag.tagId + "\">";
                        str += tag.tagName+"</div>";
                    });
                    str += "</div>";
                    str += "</div>";
                    $("#text_div").append(str);
                }
            })

        });

        /*问答功能中标签点击事件*/
        $(document).on("click", ".tagName", function () {
            var isselect = $(this).attr("isselect");
            console.log(isselect);
            if (isselect==="false"){
                if (tagIdArray.length<3){
                    $(this).css("background-color","blue");
                    $(this).attr("isselect","true");
                    var tagId = $(this).find("input").val();
                    console.log("tagId="+tagId);
                    tagIdArray.push(tagId);
                    console.log(tagIdArray);
                    console.log(tagIdArray.length);
                }else {
                    alert("最多选择3个标签,请先取消1个标签后再选择新标签");
                }
            }else {
                $(this).css("background-color","grey");
                $(this).attr("isselect","false");
                var tagId = $(this).find("input").val();
                tagIdArray.remove(tagId);
                console.log(tagIdArray);
                console.log(tagIdArray.length);
            }
        });

        //获取元素在数组的下标
        Array.prototype.indexOf = function(val) {
            for (var i = 0; i < this.length; i++) {
                if (this[i] == val)	{
                    return i;
                }
            }
            return -1;
        };

        //根据数组的下标，删除该下标的元素
        Array.prototype.remove = function(val) {
            var index = this.indexOf(val);
            if (index > -1) {
                this.splice(index, 1);
            }
        };

        /*提交按钮点击提交事件*/
        $(document).on("click", "#btn_submit_wenda", function () {
            var content = $(".w-e-text").val();
            console.log(content);
            var data = {"content":content,"tagIdArray":tagIdArray}
            $.ajax({
                type:"POST",
                url:"",
                data:data,
                success:function (result) {
                    alert(result.message);
                }
            })
        });

        /*富文本编辑器生成*/
        var E = window.wangEditor;
        var editor = new E('#toolbar_div', '#text_div');
        // 或者 var editor = new E( document.getElementById('editor') )
        editor.customConfig.menus = [
            'bold',
            'italic',
            'underline',
            'image',
            'code'
        ];
        editor.create();

        /*限制字数判断方法*/
        checkLength = function(dom, maxLength) {
            var l = 0;
            for (var i = 0; i < dom.value.length; i++) {
                if (/[\u4e00-\u9fa5]/.test(dom.value[i])) {
                    l += 2;
                } else {
                    l++;
                }
                if (l > maxLength) {
                    dom.value = dom.value.substr(0, i);
                }
            }
        };


        //视频时长格式转换函数  hh:mm:ss
        function format(num) {
            num = Math.round(num);
            var hour = parseInt((num / 3600) + '');
            var minute = parseInt(((num % 3600) / 60) + '');
            var second = (num % 3600) % 60;
            if (hour === 0) {
                hour = '00';
            } else if (hour > 0 && hour < 10) {
                hour = '0' + hour;
            }
            if (minute === 0) {
                minute = '00';
            } else if (minute > 0 && minute < 10) {
                minute = '0' + minute;
            }
            if (second === 0) {
                second = '00';
            } else if (second > 0 && second < 10) {
                second = '0' + second;
            }
            return hour + ':' + minute + ':' + second;
        }

        /*选项卡bigin*/
        function note_flow(sectionId) {
            $("#lay_flow1").empty();
            flow.load({
                elem: '#lay_flow1',//流加载容器
                isAuto: false,
                done: function (page, next) { //加载下一页
                    var lis = [];
                    var limit = 5;
                    var data = {"sectionId": sectionId, "page": page, "limit": limit};
                    console.log(data);
                    $.ajax({
                        type: "POST",
                        url: "/teacherNote/findNotes",
                        dataType: "json",
                        data: data,
                        success: function (result) {
                            var str = "";
                            layui.each(result.notes, function (i, note) {
                                str += "<div class='note_div'>";
                                str += "<h1 class='note_title'>" + note.title + "</h1>";
                                str += "<div class='note_content_div'><p>" + note.content + "</p></div>";
                                str += "</div>";
                            });
                            lis.push(str);
                            next(lis.join(''), page < result.pages);
                        }
                    })
                }
            })
        }


/*-----------------------------------------学生笔记 begin--------------------------------------------------------------*/

        $("#icon-biji").click(function () {
            $("#div_stuNote").css("display","block");
        });
        $("#stuNote_btn1").click(function () {
            var isEmpty = true;
            var lengthState = true;
            var contentHtml = '' + stu_editor.txt.html();
            var contentText = '' + stu_editor.txt.text();
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
                            stu_editor.txt.clear();
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

        var stuE = window.wangEditor;
        var stu_editor = new stuE('#div_stuNote_toolBar', '#div_stuNote_text');
        stu_editor.customConfig.menus = [
            'bold',
            'italic',
            'underline',
            'image',
            'code'
        ];
        // 隐藏"网络图片"tab
        stu_editor.customConfig.showLinkImg = false;
        stu_editor.customConfig.uploadFileName = 'file';
        stu_editor.customConfig.uploadImgServer = 'stuNote/uploadPic';
        stu_editor.customConfig.uploadImgTimeout = 1000*20;
        stu_editor.customConfig.uploadImgMaxLength = 1;
        stu_editor.customConfig.uploadImgHooks = {
            customInsert: function (insertImg, result, stu_editor) {
                var url = result.data;
                insertImg(url)
            }
        };
        stu_editor.create();

/*-----------------------------------------学生笔记 end----------------------------------------------------------------*/

/*-----------------------------------------学生笔记选项卡 begin---------------------------------------------------------*/
        var flag = 0;
        var flexState = false;
        var userId = "-1";

        $(".SNS_top_selection").click(function () {
            $(this).css("border-bottom","3px solid rgb(102,71,238)");
            $(this).css("color","rgb(102,71,238)");
            $(this).siblings().eq(0).css("border-bottom","0px solid rgb(102,71,238)");
            $(this).siblings().eq(0).css("color","rgb(109,109,109)");
            if ($(this).text() === '最新'){
                flowLoad("/stuNote/findStuNote",userId);
            }else {
                flowLoad("/stuNote/findStuNoteUp",userId);
            }
        });

        //只看我的
        var SNS_top_btn_state = false;
        $(".SNS_top_btn").click(function () {
            if(SNS_top_btn_state){
                $(this).css("color","rgb(109,109,109)");
                userId = "-1";
                SNS_top_btn_state = false;
            }else {
                $(this).css("color","rgb(102,71,238)");
                //需接入+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                userId = "1";
                SNS_top_btn_state = true;
            }
        });

        //采集
        $("#SNS_contentBox").on('click','.collectBtn',function () {
            var snId = parseInt($(this).parent().parent().children().eq(0).text());
            //需接入+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            var userId = 1;
            if ($(this).prev().text() === 'false'){
                $(this).prev().text('true');
                var data = {'state':'true','snId':snId,'userId':userId};
                var thisObj = $(this);
                $.ajax({
                    type:'POST',
                    url:'/stuNote/collect',
                    dataType:'json',
                    data:data,
                    success:function (res) {
                        if (res.error === 0){
                            thisObj.text("已采集");
                            thisObj.css('color','rgb(102,71,238)');
                            var num = parseInt(thisObj.next().text());
                            num++;
                            thisObj.next().text(num);
                        }
                    }
                });
            }else {
                $(this).prev().text('false');
                var data = {'state':'false','snId':snId,'userId':userId};
                var thisObj = $(this);
                $.ajax({
                    type:'POST',
                    url:'/stuNote/collect',
                    dataType:'json',
                    data:data,
                    success:function (res) {
                        if (res.error === 0){
                            thisObj.text("采集");
                            thisObj.css('color','rgb(121,121,121)');
                            var num = parseInt(thisObj.next().text());
                            num--;
                            thisObj.next().text(num);
                        }
                    }
                });
            }
        });

        //举报
        $("#SNS_contentBox").on("click",".reportBtn",function () {
            var snId = parseInt($(this).parent().children().eq(0).text());
            if ($(this).prev().text() === 'false'){
                $(this).prev().text('true');
                var data = {'state':'true','snId':snId};
                var thisObj = $(this);
                $.ajax({
                    type:'POST',
                    url:'/stuNote/report',
                    dataType:'json',
                    data:data,
                    success:function (res) {
                        if (res.error === 0){
                            thisObj.text("已举报");
                            thisObj.css('color','rgb(102,71,238)');
                        }
                    }
                });
            }else {
                $(this).prev().text('false');
                var data = {'state':'false','snId':snId};
                var thisObj = $(this);
                $.ajax({
                    type:'POST',
                    url:'/stuNote/report',
                    dataType:'json',
                    data:data,
                    success:function (res) {
                        if (res.error === 0){
                            thisObj.text("举报");
                            thisObj.css('color','rgb(121,121,121)');
                        }
                    }
                });
            }
        });

        //点赞点踩
        $("#SNS_contentBox").on("click",".UDBtn",function () {
            //需接入+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            var userId = 1;
            var thisObj = $(this);
            if($(this).parent().parent().attr("data_name") === 'up'){
                var snId = parseInt($(this).parent().parent().prev().prev().text());
                var data = {"userId":userId,"snId":snId};
                if($(this).parent().parent().prev().text() === 'none'){
                    $.ajax({
                        type: "POST",
                        url: "/stuNote/upAdd",
                        dataType: "json",
                        data: data,
                        success:function (res) {
                            if (res.error === 0){
                                thisObj.removeClass('icon-qinziAPPtubiao-1');
                                thisObj.addClass('icon-dianzan');
                                thisObj.css("color","rgb(102,71,238)");
                                var value = parseInt(thisObj.parent().next().text()) + 1;
                                thisObj.parent().next().text(value);
                                thisObj.parent().parent().prev().text("up");
                            }
                        }
                    });
                }else if ($(this).parent().parent().prev().text() === 'up'){
                    $.ajax({
                        type: "POST",
                        url: "/stuNote/upDelete",
                        dataType: "json",
                        data: data,
                        success:function (res) {
                            if (res.error === 0){
                                thisObj.removeClass('icon-dianzan');
                                thisObj.addClass('icon-qinziAPPtubiao-1');
                                thisObj.css("color","rgb(121,121,121)");
                                var value = parseInt(thisObj.parent().next().text()) - 1;
                                thisObj.parent().next().text(value);
                                thisObj.parent().parent().prev().text("none");
                            }
                        }
                    });
                }else {
                    $.ajax({
                        type: "POST",
                        url: "/stuNote/upAddDownDelete",
                        dataType: "json",
                        data: data,
                        success:function (res) {
                            if (res.error === 0){
                                thisObj.removeClass('icon-qinziAPPtubiao-1');
                                thisObj.addClass('icon-dianzan');
                                thisObj.css("color","rgb(102,71,238)");
                                var value = parseInt(thisObj.parent().next().text()) + 1;
                                thisObj.parent().next().text(value);
                                thisObj.parent().parent().prev().text("up");

                                var downPic = thisObj.parent().parent().next().children().eq(0).children();
                                downPic.removeClass('icon-dianzan_active');
                                downPic.addClass('icon-qinziAPPtubiao-');
                                downPic.css('font-size','17px');
                                downPic.css('color','rgb(121,121,121)');
                                value = parseInt(downPic.parent().next().text()) - 1;
                                downPic.parent().next().text(value);
                            }
                        }
                    });
                }
            }else {
                var snId = parseInt($(this).parent().parent().prev().prev().prev().text());
                var data = {"userId":userId,"snId":snId};
                if($(this).parent().parent().prev().prev().text() === 'none'){
                    $.ajax({
                        type: "POST",
                        url: "/stuNote/downAdd",
                        dataType: "json",
                        data: data,
                        success:function (res) {
                            if (res.error === 0){
                                thisObj.removeClass('icon-qinziAPPtubiao-');
                                thisObj.addClass('icon-dianzan_active');
                                thisObj.css('font-size','20px');
                                thisObj.css("color","rgb(102,71,238)");
                                var value = parseInt(thisObj.parent().next().text()) + 1;
                                thisObj.parent().next().text(value);
                                thisObj.parent().parent().prev().prev().text("down");
                            }
                        }
                    });
                }else if ($(this).parent().parent().prev().prev().text() === 'down'){
                    $.ajax({
                        type: "POST",
                        url: "/stuNote/downDelete",
                        dataType: "json",
                        data: data,
                        success:function (res) {
                            if (res.error === 0){
                                thisObj.removeClass('icon-dianzan_active');
                                thisObj.addClass('icon-qinziAPPtubiao-');
                                thisObj.css('font-size','17px');
                                thisObj.css("color","rgb(121,121,121)");
                                var value = parseInt(thisObj.parent().next().text()) - 1;
                                thisObj.parent().next().text(value);
                                thisObj.parent().parent().prev().prev().text("none");
                            }
                        }
                    });
                }else {
                    $.ajax({
                        type: "POST",
                        url: "/stuNote/downAddUpDelete",
                        dataType: "json",
                        data: data,
                        success:function (res) {
                            if (res.error === 0){
                                thisObj.removeClass('icon-qinziAPPtubiao-');
                                thisObj.addClass('icon-dianzan_active');
                                thisObj.css('font-size','20px');
                                thisObj.css("color","rgb(102,71,238)");
                                var value = parseInt(thisObj.parent().next().text()) + 1;
                                thisObj.parent().next().text(value);
                                thisObj.parent().parent().prev().prev().text("down");

                                var upPic = thisObj.parent().parent().prev().children().eq(0).children();
                                upPic.removeClass('icon-dianzan');
                                upPic.addClass('icon-qinziAPPtubiao-1');
                                upPic.css("color","rgb(121,121,121)");
                                var value = parseInt(upPic.parent().next().text()) - 1;
                                upPic.parent().next().text(value);
                            }
                        }
                    });
                }
            }
        });

        $("#SNS_contentBox").on("mouseover",".SNS_content",function () {
            $(this).css("background-color",'rgb(255,255,255)');
            $(this).css('box-shadow','0 0 15px rgb(181,179,180)');
        });

        $("#SNS_contentBox").on("mouseout",".SNS_content",function () {
            $(this).css("background-color",'rgb(250,250,250)');
            $(this).css('box-shadow','0 0 0 rgb(255,255,255)');
        });

        // 展开/收起
        $("#SNS_contentBox").on("click",".flexBtn",function () {
            if(flexState){
                $(this).parent().parent().css("height","100%");
                $(this).parent().parent().parent().css("height","200px");
                $(this).parent().prev().css("height","86%");
                $(this).parent().prev().children().eq(1).css("height","90%");
                $(".SNS_f_b_moduleBox").css("right",130);
                flexState = false;
            }else{
                $(this).parent().parent().css("height","auto");
                $(this).parent().parent().parent().css("height","auto");
                $(this).parent().prev().children().eq(1).css("height","auto");
                var height = $(this).parent().prev().children().eq(1).height();
                if (height < 200){
                    height = 200;
                }
                $(this).css("right",0);
                $(this).siblings().css("right",0);
                $(this).parent().prev().css("height",height);
                flexState = true;
            }
        });


        $("#selection_stuNote").click(function () {
            flowLoad("/stuNote/findStuNote",userId);
        });

        function flowLoad(url,userId) {
            $("#SNS_ul_stream").empty();
            flow.load({
                elem: '#SNS_ul_stream',//流加载容器
                isAuto: false,
                done: function (page, next) { //加载下一页
                    var lis = [];
                    var size = 3;
                    var data = {"sectionId": 1, "page": page, "size": size};
                    $.ajax({
                        type: "POST",
                        url: ""+url+"?userId="+userId,
                        dataType: "json",
                        data: data,
                        success: function (result) {
                            var str = "";
                            layui.each(result.notes, function (i, note) {
                                //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                                var uId = '1';
                                var upStr = '<i class="iconfont icon-qinziAPPtubiao-1 UDBtn" style="font-size: 20px !important;color: rgb(121,121,121) !important;"></i>';
                                var downStr = '<i class="iconfont icon-qinziAPPtubiao- UDBtn" style="font-size: 17px !important;color: rgb(121,121,121) !important;"></i>';
                                var upDownState = "none";
                                for (var i in note.stuNoteUpDown){
                                    if(note.stuNoteUpDown[i].userId === uId){
                                        if(note.stuNoteUpDown[i].upDown === 'up'){
                                            upStr = '<i class="iconfont icon-dianzan UDBtn" style="font-size: 20px !important;color: rgb(102,71,238) !important;"></i>';
                                            upDownState = "up";
                                        } else if(note.stuNoteUpDown[i].upDown === 'down'){
                                            downStr = '<i class="iconfont icon-dianzan_active UDBtn" style="font-size: 20px !important;color: rgb(102,71,238) !important;"></i>';
                                            upDownState = "down";
                                        }
                                    }
                                }
                                var collectStr = '<div class="SNS_moduleBox_lbox collectBtn" style="width: 45px">采集</div>';
                                var collectState = 'false';
                                for (var i in note.stuNoteCollect){
                                    if (note.stuNoteCollect[i].userId === uId){
                                        collectStr = '<div class="SNS_moduleBox_lbox collectBtn" style="color: blue;width: 45px">已采集</div>';
                                        collectState = 'true';
                                    }
                                }
                                flag ++;
                                console.log(note.date);
                                str='<div id="SNS_content_'+ flag +'" class="SNS_content" style="margin: 0 0 10px 0">\n' +
                                        '<div class="SNS_content_user">\n' +
                                            '<div class="SNS_headPhoto_box">\n' +
                                                '<img src="'+ note.userImg +'" style="width: 100%;height: 100%">\n' +
                                            '</div>\n' +
                                            '<div class="SNS_userName_box">'+ note.userRealName +'</div>\n' +
                                        '</div>\n' +
                                        '<div class="SNS_rightBox">\n' +
                                            '<div class="SNS_text_box">\n' +
                                                '<div id="SNS_tooBarId'+ flag +'" class="SNS_toolBar" style="display: none"></div>\n' +
                                                '<div id="SNS_textEditorId'+ flag +'" class="SNS_textEditor"></div>\n' +
                                            '</div>\n' +
                                            '<div class="SNS_func_box">' +
                                                '<span style="display: none">'+ note.snId +'</span>' +
                                                '<span style="display: none">'+ upDownState +'</span>' +
                                                '<div class="SNS_f_b_moduleBox updown_btn" data_name="up" style="float: left">' +
                                                    '<div class="SNS_moduleBox_lbox">' +
                                                        upStr +
                                                    '</div>' +
                                                    '<div class="SNS_moduleBox_rbox">'+ note.up +'</div>' +
                                                '</div>' +
                                                '<div class="SNS_f_b_moduleBox updown_btn" data_name="down" style="float: left">' +
                                                    '<div class="SNS_moduleBox_lbox" style="padding: 2px 0 0 0;height: 26px">' +
                                                        downStr +
                                                    '</div>' +
                                                    '<div class="SNS_moduleBox_rbox">'+ note.down +'</div>' +
                                                '</div>' +
                                                '<div class="SNS_f_b_moduleBox" style="float: left;width: 85px">' +
                                                    '<span style="display: none">'+ collectState +'</span>' +
                                                    collectStr +
                                                    '<div class="SNS_moduleBox_rbox" style="padding: 5px 0 0 5px;width: 35px;height: 18px">'+ note.collect +'</div>' +
                                                '</div>' +
                                                '<div class="SNS_f_b_moduleBox enableClk flexBtn" style="float: left">展开/收起</div>' +
                                                '<span style="display: none">false</span>' +
                                                '<div class="SNS_f_b_moduleBox reportBtn" style="float: left">举报</div>' +
                                                '<div class="SNS_f_b_moduleBox" style="float: left;width: 140px;padding: 2px 0 0 0">'+ note.dateString +'</div>' +
                                            '</div>\n' +
                                        '</div>\n' +
                                    '</div>' +
                                    '<script>\n' +
                                    'var SNS_E = window.wangEditor;\n' +
                                    'var SNS_editor'+ flag +' = new SNS_E(\'#SNS_tooBarId'+ flag +'\', \'#SNS_textEditorId'+ flag +'\');\n' +
                                    'SNS_editor'+ flag +'.create();\n' +
                                    'SNS_editor'+ flag +'.txt.html(\''+ note.content +'\');\n' +
                                    'SNS_editor'+ flag +'.$textElem.attr(\'contenteditable\', false);\n' +
                                    '</script>';

                                lis.push(str);
                            });
                            next(lis.join(''), page < result.pages);
                        }
                    });

                }
            });
        }
/*-----------------------------------------学生笔记选项卡 end-----------------------------------------------------------*/


    });


});




