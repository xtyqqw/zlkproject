<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/11/25
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>学习记录</title>
    <script src="/js/jquery-1.12.4.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <style type="text/css">
        .learnrecord{
            margin-top: 20px;
            width: 100%;
            height: 400px;
        }
        .timeline{
            width: 900px;
            margin: 0 auto 0 0;
        }
        /* 时间 */
        .timeline .date{
            float: left;
            text-align: center;
            padding-right: 10px;
        }
        .timeline .date .year{
            font-size: 17px;
        }
        .yuan{
            border: 1px solid #999999;
            border-radius: 50%;
            height: 10px;
            width: 10px;
            float: left;
            background-color: #999999;
            margin-top: 5px;
        }
        .yuan:before{
            content: '';
            position: absolute;
            width: 1px;
            height: 350px;
            margin-left: 4px;
        }
        .yuan:before,hr{
            background-color: #999999;
        }
        .learn-main{
            background-color: #FAFAFA;
            float: left;
            margin-left: 130px;
            width: 900px;
        }
        .learn-main:hover{
            background-color: #FFFFFF;
            box-shadow: 1px 1px 5px 1px #D4D4D4;
        }
        .learn-title{
            float: left;
            margin: 30px 0 50px 50px;
        }
        .learn-title h2{
            font-size: 23px;
            padding-bottom: 8px;
        }
        .learn-title p{
            font-size: 15px;
            color: #999999;
            padding-bottom: 13px;
        }
        .learn-title img{
            width: 200px;
            height: 150px;
            border-radius: 5px;
        }
        /* 获星数量 */
        .learn-main-getstar{
            float: right;
            width: 200px;
            margin-right: 30px;
        }
        .learn-main-getstar p{
            text-align: right;
            margin: 30px 10px 0 0;
            font-size: 20px;
        }
        /* 继续学习 */
        .learn-main-getstar a{
            border: 1px #914FF1;
            color: #FFFFFF;
            font-size: 17px;
            line-height: 40px;
        }
        .continue-learn{
            border: 1px #914FF1;
            border-radius: 3px;
            width: 120px;
            height: 40px;
            background-color: #914FF1;
            text-align: center;
            margin: 80px 0 30px auto;
        }
        /* 鼠标移入继续学习按钮的样式 */
        .continue-learn:hover{
            box-shadow: 1px 1px 5px 1px #D4D4D4;
        }
        /*.continue-learn{display: none;}
        .continue-learn.active{display: block}*/
    </style>
</head>
<body>
<!-- 鼠标移入移出显示隐藏继续学习 -->
<%--<script type="text/javascript">
    $(function(){
        $(".learn-main").mouseenter(function(){
            var index = $(this).index();
            /*$(this).addClass("main").siblings().removeClass("main");
            $(".continue-learn").eq(index).addClass("active").siblings().removeClass("active");*/
            $(this).$(".continue-learn").show()/*.siblings().removeClass("continue-learn")*/;
            $(this).$(".yuan").css("background-color","#914FF1");
        });
        $('.learn-main').mouseleave(function() {
            $(".continue-learn").removeClass("active").siblings().removeClass("active");
        });
    })
</script>--%>
<div class="learnrecord">
    <%--<c:forEach items="${itemList}" var="item">
        <div class="timeline">
            <div class="date">
                <p class="year">${item.stuTime}</p>
            </div>
            <div class="yuan"></div>
            <div class="learn-main mainname main">
                <div class="learn-title">
                    <h2>${item.coursesName}</h2>
                    <p>解锁任务：${item.coursesName} — ${item.chapterName} — ${item.sectionName}</p>
                    <img src="${item.coverPic}">
                </div>
                <div class="learn-main-getstar">
                    <p>获星数量</p>
                    <!-- 小进度条 -->
                    <div class="layui-progress layui-progress-big" lay-showpercent="true"
                         style="width: 100px;margin: 10px 0 0 auto;">
                        <div class="layui-progress-bar" lay-percent="80/120" style="background-color: #FBC328;"></div>
                    </div>
                    <a href="<%=request.getContextPath()%>/toVideo">
                        <div class="continue-learn">继续学习</div>
                    </a>
                </div>
                <!-- 大进度条 -->
                <div class="layui-progress layui-progress-big" lay-showpercent="true"
                     style="width: 520px;height: 20px;background-color: #dfd9fd;
                            margin: 230px 30px auto 350px;float: right;position: fixed;">
                    <div class="layui-progress-bar" lay-percent="${per}%"
                         style="height: 20px;background-color: #9e8dff;text-align: center;font-weight: bold"></div>
                </div>
            </div>
        </div>
    </c:forEach>--%>
    <%--<div class="flow_div"></div>--%>
