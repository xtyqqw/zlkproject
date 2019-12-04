layui.use(['table','form','layer'], function(){
    var table = layui.table;
    var form = layui.form;
    var layer = layui.layer;
    table.render({
        elem: '#StuNote'
        ,url:'/stuNote/selectStuNoteAllByLimit'
        ,height: 480
        ,cols: [[
            {field:'snId', title: '笔记ID', width:100}
            ,{field:'snSectionId', title: '小节ID', width:100}
            ,{field:'snUserId', title: '用户ID', width:100}
            ,{field:'content', title: '内容', width:100}
            ,{field:'up', title: '赞', width:100}
            ,{field:'down', title: '踩', width:100}
            ,{field:'report', title: '举报', width:100, sort: true}
            ,{field:'date', title: '日期',templet: '<div>{{ layui.util.toDateString(d.date,"yyyy-MM-dd HH:mm:ss") }}</div>', width:170}
            ,{fixed: 'right', title:'操作', toolbar:'#toolbarDemo', width:100, fixed: 'right'}
        ]]
        ,page: {
            curr:1
        }
    });
    table.on('edit(test)', function(obj){
        console.log(obj.value); //得到修改后的值
        console.log(obj.field); //当前编辑的字段名
        console.log(obj.data); //所在行的所有相关数据
    });
    table.on('tool(test)',function (obj) {
        console.log(obj);
        var snId=obj.data.snId;
        var event = obj.event;
        if(event=="delete"){
            layer.open({
                content:'是否删除？'
                ,btn:['是','否']
                ,yes:function () {
                    $.ajax({
                        type: "GET",
                        url: "/stuNote/deleteStuNoteBySnId?snId="+snId,
                        data: "",
                        success: function (result) {
                            //flag = false;
                            layer.msg("删除成功");
                            table.reload('StuNote',{
                                url: '/stuNote/selectStuNoteAllByLimit',
                                height: 480,
                                page:{
                                    curr:1
                                }
                            });
                        }
                    });
                }
                ,btn2:function () {
                    flag = false;
                }
            });
        }
        else if(obj.event === 'edit'){
            $("#snId").val(snId);
            console.log(obj.data.report);
            if(obj.data.report=="false"){
                $("#report").find("#reportFalse").prop("selected",true);
                form.render();
            }else if (obj.data.report=="true"){
                $("#report").find("#reportTrue").prop("selected",true);
                form.render();
            }else{
                $("#report").find("#reportNull").prop("selected",true);
                form.render();

            }
            layer.open({
                title: "修改",
                type: 1,
                area: ['40%', '80%'],
                content: $("#updateStuNote")
            });
        }
    });
});
