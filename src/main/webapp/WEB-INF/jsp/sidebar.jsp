<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/11/18
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>侧栏</title>
    <script src="/js/jquery-1.12.4.js"></script>
    <style type="text/css">
        body{
            background-color: #FFFFFF;
            margin: 0;
        }
<<<<<<< HEAD
        .sidebar{
            margin-top: 200px;
            position: fixed;
            right: 20px;
        }
        .sidebar .box{
=======
        #sidebar{
            margin-top: 100px;
            position: absolute;
            right: 20px;
            top: 200px;
        }
        #sidebar .box{
>>>>>>> 4591641b43f5460d4383af853409b4275eba776b
            float: left;
            margin-right: 0;
            border: 1px #656565;
            background-color: #FFFFFF;
            width: 70px;
            border-radius: 5px;
            box-shadow: 3px 3px 5px 3px #D4D4D4;
            position: fixed;
            right: 20px;
            top: 200px;
        }
<<<<<<< HEAD
        .sidebar img{
            width: 38px;
            height: 38px;
        }
        .sidebar ul{
            padding-left: 19px;
            padding-right: 15px;
        }
        .sidebar ul li{
            list-style: none;
            padding: 5px 0px;
        }
        .sidebar ul li a{
            text-decoration: none;
            color: #656565;
        }
        .sidebar hr{
=======
        #sidebar img{
            width: 38px;
            height: 38px;
        }
        #sidebar ul{
            padding-left: 19px;
            padding-right: 15px;
        }
        #sidebar ul li{
            list-style: none;
            padding: 5px 0px;
        }
        #sidebar ul li a{
            text-decoration: none;
            color: #656565;
        }
        #sidebar hr{
>>>>>>> 4591641b43f5460d4383af853409b4275eba776b
            width: 36px;
            color: #FCFCFE;
        }
        /* 二维码样式 */
<<<<<<< HEAD
        .sidebar .qrcode1,.qrcode2{
=======
        #sidebar .qrcode1,.qrcode2{
>>>>>>> 4591641b43f5460d4383af853409b4275eba776b
            position: fixed;
            right: 98px;
            height: 120px;
            float: right;
            border: 1px #656565;
            border-radius: 5px;
            box-shadow: 3px 3px 5px 3px #D4D4D4;
            display: none;
        }
<<<<<<< HEAD
        .sidebar .qrcode1{
            margin-top: 150px;
        }
        .sidebar .qrcode1 img{
            padding: 10px 15px 0px 15px;
        }
        .sidebar .qrcode1 span{
            padding: 5px 15px;
        }
        .sidebar .qrcode2{
            margin-top: 220px;
        }
        .sidebar .qrcode2 img{
            padding: 10px 10px 0px 15px;
        }
        .sidebar .qrcode2 span{
            padding: 5px 10px;
        }
        .sidebar .qrcode1,.qrcode2 span{
            font-size: 13px;
        }
        .sidebar span{
            padding: 0px;
        }
=======
        #sidebar .qrcode1{
            margin-top: 50px;
        }
        #sidebar .qrcode1 img{
            padding: 10px 15px 0px 15px;
        }
        #sidebar .qrcode1 span{
            padding: 5px 15px;
        }
        #sidebar .qrcode2{
            margin-top: 130px;
        }
        #sidebar .qrcode2 img{
            padding: 10px 10px 0px 15px;
        }
        #sidebar .qrcode2 span{
            padding: 5px 10px;
        }
        #sidebar .qrcode1,.qrcode2 span{
            font-size: 13px;
        }
        #sidebar span{
            padding: 0px;
        }
        #sidebar .box ul li a img span{
            position: absolute;
        }
>>>>>>> 4591641b43f5460d4383af853409b4275eba776b
    </style>
</head>
<body>
    <!-- 鼠标移入移出事件 -->
    <script type="text/javascript">
        $(document).ready(function(){
            /* 平台介绍 鼠标移入隐藏图片显示字 */
            $("#nav1").mouseover(function(){
                $("#zi1").show();
                $("#tu1").hide();
            });
            /* 平台介绍 鼠标移出隐藏字显示图片 */
            $("#nav1").mouseout(function(){
                $("#zi1").hide();
                $("#tu1").show();
            });

            /* 帮助客服 鼠标移入隐藏图片显示字 */
            $("#nav2").mouseover(function(){
                $("#zi2").show();
                $("#tu2").hide();
            });
            /* 帮助客服 鼠标移出隐藏字显示图片 */
            $("#nav2").mouseout(function(){
                $("#zi2").hide();
                $("#tu2").show();
            });

            /* 意见反馈 鼠标移入隐藏图片显示字 */
            $("#nav3").mouseover(function(){
                $("#zi3").show();
                $("#tu3").hide();
            });
            /* 意见反馈 鼠标移出隐藏字显示图片 */
            $("#nav3").mouseout(function(){
                $("#zi3").hide();
                $("#tu3").show();
            });
            /* 邀请好友 鼠标移入隐藏图片显示字 */
            $("#nav4").mouseover(function(){
                $("#zi4").show();
                $("#qrcode1").show();
                $("#tu4").hide();
            });
            /* 邀请好友 鼠标移出隐藏字显示图片 */
            $("#nav4").mouseout(function(){
                $("#zi4").hide();
                $("#qrcode1").hide();
                $("#tu4").show();
            });
            /* 公众号 鼠标移入隐藏图片显示字 */
            $("#nav5").mouseover(function(){
                $("#zi5").show();
                $("#qrcode2").show();
                $("#tu5").hide();
            });
            /* 公众号 鼠标移出隐藏字显示图片 */
            $("#nav5").mouseout(function(){
                $("#zi5").hide();
                $("#qrcode2").hide();
                $("#tu5").show();
            });
        });

    </script>

<<<<<<< HEAD
    <div class="sidebar">
=======
    <div id="sidebar">
>>>>>>> 4591641b43f5460d4383af853409b4275eba776b
        <div class="box">
            <ul>
                <li id="nav1">
                    <a href="javascript:;">
                        <img id="tu1" src="/img/help.png">
                        <span class="zi" id="zi1" style="display: none;">平台介绍</span>
                    </a>
                </li><hr>
                <li id="nav2">
                    <a href="javascript:;">
                        <img id="tu2" src="/img/kefu.png">
                        <span class="zi" id="zi2" style="display: none;">帮助客服</span>
                    </a>
                </li><hr>
                <li id="nav3">
                    <a href="javascript:;">
                        <img id="tu3" src="/img/yijian.png">
                        <span class="zi" id="zi3" style="display: none;">意见反馈</span>
                    </a>
                </li><hr>
                <li id="nav4">
                    <a href="javascript:;">
                        <img id="tu4" src="/img/yaoqing.png">
                        <span class="zi" id="zi4" style="display: none;">邀请好友</span>
                    </a>
                </li><hr>
                <li id="nav5">
                    <a href="javascript:;">
                        <img id="tu5" src="/img/gong.png">
                        <span class="zi" id="zi5" style="display: none;">公众号</span>
                    </a>
                </li>
            </ul>
        </div>
        <!-- 邀请好友二维码 -->
        <div class="qrcode1" id="qrcode1">
            <img src="/img/qrcode.png" style="height: 80px; width: 80px;"><br />
            <span>扫码邀请好友</span>
        </div>
        <!-- 公众号二维码 -->
        <div class="qrcode2" id="qrcode2">
            <img src="/img/qrcode.png" style="height: 80px; width: 80px;"><br />
            <span>扫码关注公众号</span>
        </div>
    </div>
</body>
</html>
