<%--
  Created by IntelliJ IDEA.
  User: sanliangsan
  Date: 2019/11/19
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css"/>
    <script src="/layui/layui.js" type="text/javascript"></script>
    <style type="text/css">
        .box{padding: 40px 80px; }
        .box li{line-height: 44px;width: 100%;overflow: hidden;list-style: none;}
        /* 输入框前面字体的样式 */
        .box li label {width: 120px;height: 50px;float: left;line-height: 50px;text-align: right;
            padding-right: 20px;}
        /* 输入框的样式 */
        .box li input{padding: 6px 0;font-size: 16px;width: 200px;height: 40px;line-height: 28px;
            border: 1px solid #dddddd;text-indent: 0.5em;float: left;border-radius: 5px;}
        /*下拉框的样式*/
        .xlInput{width: 200px;height: 40px;border: 1px solid #dddddd;border-radius: 5px;}
        /*提交按钮的样式*/
        .submit input{display: inline-block;width: 80px;height: 40px;background-color: #01AAED;
            color: #FFFFFF;font-size: 17px; line-height: 40px;outline: none;border: none;
            border-radius: 5px;cursor: pointer;margin-left: 200px;}
    </style>
</head>
<body  style="height: 800px">
<table class="layui-hide" id="stu_note" lay-filter="test"></table>
<div hidden="hidden" id="updates">
    <form action="<%=request.getContextPath()%>/notes/update" method="post">
        <ul class="box box2">
            <li hidden="hidden">
                <input type="text" id="snId" name="snId" /><br><br>
            </li>
            <li>
                <input type="text" id="content" name="content" required="required"/><br><br>
            </li>
        </ul>
        <div class="submit">
            <input type="submit" value="保存" />
        </div>
    </form>
</div>
<script >
    layui.use(['table', 'layer', 'laydate','form'],
        function () {
            var $ = layui.$;
            var table = layui.table;
            var layer = layui.layer;
            var form = layui.form;
            table.render({
                elem: '#stu_note'
                , url: '<%=request.getContextPath()%>/notes/select'
                , toolbar: 'default'
                , cols: [[
                     {field: 'content', width: 200,align:'center', title: '内容'}
                    , {field: 'up', width: 200,align:'center', title: '赞'}
                    , {field: 'down', width: 200,align:'center', title: '踩'}
                    , {field: 'report', width: 200,align:'center', title: '举报'}
                    , {field: 'date', width: 200,align:'center', title: '时间'}
                    , {
                        field: 'right',
                        title: '操作',
                        width: 140,
                        align: 'center',
                        toolbar: '<div class="layui-btn-group">' +
                            '<button type="button" class="layui-btn layui-btn-xs layui-margin" lay-event="edit">编辑</button>' +
                            '<button class="layui-btn layui-btn-danger layui-btn-xs layui-margin" lay-event="del">删除</button>' +
                            '</div>'
                    }
                ]]
            });
            table.on('tool(test)',function (obj) {
                var data=obj.data;
                if(obj.event==='del'){/*删除*/
                    layer.confirm("确认删除？",function (index) {
                        obj.del();
                        $.ajax({
                            type:"POST",
                            url:"<%=request.getContextPath()%>/notes/delete?snId="+data.snId,
                            success:function (msg) {
                                layer.msg(msg);
                            }
                        });
                        layer.close(index);
                    });
                }else if(obj.event==='edit'){/*修改*/
                    $("#snId").val(data.snId);
                    $("#content").val(data.content);
                    layer.open({
                        type:1
                        ,title:'修改'
                        ,btn:true
                        ,area:['50%','80%']
                        ,content:$('#updates')
                    });
                }

            })
        })

</script>
</body>
</html>
