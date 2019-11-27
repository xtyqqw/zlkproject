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

    });

});




