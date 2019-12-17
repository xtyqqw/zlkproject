<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/12/2
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>文章详情</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/typo.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/animate.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/articleShow.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/me.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/prism/prism.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/community/tocbot/tocbot.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">

    <style type="text/css">
        /*底部样式*/
        body{margin: 0;}
        #footer{
            background-color: #333C4D;
            height: 130px;
            width: 100%;
            margin-top: 50px;
            margin-bottom: 0;
            position: absolute;
        }
        #footer ul{
            padding-top: 30px;
            width: 800px;
            height: 60px;
            margin: 0 auto;
            border-bottom: 1px solid #999999;
        }
        #footer ul li{
            float: left;
            list-style: none;
            padding-left: 30px;
        }
        #footer ul li a{
            color: #989898;
            text-decoration: none;
            float: left;
            padding-left: 20px;
        }
        #footer ul li a:hover{
            color: #F2F2F2;
        }
        #footer hr{
            width: 800px;
            color: #989898;
        }
        #footer p{
            color: #989898;
            text-align: center;
            padding-top: 10px;
        }

        /*取消关注弹窗*/
        .att_tan{
            position: fixed;
            left: 300px;
            top: 200px;
        }
        .att_success1,.att_success2,.att_success3,.att_success4,.att_success5{
            width: 400px;
            height: 70px;
            text-align: center;
            position: fixed;
            box-shadow: 1px 1px 5px 1px #D4D4D4;
            background-color: #FFFFFF;
            border-radius: 3px;
        }
        .att_success_zi1,.att_success_zi2,.att_success_zi3,.att_success_zi4,.att_success_zi5{
            font-size: 18px;
            position: fixed;
        }
        .att_success_zi1{
            margin: 23px 160px;
        }
        .att_success_zi2{
            margin: 23px 100px;
        }
        .att_success_zi3{
            margin: 23px 120px;
        }
        .att_success_zi4{
            margin: 23px 170px;
        }
        .att_success_zi5{
            margin: 23px 130px;
        }
        .att_success_ok1,.att_success_ok2,.att_success_no1,.att_success_no2,.att_success_noo{
            height: 20px;
            width: 20px;
            border-radius: 50%;
            text-align: center;
            line-height: 1;
            color: #fff;
            font-size: 20px;
            float: left;
            position: fixed;
            margin: 25px 20px 25px 90px;
        }
        .att_success_ok1,.att_success_ok2{
            border: 1px solid #5ab62f;
            background-color: #5ab62f;
        }
        .att_success_ok1{
            margin-left: 130px;
        }
        .att_success_ok2{
            margin-left: 135px;
        }
        .att_success_no1,.att_success_no2{
            border: 1px solid #d34748;
            background-color: #d34748;
            margin-left: 60px;
        }
        .att_success_no1{
            margin-left: 60px;
        }
        .att_success_no2{
            margin-left: 100px;
        }
        .att_success_noo{
            border: 1px solid #f5bb29;
            background-color: #f5bb29;
            margin-left: 85px;
        }
        .attention_type{
            float: left;
            margin: 13px auto;
            cursor: pointer;
        }
        .attention_type .ok,.jia{
            height: 20px;
            width: 20px;
            border-radius: 50%;
            text-align: center;
            line-height: 1;
            color: #fff;
            font-size: 20px;
            float: left;
        }
        .attention_type .ok{
            border: 1px solid #5ab62f;
            background-color: #5ab62f;
        }
        .main_left .attention_type .jia{
            border: 1px solid #343434;
            background-color: #343434;
        }
        .attention_type .ok_zi,.no_zi{
            font-size: 14px;
            color: #999999;
            float: left;
            padding-left: 7px;
        }
    </style>
