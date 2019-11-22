<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/11/18
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <link rel="stylesheet" href="../layui/css/layuiXingxing.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1523298_ebdj0htk708.css">
    <script src="../layui/layui.js"></script>
    <script src="../js/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>



    <style>
     .layui-tab {
         width: 950px;
         height: 500px;
         position: relative;
         left: 200px;
         top: 35px;
     }

     .layui-this{
         width:190px;
         color:#000000;
     }
     .layui-tab-title{
         color:#000000;
     }
     .dt1{
         border: solid 1px;
         color: black;
         width: 213px;
         height: 90px;
     }

     .dl1{
         height: 190px;
         width:230px;
     }

     .h61{
         position: relative;
         left: 10px;
         top: 8px;
         color: #1f2022;
         font-weight:bold;
     }
     .h62{
         position: relative;
         left: 128px;
         top: -8px;
         color: #1f2022;
         font-weight:bold;
     }
     .h63{
         position: relative;
         left: 155px;
         top: -23px;
         color: #1f2022;
         font-weight:bold;
     }
     .h64{
         position: relative;
         left: 10px;
         top: -20px;
         color: #ff4413;

     }
     .h65{
         position: relative;
         left: 60px;
         top: -34px;
         color: #807d7c;
     }
     .but1{
         width: 100px;
         height: 25px;
         position: absolute;
         left: 53px;
         top: 52px;
         background-color: #1E9FFF;
         color: white;
         border-radius: 5px;
         font-weight:bold;
         border: none;
     }
     .conceal{
         width: 950px;
         height: 200px;
         position: absolute;
         z-index: 1;
         background-color: #ffffff;
         display: none;
         top:39px;
         left: 0px;
         border: 2px solid #0a61ff;
         border-top: none;
     }

     .badge{


     }

     #badge9{
          position: relative;
          top:40px;
          left: 5px;
               opacity: 0.8;
      }
     #badge10{
         position: relative;
         top:20px;
         left: 50px;
         opacity: 0.8;
     }

     #new1{
         position: relative;
         top:-14px;
         left: 115px;
         background-color: orange;
         font-weight:bold;
     }
     #hot1{
         position: relative;
         top:-14px;
         left: 115px;
         background-color: red;
         font-weight:bold;
     }
     .xingxing {
         position: absolute;
         top: 71px;
         left: 110px;
         width: 100px;
         height: 50px;
     }


     .li1{
         float: left;
         height: 190px;

     }

     .h51{
         position: relative;
         top:55px;
         left:5px;
         font-weight:bold;
         color: white;
     }

     .dd2{
         position: relative;
         top:-102px;
         left:10px;
     }
     .dd3{
         box-shadow:-2px 0 3px -1px #ebebeb,
         -2px 0 3px -1px #ebebeb,
         2px 0 3px -1px  #ebebeb;
         height: 80px;
         position: relative;
         top: -75px;
         width:215px;
     }

     .layui-this{
         font-weight:bold;
     }
     #xing1{
         position: relative;
         top:-65px;
         left:-40px;
         float: left;
     }
     #xing2{
         position: relative;
         top:-65px;
         left:-60px;
            float: left;

     }
     #xing3{
         position: relative;
         top:-65px;
         left:-80px;
           float: left;

     }
     #xing4{
         position: relative;
         top:-65px;
         left:-100px;
         float: left;

     }
     #xing5{
         position: relative;
         top:-65px;
         left:-120px;
         float: left;

     }

    </style>


</head>
<body>
<jsp:include page="../jsp/header.jsp"></jsp:include>
<div class="layui-tab layui-tab-brief" >
    <ul class="layui-tab-title">
        <li class="layui-this" >全部内容</li>


    </ul>
    <div class="layui-tab-content" >
        <div class="layui-tab-item layui-show">
            <div class="conceal" >
                <a>JAVA</a><br>
                <a>HTML</a><br>
                <a>CSS</a><br>
                <a>JS</a><br>
                <p class="xingxing"></p>

            </div>
            <div style="clear: both"></div>

        </div>

        <div id="LAY_demo2"></div>
    </div>
