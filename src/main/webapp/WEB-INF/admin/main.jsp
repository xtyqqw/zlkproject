<%--
  Created by IntelliJ IDEA.
  User: yzh
  Date: 2019/9/16
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>主体内容</title>
    <link href="//at.alicdn.com/t/font_1542444_yg83v2j8bj9.css" rel="stylesheet" type="text/css"/>
    <link href="//at.alicdn.com/t/font_1542444_vfbtgm5g59.css" rel="stylesheet" type="text/css"/>
    <link href="//at.alicdn.com/t/font_1542444_x9k859tp6ec.css" rel="stylesheet" type="text/css"/>
    <link href="//at.alicdn.com/t/font_1542444_7bsop62hyz9.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/echarts.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <style type="text/css">
        #main {
            position: relative;
            top: 53px;
        }
        #right{
            position: relative;
            float: right;
            top: -53px;
            right: 73px;
            border: 1px solid #ccc;
        }
        #rightTop{
            text-align: center;
        }
        #rigitTable{
            border-collapse: collapse;
        }
        #rigitTable,#rigitTable tr td {
            border:1px solid #ccc;
        }
        #rigitTable tr td{
            padding: 5px 10px;
        }
        #top{
            position: relative;
            float: left;
            left: 65px;
            top: 20px;
            height: 105px;
            width: 1006px;
            background-color: #ccc;
        }
        #top div{
            background-color: white;
            float: left;
            height: 99px;
            width: 235px;
            margin-top: 3px;
            margin-bottom: 3px;
        }
        #visit{
            margin-left: 3px;
        }
        #visit,#course,#article{
            margin-right: 20px;
        }
        .liulan{
            position: absolute;
            margin-top: 35px;
            margin-left: 50px;
        }
        #top div p{
            position: absolute;
            margin-top: 16px;
            margin-left: 130px;
        }
    </style>
</head>
<body>

<div id="top">
    <div id="visit">
        <i class="icon-liulan1 iconfont liulan"></i>
        <p>${visitNumber}</p><br/><br/>
        <p>访问量</p>
    </div>
    <div id="course">
        <i class="icon-xiangmuguanli iconfont liulan"></i>
        <p>120</p><br/><br/>
        <p>项目数</p>
    </div>
    <div id="article">
        <i class="icon-ai-article iconfont liulan"></i>
        <p>1320</p><br/><br/>
        <p>文章数</p>
    </div>
    <div id="user">
        <i class="icon-yonghu iconfont liulan"></i>
        <p>580</p><br/><br/>
        <p>用户数</p>
    </div>
</div>

<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 800px;height:356px;"></div>

<div id="right">
    <div id="rightTop">
        <p>系统信息</p>
    </div>
    <div>
        <table id="rigitTable">
            <tr><td>系统名</td><td>学习网站后台管理系统</td></tr>
            <tr><td>技术架构</td><td>SSM</td></tr>
            <tr><td>版本</td><td>v0.0.1</td></tr>
        </table>
    </div>
</div>

<script type="text/javascript">
    window.onload = function () {
        //echarts数据源
        $.ajax({
            url: '<%=request.getContextPath()%>/type/findTypeContainsTag',
            type: 'post',
            datatype: 'json',
            success: function (data) {
                var jsonobj= eval('(' + data + ')');
                var odata = [];
                var typename=[];
                for (var i = 0; i < jsonobj.length; i++) {
                    //var obj = {};
                    /*obj.name = '每种方向包含类别数量';
                    obj.type = 'bar';*/
                    typename.push(jsonobj[i].typeName);
                    odata.push(jsonobj[i].tagNumber);
                }
                option = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['每种方向包含类别数量']
                    },
                    xAxis: {
                        type : 'category',
                        data: typename
                    },
                    yAxis: [{
                        type : 'value'
                    }],
                    series: [{
                        name: '每种方向包含类别数量',
                        type: 'bar',
                        barWidth: 55,
                        data: odata
                    }]
                };
                //获取要赋值的DOM控件
                var myChart = echarts.init(document.getElementById('main'));
                //赋值
                myChart.setOption(option);
            }
        });
    }
</script>
</body>
</html>