</head>
<body>
    <%@include file="../../jsp/header.jsp"%>
    <div>
        <a href="#top" style="position: fixed;margin-left: 93vw;z-index: 100;margin-top: 35vw;">
            <svg t="1576140135922" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6257" width="64" height="64"><path d="M555.880483 37.797839a634.568341 634.568341 0 0 1 115.956771 180.038143 558.138589 558.138589 0 0 1 48.640813 249.612206 17.963128 17.963128 0 0 0 7.303243 16.071202c16.74253 13.833439 33.220598 28.073744 49.983471 41.907183a126.575969 126.575969 0 0 1 47.684679 124.094088c-8.564526 53.502861-20.07883 106.598856-31.023522 159.694851a41.744437 41.744437 0 0 1-69.167197 24.615384c-29.701208-25.02225-58.99555-50.6548-88.005086-76.287349-14.545455-12.816275-14.240305-13.426573-29.233312-1.830896a149.787667 149.787667 0 0 1-132.577241 30.311507 161.444374 161.444374 0 0 1-66.848061-34.990464 9.256198 9.256198 0 0 0-14.850604 0.610298 5099.86014 5099.86014 0 0 1-90.283534 80.762874 42.578512 42.578512 0 0 1-70.143675-24.818818c-5.675779-23.801653-10.456453-47.806739-15.684679-71.608391-5.635092-25.632549-11.371901-51.265099-16.966306-77.101081a128.671329 128.671329 0 0 1 33.627463-123.076923 716.083916 716.083916 0 0 1 62.57597-52.892562 12.673872 12.673872 0 0 0 5.777495-11.595677 562.898919 562.898919 0 0 1 55.903369-270.565798 658.308964 658.308964 0 0 1 83.529562-134.876033 279.028608 279.028608 0 0 1 56.96122-56.147489c12.043229-8.34075 12.979021-8.544183 24.411952 0a212.26192 212.26192 0 0 1 32.366179 28.073745z m36.617928 216.656071a113.434202 113.434202 0 0 0-159.226955-3.254927 117.177368 117.177368 0 0 0-2.034329 167.832168 114.919263 114.919263 0 0 0 159.69485 0.610298 117.86904 117.86904 0 0 0 1.485061-165.187539z m-195.153211 569.612206a21.787667 21.787667 0 0 1 28.480611-3.865226 192.467896 192.467896 0 0 0 171.55499 0 22.377622 22.377622 0 0 1 34.258106 21.360458c0.142403 30.108074 0 60.216147 0 90.324221a21.726637 21.726637 0 0 1-12.409409 22.174189 21.380801 21.380801 0 0 1-25.632549-4.475524c-4.801017-4.272092-9.276542-9.154482-13.975843-13.630006-8.625556-8.34075-8.767959-8.34075-13.955499 2.034329-11.066751 22.377622-22.092816 44.958678-33.159568 67.3363a24.411952 24.411952 0 0 1-14.993007 14.240305 21.909727 21.909727 0 0 1-26.62937-13.019707c-11.514304-22.987921-22.662428-45.975842-34.03433-68.963764-4.923077-9.968214-5.228226-9.968214-13.304513-2.034329-4.88239 4.88239-9.622378 9.764781-14.647171 14.443738a22.377622 22.377622 0 0 1-37.858869-16.681501q-0.12206-46.993007 0-93.986013a19.122695 19.122695 0 0 1 6.306421-15.25747z m0 0" p-id="6258" fill="#8a8a8a"></path></svg>
        </a>
    </div>
    <!--中间内容-->
    <div id="waypoint" class="m-container-small m-padded-tb-big animated fadeIn">
        <div class="ui container">
            <%--顶部--%>
            <div class="ui top attached segment">
                <div class="ui horizontal link list">
                    <div class="item">
                        <img src="${article.user.userImg}" alt="" class="ui avatar image">
                        <div class="content"><a href="<%=request.getContextPath() %>/personal/person" class="header" style="box-shadow: none;height: auto;">${article.user.userRealname}</a></div>
                    </div>
                    <div class="item">
                        <i class="calendar icon"></i> <span><fmt:formatDate value="${article.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    </div>
                    <div class="item">
                        <i class="eye icon"></i> <span>${article.browseCount}</span>
                    </div>
                    <%--<c:if test="${list.size()!=0}">
                        <div class="item attention_type">
                            <c:if test="${list.userId!=userId}">
                                <!-- 已关注 -->
                                <c:if test="${list.followType==1}">
                                    <span style="display: none">${list.userId}</span>
                                    <p class="ok">√</p>
                                    <p class="ok_zi">已关注</p>
                                </c:if>
                                <!-- 加关注 -->
                                <c:if test="${list.followType==0}">
                                    <span style="display: none">${list.userId}</span>
                                    <p class="jia">+</p>
                                    <p class="no_zi">加关注</p>
                                </c:if>
                            </c:if>
                            <div class="att_tan">
                                <div class="att_success1">
                                    <p class="att_success_ok1">√</p>
                                    <p class="att_success_zi1">取消关注成功!</p>
                                </div>
                                <div class="att_success2">
                                    <p class="att_success_no1">X</p>
                                    <p class="att_success_zi2">取消关注失败，请重新操作！</p>
                                </div>
                                <div class="att_success3">
                                    <p class="att_success_noo">!</p>
                                    <p class="att_success_zi3">加载超时，请稍后再试！</p>
                                </div>
                                <div class="att_success4">
                                    <p class="att_success_ok2">√</p>
                                    <p class="att_success_zi4">关注成功!</p>
                                </div>
                                <div class="att_success5">
                                    <p class="att_success_no2">X</p>
                                    <p class="att_success_zi5">关注失败，请重新操作！</p>
                                </div>
                            </div>
                        </div>
                    </c:if>--%>
                </div>
            </div>
            <div class="ui attached segment">
                <!--图片区域-->
                <img src="${article.figures}" alt="" class="ui fluid rounded image">
            </div>
            <div class="ui attached padded segment">
                <!--内容-->
                <div class="ui right aligned basic segment field">
                    <div class="ui violet basic label">${article.typeName}</div>
                    <c:if test="${article.createArticleType == 0}">
                        <div class="ui orange basic label">原创</div>
                    </c:if>
                    <c:if test="${article.createArticleType == 1}">
                        <div class="ui orange basic label">转载</div>
                    </c:if>
                    <c:if test="${article.createArticleType == 2}">
                        <div class="ui orange basic label">翻译</div>
                    </c:if>
                </div>
                <h2 class="ui center aligned header" style="box-shadow: none;">
                    ${article.title}
                </h2>
                <br>
                <!--中间主要内容部分-->
                <div id="content" class="typo typo-selection js-toc-content m-padded-lr-responsive m-padded-tb-large">
                    <pre>${article.articleContent}</pre>
                </div>
                <!--标签-->
                <div class="m-padded-lr-responsive" style="margin-bottom: 55px;margin-top: -20px;">
                    <c:forEach items="${article.tags}" var="tag">
                        <div class="column" style="margin-right: 15px;float: left;">
                            <div class="ui basic teal left pointing label">${tag.tagName}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="ui bottom attached segment">
                <!--留言区域列表-->
                <div class="ui form" id="div_stuCmt">
                    <div id="stuCmt_titleBox">
                        <h3 id="stuCmt_title" class="ui dividing header" style="box-shadow: none;height: 3vw;">评论</h3>
                    </div>
                    <div style="border: 0px solid white !important;">
                        <div id="SCS_allBox" style="margin-top: 15px;margin-bottom: 15px;">
                            <div id="cmt-content-box">
                                <ul id="art-cmt-ul-stream"></ul>
                            </div>
                        </div>
                    </div>
                    <div id="art-cmt-textBox" class="field violet" style="border: 1px solid; height: 12vw;border-radius: 4px;margin-top: 1vw;">
                        <div id="div-artCmt-toolBar" class="toolbar violet"></div>
                        <div id="div-artCmt-text" class="text" style="height: 10vw;"></div>
                    </div>
                    <div id="art-cmt-btnBox" class="fields">
                        <div class="field m-margin-bottom-small m-mobile-wide" style="margin-top: 3px;">
                            <div class="ui left">
                                <button id="artCmt-btn" type="button" class="ui button m-mobile-wide violet"><i class="edit icon"></i>发布</button>
                            </div>
                        </div>
                        <div class="field m-margin-bottom-small m-mobile-wide" style="margin-top: 3px;">
                            <button id="selection_stuCmt" type="button" class="ui button m-mobile-wide violet"><i class="eye icon"></i>查看</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        <ul>
            <li>
                <a href="/aboutus/aboutus">关于我们</a>
            </li>
            <li>
                <a href="/aboutus/aboutus">加入我们</a>
            </li>
            <li>
                <a href="/aboutus/aboutus">联系我们</a>
            </li>
            <li>
                <a href="/aboutus/aboutus">讲师合作</a>
            </li>
            <li>
                <a href="/aboutus/aboutus">帮助中心</a>
            </li>
            <li>
                <a href="/aboutus/aboutus">友情链接</a>
            </li>
            <li>
                <a href="/aboutus/aboutus">合作企业</a>
            </li>
        </ul>
        <p>
            copyright&nbsp;&nbsp;&nbsp;&nbsp;2017&nbsp;&nbsp;&nbsp;&nbsp;北京智量酷教育科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;京ICP备09076312号
        </p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/jquery.scrollto@2.1.2/jquery.scrollTo.min.js"></script>

    <script src="<%=request.getContextPath() %>/js/articleShow.js"></script>
    <script src="<%=request.getContextPath() %>/layui/layui.all.js"></script>
    <script src="<%=request.getContextPath() %>/js/wangEditor.js"></script>

    <script src="<%=request.getContextPath() %>/community/prism/prism.js"></script>
    <script src="<%=request.getContextPath() %>/community/tocbot/tocbot.min.js"></script>
    <script src="<%=request.getContextPath() %>/community/waypoints/jquery.waypoints.min.js"></script>

    <script>
        $(function () {
            /*点击已关注 取消关注*/
            $(".ok_zi").click(function () {
                let str = $(this).prev().prev().text() + '';
                nofollow(str,$(this));
            });
            /*点击加关注*/
            $(".no_zi").click(function () {
                let str = $(this).prev().prev().text() + '';
                jiafollow(str,$(this));
            });
            $(".att_success1,.att_success2,.att_success3,.att_success4,.att_success5").hide();
        });

        /*点击已关注 取消关注*/
        function nofollow(userId,mythis){
            $.ajax({
                url:"/removeFollow?userId="+userId,
                type:"GET",
                dataType:"json",
                context: userId,
                success:function (data) {
                    if (data.code === '1'){
                        mythis.hide();
                        mythis.siblings(".ok").hide();
                        mythis.siblings(".jia,.no_zi").show();
                        mythis.parents().siblings(".att_tan").children(".att_success1").show().delay(2000).hide(300);
                    } else {
                        mythis.parents().siblings(".att_tan").children(".att_success2").show().delay(2000).hide(300);
                    }
                },
                error:function () {
                    mythis.parents().siblings(".att_tan").children(".att_success3").show().delay(2000).hide(300);
                }
            });
        }

        /*点击加关注*/
        function jiafollow(userId,mythis){
            $.ajax({
                url:"/saveFollow?userId="+userId,
                type:"GET",
                dataType:"json",
                success:function (data) {
                    if (data.code === '1'){
                        mythis.hide();
                        mythis.siblings(".jia").hide();
                        mythis.siblings(".ok,.ok_zi").show();
                        mythis.parents().siblings(".att_tan").children(".att_success4").show().delay(2000).hide(300);
                    } else {
                        mythis.parents().siblings(".att_tan").children(".att_success5").show().delay(2000).hide(300);
                    }
                },
                error:function () {
                    mythis.parents().siblings(".att_tan").children(".att_success3").show().delay(2000).hide(300);
                }
            });
        }
    </script>
</body>
</html>
