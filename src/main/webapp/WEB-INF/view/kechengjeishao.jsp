<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>

    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/kechengjeishao.css">
    <script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"></script>


</head>
<body>

<div id="kechengzhuti">
    <div id="kechengjeishao">
        <input id="kechengId" type="hidden">
        <div id="kechengshipin">

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
                        <div class="layui-progress layui-progress-big"  lay-filter="demo">
                            <div id="huoxingshu" class="layui-progress-bar layui-bg-orange" lay-percent="0%">800/1000</div>
                        </div>
                    </div>
                </li>

            </ul>
            <button id="jiaru">
                参加项目
            </button>
        </div>
    </div>
    <div id="xiangmujeishao">
        <div id="jeishaobiaoti">
            <div id="jeishaobiaotidiv">
                <span class="layui-badge-dot layui-bg-blue xiao"></span>
                <span class="layui-badge-dot layui-bg-blue da"></span>
                <span class="layui-badge-dot layui-bg-blue xiao"></span>
                <b id="jeishaobiaotineirong">项目介绍</b>
                <span class="layui-badge-dot layui-bg-blue xiao"></span>
                <span class="layui-badge-dot layui-bg-blue da"></span>
                <span class="layui-badge-dot layui-bg-blue xiao"></span>
            </div>
        </div>
        <div id="jeishaoneirong">
            <div id="jeishaotText">
                <div id="jeishaoterjibiaoti">
                    项目文字版介绍二级标题
                </div>
                <div id="jeishaozhengwen">
                    <p>项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。<br>
                        项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。<br>
                        项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。
                    </p>
                </div>
            </div>
            <div id="jeishaoImg">
                <img src="bofang.jpg">
            </div>
        </div>
    </div>
    <div id="kechengtedian">
        <div id="kechengtedianbiaoti">
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <span class="layui-badge-dot layui-bg-blue da"></span>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <b id="tedianbiaotineirong">项目特点</b>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <span class="layui-badge-dot layui-bg-blue da"></span>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
        </div>
        <div id="tedianneirong">
            <div id="tedianImg">
                <img src="bofang.jpg">
            </div>
            <div id="tediantext">
                <div id="tedianerjibiaoti">
                    项目特点文字版介绍二级标题
                </div>
                <div id="tedianzhengwenneirong">
                    <p>项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。<br>
                        项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。<br>
                        项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。
                    </p>
                </div>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript" src="/layui/layui.js"  charset="utf-8"></script>
<script type="text/javascript" src="/js/kechengjeishao.js"  charset="utf-8"></script>

</body>
</html>