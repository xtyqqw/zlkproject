<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提问页面</title>
    <link rel="stylesheet" href="../layui/css/layui.css" type="text/css">
    <script src="../js/jquery-1.12.4.js"></script>
    <script src="../layui/layui.js"></script>
    <script src="../js/jquery.timeago.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        .context-div {
            overflow-x: hidden;
            overflow-y: hidden;
            position: absolute;
            margin: auto 0;
            width: 100%;
            height: 78%;
        }

        .all {
            width: 100%;
            height: 178px;
            background-color: #FFFFFF;
            border-bottom: 1px solid #F0F0F0;
            position: relative;
            margin-top: 30px;
            float: left;
            margin-left: 0;
        }

        .title {
            position: relative;
            left: 15px;
            top: -5px;
            float: left;
        }

        .title a {
            font-size: 22px;
            font-family: Arial;
            font-weight: bold;
            color: #383838;
            text-decoration: none;
        }

        .solve {
            position: relative;
            left: 25px;
            float: left;
            width: 55px;
            height: 20px;
            background-color: #1E9FFF;
            border-radius: 6%;
            font-size: 15px;
            font-family: Arial;
            color: #FFFFFF;
            text-decoration: none;
            text-align: center;
        }

        .questionSetTop {
            position: relative;
            left: 35px;
            float: left;
            width: 35px;
            height: 20px;
            background-color: #FF0000;
            border-radius: 6%;
            text-align: center;
        }

        .questionSetTop #p {
            font-size: 15px;
            font-family: Arial;
            color: #FFFFFF;
            text-decoration: none;
            margin: 0;
            padding: 0;
            display: inline-block;
            vertical-align: middle;
            text-align: left;
        }

        .questionContent {
            width: 90%;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            font-size: 16px;
            font-family: Arial;
            color: #707070;
            text-decoration: none;
            margin-top: 40px;
            height: 65px;
            margin-left: 1em;
        }

        .icon {
            position: absolute;
            left: 875px;
            bottom: 17px;
        }

        .browseCount {
            position: absolute;
            left: 905px;
            bottom: 17px;
        }

        .browseCount a {
            font-size: 16px;
            font-family: "Arial";
            color: #989898;
            text-decoration: none;
        }


        .commentCount a {
            font-size: 16px;
            font-family: "Arial";
            color: #989898;
            text-decoration: none;
        }

        .user1 {
            height: 30px;
            width: 300px;
            float: left;
            margin-left: 15px;
            margin-top: 32px;
        }

        .userRealname {
            position: relative;
            float: left;
            display: inline;
        }

        .userRealname a {
            font-size: 16px;
            color: #989898;
            font-family: Arial;
            text-decoration: none;
        }

        .little {
            width: 3px;
            height: 3px;
            background-color: #989898;
            border-radius: 50px;
            position: relative;
            float: left;
            display: inline;
            margin-left: 10px;
            margin-top: 8px;
        }

        .createTime {
            font-size: 16px;
            color: #989898;
            font-family: Arial;
            position: relative;
            float: left;
            display: inline;
            left: 10px;
        }

        a:hover {
            color: #1296db;
            text-decoration: none;
        }

        .demo1 {
            float: right;
            margin: 850px 120px auto;
            clear: both;
        }

    </style>
</head>
<body>
<div class="context-div"></div>
<div id="demo1" class="demo1"></div>
<script>
    $(function () {
        loadData();
        getPage();
        $(".timeago").timeago();
    });
    var page = 1; //设置首页页码
    var limit = 4;  //设置一页显示的条数
    var total;    //总条数
    function loadData() {
        $.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/question/questionAll",
            async: false,
            dataType: 'json',
            data: {
                "page": page,
                "limit": limit
            },
            success: function (ret) {
                total = ret.count;  //设置总条数
                var question = ret.questionAllList;
                var html = '';
                for (var i = 0; i < question.length; i++) {
                    html += '<div class="all" >';
                    html += '<div class="title"><a href="/question/findQuestion?questionId=' + question[i].questionId + '" target="_blank">' + question[i].questionTitle + '</a></div>';
                    if (question[i].solve === "0") {
                        html += '<div class="solve">待解决</div>';
                    }
                    if (question[i].solve === "1") {
                        html += '<div class="solve">已解决</div>';
                    }

                    if (question[i].questionSetTop === "0") {
                        html += '<div class="questionSetTop" id="questionSetTop"><p id="p">置顶</p></div>';
                    }
                    if (question[i].questionSetTop === "1") {
                        html += '<div class="questionSetTop" id="questionSetTop" style="display:none;"><p id="p">' + question[i].questionSetTop + '</p></div>';
                    }
                    html += '<div class="questionContent"><span>' + question[i].questionSynopsis + '</span></div>';
                    html += '<div class="user1">';
                    html += '<div class="userRealname"><a href="/question/findQuestion?questionId=' + question[i].questionId + '" target="_blank">' + question[i].user.userRealname + '</a></div>';
                    html += '<div class="little"></div>';
                    html += '<div class="createTime"><span class="timeago" title="' + question[i].updateTime + '"></span></div>';
                    html += '</div>';
                    html += '<svg t="1574820328378" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="713" width="22" height="20"><path d="M512 608a96 96 0 1 1 0-192 96 96 0 0 1 0 192m0-256c-88.224 0-160 71.776-160 160s71.776 160 160 160 160-71.776 160-160-71.776-160-160-160" fill="#989898" p-id="714"></path><path d="M512 800c-212.064 0-384-256-384-288s171.936-288 384-288 384 256 384 288-171.936 288-384 288m0-640C265.248 160 64 443.008 64 512c0 68.992 201.248 352 448 352s448-283.008 448-352c0-68.992-201.248-352-448-352" fill="#989898" p-id="715"></path></svg>';
                    html += '<div class="browseCount"><a href="/question/findQuestion?questionId=' + question[i].questionId + '" target="_blank">' + question[i].browseCount + '浏览' + '</a></div>';
                    html += '</div>';
                }
                $(".context-div").empty().append(html);
            }
        });
    }

    function getPage() {
        layui.use('laypage', function () {
            var laypage = layui.laypage;
            laypage.render({
                elem: 'demo1',
                count: total,
                limit: limit,
                layout: ['prev', 'page', 'next', 'count'],
                jump: function (obj, first) {
                    page = obj.curr;
                    limit = obj.limit;
                    console.log(obj);
                    if (!first) {
                        loadData()
                    }
                }
            });
        });
    }
</script>
</body>
</html>