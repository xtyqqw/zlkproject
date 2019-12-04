<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/12/3
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>我的问答</title>
    <script src="/js/jquery-1.12.4.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <style type="text/css">
        .main{font-family: "微软雅黑";margin: 0 auto;padding: 0;width: 100%;}
        .nav{
            margin: 0 auto;
            width: 1040px;
        }
        /*导航*/
        .nav_ul{
            list-style: none;
        }
        .main_ul{
            list-style: none;
            margin-top: 0;
        }
        .nav_ul .nav_li1{
            color: #8c24dd;
            border-bottom: 2px solid #8c24dd;
        }
        .nav_ul .nav_li1,.nav_li2,.nav_li3{
            float: left;
            padding: 10px;
            width: 80px;
            text-align: center;
            letter-spacing: 3px;
            color: #656565;
        }
        .nav_ul li:hover{
            color: #8c24dd !important;
            border-bottom: 2px solid #8c24dd !important;
            cursor: pointer;
        }
        .active{
            color: #8c24dd;
            border-bottom: 2px solid #8c24dd;
        }
        .nav .count{
            float: right;
            color: #656565;
            font-size: 14px;
            margin-right: 20px;
            margin-top: 10px;
        }
        /* 提问样式 */
        .question_waik{
            border: 1px solid #FAFAFA;
            background-color: #FAFAFA;
            margin: 40px 0 0 0;
            padding-bottom: 50px;
        }
        .question_waik:hover{
            background-color: #FFFFFF;
            box-shadow: 1px 1px 5px 1px #D4D4D4;
        }
        .head_lebel{
            margin: 20px;
        }
        .lebel_li{
            float: left;
            border: 1px solid #bec3d9;
            background-color: #bec3d9;
            border-radius: 50px;
            padding: 2px 10px;
            margin: 0 10px;
            color: #FFFFFF;
        }
        .question_waik .title{
            font-size: 18px;
            margin-top: 20px;
            margin-left: 30px;
            font-weight: bold;
        }
        .question_waik .from{
            font-size: 14px;
            margin-top: 30px;
            margin-left: 30px;
        }
        .question_waik .question_num,.look_num,.question_share{
            margin-top: 10px;
            margin-left: 30px;
            color: #999999;
            float: left;
        }
        .question_waik .question_share:hover{
            color: #494949;
            cursor: pointer;
        }
        .question_waik .question_num{
            margin-left: 30px;
            margin-top: 10px;
        }
        .question_waik .question_date{
            margin-top: 10px;
            float: right;
            margin-right: 20px;
            color: #999999;
        }
        .reply_waik_adopted,.reply_waik{
            margin: 40px 0;
            border: 1px solid #FAFAFA;
            background-color: #FAFAFA;
            padding-bottom: 20px;
        }
        .reply_waik_adopted:hover{
            background-color: #FFFFFF;
            box-shadow: 1px 1px 5px 1px #D4D4D4;
        }
        .reply_date{
            margin-top: 20px;
            margin-right: 20px;
            float: right;
            color: #999999;
        }
        .reply_waik_adopted .adopted{
            border: 1px solid #ffcd04;
            background-color: #ffcd04;
            border-radius: 5px;
            color: #FFFFFF;
            padding: 1px 3px;
            margin-top: 45px;
            margin-left: 30px;
            float: left;
            font-size: 10px;
        }
        .reply_waik_adopted .reply_adopted_msg{
            margin: 45px 90px 30px 80px;
            font-size: 16px;
            color: #494949;
        }
        .reply_waik_adopted .reply_adopted_share{
            float: right;
            margin-right: 20px;
            color: #999999;
        }
        .reply_waik_adopted .reply_adopted_share:hover{
            color: #494949;
            cursor: pointer;
        }
        .reply_waik:hover{
            background-color: #FFFFFF;
            box-shadow: 1px 1px 5px 1px #D4D4D4;
        }
        .reply_waik .reply_msg{
            margin: 45px 90px 30px 30px;
            font-size: 16px;
            color: #494949;
        }
        .reply_waik .reply_dian{
            float: right;
            margin-right: 20px;
            font-size: 30px;
            color: #999999;
            margin-top: -15px;
            cursor: pointer;
        }
        .reply_waik .reply_share,.reply_edit,.reply_delete{
            float: right;
            margin-right: 20px;
            color: #999999;
        }
        .reply_waik .reply_share:hover{
            color: #494949;
            cursor: pointer;
        }
        .reply_waik .reply_edit:hover{
            color: #494949;
            cursor: pointer;
        }
        .reply_waik .reply_delete:hover{
            color: #494949;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="main">
    <div class="nav">
        <ul class="nav_ul">
            <li class="nav_li1">全部</li>
            <li class="nav_li2">我的提问</li>
            <li class="nav_li3">我的问答</li>
        </ul>
        <ul class="main_ul">
            <%--全部--%>
            <li class="main_li_show">
                <p class="count">共6条笔记</p><br>
                <c:forEach begin="0" end="1">
                    <%--<c:if test="">--%>
                        <div class="question_waik">
                            <ul class="head_lebel">
                                <c:forEach begin="0" end="2">
                                    <li class="lebel_li">Java</li>
                                </c:forEach>
                            </ul><br />
                            <p class="title">请问，为何最后那个函数function conf()里的classname不能生效？</p>
                            <p class="from">来自：人工智能-百度无人车项目-Python基础-Hello World</p>
                            <p class="question_num">回答 0000</p>
                            <p class="look_num">浏览 0000</p>
                            <p class="question_share">分享</p>
                            <p class="question_date">2018-11-8 09：09</p>
                        </div>
                    <%--</c:if>
                    <c:if test="">--%>
                        <!-- 我的回答 已采纳 -->
                        <div class="reply_waik_adopted">
                            <p class="reply_date">2018-11-8 09：09</p>
                            <p class="adopted">已采纳</p>
                            <p class="reply_adopted_msg">
                                一下子买了前端路径的所有课程，比外面的培训机构便宜多了，而且内容很充实，老师讲的也很细致，课后选择题，编程习题，作业都很有针对性，不懂得的地方有老师专程讲解，我很喜欢，我是一个喜欢自学的人。
                            </p>
                            <i class="layui-icon layui-icon-praise"
                               style="margin-left: 30px;color: #494949;"> 0000</i>
                            <i class="layui-icon layui-icon-tread"
                               style="margin-left: 20px;color: #494949;"> 0000</i>
                            <i class="layui-icon layui-icon-dialogue"
                               style="margin-left: 20px;color: #494949;"> 0000</i>
                            <p class="reply_adopted_share">分享</p>
                        </div>
                    <%--</c:if>
                    <c:if test="">--%>
                        <!-- 我的回答 -->
                        <div class="reply_waik">
                            <p class="reply_date">2018-11-8 09：09</p>
                            <p class="reply_msg">
                                一下子买了前端路径的所有课程，比外面的培训机构便宜多了，而且内容很充实，老师讲的也很细致，课后选择题，编程习题，作业都很有针对性，不懂得的地方有老师专程讲解，我很喜欢，我是一个喜欢自学的人。一下子买了前端路径的所有课程，比外面的培训机构便宜多了，而且内容很充实，老师讲的也很细致，课后选择题，编程习题，作业都很有针对性，不懂得的地方有老师专程讲解，我很喜欢，我是一个喜欢自学的人
                            </p>
                            <i class="layui-icon layui-icon-praise"
                               style="margin-left: 30px;color: #494949;"> 0000</i>
                            <i class="layui-icon layui-icon-tread"
                               style="margin-left: 20px;color: #494949;"> 0000</i>
                            <i class="layui-icon layui-icon-dialogue"
                               style="margin-left: 20px;color: #494949;"> 0000</i>
                            <p class="reply_dian">...</p>
                            <p class="reply_delete" onclick="delNote(${sN.snId})">删除</p>
                            <p class="reply_edit" onclick="editNote('${sN.content}',${sN.snId})">编辑</p>
                            <p class="reply_share">分享</p>
                        </div>
                    <%--</c:if>--%>
                </c:forEach>
            </li>
            <%--我的提问--%>
            <li class="main_li2">
                <p class="count">共5条笔记</p><br>
                <c:forEach begin="0" end="4">
                    <div class="question_waik">
                        <ul class="head_lebel">
                            <c:forEach begin="0" end="2">
                                <li class="lebel_li">Java</li>
                            </c:forEach>
                        </ul><br />
                        <p class="title">请问，为何最后那个函数function conf()里的classname不能生效？</p>
                        <p class="from">来自：人工智能-百度无人车项目-Python基础-Hello World</p>
                        <p class="question_num">回答 0000</p>
                        <p class="look_num">浏览 0000</p>
                        <p class="question_share">分享</p>
                        <p class="question_date">2018-11-8 09：09</p>
                    </div>
                </c:forEach>
            </li>
            <%--我的回答--%>
            <li class="main_li3">
                <p class="count">共4条笔记</p><br>
                <c:forEach begin="0" end="1">
                    <%--<c:if test="">--%>
                        <!-- 我的回答 已采纳 -->
                        <div class="reply_waik_adopted">
                            <p class="reply_date">2018-11-8 09：09</p>
                            <p class="adopted">已采纳</p>
                            <p class="reply_adopted_msg">
                                一下子买了前端路径的所有课程，比外面的培训机构便宜多了，而且内容很充实，老师讲的也很细致，课后选择题，编程习题，作业都很有针对性，不懂得的地方有老师专程讲解，我很喜欢，我是一个喜欢自学的人。
                            </p>
                            <i class="layui-icon layui-icon-praise"
                               style="margin-left: 30px;color: #494949;"> 0000</i>
                            <i class="layui-icon layui-icon-tread"
                               style="margin-left: 20px;color: #494949;"> 0000</i>
                            <i class="layui-icon layui-icon-dialogue"
                               style="margin-left: 20px;color: #494949;"> 0000</i>
                            <p class="reply_adopted_share">分享</p>
                        </div>
                    <%--</c:if>
                    <c:if test="true">--%>
                        <!-- 我的回答 -->
                        <div class="reply_waik">
                            <p class="reply_date">2018-11-8 09：09</p>
                            <p class="reply_msg">
                                一下子买了前端路径的所有课程，比外面的培训机构便宜多了，而且内容很充实，老师讲的也很细致，课后选择题，编程习题，作业都很有针对性，不懂得的地方有老师专程讲解，我很喜欢，我是一个喜欢自学的人。一下子买了前端路径的所有课程，比外面的培训机构便宜多了，而且内容很充实，老师讲的也很细致，课后选择题，编程习题，作业都很有针对性，不懂得的地方有老师专程讲解，我很喜欢，我是一个喜欢自学的人
                            </p>
                            <i class="layui-icon layui-icon-praise"
                               style="margin-left: 30px;color: #494949;"> 0000</i>
                            <i class="layui-icon layui-icon-tread"
                               style="margin-left: 20px;color: #494949;"> 0000</i>
                            <i class="layui-icon layui-icon-dialogue"
                               style="margin-left: 20px;color: #494949;"> 0000</i>
                            <p class="reply_dian">...</p>
                            <p class="reply_delete" onclick="delNote(${sN.snId})">删除</p>
                            <p class="reply_edit" onclick="editNote('${sN.content}',${sN.snId})">编辑</p>
                            <p class="reply_share">分享</p>
                        </div>
                    <%--</c:if>--%>
                </c:forEach>
            </li>
            <%--富文本编辑框--%>
            <div hidden="hidden" id="demo" style="padding: 25px">
                <form action="<%=request.getContextPath()%>/myyNote/edit" method="post">
                    <textarea id="content" name="content"></textarea>
                    <input type="text" id="input_hid" hidden="hidden" name="snId">
                    <input type="submit" class="layui-btn" style="float: right;" value="提交">
                </form>
            </div>
        </ul>
    </div>
</div>
<script type="text/javascript">
    /*点击删除*/
    /*function delNote(snId){
        var layer = layui.layer;
        layer.confirm('确定删除？',{offset:"100px"},function(index){
            $.ajax({
                type: "POST",
                url: "/myyNote/delete?snId="+snId,
                success: function(msg){
                    layer.msg(msg);
                    window.location.href = location.href;//删除后刷新当前页面
                }
            });
            layer.close(index);
        });
    }*/
    /*点击编辑*/
    layui.use('layer', function(){
        var $ = layui.jquery, layer = layui.layer;
        window.editNote = function(obj,snId){
            $("#content").html(obj);
            $("#input_hid").val(snId);
            layer.open({
                type: 1,
                title: '编辑',
                btn: false,
                area: ['70%','50%'],
                content: $('#demo'),
                offset: '30px'
            })
        }
    });
    /*富文本编辑*/
    layui.use('layedit', function(){
        var layedit = layui.layedit;
        layedit.build('content',{
            tool: [
                'strong', //加粗
                'italic', //斜体
                'underline', //下划线
                'del' //删除线
            ]
        });
    });
</script>
<%--点击...事件--%>
<script>
    $(".reply_delete,.reply_edit,.reply_share").hide();
    $(document).ready(function(){
        $(".reply_dian").click(function(){
            $(this).siblings(".reply_delete,.reply_edit,.reply_share").show();
            $(this).hide();
        });
    });
</script>
<!--点击选项卡事件-->
<script>
    $(".main_li2,.main_li3").hide();
    $(document).ready(function () {
        $(".nav_li1").click(function(){
            $(this).addClass("active").siblings().removeClass("active");
            $(".nav_li1").css("color","#8c24dd");
            $(".nav_li1").css("border-bottom","2px solid #8c24dd");
            $(".main_li_show").show();
            $(".main_li2,.main_li3").hide();
        });
        $(".nav_li2").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
            $(".nav_li1").css("color","#656565");
            $(".nav_li1").css("border-bottom","none");
            $(".main_li2").show();
            $(".main_li_show,.main_li3").hide();
        });
        $(".nav_li3").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
            $(".nav_li1").css("color","#656565");
            $(".nav_li1").css("border-bottom","none");
            $(".main_li3").show();
            $(".main_li_show,.main_li2").hide();
        });
    });
</script>
</body>
</html>