</div>



<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>

<script>
    $(".layui-this").mouseenter(function () {
        $(this).css("background-color","#6872ff");
        $(this).css("border-radius","5px");
        $(this).css("color","#fff");
        $(".conceal").show();
        $(this).children().first().css("margin-top","1vw");

    });
    $(".layui-this").mouseleave(function () {
        $(this).css("background-color","#fff");
        $(this).css("height","3vw");
        $(this).css("border-radius","5px");
        $(this).css("margin-top","0vw");
        $(this).css("border","none");
        $(this).css("color","#4ea9cd");
        $(".conceal").hide();
        $(this).children().children().first().css("margin-top","0vw");

    });
    $(".conceal").mouseenter(function () {
        $(this).show();
    });

    $(".conceal").mouseleave(function () {
        $(this).hide();
    });
    $(".layui-this").click( function () {
        $(this).siblings().css("width","185px");
        $(this).siblings().css("color","#4ea9cd");

    });
    
</script>
<%--<script src="/js/courseHomePage.js" charset="UTF-8"></script>--%>

<script src="/layui/layui.js" charset="utf-8"></script>

<%--图片中的星星--%>
<script>

</script>

 <%--瀑布流--%>
<script>
    layui.use('flow', function(){
        var flow = layui.flow;
  flow.load({
elem: '#LAY_demo2' //流加载容器
,isAuto: false
,done: function(page, next){ //加载下一页
//模拟插入
setTimeout(function(){
var lis = [];
var limit =8;
var data={"page":page,"limit":limit};
console.log(data);
$.ajax({
    type :"POST",
    url:"/courseHomePage/findCoursesList",
    dataType:"json",
    data:data,
    success:function(result) {
        layui.each(result.coursesList, function (i, courses) {
                lis.push(

                    '<ul>' +
                    '<li class="li1">' +
                    '<dl class="dl1">' +
                    '<dt class="dt1">' +
                    '<img id="img1" src="../../img/courses.png" style="height: 90px;width: 213px ">' +
                    '</dt>' +
                    '<dd class="dd2">' +
                    '<h5 class="h51">玩转数据结构，从入门到精通</h5>' +
                    ' <span class="badge badge-warning" contenteditable="true" id="new1">NEW</span> ' +
                    ' <span class="badge badge-important" contenteditable="true" id="hot1">HOT</span>  ' +
                    '<p><span class="badge" contenteditable="true" id="badge9">java</span></p>' +
                    '<p><span class="badge" contenteditable="true" id="badge10">html</span></p>' +
                    '<div class="xingxing">' +
                    '<ul class="kechengxiaojeipingfen_ul">'+
                        '<li id="xing1">'+
                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                        '</li>'+
                        '<li id="xing2">'+
                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                        '</li>'+
                        '<li id="xing3">'+
                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                        '</li>'+
                        '<li id="xing4">'+
                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                        '</li>'+
                        '<li id="xing5">'+
                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                        '</li>'+
                        '</ul>'+
                    '</div>'+
                    '</dd>' +
                    '<dd class="dd3">' +
                    '<h6 class="h61" id="renshu">学习人数 ：'+courses.studentNum+'人</h6>' +
                    '<h6 class="h62" id="zhang">'+courses.chapterNum+'章</h6>' +
                    '<h6 class="h63" id="jie">'+courses.sectionNum+'节</h6>' +
                    '<h6 class="h64" id="jin">￥'+courses.price+'</h6>' +
                    '<h6 class="h65">上次学习时间</h6>' +
                    '<input class="but1" type="button" onclick=window.open("https://www.baidu.com") value="查看详情"/>' +
                    '</dd>' +
                    '</dl>' +
                    '</li>' +
                        '</ul>'


                );
        })
                next(lis.join(''), page < 6); //假设总页数为 6
    }
});
}, 500);
}
  });
    });
</script>


<div style="clear: both"></div>
<jsp:include page="../jsp/footer.jsp"></jsp:include>
</body>
</html>