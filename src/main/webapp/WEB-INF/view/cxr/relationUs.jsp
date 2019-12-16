<%--
  Created by IntelliJ IDEA.
  User: ${崔新睿}
  Date: 2019/11/22
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>联系我们</title>
    <script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        #lianxiwomenzhuti{
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
        #lianxiwomenzhuti #wen_da{
            margin-right: 3vw;
            margin-left: 5vw;
        }
        #lianxiwomenzhuti li{
            font-size: 1vw;
            list-style: disc;
            margin-top: 2vw;
            margin-bottom: 2vw;
        }
        #lianxiwomenzhuti #zhuti_tou{
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
        #lianxiwomenzhuti #wen_da .wen{
            color: rgb(70,70,70);
            font-size: 1.5vw;
        }
        #lianxiwomenzhuti #wen_da .da{
            color: rgb(150,150,150);
            font-size: 1.2vw;
            margin-top: 1vw;
        }
        #lianxiwomenzhuti #wen_da .weixin{
            float: left;
            width: 5vw;
            margin-right: 3vw;
            height: 7vw;
        }
        #lianxiwomenzhuti #wen_da .weixin img{
            width: 100%;
            height: 5vw;
        }
        #lianxiwomenzhuti #wen_da .weixin .jianjei{
            color: rgb(150,150,150);
            text-align: center;
            font-size: 1vw;
        }



    </style>

</head>
<body style="width: 90%;">

<div id="lianxiwomenzhuti">

    <div id="zhuti_tou">
        联&nbsp;系&nbsp;我&nbsp;们
    </div>
    <ul id="wen_da">
        <li style="display: none;"> <b class="wen">联系我们id</b> <p class="da">${contactUs.contactusId}</p> </li>
        <li> <b class="wen">电子邮件</b><p class="da">${contactUs.contactusEmail}</p> </li>
        <li> <b class="wen">联系电话</b> <p class="da">${contactUs.contactusPhone}</p> </li>
        <li> <b class="wen">工作时间</b><p class="da">周一至周日09:00-22:00(节假日除外)</p> </li>
        <li> <b class="wen">客服提醒</b><p class="da">${contactUs.contactusRemind}</p> </li>
        <li> <b class="wen">联系地址及邮编</b><p class="da"> ${contactUs.contactusAddress} <br />邮政编码：${contactUs.contactusPostcode}</p> </li>
        <li> <b class="wen">微信</b> <p class="da"> </p>
            <div class="weixin">
                <img src="/img/cxr/平台公众号.png" />
                <p class="jianjei">平台公众号</p>
            </div>
            <div class="weixin">
                <img src="/img/cxr/客服群.png" />
                <p class="jianjei">客服群</p>
            </div> <p></p>
        </li>
    </ul>
</div>

</body>
</html>
