<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/11/18
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <link rel="stylesheet" href="../layui/css/layuiXingxing.css">
    <script src="../layui/layui.js"></script>
    <script src="../js/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>




    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style>
     .layui-tab {
         width: 950px;
         height: 600px;
         position: absolute;
         left: 200px;
         top: 100px;
     }
     .layui-this{
         width:190px;
         color:#000000;
     }
     .layui-tab-title{
         color:#000000;
     }
     .dt1{
         border: solid 1px;
         color: black;
         width: 213px;
         height: 110px;
     }
     .dl1{
         position: absolute;
         top: 90px;
     }
     .dl2{
         position: absolute;
         left: 240px;
         top: 90px;
     }
     .dl3{
         position: absolute;
         left: 468px;
         top: 90px;
     }
     .dl4{
            position: absolute;
            left: 698px;
            top: 90px;
        }
     .dl5{
         position: absolute;

         top: 320px;
     }
     .dl6{
         position: absolute;
         left: 240px;
         top: 320px;
     }
     .dl7{
         position: absolute;
         left: 468px;
         top: 320px;
     }
     .dl8{
         position: absolute;
         left: 698px;
         top: 320px;
     }
     .dd1{
         box-shadow:-2px 0 3px -1px #ebebeb,
         -2px 0 3px -1px #ebebeb,
         2px 0 3px -1px  #ebebeb;
         height: 100px;

     }
     .h61{
         position: absolute;
         left: 10px;
         top: 103px;
         color: #1f2022;
         font-weight:bold;
     }
     .h62{
         position: absolute;
         left: 128px;
         top: 103px;
         color: #1f2022;
         font-weight:bold;
     }
     .h63{
         position: absolute;
         left: 155px;
         top: 103px;
         color: #1f2022;
         font-weight:bold;
     }
     .h64{
         position: absolute;
         left: 10px;
         top: 123px;
         color: #ff4413;

     }
     .h65{
         position: absolute;
         left: 70px;
         top: 123px;
         color: #807d7c;
     }
     .but1{
         width: 100px;
         height: 30px;
         position: absolute;
         left: 53px;
         top: 160px;
         background-color: #1E9FFF;
         color: white;
         border-radius: 5px;
         font-weight:bold;
     }
     .conceal{
         width: 950px;
         height: 300px;
         position: absolute;
         z-index: 1;
         background-color: #f6f1ff;
         display: none;
         top:39px;
         left: -2px;

     }
     .h51{
         position: absolute;
         top:50px;
         left: 5px;
         font-weight:bold;

     }
     .badge{

         opacity: 0.1;
     }
     #badge1{
         position: absolute;
         top:80px;
         left: 5px;
        }
     #badge2{
         position: absolute;
         top:80px;
         left: 50px;
     }
     #badge3{
         position: absolute;
         top:80px;
         left: 5px;
     }
     #badge4{
         position: absolute;
         top:80px;
         left: 50px;
     }#badge5{
          position: absolute;
          top:80px;
          left: 5px;
      }
     #badge6{
         position: absolute;
         top:80px;
         left: 50px;
     }#badge7{
          position: absolute;
          top:80px;
          left: 5px;
      }
     #badge8{
         position: absolute;
         top:80px;
         left: 50px;
     }#badge9{
          position: absolute;
          top:80px;
          left: 5px;
      }
     #badge10{
         position: absolute;
         top:80px;
         left: 50px;
     }#badge11{
          position: absolute;
          top:80px;
          left: 5px;
      }
     #badge12{
         position: absolute;
         top:80px;
         left: 50px;
     }#badge13{
          position: absolute;
          top:80px;
          left: 5px;
      }
     #badge14{
         position: absolute;
         top:80px;
         left: 50px;
     }#badge15{
          position: absolute;
          top:80px;
          left: 5px;
      }
     #badge16{
         position: absolute;
         top:80px;
         left: 50px;
     }
     #badge17{
         position: absolute;
         top:80px;
         left: 5px;
     }
     #badge18{
         position: absolute;
         top:80px;
         left: 50px;
     }


     .xingxing{
         position: absolute;
         top:71px;
         left: 110px;
     }

    </style>


</head>
<body>

