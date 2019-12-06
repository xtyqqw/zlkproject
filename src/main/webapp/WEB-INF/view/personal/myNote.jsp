<%--
  Created by IntelliJ IDEA.
  User: Anduin
  Date: 2019/11/28
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../../layui/css/layui.css"/>
    <script src="../../../js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../../layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
</head>
<style type="text/css">
    body {
        margin: 0;
        padding: 0;
    }

    .all {
        width: 100px;
        height: 30px;
        color: #914ff1;
        border-bottom: 1px solid #914FF1;
        text-align: center;
        display: inline-block;
        margin-left: 50px;
        line-height: 30px;
    }

    .num {
        display: inline-block;
        width: 100px;
        height: 30px;
        float: right;
        font-size: 13px;
        padding-top: 5px;
    }

    .context ul li {
        background: #F5F5F5;
        list-style: none;
        padding: 10px;
        border-radius: 5px;
        margin-top: 20px;
    }

    .context ul li p {
        margin-bottom: 15px;
        color: #808080;
    }

    .con_p {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
    }

    .context ul li span {
        margin-right: 10px;
        color: #000000;
        cursor: pointer;
        font-size: 13px;
    }

    .context ul li .up, .context ul li .down {
        width: 30px;
        display: inline-block;
    }

    .context ul li .time {
        float: right;
        color: #c0c0c0;
    }
</style>
<body>
<div>
    <p class="all">全 部</p>
    <p class="num">共<span>${noteNum}</span>条笔记</p>
</div>
<div class="context">
    <ul>
<%--        <c:forEach items="${stuNoteList}" var="sN">--%>
<%--            <li>--%>
<%--                <p class="remove_p con_p">${sN.content}</p>--%>
<%--                <div>--%>
<%--                    <i class="layui-icon layui-icon-praise"></i>--%>
<%--                    <span class="up">${sN.up}</span>--%>
<%--                    <i class="layui-icon layui-icon-tread"></i>--%>
<%--                    <span class="down">${sN.down}</span>--%>
<%--                    <span class="lookall">查看全文</span>--%>
<%--                    <span class="edit" onclick="editNote('${sN.content}',${sN.snId})">编辑</span>--%>
<%--                    <span class="delete" onclick="delNote(${sN.snId})">删除</span>--%>
<%--                    <span class="time">${sN.stuTime}</span>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--        </c:forEach>--%>
    </ul>
</div>
<div id="test1"></div>
<div hidden="hidden" id="demo" style="padding: 25px">
    <form action="<%=request.getContextPath()%>/myNote/edit" method="post">
        <textarea id="content" name="content"></textarea>
        <input type="text" id="input_hid" hidden="hidden" name="snId">
        <input type="submit" class="layui-btn" style="float: right;" value="提交">
    </form>
</div>
</body>
<script type="text/javascript">
    function delNote(snId) {
        var layer = layui.layer;
        layer.confirm('确定删除？', {offset: "100px"}, function (index) {
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/myNote/delete?snId=" + snId,
                success: function (msg) {
                    layer.msg(msg);
                    window.location.href = location.href;
                }
            });
            layer.close(index);
        });
    }

    layui.use('layer', function () {
        var $ = layui.jquery, layer = layui.layer;
        window.editNote = function (obj, snId) {
            $("#content").html(obj);
            $("#input_hid").val(snId);
            layer.open({
                type: 1
                , title: '编辑'
                , btn: false
                , area: ['70%', '50%']
                , content: $('#demo')
                , offset: '30px'
            })
        }
    })

    layui.use('layedit', function () {
        var layedit = layui.layedit;
        layedit.build('content', {
            tool: [
                'strong' //加粗
                , 'italic' //斜体
                , 'underline' //下划线
                , 'del' //删除线
            ]
        });
    });
    // layui.use('flow', function () {
    //     var flow = layui.flow;
    //     flow.load({
    //         elem: '.context ul' //流加载容器
    //         , isAuto: false
    //         , done: function (page, next) { //执行下一页的回调
    //             setTimeout(function () {
    //                 var lis = [];
    //                 var limit = 5;
    //                 var data = {"page": page, "limit": limit};
    //                 $.ajax({
    //                     type: "POST",
    //                     url: "/myNote/toFlow",
    //                     dataType: "json",
    //                     data: data,
    //                     success: function (result) {
    //                         layui.each(result.stuNoteList, function (i, stuNote) {
    //                             lis.push('<li>' +
    //                                 '<p class="remove_p con_p">'+ stuNote.content +'</p>' +
    //                                 '<div>' +
    //                                 '<i class="layui-icon layui-icon-praise"></i>' +
    //                                 '<span class="up">'+stuNote.up +'</span>' +
    //                                 '<i class="layui-icon layui-icon-tread"></i>' +
    //                                 '<span class="down">'+stuNote.down +'</span>' +
    //                                 '<span class="lookall">查看全文</span>' +
    //                                 '<span class="edit" onclick="editNote(\''+data1[i].content+'\','+data1[i].snId+')">编辑</span>' +
    //                                 '<span class="delete" onclick="delNote('+ stuNote.snId +')">删除</span>\n' +
    //                                 '<span class="time">'+ stuNote.snDate +'</span>' +
    //                                 '</div>' +
    //                                 '</li>')
    //                         })
    //                         next(lis.join(''), page < 5);
    //                     }
    //                 });
    //             }, 500);
    //         }
    //     });
    // });
    $(function () {
        loadData()
        getPage()
        $(".lookall").click(function () {
            if (($(this).html())==="查看全文") {
                $(this).parent().siblings('.remove_p').removeClass("con_p");
                $(this).html("收起");
            } else {
                $(this).parent().siblings('.remove_p').addClass("con_p");
                $(this).html("查看全文");
            }
        })
    })
    var page = 1; //设置首页页码
    var limit = 10;  //设置一页显示的条数
    var total;    //总条数
    function loadData() {
        $.ajax({
            type: "post",
            url: "/myNote/toPage",
            async: false,
            dataType: 'json',
            data: {
                "page": page,
                "limit": limit,
            },
            success: function (ret) {
                total = ret.count;  //设置总条数
                var data1 = ret.data;
                var html = '';
                for (var i = 0; i < data1.length; i++) {
                    html += '<li>';
                    html += '<p class="remove_p con_p">'+ data1[i].content +'</p>';
                    html += '<div>';
                    html += '<i class="layui-icon layui-icon-praise"></i>';
                    html += '<span class="up">'+data1[i].up +'</span>';
                    html += '<i class="layui-icon layui-icon-tread"></i>';
                    html += '<span class="down">'+data1[i].down +'</span>';
                    html += '<span class="lookall">查看全文</span>';
                    html += '<span class="edit" onclick="editNote(\''+data1[i].content+'\','+data1[i].snId+')">编辑</span>';
                    html += '<span class="delete" onclick="delNote('+ data1[i].snId +')">删除</span>';
                    html += '<span class="time">'+ data1[i].stuTime +'</span>';
                    html += '</div>';
                    html += '</li>';
                }
                $(".context ul").empty().append(html);
            }
        });
    }
    function getPage(){
        layui.use('laypage', function(){
            var laypage = layui.laypage;
            laypage.render({
                elem: 'test1'
                ,count: total,
                limit:limit,
                jump: function(obj, first){
                    page=obj.curr;
                    limit=obj.limit;
                    if(!first){
                        loadData()
                    }
                }
            });
        });
    }
</script>
</html>
