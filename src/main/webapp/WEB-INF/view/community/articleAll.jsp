<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>最新</title>
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css"/>
    <script src="../js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        .context-div{
            overflow-x:hidden;
            position: absolute;
            overflow: hidden;
            margin: auto 0;
            width: 98%;
            height: 98%;
        }
        .all{
            width: 100%;
            height: 178px;
            background-color: #FFFFFF;
            border-bottom: 1px solid #F0F0F0;
            position: relative;
        }
        .title{
            position: relative;
            left: 23px;
            top: -9px;
            float: left;
        }
        .title a{
            font-size: 22px;
            font-family: Arial;
            font-weight: bold;
            color: #383838;
            text-decoration:none;
        }
        .createArticleType{
            position: relative;
            left: 33px;
            top: -3px;
            float: left;
            width: 35px;
            height: 20px;
            background-color: #1296db;
            border-radius: 8%;
            font-size: 15px;
            font-family: Arial;
            color: #FFFFFF;
            text-decoration:none;
            text-align: center;
        }
        .articleSetTop{
            position: relative;
            left: 44px;
            top: -3px;
            float: left;
            width: 35px;
            height: 20px;
            background-color: #914ff1;
            border-radius: 8%;
            text-align: center;
        }
        .articleSetTop #p{
            font-size: 15px;
            font-family: Arial;
            color: #FFFFFF;
            text-decoration:none;
            margin:0;
            padding:0;
            display: inline-block;
            vertical-align: middle;
            text-align: left;
        }
        .kuang{
            width: 98%;
            position: relative;
            top: 1px;
        }
        .articleDigest{
            margin-left: 20px;
            margin-top: -52px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            /*border: #914ff1 2px solid;*/
            font-size: 17px;
            font-family: Arial;
            color:  #707070;
            text-decoration:none;

        }
        .figures{
            margin-left: 716px;
            margin-top: 30px;
            width: 170px;
            height: 95px;
            border-radius: 5px;
            border: none 0;
        }
        .imgtest {
            width: 100%;
            height: 100%;
            object-fit:cover;
            border-radius: 5px;
            border: none 0;
        }
        .icon{
            position: absolute;
            left: 702px;
            bottom: 26px;
        }
        .browseCount{
            position: absolute;
            left: 727px;
            bottom: 27px;
        }
        .browseCount a{
            font-size: 16px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        .icon1{
            position: absolute;
            left: 811px;
            bottom: 26px;
        }
        .commentCount{
            position: absolute;
            left: 837px;
            bottom: 27px;

        }
        .commentCount a{
            font-size: 16px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        .userImg{
            border: 1px crimson solid;
            width: 20px;
            height: 20px;
            border-radius: 50px;
            position: absolute;
            margin-left: 23px;
            margin-top: 35px;
        }
        .userRealname{
            position: relative;
            float: left;
            left: 66px;
            top: 35px;
            display: inline;
        }
        .userRealname a{
            font-size: 16px;
            color: #989898;
            font-family: Arial;
            text-decoration:none;
        }
        .little{
            width: 3px;
            height: 3px;
            background-color: #989898;
            border-radius: 50px;
            position: relative;
            float: left;
            left: 79px;
            top: 44px;
            display: inline;
        }
        .createTime{
            font-size: 16px;
            color: #989898;
            font-family: Arial;
            position: relative;
            left: 92px;
            top: 36px;
            float: left;
            display: inline;
        }
        a:hover{
            color: #1296db;
            text-decoration:none;
        }
    </style>
</head>
<body>
    <div class="context-div">
        <c:forEach items="${articleList}" var="article" begin="0" end="4">
            <div class="all">
                <div class="title"><a href="#">${article.title}</a></div>
                <div class="createArticleType">${article.createArticleType}</div>
                <c:if test="${article.articleSetTop == 0}">
                    <div class="articleSetTop"><p id="p">置顶</p></div>
                </c:if>
                <div class="kuang">
                    <div class="figures" id="figures">
                        <img class="imgtest" src="${article.figures}">
                    </div>
                    <div class="articleDigest" id="articleDigest" style="width: 660px">${article.articleDigest}</div>
                </div>
                <div>
                    <div class="userRealname"><a href="#">${article.userList.userRealname}</a></div>
                    <div class="little"></div>
                    <div class="createTime"><span id="time">${article.createTime.getTime()}</span></div>
                </div>
                <div class="userImg">${article.userList.userImg}</div>
                <svg t="1574820328378" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="713" width="22" height="20"><path d="M512 608a96 96 0 1 1 0-192 96 96 0 0 1 0 192m0-256c-88.224 0-160 71.776-160 160s71.776 160 160 160 160-71.776 160-160-71.776-160-160-160" fill="#989898" p-id="714"></path><path d="M512 800c-212.064 0-384-256-384-288s171.936-288 384-288 384 256 384 288-171.936 288-384 288m0-640C265.248 160 64 443.008 64 512c0 68.992 201.248 352 448 352s448-283.008 448-352c0-68.992-201.248-352-448-352" fill="#989898" p-id="715"></path></svg>
                <div class="browseCount"><a href="#">${article.browseCount}阅读</a></div>
                <svg t="1574820647675" class="icon1" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="832" width="22" height="20"><path d="M896 128H128a32 32 0 0 0-32 32v576a32 32 0 0 0 32 32h288v-64H160V192h704v512h-256c-8.832 0-16.832 3.584-22.656 9.376l-159.968 160 45.248 45.248L621.248 768H896a32 32 0 0 0 32-32V160a32 32 0 0 0-32-32" fill="#989898" p-id="833"></path><path d="M560 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 560 448M240 448a48 48 0 1 0 95.968 0.032A48 48 0 0 0 240 448M784 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 784 448" fill="#989898" p-id="834"></path></svg>
                <div class="commentCount"><a href="#">${article.commentCount}评论</a></div>
            </div>
        </c:forEach>
    </div>
    <!--日期转换-->
    <script>
        $(document).ready(function()
        {
                var str = "";
                var timestamp = 0;
                var pass = 0;
                str = $("#time").text();
                timestamp = (new Date()).valueOf();
                pass = (timestamp - str) / 1000;
                $("#time").text(pass);
                if (pass < 60) {
                    $("#time").text(pass + "秒前");
                }
                else
                {
                    if (pass < (60 * 60))
                    {
                        pass = Math.floor(pass / 60);
                        $("#time").text(pass + "分钟前");
                    }
                    else
                    {
                        if (pass < (60 * 60 * 72))
                        {
                            pass = Math.floor(pass / 60 / 60);
                            $("#time").text(pass + "小时前");
                        }
                        else
                        {
                            if (pass >= (60 * 60 * 72) )
                            {
                                pass = Math.floor(pass / 60 / 60 / 24);
                                $("#time").text(pass + "天前");
                            }
                        }
                    }
                }
            });
    </script>
    <!--没插图就隐藏-->
    <script>
        $(function () {
            var img = $("#figures").find("img");
            if(img.length<=0){
                $("#figures").hide();
            }
        })
    </script>
    <%--<script type="text/javascript">
        //分页，从第二页开始
        var Pages = parseInt('1') + 1;
        //数量
        var Limit = 5;
        //需要追加到哪个元素下
        var Dom = jQuery('.context-div');
        //#More按钮点击时执行ajax

        jQuery('#more').on('click', function() {
            var url = "<%=request.getContextPath()%>/article/findByCreateTime";
            jQuery.ajax({
                //请求类型
                type: 'POST',
                //请求地址
                url: url,
                //返回数据类型
                dataType: 'json',
                //请求成功
                success: function(response, status) {
                    var Data = response.data;
                    console.log(Data);
                    //如果Data不等于空，证明有数据，开始执行以下方法
                    if (Data != '') {
                        //进行循环，value就是文章对象
                        jQuery.each(Data, function(index, value) {
                            var Html ='<div class="all">\n' +
                                '                <div class="title"><a href="#">${article.title}</a></div>\n' +
                                '                <div class="createArticleType">${article.createArticleType}</div>\n' +
                                '                <c:if test="${article.articleSetTop == 0}">\n' +
                                '                    <div class="articleSetTop"><p id="p">置顶</p></div>\n' +
                                '                </c:if>\n' +
                                '                <div class="createTime"><span id="time">1562169599000</span></div>\n' +
                                '                <div class="kuang">\n' +
                                '                    <div class="figures">\n' +
                                '                        <img class="imgtest" src="http://localhost:8080//upload//6f8e3206-fd7e-4ff9-a1eb-fc07de81435f.jpg" alt="">\n' +
                                '                    </div>\n' +
                                '                    <div class="articleDigest">${article.articleDigest}</div>\n' +
                                '                </div>\n' +
                                '                <div class="userRealname"><a href="#">${article.userList.userRealname}</a></div>\n' +
                                '                <div class="little"></div>\n' +
                                '                <div class="userImg">${article.userList.userImg}</div>\n' +
                                '                <svg t="1574820328378" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="713" width="22" height="20"><path d="M512 608a96 96 0 1 1 0-192 96 96 0 0 1 0 192m0-256c-88.224 0-160 71.776-160 160s71.776 160 160 160 160-71.776 160-160-71.776-160-160-160" fill="#989898" p-id="714"></path><path d="M512 800c-212.064 0-384-256-384-288s171.936-288 384-288 384 256 384 288-171.936 288-384 288m0-640C265.248 160 64 443.008 64 512c0 68.992 201.248 352 448 352s448-283.008 448-352c0-68.992-201.248-352-448-352" fill="#989898" p-id="715"></path></svg>\n' +
                                '                <div class="browseCount"><a href="#">${article.browseCount}阅读</a></div>\n' +
                                '                <svg t="1574820647675" class="icon1" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="832" width="22" height="20"><path d="M896 128H128a32 32 0 0 0-32 32v576a32 32 0 0 0 32 32h288v-64H160V192h704v512h-256c-8.832 0-16.832 3.584-22.656 9.376l-159.968 160 45.248 45.248L621.248 768H896a32 32 0 0 0 32-32V160a32 32 0 0 0-32-32" fill="#989898" p-id="833"></path><path d="M560 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 560 448M240 448a48 48 0 1 0 95.968 0.032A48 48 0 0 0 240 448M784 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 784 448" fill="#989898" p-id="834"></path></svg>\n' +
                                '                <div class="commentCount"><a href="#">${article.commentCount}评论</a></div>\n' +
                                '            </div>';
                            //将变量Html的内容追加在事先定义好的变量Dom后
                            Dom.append(Html);
                        });
                        //分页+=1
                        Pages += 1;
                    }
                    //全部加载完毕提示
                    else {
                        jQuery('#more').text("没有更多内容");
                    }
                },
                //请求失败
                error: function(xhr, status, error) {
                    console.log("请求对象XMLHttpRequest: " + xhr);
                    console.log("错误类型textStatus: " + status);
                    console.log("异常对象errorThrown: " + error);
                }
            })
        })
    </script>--%>
    <script>
        layui.use('flow', function () {
            var flow = layui.flow;
            flow.load({
                elem: '.context-div' //流加载容器
                , isAuto: false
                , done: function (page, next) { //执行下一页的回调
                    setTimeout(function () {
                        var lis = [];
                        var limit = 5;
                        var data = {"page": page, "limit": limit};
                        $.ajax({
                            type: "POST",
                            url: "/article/findByCreateTime",
                            dataType: "json",
                            data: data,
                            success: function (result) {
                                layui.each(result.articleList, function (i, courses) {
                                    lis.push()
                                })
                                next(lis.join(''), page < 2);
                            }
                        });
                    }, 500);
                }
            });
        });
    </script>
</body>
</html>