<div class="layui-tab layui-tab-brief" >
    <ul class="layui-tab-title">
        <li class="layui-this" >全部内容</li>


    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div class="conceal" >
                <p>JAVA</p>
                <p>HTML</p>
                <p>CSS</p>
                <p>JS</p>

            </div>
            <dl class="dl1">
                <dt class="dt1">
                <h5 class="h51">玩转数据结构，从入门到精通</h5>
                    <p><span class="badge" contenteditable="true" id="badge9">java</span></p>
                    <p><span class="badge" contenteditable="true" id="badge10">html</span></p>
                    <div class="xingxing"></div>
                </dt>
                <dd class="dd1">
                    <h6 class="h61" id="renshu">学习人数</h6>
                    <h6 class="h62" id="zhang">章</h6>
                    <h6 class="h63" id="jie">节</h6>
                    <h6 class="h64" id="jin">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">
                </dd>

            </dl>
            <dl class="dl2">
                <dt class="dt1">
                    <h5 class="h51">玩转数据结构，从入门到精通</h5>
                    <p><span class="badge" contenteditable="true" id="badge17">java</span></p>
                    <p><span class="badge" contenteditable="true" id="badge18">html</span></p>
                    <div class="xingxing"></div>
                </dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl3">
                <dt class="dt1">
                    <h5 class="h51">玩转数据结构，从入门到精通</h5>
                    <p><span class="badge" contenteditable="true" id="badge3">java</span></p>
                    <p><span class="badge" contenteditable="true" id="badge4">html</span></p>
                    <div class="xingxing"></div>
                </dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl4">
                <dt class="dt1">
                    <h5 class="h51">玩转数据结构，从入门到精通</h5>
                    <p><span class="badge" contenteditable="true" id="badge5">java</span></p>
                    <p><span class="badge" contenteditable="true" id="badge6">html</span></p>
                    <div class="xingxing"></div>
                </dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl5">
                <dt class="dt1">
                    <h5 class="h51">玩转数据结构，从入门到精通</h5>
                    <p><span class="badge" contenteditable="true" id="badge7">java</span></p>
                    <p><span class="badge" contenteditable="true" id="badge8">html</span></p>
                    <div class="xingxing"></div>
                </dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl6">
                <dt class="dt1">
                    <h5 class="h51">玩转数据结构，从入门到精通</h5>
                    <p><span class="badge" contenteditable="true" id="badge11">java</span></p>
                    <p><span class="badge" contenteditable="true" id="badge12">html</span></p>
                    <div class="xingxing"></div>
                </dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl7">
                <dt class="dt1">
                    <h5 class="h51">玩转数据结构，从入门到精通</h5>
                    <p><span class="badge" contenteditable="true" id="badge13">java</span></p>
                    <p><span class="badge" contenteditable="true" id="badge14">html</span></p>
                    <div class="xingxing"></div>
                </dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl8">
                <dt class="dt1">
                    <h5 class="h51">玩转数据结构，从入门到精通</h5>
                    <p><span class="badge" contenteditable="true" id="badge15">java</span></p>
                    <p><span class="badge" contenteditable="true" id="badge16">html</span></p>
                    <div class="xingxing"></div>
                </dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
        </div>

    </div>
</div>



<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>

<script>
    $(".layui-this").mouseenter(function () {
        $(this).css("background-color","#6872ff");
        $(this).css("border-radius","5px");
        $(this).css("color","#fff");
        $(".conceal").show();
        $(this).children().first().css("margin-top","1vw");

    });
    $(".layui-this").mouseleave(function () {
        $(this).css("background-color","#fff");
        $(this).css("height","3vw");
        $(this).css("border-radius","5px");
        $(this).css("margin-top","0vw");
        $(this).css("border","none");
        $(this).css("color","#4ea9cd");
        $(".conceal").hide();
        $(this).children().children().first().css("margin-top","0vw");

    });
    $(".conceal").mouseenter(function () {
        $(this).show();
    });

    $(".conceal").mouseleave(function () {
        $(this).hide();
    });
    $(".layui-this").click( function () {
        $(this).siblings().css("width","185px");
        $(this).siblings().css("color","#4ea9cd");

    });
    
</script>
<script src="/js/courseHomePage.js" charset="UTF-8"></script>

<script src="/layui/layui.js" charset="utf-8"></script>

<script>
    layui.use(['rate'], function(){
        var rate = layui.rate;

        rate.render({
            elem: '.xingxing'
            ,value: 4
            ,readonly: true
        });
        });
</script>


</body>
</html>