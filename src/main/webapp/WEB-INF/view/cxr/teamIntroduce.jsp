<%--
  Created by IntelliJ IDEA.
  User: ${崔新睿}
  Date: 2019/12/3
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"></script>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" type="text/css">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>

    <style type="text/css">

        *{
            margin: 0;
            padding: 0;
        }
        #tuanduizhuti{
            /*z-index: -9;*/
            position: relative;
            float: left;
            margin: 8vw 0vw 5vw 19vw;
            width: 99%;
            box-shadow: 0vw 0.3vw 0.3vw 0.3vw rgb(235,235,235);
            border-top: 0.3vw solid #713ED7;
            padding-bottom: 5vw;
            margin-left: 1vw;
            margin-top: 1vw;
        }
        #tuanduizhuti #zhuti_tou{
            position: relative;
            border-radius: 0.3VW;
            width: 18vw;
            height: 5vw;
            background-color: #713ED7;
            border: none;
            font-size: 2vw;
            line-height: 4vw;/*垂直居中*/
            text-align: center;
            color: #ffffff;
            margin: 0 auto;
        }
        #tuanduizhuti img{
            width: 100%;
            height: 100%;
        }

        #tuanduizhuti #zhuti_zhong{
            margin: 0vw 0vw 0vw 3vw;
        }
        #tuanduizhuti #zhuti_zhong div{
            margin: 0.5vw 0vw;
        }
        #tuanduizhuti #zhuti_zhong #datu{
            width: 96%;
            float: left;
            height: 20vw;
            margin-right: 1vw;
        }
        #tuanduizhuti #zhuti_zhong .sanfen{
            width: 40%;
            float: left;
            height: 20vw;
           margin-right: 1vw;
        }
        #tuanduizhuti #zhuti_zhong .liufen{
            width: 55%;
            float: left;
            height: 20vw;
            margin-right: 1vw;
        }

        .wenzi{
            display: none;
            position:relative;


        }
        li{
            list-style-type:none;
        }

        .layui-flow-more a cite{
            padding:0 20px;
            border-radius:55px;
            display: none;
            font-size: 1.5vw;
            background-color:#713ED7;
            color:white;
            font-style:normal;
            margin-left:-5vw;

        }

    </style>

</head>
<body style="width: 90%;">


<div id="tuanduizhuti">
    <div id="zhuti_tou">
        团&nbsp;队&nbsp;介&nbsp;绍
    </div>
    <ul>
        <div id="zhuti_zhong">
            <li>
                <div id="datu">
                    <a href="#"> <img src="/img/cxr/团队介绍.jpg" id="tu1" /> <div class="wenzi" id="wenzi1">图片介绍</div> </a>
                </div> </li>
            <!-- 流加载 -->
            <ul class="flow-default" id="LAY_demo1"></ul>
        </div>
    </ul>
</div>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script src="<%=request.getContextPath()%>/layui/layui.js"></script>

<script>

    /*流加载*/
    layui.use(['flow','element'], function(){
        var flow = layui.flow;
        var $ = layui.jquery,element = layui.element;
        flow.load({
            elem: '#LAY_demo1' //流加载容器
            ,scrollElem: '#LAY_demo1' //滚动条所在元素，一般不用填，此处只是演示需要。
            ,done: function(page, next){ //执行下一页的回调

                //模拟数据插入
                setTimeout(function(){
                    var lis = [];

                    for(var i = 1; i <=1 ; i++){
                        lis.push(
                            '<li>'+
                            '<div class="sanfen" id="sanfen1">'+
                            '<a href="#">'+'<span class="wenzi" id="wenzi2">'+'图片介绍'+'</span>'+
                            '<img src="/img/cxr/团队介绍.jpg" id="tu2"/>'+ '</a>'+
                            '</div>'+' </li>'+
                            '<li>'+
                            '<div class="liufen" id="liufen1">'+
                            '<a href="#">'+'<span class="wenzi" id="wenzi3">'+'图片介绍'+'</span>'+
                            '<img src="/img/cxr/团队介绍.jpg" id="tu3" />'+'</a>'+
                            '</div>'+'</li>'+
                            ' <li>'+
                            '<div class="liufen" id="liufen2">' +
                            '<a href="#">'+'<span class="wenzi" id="wenzi4">'+'图片介绍'+'</span>'+
                            '<img src="/img/cxr/团队介绍.jpg" id="tu4" />' +'</a>'+
                            '</div>'+' </li>' +
                            '<li>'+
                            '<div class="sanfen" id="sanfen2">'+
                            '<a href="#">'+ '<span class="wenzi" id="wenzi5">'+'图片介绍'+'</span>'+
                            '<img src="/img/cxr/团队介绍.jpg" id="tu5" /> '+'</a>'+
                            '</div> '+'</li>'+
                            '</div>'+'</li>')
                    }

                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < 10); //假设总页数为 10
                    element.render('progress');//进度条渲染

                }, 500);
            }
        });

    });

</script>
</body>
</html>