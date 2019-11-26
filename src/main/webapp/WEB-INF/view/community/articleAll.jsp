<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>最新</title>
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <style type="text/css">
        .context-div{
            overflow-x:hidden;
            position: absolute;
            overflow: hidden;
            margin: auto 0;
            /*border: #00B83F 2px solid;*/
            width: 810px;
            height: 98%;
        }
        .all{
            width: 900px;
            height: 187px;
            background-color: #FFFFFF;
            border-bottom: 1px solid #F0F0F0;
            position: relative;
            /*border:2px solid #7F0055;*/
        }
        .title{
            position: relative;
            left: 14px;
            top: 30px;
            float: left;
            font-size: 20px;
            font-family: Arial;
            font-weight: bold;
            color: #383838;
            text-decoration:none;
        }
        .createArticleType{
            position: relative;
            left: 30px;
            top: 32px;
            width: 35px;
            height: 20px;
            background-color: #1296db;
            border-radius: 8%;
            float: left;
            font-size: 15px;
            font-family: Arial;
            color: #FFFFFF;
            text-decoration:none;
            text-align: center;
        }
        #articleSetTop{
            position: relative;
            left: 35px;
            top: 32px;
            width: 35px;
            height: 20px;
            background-color: #914ff1;
            border-radius: 8%;
            float: left;
            font-size: 15px;
            font-family: Arial;
            color: #FFFFFF;
            text-decoration:none;
            text-align: center;
        }
        .articleDigest{
            position: relative;
            width: 610px;
            float: left;
            left: 14px;
            top: 50px;
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
            position: relative;
            left: 660px;
            top: 24px;
            border: 1px solid #FD482C;
            width: 138px;
            height: 85px;
            border-radius: 5px;
        }
        .browseCount{
            position: relative;
            left: 635px;
            bottom: -8px;
            /*float: left;*/
            font-size: 16px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        .commentCount{
            position: relative;
            left: 740px;
            bottom: 14px;
            font-size: 16px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        .createTime{
            position: absolute;
            bottom: 30px;
            left: 150px;
            font-size: 16px;
            color: #989898;
            font-family: Arial;
        }
        .userImg{
            border: 1px crimson solid;
            width: 20px;
            height: 20px;
            position: relative;
            left: 14px;
            bottom: -28px;
            border-radius: 50px;
        }
        .userRealname{
            border: 1px crimson solid;
            width: 70px;
            height: 20px;
            position: relative;
            left: 50px;
            bottom: -50px;
        }
        .more{
            font-size: 18px;
            font-family: Arial;
            color: #989898;
            background-color: #FFFFFF;
            border: none 0;
        }
        .more-button{
            text-align: center;
            position: relative;
            bottom: -20px;
        }
        .imgtest {
            width: 100%;
            height: 100%;
            object-fit:cover;
        }
    </style>
</head>
<body>
    <div class="context-div">
        <c:forEach items="${articleList}" var="article" begin="0" end="4">
            <%--<a href="#">--%>
            <div class="all">
                <div class="title"><a href="#">${article.title}</a></div>
                <div class="createArticleType">${article.createArticleType}</div>
                <div class="" id="articleSetTop"><span>${article.articleSetTop}</span></div>
                <div class="articleDigest">${article.articleDigest}</div>
                <div class="createTime"><fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
                <div class="figures">
                    <%--<img class="imgtest" src="http://localhost:8080//upload//6f8e3206-fd7e-4ff9-a1eb-fc07de81435f.jpg" alt="">--%>
                </div>
                <div class="userRealname"><a href="#">${article.userRealname}</a></div>
                <div class="userImg">${article.userImg}</div>
                <div class="browseCount">${article.browseCount}阅读</div>
                <div class="commentCount">${article.commentCount}评论</div>
            </div>
            <%--</a>--%>
        </c:forEach>
        <div class="more-button">
            <button class="more" id="more">点击加载更多</button>
        </div>
    </div>
    <%--<script type="text/javascript">
        var el=document.getElementById("#articleSetTop");
        if(el.innerHTML=''){el.style.display="none";}
    </script>
    <script type="text/javascript">
        function getDateTimeStamp(${article.createTime}){
            return Date.parse(${article.createTime}.replace(/-/gi,"/"));
        }

        function timeago(dateTimeStamp){   //dateTimeStamp是一个时间毫秒，注意时间戳是秒的形式，在这个毫秒的基础上除以1000，就是十位数的时间戳。13位数的都是时间毫秒。
            var minute=1000*60;      //把分，时，天，周，半个月，一个月用毫秒表示
            var  hour=minute*60;
            var day=hour*24;
            var week=day*7;
            var halfamonth=day*15;
            var month=day*30;
            var  now=new Date().getTime();   //获取当前时间毫秒
            var diffValue=now-dateTimeStamp;//时间差
            if(diffValue<0){return;}
            var  minC=diffValue/minute;  //计算时间差的分，时，天，周，月
            var  hourC=diffValue/hour;
            var  dayC=diffValue/day;
            var  weekC=diffValue/week;
            var  monthC=diffValue/month;
            if(minC>=1){
                result=" "+parseInt(minC)+"分钟前"
            }
            else  if(hourC>=1){
                result=" "+parseInt(hourC)+"小时前"
            }
            else    if(dayC>=1){
                result=" "+parseInt(dayC)+"天前"
            }
            else    if(weekC>=1){
                result=" "+parseInt(weekC)+"周前"
            }
            else    if(monthC>=1){
                result=" "+parseInt(monthC)+"月前"
            }
            else{
                result="刚刚";
            }
            return result;
        }
    </script>
    <script type="text/javascript">
        //分页，从第二页开始
        var Pages = parseInt('1') + 1;
        //数量
        var Limit = 5;
        //需要追加到哪个元素下
        var Dom = jQuery('.all');
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
                            var Html ='<div class="title"><a href="<%= request.getContextPath()%>">${article.title}</a></div>\n' +
                                '                <div class="articleDigest"><a href="<%= request.getContextPath()%>">${article.articleDigest}</a></div>\n' +
                                '                <div class="createTime"><a href="<%= request.getContextPath()%>"><fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></a></div>\n' +
                                '                <div class="figures"><a href="<%= request.getContextPath()%>">${article.figures}</a></div>\n' +
                                '                <div class="browseCount"><a href="<%= request.getContextPath()%>">浏览&nbsp;${article.browseCount}</a></div>\n' +
                                '                <div class="commentCount"><a href="<%= request.getContextPath()%>">评论&nbsp;${article.commentCount}</a></div>';
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
</body>
</html>