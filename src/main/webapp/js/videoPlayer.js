var replyEditorArr = [];

$(document).ready(function () {

    var localObj = window.location;
    var basePath = localObj.protocol+"//"+localObj.host;
    var server_context=basePath;

    alert(basePath);

    layui.use(['element', 'flow','layer'], function () {
        var element = layui.element,
            $ = layui.jquery,
            flow = layui.flow,
            layer = layui.layer,
            sectionId = parseInt($("#sectionId").text());
        var tagIdArray = new Array();
        var editorflag = 0;
        var editori = 0;

        /*讲师笔记初加载*/
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
                    url: basePath+'/chapter/findChapters',
                    data: "",
                    dataType: "json",
                    success: function (data) {
                        alert(data.msg);
                        $("#mulu_div").css("display", "block");
                        $("#wenda_div").css("display", "none");
                        $("#div_stuNote").css("display", "none");
                        $("#div_stuCmt").css("display", "none");
                        var str = "";
                        var state = "";
                        var chapters = data.chapters;
                        $.each(chapters, function (i, chapter) {
                            str += "<ul>";
                            str += "<span class=\"headline\">" + chapter.chapterName + "</span>";
                            $.each(chapter.sectionList, function (i, section) {
                                var time = section.sectionTime;
                                var time1 = format(time);
                                var sectionId = section.sectionId;
                                str += "<li class='section'>";
                                str += "<input hidden name=\"sectionId\" value=\"" + sectionId + "\">";
                                $.ajax({
                                    type: "POST",
                                    url: basePath+"/section/findState?sectionId=" + sectionId,
                                    async: false,
                                    success: function (data) {
                                        state = data.state;
                                        return state;
                                    }
                                });
                                if (state === "播放中") {
                                    str += "<i class=\"iconfont icon-bofang state\"></i>";
                                } else if (state === "已完成") {
                                    str += "<i class=\"iconfont icon-wancheng state\"></i>";
                                } else if (state === "未观看") {
                                    str += "<i class=\"iconfont icon-suoding state\"></i>";
                                }
                                str += "<input hidden class=\"sectionState\" value=\"" + state + "\">";
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
        $(document).on("click", ".section", function () {
            let sectionId = $(this).find("input").val();
            let state = $(this).find("input").eq(1).val();
            let currentSectionId = parseInt($("#sectionId").text());
            $.ajax({
                type: "POST",
                url: basePath+"/section/findVideoAddr?sectionId=" + sectionId,
                success: function (data) {
                    var src = data.section.videoAddr1;
                    switchVideo(src,currentSectionId);
                    $("#mulu_div").css("display", "none");
                    $("#nv").text(data.section.videoAddr1);
                    $("#sv").text(data.section.videoAddr2);
                }
            });
            note_flow(sectionId);
            stu_qa_flow(sectionId);
            $("#sectionId").text(sectionId);
        });

        /*视频播放按钮点击事件*/

        /*功能栏问答点击*/
        $("#icon-wenda").click(function () {
            $("#mulu_div").css("display", "none");
            $("#wenda_div").css("display", "block");
            $("#div_stuNote").css("display", "none");
            $("#div_stuCmt").css("display", "none");
            $.ajax({
                type:"POST",
                url:basePath+"/courseTag/findAll",
                success:function (result) {
                    var str = "";
                    var tagList = result.tagList;
                    str += "<div id='wenda_bottom_div' style='width: 100%'>";
                    str += "<span id='wenda_bottom_div_span'>*至少选择1个，最多选择3个</span>";
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
            if (isselect==="false"){
                if (tagIdArray.length<3){
                    $(this).css("background-color","blue");
                    $(this).attr("isselect","true");
                    var tagId = $(this).find("input").val();
                    tagIdArray.push(tagId);
                }else {
                    alert("最多选择3个标签,请先取消1个标签后再选择新标签");
                }
            }else {
                $(this).css("background-color","grey");
                $(this).attr("isselect","false");
                var tagId = $(this).find("input").val();
                tagIdArray.remove(tagId);
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

        /*问答提交按钮点击提交事件*/
        $(document).on("click", "#btn_submit_wenda", function () {
            if (tagIdArray.length==0){
                alert("至少选择1个标签");
            }else {
                var content = editor.txt.html();
                var data = {"content":content,"tagIdArray":tagIdArray};
                $.ajax({
                    type:"POST",
                    url:basePath+"/stuQa/insertStuQa",
                    data:data,
                    dataType: "json",
                    traditional:true,
                    success:function (result) {
                        alert(result.message);
                        if(result.message==="添加成功"){
                            editor.txt.clear();
                            $(".tagName").css("background-color","grey");
                            $(".tagName").attr("isselect","false");
                            $("#wenda_div").css("display", "none");
                            tagIdArray.splice(0);
                        }
                    }
                });
                stu_qa_flow("#stuQaall",basePath+"/stuQa/findStuQaList",sectionId);
            }
        });

        /*问答取消按钮点击提交事件*/
        $(document).on("click", "#btn_reset_wenda", function () {
            editor.txt.clear();
            $(".tagName").css("background-color","grey");
            $(".tagName").attr("isselect","false");
            // $("#wenda_div").css("display", "none");
            tagIdArray.splice(0);
        });

        /*关闭按钮点击提交事件*/
        $(document).on("click", "#stu_qa_close_btn", function () {
            editor.txt.clear();
            $(".tagName").css("background-color","grey");
            $(".tagName").attr("isselect","false");
            $("#wenda_div").css("display", "none");
            tagIdArray.splice(0);
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
        // 隐藏"网络图片"tab
        editor.customConfig.showLinkImg = false;
        editor.customConfig.uploadFileName = 'file';
        editor.customConfig.uploadImgServer = basePath+'/stuNote/uploadPic';
        editor.customConfig.uploadImgTimeout = 1000*20;
        editor.customConfig.uploadImgMaxLength = 1;
        editor.customConfig.uploadImgHooks = {
            customInsert: function (insertImg, result, editor) {
                var url = result.data;
                insertImg(url)
            }
        };
        editor.create();

        /*限制字数判断方法*/
        checkLength = function(maxLength) {
            var text = editor.txt.html();
            var reTag = /<(?:.|\s)*?>/g;
            var reText = text.replace(reTag,"");
            var l = 0;
            for (var i = 0; i < reText.length; i++) {
                if (/[\u4e00-\u9fa5]/.test(reText[i])) {
                    l += 2;
                } else {
                    l++;
                }
                if (l > maxLength) {
                    reText = reText.substr(0, maxLength);

                }
            }
        };


        /*//视频时长格式转换函数  hh:mm:ss
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
        }*/

        /*选项卡教师笔记加载bigin*/
        function note_flow(sectionId) {
            $("#lay_flow1").empty();
            flow.load({
                elem: '#lay_flow1',//流加载容器
                isAuto: false,
                done: function (page, next) { //加载下一页
                    var lis = [];
                    var limit = 3;
                    var data = {"sectionId": sectionId, "page": page, "limit": limit};
                    console.log(data);
                    $.ajax({
                        type: "POST",
                        url: basePath+"/teacherNote/findNotes",
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

        /*-----------------------------------------学生问答选项卡 begin---------------------------------------------------------*/

        /*学生问答选项卡切换加载*/
        $("#stuQa-tab").click(function () {
            stu_qa_flow("#stuQaall",basePath+"/stuQa/findStuQaList",sectionId);
        });

        /*学生问答流加载*/
        function stu_qa_flow(id,url,sectionId) {
            $(".stuQa-item").empty();
            flow.load({
                elem: ''+id,//流加载容器
                isAuto: false,
                done: function (page, next) { //加载下一页
                    var lis = [];
                    var limit = 5;
                    var data = {"sectionId": sectionId, "page": page, "limit": limit};
                    console.log(data);
                    $.ajax({
                        type: "POST",
                        url: ""+url,
                        dataType: "json",
                        data: data,
                        success: function (result) {
                            var str = "";
                            var user = "";
                            layui.each(result.stuQaList, function (i, stuQa) {
                                console.log("stuQa="+stuQa);
                                editorflag++;
                                str += "<div class=\"stuQa-box\">";
                                str += "<div class=\"stuQa-user\">";
                                $.ajax({
                                    type:"POST",
                                    url: basePath+'/users/selectNameAndImg',
                                    async: false,
                                    data:{"userId":stuQa.userId},
                                    success:function (result1) {
                                        user = result1.user;
                                        return user;
                                    }
                                });
                                str += "<div class=\"stuQa-userPhoto\">";
                                str += "<img src='"+user.userImg+"' class='userPhoto'>";
                                str += "</div>";
                                str += "<div class=\"stuQa-userName\">"+user.userRealname+"</div>";
                                str += "</div>";
                                str += "<div class=\"stuQa-content-box\">";
                                str += "<input name='sqaId' value='"+stuQa.sqaId+"' hidden='hidden'>";
                                /*str += "<input name='pId' value='"+stuQa.pId+"' hidden='hidden'>";*/
                                str += "<div class=\"stuQa-tag-box\">";
                                layui.each(stuQa.tagList,function (i, tag) {
                                    console.log(tag);
                                    str += "<div class=\"stuQa-tag\">"+tag.tagName+"</div>";
                                });
                                str += "</div>";
                                str += "<div class=\"stuQa-content\">";
                                str += "<div class=\"stuQa-toolbar\" id='stuQa-toolbar"+editorflag+"'></div>";
                                str += "<div class=\"stuQa-textEditor\" id='stuQa-textEditor"+editorflag+"'>"+stuQa.content+"</div>";
                                str += "</div>";
                                editorCreate(editorflag);
                                str += "<div class=\"stuQa-function-box\">";
                                str += "<div class=\"stuQa-function-div\">";
                                str += "<div class=\"stuQa-func-tag stuQa-answer\" id='stuQa-answer"+editorflag+"'>回答</div>";
                                str += "<div class=\"stuQa-func-tag\" id='stuQa-answerNum"+editorflag+"'>"+stuQa.answerNum+"</div>";
                                str += "<div class=\"stuQa-func-tag\" id='stuQa-view"+editorflag+"'>浏览</div>";
                                str += "<div class=\"stuQa-func-tag\" id='stuQa-viewNum"+editorflag+"'>"+stuQa.viewNum+"</div>";
                                str += "<div class=\"stuQa-func-tag stuQa-readMore\" id='stuQa-readMore"+editorflag+"'>查看全文</div>";
                                if (stuQa.share === "已分享"){
                                    str += "<div class=\"stuQa-func-tag stuQa-share\" style='color: #9ea2ea' id='stuQa-share"+editorflag+"'>"+stuQa.share+"</div>";
                                }else {
                                    str += "<div class=\"stuQa-func-tag stuQa-share\" id='stuQa-share"+editorflag+"'>"+stuQa.share+"</div>";
                                }
                                if (stuQa.report === "已举报"){
                                    str += "<div class=\"stuQa-func-tag stuQa-report\" style='color: #9ea2ea' id='stuQa-report"+editorflag+"'>"+stuQa.report+"</div>";
                                }else {
                                    str += "<div class=\"stuQa-func-tag stuQa-report\" id='stuQa-report"+editorflag+"'>"+stuQa.report+"</div>";
                                }
                                str += "<div class=\"stuQa-func-tag stuQa-reply\" id='stuQa-reply"+editorflag+"'>回复</div>";
                                str += "<input hidden value='"+stuQa.pId+"'></input>";
                                str += "<div class=\"stuQa-date\" id='stuQa-date"+editorflag+"'>"+stuQa.date+"</div>";
                                str += "</div>";
                                str += "<div class=\"stuQa-answer-div\" id='sqaId"+stuQa.sqaId+"' style='display: none'>";
                                str += "</div>";
                                str += "</div>";
                                str += "</div>";
                                str += "</div>";
                            });
                            lis.push(str);
                            next(lis.join(''), page < result.pages);
                        }
                    })
                }
            })
        }

        /*富文本编辑器生成*/
        function editorCreate(editorflag) {
            var E = window.wangEditor;
            var editor = "editor" + editorflag;
            console.log(editor);
            editor = new E('#stuQa-toolbar'+editorflag, '#stuQa-textEditor'+editorflag);
            editor.create();
        }


        //全部选项卡点击事件
        $("#stuQaall-tab").click(function () {
            stu_qa_flow("#stuQaall",basePath+"/stuQa/findStuQaList",sectionId);
        });

        //精华选项卡点击事件
        $("#stuQaelite-tab").click(function () {
            stu_qa_flow("#stuQaelite",basePath+"/stuQa/findStuQaListElite",sectionId);
        });

        /*查看全文按钮点击提交事件*/
        $(document).on("click", ".stuQa-readMore", function () {
            if ($(this).text() === "查看全文"){
                height = $(this).parent().parent().prev().find("div").eq(1).height();//富文本框编辑器的高度
                height1 = $(this).parent().parent().height(); //功能按钮框的高度
                height2 = $(this).parent().parent().parent().find("div").eq(0).height();//标签框的高度
                height3 = $(this).parent().parent().parent().parent().height();//评论块整体高度
                if (height <= 200){
                    $(this).text("收起");
                }else {
                    $(this).parent().parent().prev().css("height","auto");
                    $(this).parent().parent().parent().css("height","auto");
                    $(this).parent().parent().parent().parent().css("height","auto");
                    $(this).parent().parent().parent().prev().find("div").eq(0).css("height",160);
                    $(this).parent().parent().css("height",height1);
                    $(this).parent().parent().parent().find("div").eq(0).css("height",height2);
                    $(this).text("收起");
                }
            }else if($(this).text() === "收起"){
                $(this).parent().parent().prev().css("height","60%");
                $(this).parent().parent().parent().css("height","auto");
                $(this).parent().parent().parent().parent().css("height",height3);
                $(this).parent().parent().parent().prev().find("div").eq(0).css("height","80%");
                $(this).parent().parent().css("height","20%");
                $(this).parent().parent().parent().find("div").eq(0).css("height","20%");
                $(this).text("查看全文");
            }


        });

        /*div鼠标移入事件*/
        $(document).on("mouseover", ".stuQa-box", function () {
            $(this).css("background-color","rgb(255,255,255)");
            $(this).css("box-shadow","0 0 15px rgb(181,179,181)");
        });

        /*div鼠标移出事件*/
        $(document).on("mouseleave", ".stuQa-box", function () {
            $(this).css("background-color","rgb(250,250,250)");
            $(this).css("box-shadow","0 0 0 rgb(200,255,255)");
        });

        //功能标签鼠标移入事件
        $(document).on("mouseover", ".stuQa-func-tag", function () {
            $(this).css("color","#9ea2ea");
            $(this).css("box-shadow","0 0 15px rgb(181,179,181)");
        });

        /*div鼠标移出事件*/
        $(document).on("mouseleave", ".stuQa-func-tag", function () {
            $(this).css("color","#000000");
            $(this).css("box-shadow","0 0 0 rgb(200,255,255)");
        });

        /*分享按钮点击提交事件*/
        $(document).on("click", ".stuQa-share", function () {
            var share = $(this).text();
            if (share === "分享"){
                var sqaId = $(this).parent().parent().parent().find("input").val();
                share = "已分享";
                var stuQa = {"sqaId":sqaId,"share":share};
                $.ajax({
                    type:"POST",
                    url:basePath+"/stuQa/updateShareOrReport",
                    contentType:'application/json',
                    data:JSON.stringify(stuQa),
                    success:function (result) {
                        share = result.stuQa.share;
                    }
                });
                $(this).text(""+share);
                $(this).css("color","#9ea2ea");
                $(this).css("pointer-events","none");
            }
        });

        /*举报按钮点击提交事件*/
        $(document).on("click", ".stuQa-report", function () {
            var report = $(this).text();
            var sqaId = $(this).parent().parent().parent().find("input").val();
            if (report === "举报"){
                report = "已举报";
                var stuQa = {"sqaId":sqaId,"report":report};
                $.ajax({
                    type:"POST",
                    url:basePath+"/stuQa/updateShareOrReport",
                    contentType:'application/json',
                    data:JSON.stringify(stuQa),
                    success:function (result) {
                        report = result.stuQa.report;
                    }
                });
                $(this).text(""+report);
                $(this).css("color","#9ea2ea");
            }else if (report === "已举报"){
                report = "举报";
                var stuQa = {"sqaId":sqaId,"report":report};
                $.ajax({
                    type:"POST",
                    url:basePath+"/stuQa/updateShareOrReport",
                    contentType:'application/json',
                    data:JSON.stringify(stuQa),
                    success:function (result) {
                        report = result.stuQa.report;
                    }
                });
                $(this).text(""+report);
                $(this).css("color","#ffffff");
            }
        });

        var height;
        var height1;
        var height2;
        var height3;
        var height4;

        /*回答按钮点击事件*/
        $(document).on("click", ".stuQa-answer", function () {
            if ($(this).text() === "回答"){

                height = $(this).parent().parent().prev().find("div").eq(1).height();//富文本框编辑器的高度
                height1 = $(this).parent().parent().height(); //功能按钮框的高度
                height2 = $(this).parent().parent().parent().find("div").eq(0).height();//标签框的高度
                height3 = $(this).parent().parent().parent().parent().height();//评论块整体高度
                height4 = $(this).parent().parent().prev().height();//内容部分高度
                var sqaId = $(this).parent().parent().parent().find("input").val();
                var id = $(this).parent().next().attr("id");
                answer(id,sqaId,sectionId);
                if (height <= 200){
                    $(this).parent().parent().prev().css("height",height4);
                }else {
                    $(this).parent().parent().prev().css("height","auto");
                }
                $(this).parent().parent().parent().css("height","auto");
                $(this).parent().parent().parent().parent().css("height","auto");
                $(this).parent().parent().parent().prev().find("div").eq(0).css("height",160);
                $(this).parent().parent().css("height","auto");
                $(this).parent().parent().parent().find("div").eq(0).css("height",height2);
                $(this).parent().next().css("display","block");
                $(this).text("收起回复");
            }else if ($(this).text() === "收起回复"){
                $(this).parent().next().css("display","none");
                $(this).text("回答");
                $(this).parent().parent().prev().css("height","60%");
                $(this).parent().parent().parent().css("height","auto");
                $(this).parent().parent().parent().parent().css("height",height3);
                $(this).parent().parent().parent().prev().find("div").eq(0).css("height","80%");
                $(this).parent().parent().css("height",height1);
                $(this).parent().parent().parent().find("div").eq(0).css("height",height2);
            }

        });

        function answer(id, sqaId, sectionId) {
            var str = "";
            var user = "";
            var data = {"sqaId":sqaId,"sectionId": sectionId};
            $.ajax({
                type: "POST",
                url: basePath+"/stuQa/findAnswersByPId",
                dataType: "json",
                data: data,
                success: function (result) {
                    layui.each(result.stuQaAnswerList, function (i, stuQa) {
                        editori++;
                        str += "<div class=\"stuQa-answer-box\">";
                        str += "<div class=\"stuQa-user\">";
                        $.ajax({
                            type:"POST",
                            url: basePath+'/users/selectNameAndImg',
                            async: false,
                            data:{"userId":stuQa.userId},
                            success:function (result1) {
                                user = result1.user;
                                return user;
                            }
                        });
                        str += "<div class=\"stuQa-userPhoto\">";
                        str += "<img src='"+user.userImg+"' class='userPhoto'>";
                        str += "</div>";
                        str += "<div class=\"stuQa-userName\">"+user.userRealname+"</div>";
                        str += "</div>";
                        str += "<div class=\"stuQa-content-box\">";
                        str += "<input name='sqaId' value='"+stuQa.sqaId+"' hidden='hidden'>";
                        str += "<div class=\"stuQa-tag-box\">";
                        layui.each(stuQa.tagList,function (i, tag) {
                            str += "<div class=\"stuQa-tag\">"+tag.tagName+"</div>";
                        });
                        str += "</div>";
                        str += "<div class=\"stuQa-content\">";
                        str += "<div class=\"stuQa-toolbar\" id='stuQa-answer-toolbar"+editori+"'></div>";
                        str += "<div class=\"stuQa-textEditor\" id='stuQa-answer-textEditor"+editori+"'>"+stuQa.content+"</div>";
                        str += "</div>";
                        answerEditorCreate(editori);
                        str += "<div class=\"stuQa-function-box\">";
                        str += "<div class=\"stuQa-function-div\">";
                        str += "<div class=\"stuQa-func-tag stuQa-answer\" id='stuQa-answer-answer"+editori+"'>回答</div>";
                        str += "<div class=\"stuQa-func-tag\" id='stuQa-answer-answerNum"+editori+"'>"+stuQa.answerNum+"</div>";
                        str += "<div class=\"stuQa-func-tag\" id='stuQa-answer-view"+editori+"'>浏览</div>";
                        str += "<div class=\"stuQa-func-tag\" id='stuQa-answer-viewNum"+editori+"'>"+stuQa.viewNum+"</div>";
                        str += "<div class=\"stuQa-func-tag stuQa-readMore\" id='stuQa-answer-readMore"+editori+"'>查看全文</div>";
                        if (stuQa.share === "已分享"){
                            str += "<div class=\"stuQa-func-tag stuQa-share\" style='color: #9ea2ea' id='stuQa-share"+editori+"'>"+stuQa.share+"</div>";
                        }else {
                            str += "<div class=\"stuQa-func-tag stuQa-share\" id='stuQa-share"+editori+"'>"+stuQa.share+"</div>";
                        }
                        if (stuQa.report === "已举报"){
                            str += "<div class=\"stuQa-func-tag stuQa-report\" style='color: #9ea2ea' id='stuQa-report"+editori+"'>"+stuQa.report+"</div>";
                        }else {
                            str += "<div class=\"stuQa-func-tag stuQa-report\" id='stuQa-report"+editori+"'>"+stuQa.report+"</div>";
                        }
                        str += "<div class=\"stuQa-func-tag stuQa-reply\" id='stuQa-reply"+editori+"'>回复</div>";
                        str += "<input hidden value='"+stuQa.pId+"'></input>";
                        str += "<div class=\"stuQa-date\" id='stuQa-answer-date"+editori+"'>"+stuQa.date+"</div>";
                        str += "</div>";
                        str += "</div>";
                        str += "</div>";
                        str += "</div>";

                    });
                    $('#'+id).html(str);
                }
            });
        }



        /*回答列表富文本编辑器生成*/
        function answerEditorCreate(editori) {
            var E = window.wangEditor;
            var editor = "answerEditor" + editori;
            console.log(editor);
            editor = new E('#stuQa-answer-toolbar'+editori, '#stuQa-answer-textEditor'+editori);
            editor.create();
        }


        //回复评论的富文本编辑器
        var ansE = window.wangEditor;
        var ans_editor = new ansE('#answer-editor');
        ans_editor.customConfig.menus = [
            'bold',
            'italic',
            'underline',
            'image',
            'code'
        ];
        // 隐藏"网络图片"tab
        ans_editor.customConfig.showLinkImg = false;
        ans_editor.customConfig.uploadFileName = 'file';
        ans_editor.customConfig.uploadImgServer = basePath+'/stuNote/uploadPic';
        ans_editor.customConfig.uploadImgTimeout = 1000*20;
        ans_editor.customConfig.uploadImgMaxLength = 1;
        ans_editor.customConfig.uploadImgHooks = {
            customInsert: function (insertImg, result, ans_editor) {
                var url = result.data;
                insertImg(url)
            }
        };
        ans_editor.create();

        //回复点击事件
        $(document).on("click", ".stuQa-reply", function () {
            var sqaId = $(this).parent().parent().parent().find("input").val();
            var pId = $(this).next("input").val();
            alert(sqaId);
            alert(pId);
            var answerId = $(this).parent().find("div").attr("id");
            var answerNumId= $(this).parent().find("div").eq(1).attr("id");
            layer.open({
                title: '回复',
                type: 1,
                content: $("#answer-div"),
                area:['500px','300px'],
                offset:'t',
                btn: ['提交'],
                yes: function (index, layero) {
                    layer.close(index);
                    var content = ans_editor.txt.html();
                    var data = {"sqaId":sqaId,"pId":pId,"content":content};
                    $.ajax({
                        type:"POST",
                        url:basePath+"/stuQa/insertAnswer",
                        dataType: "json",
                        data: data,
                        success:function (result) {
                            layer.alert(result.message);
                            $('#'+answerId).click();
                            $('#'+answerNumId).text(result.stuQa.answerNum);
                        }
                    })
                }
            });
        });

        /*-----------------------------------------学生问答选项卡 end-----------------------------------------------------------*/


/*-----------------------------------------学生笔记 begin--------------------------------------------------------------*/
        {
            $("#icon-biji").click(function () {
                $("#mulu_div").css("display", "none");
                $("#wenda_div").css("display", "none");
                $("#div_stuNote").css("display", "block");
                $("#div_stuCmt").css("display", "none");
            });
            $("#stuNote_btn1").click(function () {
                let isEmpty = true;
                let lengthState = true;
                let contentHtml = '' + stu_editor.txt.html();
                let contentText = '' + stu_editor.txt.text();
                if (contentText === ''){
                    isEmpty = true;
                }else {
                    isEmpty = false;
                }
                let arrP = $("#div_stuNote_text").children().eq(0).children();
                for (let i=0;i<arrP.length;i++){
                    if (arrP.eq(i).children("img").length > 0){
                        isEmpty = false;
                    }
                }
                //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                let sectionId = 1;
                //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                let userId = 1;
                let data = {'snSectionId':sectionId, 'snUserId':userId, 'content':contentHtml};
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
                        url : basePath+"/stuNote/submit",
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

            let stuE = window.wangEditor;
            let stu_editor = new stuE('#div_stuNote_toolBar', '#div_stuNote_text');
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
            stu_editor.customConfig.uploadImgServer = basePath+'/stuNote/uploadPic';
            stu_editor.customConfig.uploadImgTimeout = 1000*20;
            stu_editor.customConfig.uploadImgMaxLength = 1;
            stu_editor.customConfig.uploadImgHooks = {
                customInsert: function (insertImg, result, stu_editor) {
                    let url = result.data;
                    insertImg(url)
                }
            };
            stu_editor.create();
        }

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
                flowLoad(basePath+"/stuNote/findStuNote",userId);
            }else {
                flowLoad(basePath+"/stuNote/findStuNoteUp",userId);
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
                    url:basePath+'/stuNote/collect',
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
                    url:basePath+'/stuNote/collect',
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
                    url:basePath+'/stuNote/report',
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
                    url:basePath+'/stuNote/report',
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
                        url: basePath+"/stuNote/upAdd",
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
                        url: basePath+"/stuNote/upDelete",
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
                        url: basePath+"/stuNote/upAddDownDelete",
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
                        url: basePath+"/stuNote/downAdd",
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
                        url: basePath+"/stuNote/downDelete",
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
                        url: basePath+"/stuNote/downAddUpDelete",
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
            flowLoad(basePath+"/stuNote/findStuNote",userId);
        });

        function flowLoad(url,userId) {
            $("#SNS_ul_stream").empty();
            flow.load({
                elem: '#SNS_ul_stream',//流加载容器
                isAuto: false,
                done: function (page, next) { //加载下一页
                    var lis = [];
                    var size = 3;
                    //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
                                var uId = '' + $("#userId").text();
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

/*-----------------------------------------学生评论 begin--------------------------------------------------------------*/
        {
            $("#icon-pinglun").click(function () {
                $("#mulu_div").css("display", "none");
                $("#wenda_div").css("display", "none");
                $("#div_stuNote").css("display", "none");
                $("#div_stuCmt").css("display", "block");
            });
            $("#stuCmt_btn1").click(function () {
                let isEmpty = true;
                let lengthState = true;
                let contentHtml = '' + stuCmt_editor.txt.html();
                let contentText = '' + stuCmt_editor.txt.text();
                if (contentText === ''){
                    isEmpty = true;
                }else {
                    isEmpty = false;
                }
                let arrP = $("#div_stuCmt_text").children().eq(0).children();
                for (let i=0;i<arrP.length;i++){
                    if (arrP.eq(i).children("img").length > 0){
                        isEmpty = false;
                    }
                }
                //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                let sectionId = 1;
                //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                let userId = 1;
                let data = {'sectionId':sectionId, 'userId':userId, 'content':contentHtml};
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
                        url : basePath+"/stuComment/submit",
                        data : data,
                        success : function (res) {
                            alert(res.retmsg);
                            if (res.retmsg === '保存成功'){
                                stuCmt_editor.txt.clear();
                            }
                        }
                    });
                }
                lengthState = true;
            });
            $("#stuCmt_btn2").click(function () {
                $("#div_stuCmt").css("display","none");
            });
            $("#stuCmtCloseBtn").click(function () {
                $("#div_stuCmt").css("display","none");
            });

            let stuCmtE = window.wangEditor;
            let stuCmt_editor = new stuCmtE('#div_stuCmt_toolBar', '#div_stuCmt_text');
            stuCmt_editor.customConfig.menus = [
                'bold',
                'italic',
                'underline',
                'image',
                'code'
            ];
            // 隐藏"网络图片"tab
            stuCmt_editor.customConfig.showLinkImg = false;
            stuCmt_editor.customConfig.uploadFileName = 'file';
            stuCmt_editor.customConfig.uploadImgServer = basePath+'/stuComment/uploadPic';
            stuCmt_editor.customConfig.uploadImgTimeout = 1000*20;
            stuCmt_editor.customConfig.uploadImgMaxLength = 1;
            stuCmt_editor.customConfig.uploadImgHooks = {
                customInsert: function (insertImg, result, stuCmt_editor) {
                    let url = result.data;
                    insertImg(url)
                }
            };
            stuCmt_editor.create();
        }


/*-----------------------------------------学生评论 end----------------------------------------------------------------*/

/*-----------------------------------------学生评论选项卡 begin---------------------------------------------------------*/

        {
            //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            let userId = '1';
            //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            let sectionId =1;

            function cmtFlowLoad(url) {
                $("#SCS_ul_stream").empty();
                flow.load({
                    elem: '#SCS_ul_stream',//流加载容器
                    isAuto: false,
                    done: function (page, next) { //加载下一页
                        let lis = [];
                        let size = 3;

                        let flag = 0;
                        let data = {"sectionId": sectionId, "page": page, "size": size};
                        $.ajax({
                            type: "POST",
                            url: ""+url,
                            dataType: "json",
                            data: data,
                            success: function (result) {
                                var str = "";
                                let str1 = "";
                                let replyStr = "";
                                let heightStr = "";
                                let data_type = "";
                                let upDownState = "";
                                let upStr = '';
                                let downStr = '';
                                layui.each(result.comments, function (i, comment) {
                                    str1 = '';
                                    let len = comment.stuCommentList.length;
                                    for (let i=0;i<len;i++){

                                        upDownState = 'none';
                                        upStr = '<i class="iconfont icon-qinziAPPtubiao-1 SCS_UDbtn" data_name="up" style="font-size: 20px;color: rgb(121,121,121)"></i>';
                                        downStr = '<i class="iconfont icon-qinziAPPtubiao- SCS_UDbtn" data_name="down" style="font-size: 18px;color: rgb(121,121,121)"></i>';
                                        for (let l=0;l<comment.stuCommentList[i].stuUpDownList.length;l++){
                                            if(comment.stuCommentList[i].stuUpDownList[l].userId === $("#userId").text() + ''){
                                                upDownState = comment.stuCommentList[i].stuUpDownList[l].upDown;
                                                if (upDownState === 'up')
                                                    upStr = '<i class="iconfont icon-dianzan SCS_UDbtn" data_name="up" style="font-size: 20px;color: rgb(102,71,238);"></i>';
                                                else if (upDownState === 'down')
                                                    downStr = '<i class="iconfont icon-dianzan_active SCS_UDbtn" data_name="down" style="font-size: 20px;color: rgb(102,71,238);"></i>';
                                            }
                                        }

                                        if(comment.stuCommentList[i].replyPerson != null){
                                            /*replyStr = '<span>回复 <a>'+ comment.stuCommentList[i].replyPerson +'</a> :</span>';*/
                                            replyStr = '回复 '+ comment.stuCommentList[i].replyPerson +' :';
                                            heightStr = '131px';
                                            data_type = 'short';
                                        }else {
                                            replyStr = '';
                                            heightStr = '150px';
                                            data_type = 'normal';
                                        }
                                        str1=str1 + '<div class="SCS_content" style="width: 96%">\n' +
                                                        '<span style="display:none;">'+ comment.stuCommentList[i].smId +'</span>' +
                                                        '<div class="SCS_c_lbox" style="height: 200px">\n' +
                                                            '<div class="SCS_userBox">\n' +
                                                                '<div class="SCS_headPhoto_box" style="width: 7vw;height: 7vw">\n' +
                                                                    '<img src="'+ comment.stuCommentList[i].userImg +'" style="width: 100%;height: 100%">\n' +
                                                                '</div>\n' +
                                                                '<div class="SCS_userName_box" style="width: 7vw;height: 20px;font-size: 16px">'+ comment.stuCommentList[i].userRealName +'</div>\n' +
                                                            '</div>\n' +
                                                        '</div>\n' +
                                                        '<div class="SCS_c_rbox">\n' +
                                                            '<div id="SCS_r_toolBar'+ flag +'" class="SCS_toolBar" style="display: none"></div>\n' +
                                                            replyStr +
                                                            '<div id="SCS_r_textEditor'+ flag +'" class="SCS_textEditor" style="height: '+ heightStr +';display: block"></div>\n' +
                                                            '<div class="SCS_c_replyBox">' +
                                                                '<div id="SCS_reply_ToolBar'+ flag +'" class="SCS_replyToolBar"></div>\n' +
                                                                '<div id="SCS_reply_Editor'+ flag +'" class="SCS_replyEditor"></div>\n' +
                                                                '<span style="display: none">'+ flag +'</span>' +
                                                                '<div class="SCS_replyBtn" data_type="son" style="left: 476px">回复</div>' +
                                                                '<span style="display: none">'+ comment.smId +'</span>' +
                                                            '</div>\n' +
                                                            '<div class="SCS_cmt_toolBox">' +
                                                                '<span style="display: none">'+ upDownState +'</span>' +
                                                                '<div class="SCS_spaceDiv" style="float: left"></div>' +
                                                                '<div class="SCS_c_t_box" style="float: left;width: 30px">' +
                                                                    upStr +
                                                                '</div>' +
                                                                '<div class="SCS_c_t_box" style="float: left;width: 40px;padding: 5px 0 0 0">'+ comment.stuCommentList[i].up +'</div>' +
                                                                '<div class="SCS_c_t_box" style="float: left;width: 30px;padding: 6px 0 0 0">' +
                                                                    downStr +
                                                                '</div>' +
                                                                '<div class="SCS_c_t_box" style="float: left;width: 40px;padding: 5px 0 0 0">'+ comment.stuCommentList[i].down +'</div>' +
                                                                '<div class="SCS_c_t_box" style="float: left">' +
                                                                    '<span style="display: none">false</span>' +
                                                                    '<span class="SCS_flexBtn" data_type="'+ data_type +'" style="cursor: pointer">展开/收起</span>' +
                                                                '</div>' +
                                                                '<div class="SCS_c_t_box" style="float: left;width: 65px">' +
                                                                    '<span style="display: none">false</span>' +
                                                                    '<span class="SCS_reportBtn">举报</span>' +
                                                                '</div>' +
                                                                '<div class="SCS_c_t_box" style="float: left;width: 50px">' +
                                                                    '<span style="display: none">false</span>' +
                                                                    '<span class="replyBtn" style="cursor: pointer">回复</span>' +
                                                                '</div>' +
                                                                '<div class="SCS_c_t_box" style="float: right;width: 150px;font-size: 15px;padding: 7px 0 0 0;height: 23px">'+
                                                                    comment.stuCommentList[i].dateString +
                                                                '</div>' +
                                                            '</div>\n' +
                                                        '</div>\n' +
                                                    '</div>' +
                                                    '<script>' +
                                                    'let SCS_r_E = window.wangEditor;\n' +
                                                    'let SCS_r_editor'+ flag +' = new SCS_r_E(\'#SCS_r_tooBar'+ flag +'\', \'#SCS_r_textEditor'+ flag +'\');\n' +
                                                    'SCS_r_editor'+ flag +'.create();\n' +
                                                    'SCS_r_editor'+ flag +'.txt.html(\''+ comment.stuCommentList[i].content +'\');\n' +
                                                    'SCS_r_editor'+ flag +'.$textElem.attr(\'contenteditable\', false);\n' +

                                                    'let SCS_reply_E = window.wangEditor;\n' +
                                                    'let SCS_reply_editors'+ flag +' = new SCS_reply_E(\'#SCS_reply_ToolBar'+ flag +'\', \'#SCS_reply_Editor'+ flag +'\');\n' +
                                                    'replyEditorArr.push(SCS_reply_editors'+ flag +');' +
                                                    'SCS_reply_editors'+ flag +'.customConfig.menus = [\n' +
                                                        '\'bold\',\n' +
                                                        '\'italic\',\n' +
                                                        '\'underline\',\n' +
                                                        '\'image\',\n' +
                                                        '\'code\'\n' +
                                                    '];\n' +
                                                    'SCS_reply_editors'+ flag +'.customConfig.showLinkImg = false;\n' +
                                                    'SCS_reply_editors'+ flag +'.customConfig.uploadFileName = \'file\';\n' +
                                                    'SCS_reply_editors'+ flag +'.customConfig.uploadImgServer = \''+ basePath +'/stuComment/uploadPic\';\n' +
                                                    'SCS_reply_editors'+ flag +'.customConfig.uploadImgTimeout = 1000*20;\n' +
                                                    'SCS_reply_editors'+ flag +'.customConfig.uploadImgMaxLength = 1;\n' +
                                                    'SCS_reply_editors'+ flag +'.customConfig.uploadImgHooks = {\n' +
                                                        'customInsert: function (insertImg, result, SCS_reply_editor) {\n' +
                                                            'let url = result.data;\n' +
                                                            'insertImg(url)\n' +
                                                        '}\n' +
                                                    '};' +
                                                    'SCS_reply_editors'+ flag +'.create();\n' +
                                                    '</script>\n';

                                        flag++;
                                    }


                                    upDownState = 'none';
                                    upStr = '<i class="iconfont icon-qinziAPPtubiao-1 SCS_UDbtn" data_name="up" style="font-size: 20px;color: rgb(121,121,121)"></i>';
                                    downStr = '<i class="iconfont icon-qinziAPPtubiao- SCS_UDbtn" data_name="down" style="font-size: 18px;color: rgb(121,121,121)"></i>';
                                    for (let i=0;i<comment.stuUpDownList.length;i++){
                                        if(comment.stuUpDownList[i].userId === $("#userId").text() + ''){
                                            upDownState = comment.stuUpDownList[i].upDown;
                                            if (upDownState === 'up')
                                                upStr = '<i class="iconfont icon-dianzan SCS_UDbtn" data_name="up" style="font-size: 20px;color: rgb(102,71,238);"></i>';
                                            else if (upDownState === 'down')
                                                downStr = '<i class="iconfont icon-dianzan_active SCS_UDbtn" data_name="down" style="font-size: 20px;color: rgb(102,71,238);"></i>';
                                        }
                                    }
                                    str='<div class="SCS_content">\n' +
                                            '<span style="display: none">'+ comment.smId +'</span>' +
                                            '<div class="SCS_c_lbox">\n' +
                                                '<div class="SCS_userBox">\n' +
                                                    '<div class="SCS_headPhoto_box">\n' +
                                                        '<img src="'+ comment.userImg +'" style="width: 100%;height: 100%">\n' +
                                                    '</div>\n' +
                                                    '<div class="SCS_userName_box">'+ comment.userRealName +'</div>\n' +
                                                '</div>\n' +
                                            '</div>\n' +
                                            '<div class="SCS_c_rbox">\n' +
                                                '<div id="SCS_toolBar'+ flag +'" style="display: none"></div>\n' +
                                                '<div id="SCS_textEditor'+ flag +'" class="SCS_textEditor"></div>\n' +
                                                '<div class="SCS_c_replyBox">' +
                                                    '<div id="SCS_replyToolBar'+ flag +'" class="SCS_replyToolBar"></div>\n' +
                                                    '<div id="SCS_replyEditor'+ flag +'" class="SCS_replyEditor"></div>\n' +
                                                    '<span style="display: none">'+ flag +'</span>' +
                                                    '<div class="SCS_replyBtn">回复</div>' +
                                                    '<span style="display: none">'+ comment.smId +'</span>' +
                                                '</div>\n' +
                                                '<div class="SCS_cmt_toolBox">' +
                                                    '<span style="display: none">'+ upDownState +'</span>' +
                                                    '<div class="SCS_spaceDiv" style="float: left"></div>' +
                                                    '<div class="SCS_c_t_box" style="float: left;width: 30px">' +
                                                        upStr +
                                                    '</div>' +
                                                    '<div class="SCS_c_t_box" style="float: left;width: 60px;padding: 5px 0 0 0">'+ comment.up +'</div>' +
                                                    '<div class="SCS_c_t_box" style="float: left;width: 30px;padding: 6px 0 0 0">' +
                                                        downStr +
                                                    '</div>' +
                                                    '<div class="SCS_c_t_box" style="float: left;width: 60px;padding: 5px 0 0 0">'+ comment.down +'</div>' +
                                                    '<div class="SCS_c_t_box" style="float: left">' +
                                                        '<span style="display: none">false</span>' +
                                                        '<span class="SCS_flexBtn" style="cursor: pointer">展开/收起</span>' +
                                                    '</div>' +
                                                    '<div class="SCS_c_t_box" style="float: left;width: 65px">' +
                                                        '<span style="display: none">false</span>' +
                                                        '<span class="SCS_reportBtn">举报</span>' +
                                                    '</div>' +
                                                    '<div class="SCS_c_t_box" style="float: left;width: 50px">' +
                                                        '<span style="display: none">false</span>' +
                                                        '<span class="replyBtn" style="cursor: pointer">回复</span>' +
                                                    '</div>' +
                                                    '<div class="SCS_c_t_box" style="float: right;width: 150px;font-size: 15px;padding: 7px 0 0 0;height: 23px">'+
                                                        comment.dateString +
                                                    '</div>' +
                                                '</div>\n' +
                                                '<div class="SCS_reply_toolBox">' +
                                                    '<div class="SCS_spaceDiv" style="float: left"></div>' +
                                                    '<div class="SCS_r_t_box" style="float: left">回复：'+ comment.stuCommentList.length +'</div>' +
                                                    '<div class="SCS_spaceDiv" style="float: right"></div>' +
                                                    '<span style="display: none">'+ comment.stuCommentList.length +'</span>' +
                                                    '<div class="SCS_r_t_box replyFlex" style="float: right;text-align: right;cursor: pointer">收起/展开</div>' +
                                                    '<span style="display: none">false</span>' +
                                                '</div>\n' +
                                                '<div class="SCS_replyBox">'+ str1 +'</div>\n' +
                                            '</div>\n' +
                                        '</div>' +
                                        '<script>' +
                                        'let SCS_E = window.wangEditor;\n' +
                                        'let SCS_editor'+ flag +' = new SCS_E(\'#SCS_tooBar'+ flag +'\', \'#SCS_textEditor'+ flag +'\');\n' +
                                        'SCS_editor'+ flag +'.create();\n' +
                                        'SCS_editor'+ flag +'.txt.html(\''+ comment.content +'\');\n' +
                                        'SCS_editor'+ flag +'.$textElem.attr(\'contenteditable\', false);\n' +

                                        'let SCS_reply_E = window.wangEditor;\n' +
                                        'let SCS_reply_editor'+ flag +' = new SCS_reply_E(\'#SCS_replyToolBar'+ flag +'\', \'#SCS_replyEditor'+ flag +'\');\n' +
                                        'replyEditorArr.push(SCS_reply_editor'+ flag +')\n' +
                                        'SCS_reply_editor'+ flag +'.customConfig.menus = [\n' +
                                            '\'bold\',\n' +
                                            '\'italic\',\n' +
                                            '\'underline\',\n' +
                                            '\'image\',\n' +
                                            '\'code\'\n' +
                                        '];\n' +
                                        'SCS_reply_editor'+ flag +'.customConfig.showLinkImg = false;\n' +
                                        'SCS_reply_editor'+ flag +'.customConfig.uploadFileName = \'file\';\n' +
                                        'SCS_reply_editor'+ flag +'.customConfig.uploadImgServer = \''+ basePath +'/stuComment/uploadPic\';\n' +
                                        'SCS_reply_editor'+ flag +'.customConfig.uploadImgTimeout = 1000*20;\n' +
                                        'SCS_reply_editor'+ flag +'.customConfig.uploadImgMaxLength = 1;\n' +
                                        'SCS_reply_editor'+ flag +'.customConfig.uploadImgHooks = {\n' +
                                        'customInsert: function (insertImg, result, SCS_reply_editor) {\n' +
                                            'let url = result.data;\n' +
                                            'insertImg(url)\n' +
                                            '}\n' +
                                        '};' +
                                        'SCS_reply_editor'+ flag +'.create();\n' +
                                        '</script>';

                                    flag++;
                                    lis.push(str);
                                });
                                next(lis.join(''), page < result.pages);
                            }
                        });
                    }
                })
            }

            //学生评论选项卡 点击事件
            $("#selection_stuCmt").click(function () {
                replyEditorArr.length = 0;
                cmtFlowLoad(basePath+"/stuComment/findStuCmt");
            });

            //举报点击事件
            $("#SCS_contentBox").on('click','.SCS_reportBtn',function () {
                let smId = parseInt($(this).parent().parent().parent().prev().prev().text());
                let type = $(this).prev().text();
                let data;
                let thisObj = $(this);
                if(type === 'false'){
                    $(this).prev().text('true');
                    data = {'smId':smId,'report':'true'};
                    $.ajax({
                        type: "POST",
                        url: basePath+"/stuComment/updateReport",
                        dataType: "json",
                        data: data,
                        success:function (res) {
                            if (res.error === 0){
                                thisObj.text('已举报');
                                thisObj.css('color','rgb(102,71,238)');
                            }
                        }
                    });
                }else {
                    $(this).prev().text('false');
                    data = {'smId':smId,'report':'false'};
                    $.ajax({
                        type: "POST",
                        url: basePath+"/stuComment/updateReport",
                        dataType: "json",
                        data: data,
                        success:function (res) {
                            if (res.error === 0){
                                thisObj.text('举报');
                                thisObj.css('color','black');
                            }
                        }
                    });
                }
            });

            //赞踩按钮点击事件
            $("#SCS_contentBox").on('click','.SCS_UDbtn',function () {
                let UDState = $(this).parent().parent().children().eq(0).text();
                let smId = parseInt($(this).parent().parent().parent().prev().prev().text());
                let type = $(this).attr('data_name');
                let data;
                let thisObj = $(this);
                if (type === 'up'){
                    if(UDState === 'up'){
                        data = {'userId':userId,'smId':smId,'type':'UpMinus'};
                        $.ajax({
                            type: "POST",
                            url: basePath+"/stuComment/updateUD",
                            dataType: "json",
                            data: data,
                            success:function (res) {
                                if (res.error === 0){
                                    thisObj.parent().parent().children().eq(0).text('none');
                                    thisObj.removeClass('icon-dianzan');
                                    thisObj.addClass('icon-qinziAPPtubiao-1');
                                    thisObj.css('color','rgb(121,121,121)');
                                    let num = parseInt(thisObj.parent().next().text());
                                    num --;
                                    thisObj.parent().next().text(num);
                                }
                            }
                        });
                    }else if(UDState === 'none'){
                        data = {'userId':userId,'smId':smId,'type':'UpAdd'};
                        $.ajax({
                            type: "POST",
                            url: basePath+"/stuComment/updateUD",
                            dataType: "json",
                            data: data,
                            success:function (res) {
                                if (res.error === 0){
                                    thisObj.parent().parent().children().eq(0).text('up');
                                    thisObj.removeClass('icon-qinziAPPtubiao-1');
                                    thisObj.addClass('icon-dianzan');
                                    thisObj.css('color','rgb(102,71,238)');
                                    let num = parseInt(thisObj.parent().next().text());
                                    num ++;
                                    thisObj.parent().next().text(num);
                                }
                            }
                        });
                    }else {
                        data = {'userId':userId,'smId':smId,'type':'UpAddDownMinus'};
                        $.ajax({
                            type: "POST",
                            url: basePath+"/stuComment/updateUD",
                            dataType: "json",
                            data: data,
                            success: function (res) {
                                if (res.error === 0) {
                                    thisObj.parent().parent().children().eq(0).text('up');
                                    thisObj.removeClass('icon-qinziAPPtubiao-1');
                                    thisObj.addClass('icon-dianzan');
                                    thisObj.css('color','rgb(102,71,238)');
                                    let num = parseInt(thisObj.parent().next().text());
                                    num ++;
                                    thisObj.parent().next().text(num);

                                    thisObj.parent().next().next().children().eq(0).removeClass('icon-dianzan_active');
                                    thisObj.parent().next().next().children().eq(0).addClass('icon-qinziAPPtubiao-');
                                    thisObj.parent().next().next().children().eq(0).css('font-size','18px');
                                    thisObj.parent().next().next().children().eq(0).css('color','rgb(121,121,121)');
                                    num = parseInt(thisObj.parent().next().next().next().text());
                                    num --;
                                    thisObj.parent().next().next().next().text(num);
                                }
                            }
                        });
                    }
                }else {
                    if(UDState === 'down'){
                        data = {'userId':userId,'smId':smId,'type':'DownMinus'};
                        $.ajax({
                            type: "POST",
                            url: basePath+"/stuComment/updateUD",
                            dataType: "json",
                            data: data,
                            success:function (res) {
                                if (res.error === 0){
                                    thisObj.parent().parent().children().eq(0).text('none');
                                    thisObj.removeClass('icon-dianzan_active');
                                    thisObj.addClass('icon-qinziAPPtubiao-');
                                    thisObj.css('font-size','18px');
                                    thisObj.css('color','rgb(121,121,121)');
                                    let num = parseInt(thisObj.parent().next().text());
                                    num --;
                                    thisObj.parent().next().text(num);
                                }
                            }
                        });
                    }else if (UDState === 'none'){
                        data = {'userId':userId,'smId':smId,'type':'DownAdd'};
                        $.ajax({
                            type: "POST",
                            url: basePath+"/stuComment/updateUD",
                            dataType: "json",
                            data: data,
                            success:function (res) {
                                if (res.error === 0){
                                    thisObj.parent().parent().children().eq(0).text('down');
                                    thisObj.removeClass('icon-qinziAPPtubiao-');
                                    thisObj.addClass('icon-dianzan_active');
                                    thisObj.css('font-size','20px');
                                    thisObj.css('color','rgb(102,71,238)');
                                    let num = parseInt(thisObj.parent().next().text());
                                    num ++;
                                    thisObj.parent().next().text(num);
                                }
                            }
                        });
                    }else {
                        data = {'userId':userId,'smId':smId,'type':'UpMinusDownAdd'};
                        $.ajax({
                            type: "POST",
                            url: basePath+"/stuComment/updateUD",
                            dataType: "json",
                            data: data,
                            success:function (res) {
                                if (res.error === 0){
                                    thisObj.parent().parent().children().eq(0).text('down');
                                    thisObj.removeClass('icon-qinziAPPtubiao-');
                                    thisObj.addClass('icon-dianzan_active');
                                    thisObj.css('font-size','20px');
                                    thisObj.css('color','rgb(102,71,238)');
                                    let num = parseInt(thisObj.parent().next().text());
                                    num ++;
                                    thisObj.parent().next().text(num);


                                    thisObj.parent().prev().prev().children().eq(0).removeClass('icon-dianzan');
                                    thisObj.parent().prev().prev().children().eq(0).addClass('icon-qinziAPPtubiao-1');
                                    thisObj.parent().prev().prev().children().eq(0).css('color','rgb(121,121,121)');
                                    num = parseInt(thisObj.parent().prev().text());
                                    num --;
                                    thisObj.parent().prev().text(num);
                                }
                            }
                        });
                    }
                }
            });

            //回复富文本编辑器 回复按钮点击事件
            $("#SCS_contentBox").on('click','.SCS_replyBtn',function () {
                let index = parseInt($(this).prev().text());
                let pid = parseInt($(this).next().text());
                let replyPerson = $(this).parent().parent().prev().children().eq(0).children().eq(1).text();
                let type = $(this).attr('data_type');

                let isEmpty = true;
                let lengthState = true;
                let contentHtml = '' + replyEditorArr[index].txt.html();
                let contentText = '' + replyEditorArr[index].txt.text();
                if (contentText === ''){
                    isEmpty = true;
                }else {
                    isEmpty = false;
                }
                let arrP = $(this).prev().prev().children().eq(0).children();
                for (let i=0;i<arrP.length;i++){
                    if (arrP.eq(i).children("img").length > 0){
                        isEmpty = false;
                    }
                }
                //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                let sectionId = 1;
                //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                let userId = 1;
                let data;
                if (type === 'son'){
                    data = {'sectionId':sectionId, 'userId':userId, 'content':contentHtml, 'pId':pid, 'replyPerson':replyPerson};
                }else {
                    data = {'sectionId':sectionId, 'userId':userId, 'content':contentHtml, 'pId':pid};
                }

                if(contentHtml.length>1024){
                    alert("内容超出最大长度限制！");
                    lengthState = false;
                }
                if (isEmpty){
                    alert("内容为空无法提交！");
                }
                if(lengthState && !isEmpty){
                    $.ajax({
                        type : "POST",
                        url : basePath+"/stuComment/replySubmit",
                        data : data,
                        success : function (res) {
                            alert(res.retmsg);
                            if (res.retmsg === '回复成功'){
                                replyEditorArr.length = 0;
                                cmtFlowLoad(basePath+"/stuComment/findStuCmt");
                            }
                        }
                    });
                }
                lengthState = true;
            });

            //回复工具栏 收起/展开 按钮点击事件
            $("#SCS_contentBox").on('click','.replyFlex',function () {
                let state = $(this).next().text();
                if('false' === state){
                    $(this).next().text('true');
                    let num = parseInt($(this).prev().text());
                    if(num > 0){
                        $(this).parent().next().css('display','block');
                    }
                }else {
                    $(this).next().text('false');
                    $(this).parent().next().css('display','none');
                }
            });

            //评论工具栏 回复 按钮点击事件
            $("#SCS_contentBox").on('click','.replyBtn',function () {
                let state = $(this).prev().text();
                if('false' === state){
                    $(this).prev().text('true');
                    $(this).parent().parent().prev().css('display','block');
                }else {
                    $(this).prev().text('false');
                    $(this).parent().parent().prev().css('display','none');
                }
            });

            //评论工具栏 展开/收起 按钮点击事件
            $("#SCS_contentBox").on('click','.SCS_flexBtn',function () {
                let state = $(this).prev().text();
                let type = $(this).attr("data_type");
                if('false' === state){
                    $(this).prev().text('true');
                    let height = $(this).parent().parent().prev().prev().children().eq(0).height();
                    if(height > 220){
                        $(this).parent().parent().prev().prev().css('height','auto');
                    }
                }else {
                    $(this).prev().text('false');
                    if(type === 'normal'){
                        $(this).parent().parent().prev().prev().css('height','150px');
                    }else if (type === 'short'){
                        $(this).parent().parent().prev().prev().css('height','131px');
                    }else {
                        $(this).parent().parent().prev().prev().css('height','220px');
                    }
                }
            });

            $("#SCS_contentBox").on("mouseover",".SCS_content",function () {
                $(this).css("background-color",'rgb(255,255,255)');
                $(this).css('box-shadow','0 0 15px rgb(181,179,180)');
                $(this).children().eq(2).children().eq(1).css('background-color','rgb(245,245,245)');
                $(this).children().eq(2).children().eq(3).css('background-color','rgb(245,245,245)');
                $(this).children().eq(2).children().eq(4).css('background-color','rgb(245,245,245)');
            });

            $("#SCS_contentBox").on("mouseout",".SCS_content",function () {
                $(this).css("background-color",'rgb(245,245,245)');
                $(this).css('box-shadow','0 0 0 rgb(255,255,255)');
                $(this).children().eq(2).children().eq(1).css('background-color','rgb(255,255,255)');
                $(this).children().eq(2).children().eq(3).css('background-color','rgb(255,255,255)');
                $(this).children().eq(2).children().eq(4).css('background-color','rgb(255,255,255)');
            });
        }
/*-----------------------------------------学生评论选项卡 end-----------------------------------------------------------*/

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
    function switchVideo (src,sectionId) {
        var data = {'time':elem_video1.currentTime,'sectionId':sectionId};
        $.ajax({
            type : "POST",
            async: false,
            url : basePath+"/player/recordTimeSwitch",
            data : data,
            success: function () {
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
        });
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
                url : basePath+"/player/recordTime",
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
                url : basePath+"/player/readRecord",
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
            alert(sectionId);
            let videoState = "";
            $.ajax({
                type: "POST",
                url: basePath+"/section/findState?sectionId=" + sectionId,
                async: false,
                success: function (data) {
                    videoState = data.state;
                    return videoState;
                }
            });
            if (videoState==="未观看"){
                let data = {"state":"播放中"};
                $.ajax({
                    type:"POST",
                    url:basePath+'/player/recordState',
                    data: data,
                    dataType: 'json',
                    success: function () {

                    }
                });
            }
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
                    let data = {'state':'已完成'};
                    $.ajax({
                        type: 'POST',
                        url: basePath+'/player/recordState',
                        data: data,
                        dataType: 'json',
                        success: function () {

                        }
                    });
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
            document.getElementById("video_src").src = '' + $("#sv").text();
        }else if('普清'===$(this).text()){
            document.getElementById("video_src").src = '' + $("#nv").text();
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
});
})
