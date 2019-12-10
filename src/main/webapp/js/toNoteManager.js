
$('body').on('mouseenter','.layui-table-view td[data-field = "content"]',function () {
    var msg = $(this).find('div').text();
    console.log(msg);
    //如果msg不为空，执行悬停显示内容操作，即msg为空或msg为空字符串时，悬停事件不执行
    if(msg!=null&msg!=""){
        tipsInx = layer.tips(msg, this,{
            tips: [3, '#96c8c8'],
            time: 2000
        });
    }

});

layui.use(['table','form','layer'], function(){
    var table = layui.table;
    var form = layui.form;
    var layer = layui.layer;
    table.render({
        elem: '#StuNote'
        ,url:'/note/selectStuNoteAllByLimit'
        ,height: 480
        ,cols: [[
            {field:'snId', title: '用户笔记序号', width:120}
            ,{field:'snSectionId', title: '所对应小节的序号', width:150}
            ,{field:'snUserId', title: '写笔记用户的序号', width:150}
            ,{field:'content', title: '笔记内容', width:100}
            ,{field:'up', title: '点赞数', width:100}
            ,{field:'down', title: '点踩数', width:100}
            ,{field:'report', title: '是否被举报', width:130, sort: true}
            ,{field:'date', title: '写笔记时的日期',templet: '<div>{{ layui.util.toDateString(d.date,"yyyy-MM-dd HH:mm:ss") }}</div>', width:170}
            ,{fixed: 'right', title:'操作', toolbar:'#toolbarDemo', fixed: 'right'}
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
                        url: "/note/deleteStuNoteBySnId?snId="+snId,
                        data: "",
                        success: function (result) {
                            //flag = false;
                            layer.msg("删除成功");
                            table.reload('StuNote',{
                                url: '/note/selectStuNoteAllByLimit',
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
            /*回显下拉框*/
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
