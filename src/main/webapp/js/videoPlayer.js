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
});

