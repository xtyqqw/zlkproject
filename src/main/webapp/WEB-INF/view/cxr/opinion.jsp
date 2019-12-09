<%--
  Created by IntelliJ IDEA.
  User: ${崔新睿}
  Date: 2019/11/25
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>意见反馈</title>
    <script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="yijianfankui.css" />
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        #yijianzhuti{
            z-index: -9;
            position: relative;
            float: left;
            margin: 8vw 0vw 5vw 19vw;
            width: 1000px;
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
            height: 2.5vw;
            font-size: 1vw;
            border: none;
            color: #ffffff;
            background-color: rgb(150,150,150);
            float: right;
        }
        #yijianzhuti #zhuti_wei #tijiao{
            border-radius: 0.3VW;
            width: 6vw;
            height: 2.5vw;
            font-size: 1vw;
            border: none;
            color: #ffffff;
            background-color: #713ED7;
            float: right;
        }
        #yijianzhuti #chenggong{
            position: fixed;
            top: 45%;
            left: 42%;
            font-size: 1vw;
            border-radius: 0.4vw;
            background-color: #fff;
            width: 18vw;
            height: 3.5vw;
            line-height: 3.5vw;
            text-align: center;
        }
        #yijianzhuti #chongxin{
            position: fixed;
            top: 45%;
            left: 42%;
            font-size: 1vw;
            border-radius: 0.4vw;
            background-color: #fff;
            width: 18vw;
            height: 3.5vw;
            line-height: 3.5vw;
            text-align: center;
        }
        #yijianzhuti #shibai{
            position: fixed;
            top: 45%;
            left: 42%;
            font-size: 1vw;
            border-radius: 0.4vw;
            background-color: #fff;
            width: 18vw;
            height: 3.5vw;
            line-height: 3.5vw;
            text-align: center;
        }


    </style>
</head>
<body>


<div id="yijianzhuti">
    <div id="zhuti_tou">
        意&nbsp;见&nbsp;反&nbsp;馈
    </div>
    <div id="zhuti_zhong">
        <div id="jianje">
            <p><span id="dian"><b>.</b></span><span>请在下方输入框中输入你对平台的宝贵意见</span></p>
        </div>
        <form action="<%=request.getContextPath()%>/opinion/addOpinion" method="post">
            <div id="shuru">
                <textarea id="shurukuang" name="opinionContext" placeholder="请输入20-100字的反馈内容"  minlength="20" maxlength="100"></textarea>
            </div>

    <div id="zhuti_wei">
        <button id="tijiao">提交</button>
        <button id="quxiao">取消</button>
    </div>
    </form>
    </div>
    <div id="chenggong">
        <img src="/img/cxr/提交成功图片.png" />提交已成功
    </div>
    <div id="chongxin">
        <img src="/img/cxr/提交失败.png" />编辑内容不符合要求，请重新编辑！
    </div>
    <div id="shibai">
        <img src="/img/cxr/加载超时.png" />加载超时请重试
    </div>
</div>
<script type="text/javascript">
    $("#tishi").hide();
    $("#chenggong").hide();
    $("#chongxin").hide();
    $("#shibai").hide();
    $('#tijiao').click(function () {
        $("#chenggong").show();
        setTimeout(function () {
            $("#chenggong").hide();
        },1500)
    });
    $('#quxiao').click(function () {
        $("#chongxin").show();
        setTimeout(function () {
            $("#chongxin").hide();
        },1500)
    });
    var suru = $('#shurukuang').val();;
    if (suru.length>20&&suru.length<100) {
        $("#tishi").hide();
    }else{
        $("#tishi").show();
    };
    $('#shurukuang').keyup(function(){
        var suru = $('#shurukuang').val();

        if (suru.length>20&&suru.length<100) {
            $("#tishi").hide();
        }else{
            $("#tishi").show();
        };
    });
</script>

</body>
</html>
