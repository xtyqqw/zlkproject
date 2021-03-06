<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/11/19
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学习看板</title>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <script src="../../../js/echarts.min.js"></script>
    <style type="text/css">
        body{margin: 0;}
        .xuexili{
            margin-top: 0;
            background-color: #FAFAFA;
            width: 100%;
            height: 300px;
            border: 1px #FAFAFA;
            border-radius: 3px;
        }
        .zi{
            margin: 40px 30px 0 30px;
            padding-top: 20px;
        }
        .zi1,.zi2{
            font-size: 23px;
        }
        .zi2{
            padding-left: 300px;
        }
        /* 学习力指针图 */
        .pointer{
            position: fixed;
        }
        .pointer p{
            color: #713ED7;
            font-size: 20px;
            padding: 20px 0 0 166px;
            margin: 0;
        }
        .pointer img{
            padding-left: 20px;
        }
        /* 今日学习情况 */
        .today-learn-case{
            width: 650px;
            height: 200px;
            margin-left: 400px;
            margin-top: 50px;
        }
        .today-learn-case ul{
            margin-left: 30px;
        }
        .today-learn-case ul li{
            list-style: none;
            float: left;
            margin-left: 10px;
            border: 1px #FAFAFA;
            border-radius: 5px;
            padding: 20px 30px;
            text-align: center;
        }
        .today-learn-case ul li:hover{
            box-shadow: 1px 1px 5px 3px #D4D4D4;
            background-color: #FFFFFF;
        }
        .today-learn-case .font1{
            font-size: 18px;
        }
        .today-learn-case i{
            font-size: 22px;
            color: #713ED7;
            margin: 10px 0;
        }
        .today-learn-case p{
            margin: 0;
            color: #999999;
            font-size: 12px;
        }
        .today-learn-case .persent{
            color: #713ED7;
            font-size: 15px;
        }
        #main{
            width: 600px;
            height: 300px;
            margin-left: -90px;
            margin-top: -20px;
        }
    </style>
</head>
<body>
<!-- 学习力 -->
<div class="xuexili">
    <div class="zi">
        <span class="zi1">学习力</span>
        <span class="zi2">今日学习情况</span>
    </div>
    <!-- 学习力指针图 -->
    <div class="pointer">
        <%--<p>501</p>--%>
        <%--<img src="/img/poor-good.png">--%>
        <div id="main"></div>
    </div>
    <!-- 今日学习情况 -->
    <div class="today-learn-case">
        <ul>
            <li>
                <span class="font1">学习时长</span><br />
                <i>${times}</i>
                <span style="font-size: 13px;color: #999999;">小时</span>
                <p>已超过<span class="persent">${rankAll}</span>%的同学</p>
            </li>
            <li>
                <span class="font1">学习成长量</span><br />
                <i>${grow}</i>
                <p>已超过<span class="persent">${rankAll}</span>%的同学</p>
            </li>
            <li>
                <span class="font1">技能水平</span><br />
                <i>${level}</i>
                <p>已超过<span class="persent">${rankAll}</span>%的同学</p>
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var num = ${ability};
    // 指定图表的配置项和数据
    var option = {
        tooltip : {
            formatter: "{a} <br/>{b} : {c}%"
        },
        toolbox: {
            feature: {
                restore: {},
                saveAsImage: {}
            }
        },
        series: [
            {
                name: '学习力',
                type: 'gauge',
                detail: {formatter:'${ability}%'},
                data: [{value: 50}]
            }
        ]
    };
    setInterval(function () {
        option.series[0].data[0].value = num.toFixed(2) - 0;
        myChart.setOption(option, true);
    },2000);

    // 使用刚指定的配置项和数据显示图表
    myChart.setOption(option);
</script>
</body>
</html>