</div>
<div id="demo7" style="float: right;margin: 50px 20px auto"></div>
<%--分页--%>
<script>
    var page = 1;
    var limit = 5;
    var total;
    function showRecord() {
        $.ajax({
            type: "post",
            url: "/courses/tocourses",
            async: false,
            dataType: 'json',
            data: {
                "page": page,
                "limit": limit,
            },
            success: function (data) {
                total = data.count;
                var per = data.per;
                var data1 = data.data;
                var html = '';
                for (var i = 0;i<data1.length;i++){
                    html += '<div class="timeline">';
                    html += '<div class="date">';
                    html += '<p class="year">'+ data1[i].stuTime +'</p>';
                    html += '</div>';
                    html += '<div class="yuan"></div>';
                    html += '<div class="learn-main mainname main">';
                    html += '<div class="learn-title">';
                    html += '<h2>'+ data1[i].coursesName+'</h2>';
                    html += '<p>解锁任务：'+ data1[i].coursesName+' — '+ data1[i].chapterName+' — '+ data1[i].sectionName+'</p>';
                    html += '<img src="'+ data1[i].coverPic+'">';
                    html += '</div>';
                    html += '<div class="learn-main-getstar">';
                    html += '<p>获星数量</p>';
                    html += '<div class="layui-progress layui-progress-big" lay-showpercent="true" ' +
                        'style="width: 100px;margin: 10px 0 0 auto;">';
                    html += '<div class="layui-progress-bar" lay-percent="80/120" style="background-color: #FBC328;"></div>';
                    html += '</div>';
                    html += '<a href="/toVideo" target="_blank">';
                    html += '<div class="continue-learn">继续学习</div>';
                    html += '</a>';
                    html += '</div>';
                    html += '<div class="layui-progress layui-progress-big" lay-showpercent="true" ' +
                        'style="width: 520px;height: 20px;background-color: #dfd9fd;' +
                        'margin: 230px 30px auto 350px;float: right;position: fixed;">';
                    html += '<div class="layui-progress-bar" lay-percent="'+data1[i].per+'\%'+'" ' +
                        'style="height: 20px;background-color: #9e8dff;text-align: center;font-weight: bold"></div>';
                    html += '</div>';
                    html += '</div>';
                    html += '</div>';
                }
                $(".learnrecord").empty().append(html);
            }
        })
    }
    /*进度条*/
    /*layui.use('element', function(){
        var element = layui.element;
        element.render('progress');
    });*/
    function percent() {
        layui.use('element', function(){
            var element = layui.element;
            element.render('progress');
        });
    }
    function getPage(){
        layui.use('laypage', function() {
            var laypage = layui.laypage;
            //完整功能
            laypage.render({
                elem: 'demo7'
                ,count: total //数据总数
                ,theme: '#914FF1'
                ,limit:limit
                ,layout: ['prev', 'page', 'next', 'count']
                ,jump: function(obj,first){
                    page=obj.curr;
                    limit=obj.limit;
                    if(!first){
                        showRecord();
                        percent();
                    }
                }
            });
        });
    }
    $(function () {
        showRecord();
        getPage();
        percent();
    })
</script>
<%--流加载--%>
<%--<script type="text/javascript">
    layui.use('flow', function () {
        var flow = layui.flow;
        flow.load({
            elem: '.flow_div' //流加载容器
            , isAuto: false
            , done: function (page, next) { //执行下一页的回调
                setTimeout(function () {
                    var lis = [];
                    var limit = 8;
                    var data = {"page": page, "limit": limit};
                    $.ajax({
                        type: "POST",
                        url: "/courses/icourses",
                        dataType: "json",
                        data: data,
                        success: function (map) {
                            layui.each(map.itemList, function (i, item) {
                                lis.push('<div class="timeline">'
                                    +'<div class="date">'
                                    +'<p class="year">'+item.stuTime+'</p>'
                                    +'</div>'
                                    +'<div class="yuan"></div>'
                                    +'<div class="learn-main mainname main">'
                                    +'<div class="learn-title">'
                                    +'<h2>'+item.coursesName+'</h2>'
                                    +'<p>解锁任务：'+item.coursesName+' — '+item.chapterName+' — '+item.sectionName+'</p>'
                                    +'<img src="'+item.coverPic +'">'
                                    +'</div>'
                                    +'<div class="learn-main-getstar">'
                                    +'<p>获星数量</p>'
                                    +'<div class="layui-progress layui-progress-big" lay-showpercent="true"'
                                    +'     style="width: 100px;margin: 10px 0 0 auto;">'
                                    +'<div class="layui-progress-bar" lay-percent="80/120" style="background-color: #FBC328;"></div>'
                                    +'</div>'
                                    +'<a href="javascript:;">'
                                    +'<div class="continue-learn">继续学习</div>'
                                    +'</a>'
                                    +'</div>'
                                    +'<div class="layui-progress layui-progress-big" lay-showpercent="true"'
                                    +'     style="width: 520px;height: 20px;background-color: #dfd9fd;'
                                    +'            margin: 230px 30px auto 350px;float: right;position: fixed;">'
                                    +'<div class="layui-progress-bar" lay-percent="'+map.per + ' %"'
                                    +'     style="height: 20px;background-color: #9e8dff;text-align: center;font-weight: bold"></div>'
                                    +'</div>'
                                    +'</div>'
                                    +'</div>'
                                )
                            });
                            next(lis.join(''), page < 3);
                        }
                    });
                }, 500);
            }
        });
    });
</script>--%>
</body>
</html>
