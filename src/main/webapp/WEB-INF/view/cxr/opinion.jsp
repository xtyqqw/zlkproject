<%--
  Created by IntelliJ IDEA.
  User: ${崔新睿}
  Date: 2019/11/25
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%--jstl约束--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>意见反馈</title>
    <script src="<%=request.getContextPath()%>/layui/layui.all.js"></script>
    <script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" type="text/css">



    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }

        #yijianzhuti{
            /*z-index: 9;*/
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
        #yijianzhuti #zhuti_tou{
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
        #yijianzhuti #zhuti_zhong{
            margin: 0 6vw;
            height: 25vw;
            margin-top: 1vw;
        }
        #yijianzhuti #zhuti_zhong #jianje{
            font-size: 1.5vw;
            color: rgb(150,150,150);
        }
        #yijianzhuti #zhuti_zhong #jianje #dian{
            line-height: 3vw;
            position: relative;
            top: -0.1vw;
            font-size: 3vw;
            color: #000000;
        }
        #yijianzhuti #zhuti_zhong #shuru{
            margin: 1vw 0;
            height: 18vw;
            margin-top: 2vw;
        }
        #yijianzhuti #zhuti_zhong #shuru textarea{
            font-size: 1.8vw;
            resize: none;
            padding: 1vw;
            width: 100%;
            height: 100%;
            color: rgb(150,150,150);
        }
        #yijianzhuti #zhuti_wei{
            margin: 0 6vw;
        }
        #yijianzhuti #zhuti_wei #tishi{
            float: left;
            font-size: 1vw;
            color: #ff0000;
        }
        #yijianzhuti #zhuti_wei #quxiao{
            border-radius: 0.3VW;
            width: 6vw;
            margin-right: 2vw;
            height: 3.8vw;
            font-size: 1.3vw;
            border: none;
            color: #ffffff;
            background-color: rgb(150,150,150);
            float: right;
        }
        #yijianzhuti #zhuti_wei #tijiao{
            border-radius: 0.3VW;

            width: 6vw;
            height: 3.8vw;
            font-size: 1.3vw;
            border: none;
            color: #ffffff;
            /*background-color: #713ED7;*/
            float: right;
        }
        #yijianzhuti #chenggong{
            position: fixed;
            top: 25%;
            left:35%;
            font-size: 1.3vw;
            color: white;
            border-radius: 0.4vw;
            background-color:  #713ED7;
            width: 12vw;
            height: 3.5vw;
            line-height: 3.5vw;
            text-align: center;
        }
        #yijianzhuti #quxiao1{
            position: fixed;
            top: 25%;
            left:40%;
            font-size: 1.3vw;
            color: white;
            border-radius: 0.4vw;
            background-color:  #713ED7;
            width: 12vw;
            height: 3.8vw;
            line-height: 3.5vw;
            text-align: center;
        }




    </style>

    <%--提交按钮js--%>
    <%--<script src="<%=request.getContextPath()%>/layui/lay/dest/layui.all.js/layui.js"></script>--%>
    <script src="<%=request.getContextPath()%>/layui/layui.all.js"></script>
    <script>


        //    取消按钮事件
        //重置按钮点击事件,当点击重置按钮时，显示信息
        $("#quxiao").click(function () {
            layer.msg("信息已重置",{ icon:6});
        });
    </script>

</head>
<body style="width:90%;">


<div id="yijianzhuti">
    <div id="zhuti_tou">
        意&nbsp;见&nbsp;反&nbsp;馈
    </div>
    <div id="zhuti_zhong">
        <div id="jianje">
            <p><span id="dian"><b>.</b></span><span>请在下方输入框中输入你对平台的宝贵意见</span></p>
        </div>
        <form action="<%=request.getContextPath()%>/opinion/addOpinion" id="form" method="post">
            <div id="shuru">
                <textarea id="shurukuang" name="opinionContext" required="required" placeholder="请输入20-100字的反馈内容"  minlength="20" maxlength="100"></textarea>
            </div>

            <div id="zhuti_wei">
                <input id="tijiao" type="submit" class="layui-btn" lay-event="add" style="background-color: #713ED7"><p style="margin-top:-0.5vw;"></p></input>
                <button type="reset" id="quxiao" onclick="quxiao()">取消</button>
            </div>
        </form>
    </div>
    <%--提交成功提示框--%>
    <%--<div id="msg">${msg}</div>--%>
   <input type="hidden" value="${msg}" id="msg">
    <%--取消提示框--%>
    <div id="quxiao1"><i class="layui-icon layui-icon-auz"></i>信息已重置</div>
</div>

<script>
    $("#msg").hide();
    $('#tijiao').click(function () {
        //获取输入框的值
        // alert("1111");
        var shuru = $('#shurukuang').val();
        //对输入框的值得长度进行判断，
        // 如果20<长度<100时。该提示信息显示
        if(shuru.length>20&&shuru.length<100){
            $("#msg").show();
            setTimeout(function () {
                $("#msg").hide();
            },5500)
        }
    });
</script>
<script>
    // 取消按钮事件
    $("#quxiao1").hide();
    $('#quxiao').click(function () {
        // alert("2222");
        var shuru = $('#shurukuang').val();
        if(shuru.length>0){
            $("#quxiao1").show();
            setTimeout(function () {
                $("#quxiao1").hide();
            },2000)
        }

    });
</script>
<script>
    //js表格
    layui.use(['table', 'laydate', 'form', 'util', 'layer'], function () {
        var table = layui.table;
        var laydate = layui.laydate;
        var layer = layui.layer;
        var util = layui.util;
        var form = layui.form;
        <c:if test="${flag}">
        <%--获取msg信息--%>
        $(function () {
            layer.alert($("#msg").val());
        })
        </c:if>

        form.render();
        //第一个实例




        //头工具栏事件,添加方法
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'add':
                    layer.open({

                        yes: function (index, layero) {
                            //添加安扭ID
                            layero.find("form").find("#tijiao").click();
                        }
                    });
                    break;
            };
        });


    });

</script>



</body>
</html>
