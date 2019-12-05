layui.use('flow', function(){
    var flow = layui.flow;

    flow.load({
        elem: '#xiangqingneirong' //流加载容器
        ,isAuto: false
        ,isLazyimg: true
        ,done: function(page, next){ //加载下一页
            //模拟插入
            setTimeout(function(){
                var lis = [];
                var limit = 3;//刚开始要显示的课程数
                var number;
                var color;
                var data = {"page":page,"limit":limit};
                $.ajax({
                    type :"POST",
                    url:"/section/findSectionDetails?coureseId=1",
                    dataType:"json",
                    data:data,
                    success:function(result) {
                        console.log(result);
                        number=result.yeishu;
                        /*循环遍历数据*/
                        layui.each(result.sectionDetailsList, function (index, courses) {
                            lis.push('<li  class="xiangqingneirong_li">'+
                                '<div class="tishi">'+
                                '<div class="shuxian"></div>');
                            /*判断观看状态*/
                            if (courses.state==="已看完") {
                                lis.push('<div class="yikanguo"><i class="iconfont icon-check-circle "></i></div>');
                                color="#FFBb00";
                            }else if (courses.state==="正在看") {
                                lis.push('<div class="zhengzaikan" ><i class="iconfont icon-play-circle"></i></div>');
                                color="#FFBb00";
                            }else{
                                lis.push('<div class="haimeikan"><i class="iconfont icon-suoguanbi "></i></div>');
                                color="rgb(100,100,100)";
                            }

                            lis.push('</div>'+
                                '<div class="xiangmuxiangqing_kechengneirong">'+
                                '<input type="hidden"  value="'+courses.sectionId+'">'+
                                '<div class="kechengxiaojeibiaoti">'+
                                '<b class="kechengmingcheng">'+courses.sectionName+'</b>'+
                                '<b class="kechengsijian">'+courses.sectionTime+'分钟'+'</b>'+
                                '</div>'+
                                '<div class="kechengxiaojeijeishao">'+courses.sectionIntro+'</div>'+
                                '<div class="kechengxiaojeipingfen">'+
                                '<ul class="kechengxiaojeipingfen_ul">');
                            /*判断评分数*/
                            if (courses.state==="已看完") {
                                if(courses.xiaojeiPinfen==="3"){
                                    lis.push(
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>');
                                }
                                else if(courses.xiaojeiPinfen==="2"){
                                    lis.push(
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star1 xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>');
                                }
                                else if(courses.xiaojeiPinfen==="1"){
                                    lis.push(
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star1 xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star1 xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>');
                                }
                                else {
                                    lis.push(
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star1 xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star1 xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>');
                                }
                            }else if (courses.state==="正在看") {
                                if(courses.xiaojeiPinfen==="3"){
                                    lis.push(
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>');
                                }
                                else if(courses.xiaojeiPinfen==="2"){
                                    lis.push(
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star1 xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>');
                                }
                                else if(courses.xiaojeiPinfen==="1"){
                                    lis.push(
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star1 xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star1 xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>');
                                }
                                else {
                                    lis.push(
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star1 xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star1 xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>' +
                                        '<li class="kechengxiaojeipingfen_li">' +
                                        '<i class="iconfont icon-star1 xingxing" style="color: ' + color + ';"></i>' +
                                        '</li>');
                                }
                            }else {
                                lis.push(
                                    '<li class="kechengxiaojeipingfen_li">' +
                                    '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                    '</li>' +
                                    '<li class="kechengxiaojeipingfen_li">' +
                                    '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                    '</li>' +
                                    '<li class="kechengxiaojeipingfen_li">' +
                                    '<i class="iconfont icon-star-fill xingxing" style="color: ' + color + ';"></i>' +
                                    '</li>');
                            }
                            lis.push( '</ul>'+
                                '</div>'+
                                '</div>'+
                                '</li>'
                            );
                        });
                        next(lis.join(''), page < number);
                    }
                });
            }, 500);
        }
    });
});
$("#xiangqingneirong").on("click",".xiangmuxiangqing_kechengneirong", function(){
    var sectionId = $(this).children().first().val();
    $.ajax({
        type : "POST",
        async: false,
        url :"/kecheng/seleUserCoursesByUserCourses",
        data:"",
        success: function (bool) {
            if (bool){
                alert(sectionId);
            }else {
                alert("您还未参加项目")
            }
        }

    });

});
