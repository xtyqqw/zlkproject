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
    });


});

