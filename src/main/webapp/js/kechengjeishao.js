var localObj = window.location;
var basePath = localObj.protocol+"//"+localObj.host;
var xingsu ;
var baifansu ;
$(function () {
    $.ajax({
        type : "POST",
        async: false,
        url :basePath+"/courseHomePage/selectCoursesByCoursesId",
        data:"",
        success: function (data) {
            console.log(data);
            baifansu = data.ratio;
            var starSum = data.starSum;
            var sectionCount =  data.sectionCount;
            /*判断是否已参加项目*/
            $.ajax({
                type : "POST",
                async: false,
                url :basePath+"/kecheng/seleUserCoursesByUserCourses",
                data:{"coursesId":data.courses.coursesId},
                success: function (bool) {
                    /*当有记录时把 “参加项目”变为“已参加”*/
                    if (bool=="已参加"){
                        $("#chanjia").html('<button id="xinjiaru">已参加项目</button>');
                    }
                }
            });
            $("#kechengId").val(data.courses.coursesId);
            $("#kechengshipin").html("<video width='100%' height='100%' controls style='border-radius: 5px;' >"
                +"<source src="+data.courses.introduceVideo+" type='video/mp4' style='width:100%;height:100%;'>"
                +"您的浏览器不支持 HTML5 video 标签。"
                +" </video>");
            $("#rensu").text(data.courses.studentNum+"人");
            /*判断课程的评分*/
            if(baifansu<=0){
                xingsu=0;
            }else if (baifansu>0&&baifansu<=20){
                xingsu=1;
            } else if (baifansu>20&&baifansu<=40){
                xingsu=2;
            } else if (baifansu>40&&baifansu<=60){
                xingsu=3;
            } else if (baifansu>60&&baifansu<=80){
                xingsu=4;
            }else if (baifansu>80){
                xingsu=5;
            }
            $("#jiage").text("￥"+data.courses.price);
            $("#xianmuliang").text(data.courses.chapterNum+"章"+data.courses.sectionNum+"节");
            $("#huoxingshu").text(starSum+"/"+(sectionCount*3*data.courses.studentNum));
            $("#jeishaozhengwen").html("<p>"+data.courses.introduceText+"</p>");
            $("#tedianzhengwenneirong").html("<p>"+data.courses.featureText+"</p>");
            $("#jeishaoImg").html("<img src='"+data.courses.introducePic+"'>");
            $("#tedianImg").html("<img src='"+data.courses.featurePic+"'>");
        },
        error: function (data) {
            alert(JSON.stringify(data));
        }
    });
});
/*
* 这个是layui中的评分必要的js代码
*/
layui.use(['rate'], function(){
    var rate = layui.rate;

    //只读
    rate.render({
        elem: '#xingxing'
        ,value: xingsu
        ,readonly: true
    });
});
/*
 * 这个是layui进度条需要的js代码
 */
layui.use('element', function(){
    var $ = layui.jquery
        ,element = layui.element;
    element.progress('demo', baifansu+"%");
});
//鼠标移入移出时间
/*$(".xinxi").mouseenter(function () {
    $(this).css("background-color","#fff");
    $(this).css("height","7vw");
    $(this).css("width","7vw");
    $(this).css("margin-top","-1vw");
    $(this).css("box-shadow","0.1px 0.1px 0.1px 0.1px rgb(200,200,200)");
    $("#kechengshipin").css("z-index","-1");
    $(this).css("border-radius","3px");
    $(this).children().children().first().css("margin-top","1vw");
});
$(".xinxi").mouseleave(function () {
    $(this).css("background-color","rgb(235,235,235)");
    $(this).css("height","5vw");
    $(this).css("width","10%");
    $(this).css("margin-top","0vw");
    $(this).css("border-radius","0px");
    $("#kechengshipin").css("z-index","1");
    $(this).css("box-shadow","none");
    $(this).children().children().first().css("margin-top","0vw");
});*/
$("#jiaru").click(function () {
    var kechengId = $("#kechengId").val();
    $.ajax({
        type : "POST",
        async: false,
        url :basePath+"/kecheng/insertCourses",
        data: {"coursesId":kechengId},
        success: function (data) {
            console.log(data);
            if(data=="未登录"){
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg('请先登录');
                });
            }else{
                $("#chanjia").html('<button id="xinjiaru">已参加项目</button>');
                $.ajax({
                    type : "POST",
                    //async: false,
                    url :basePath+"/courseHomePage/selectCoursesByCoursesId",
                    data:"",
                    success: function (data) {
                        $("#rensu").text(data.courses.studentNum+"人");
                    }
                });
            }
        }
    });
});