<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"></script>
    <style type="text/css">
        body {
            line-height: 1.2vw;
        }
        .layui-rate {
            padding: 0;
            font-size: 0;
        }
        .layui-progress {
            position: relative;
            height: 1vw;
            border-radius: 1vw;
            font-size: 1vw;
            background-color: #e2e2e2;
        }
        .layui-progress-bar{
            height: 1vw;
        }
        .layui-rate li i.layui-icon {
            font-size: 1vw;
            color: #FFB800;
            margin-right: 0px;
            transition: all .3s;
            -webkit-transition: all .3s;
        }
        *{
            margin: 0px;
            padding: 0px;
        }
        #kechengzhuti{
            padding: 0px 15vw;
        }
        #kechengzhuti #kechengjeishao{

        }
        #kechengzhuti #kechengshipin{
            position: relative;
            z-index: -1;
            width: 100%;
            height: 22vw;
        }
        #kechengzhuti #kechengxinxi{
            width: 100%;
            height: 5vw;
            background-color: rgb(235,235,235);
            border-radius: 5px;
        }
        #kechengzhuti #kechengxinxi ul{

        }
        #kechengzhuti #kechengxinxi ul .xinxi{
            z-index: 9;
            float: left;
            margin-left: 2.5vw;
            width: 10%;
            height: 5vw;
            text-align: center;
        }
        #kechengzhuti #kechengxinxi #jiaru{
            float: right;
            margin-top: 1.2vw;
            margin-right: 1.5vw;
            width: 6.5vw;
            color: #fff;
            height: 2.5vw;
            font-size: 1.02vw;
            line-height: 2.5vw;
            background-color: #00f;
            border-radius: 5px;
            border: none;
            text-align: center;
        }
        #kechengzhuti #kechengxinxi ul li .xiaobiaoti{
            height: 2.5vw;
            font-size: 1.1vw;
        }
        #kechengzhuti #kechengxinxi ul li .xiaobiaoti b{
            position: relative;
            top: 1.1vw;
        }
        #kechengzhuti #kechengxinxi ul li #rensu{
            width: 100%;
            height: 50%;
            color: rgb(150,150,150);
            font-size: 1vw;
        }
        #kechengzhuti #kechengxinxi ul li #jiage{
            width: 100%;
            height: 50%;
            color: #f00;
            font-size: 1vw;
        }
        #kechengzhuti #kechengxinxi ul li #xianmuliang{
            width: 100%;
            height: 50%;
            color: rgb(150,150,150);
            font-size: 1vw;
        }
        #kechengzhuti #kechengxinxi ul li #xingxing{
            width: 100%;
            height: 50%;
        }


    </style>
</head>
<body>
<div id="kechengzhuti">
    <div id="kechengjeishao">
        <div id="kechengshipin">
            <video width="100%" height="100%" controls style="border-radius: 5px;">
                <source src="shipin.mp4" type="video/mp4">
                您的浏览器不支持 HTML5 video 标签。
            </video>
        </div>
        <div id="kechengxinxi">
            <ul>
                <li class="xinxi">
                    <div>
                        <div class="xiaobiaoti"><h6><b>学习人数</b></h6></div>
                        <div id="rensu"><p>123人</p></div>
                    </div>
                </li>
                <li class="xinxi">
                    <div>
                        <div  class="xiaobiaoti"><h6><b>好评度</b></h6></div>
                        <div id="xingxing">
                        </div>
                    </div>
                </li>
                <li class="xinxi">
                    <div>
                        <div  class="xiaobiaoti"><h6><b>价格</b></h6></div>
                        <div id="jiage">￥200.00</div>
                    </div>
                </li>
                <li class="xinxi">
                    <div>
                        <div class="xiaobiaoti"><h6><b>项目量</b></h6></div>
                        <div id="xianmuliang">21步54节</div>
                    </div>
                </li>
                <li class="xinxi">
                    <div>
                        <div class="xiaobiaoti"><h6><b>获星数量</b></h6></div>
                        <div class="layui-progress">
                            <div class="layui-progress-bar layui-bg-orange" lay-percent="80%">800/1000</div>
                        </div>
                    </div>
                </li>

            </ul>
            <button id="jiaru">
                参加项目
            </button>
        </div>
    </div>
</div>

<script type="text/javascript" src="/layui/layui.js"  charset="utf-8"></script>
<script type="text/javascript">
    /*
    * 这个是layui中的评分必要的js代码
    */
    layui.use(['rate'], function(){
        var rate = layui.rate;
        //只读
        rate.render({
            elem: '#xingxing'
            ,value: 5
            ,readonly: true
        });
    });
    /*
     * 这个是layui进度条需要的js代码
     */
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element;
    });
    $(".xinxi").mouseenter(function () {
        $(this).css("background-color","#fff");
        $(this).css("height","7vw");
        $(this).css("width","7vw");
        $(this).css("margin-top","-1vw");
        $(this).css("border","1px solid rgb(150,150,150)");
        $(this).children().children().first().css("margin-top","1vw");
    });
    $(".xinxi").mouseleave(function () {
        $(this).css("background-color","rgb(235,235,235)");
        $(this).css("height","5vw");
        $(this).css("width","10%");
        $(this).css("margin-top","0vw");
        $(this).css("border","none");
        $(this).children().children().first().css("margin-top","0vw");
    });
</script>
</body>
</html>